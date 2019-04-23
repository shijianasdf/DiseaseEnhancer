package gd3lib;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
public class SingleNucleotideVariation {
	private PreparedStatement pstmt;
	private ResultSet rs;

	public HashMap<String, Object> getSnvFromDb(Connection conn, String dbName, String tableName, String selectedCols, String mutationCols, String keyCol, String keyValue) throws SQLException{
		HashMap<String, Object> reMap = new HashMap<String, Object>();
		String mysqlStr = "";
		mysqlStr = "select "+selectedCols+" from "+dbName+"."+tableName+" where "+keyCol+"='"+keyValue+"';";
		System.out.println(mysqlStr);
		// 运行 mysql 指令
		pstmt = conn.prepareStatement(mysqlStr);
		rs = pstmt.executeQuery();
		// 获取返回值
		while(rs.next()){
			reMap.put("name", rs.getString(1));
			reMap.put("length", rs.getString(2));
			reMap.put("start", rs.getString(3));
			reMap.put("end", rs.getString(4));
		}
		mysqlStr = "select "+mutationCols+" from "+dbName+"."+tableName+" where "+keyCol+"='"+keyValue+"';";
		ArrayList<ArrayList<String>> mutationTable = new ArrayList<ArrayList<String>>();
		pstmt = conn.prepareStatement(mysqlStr);
		rs = pstmt.executeQuery();
		while(rs.next()){
			// 建立临时的 list 以存储行信息
			ArrayList<String> rowList=new ArrayList<String>();
			int size = mutationCols.split(", ").length;
			for(int i=1; i<=size; i++)
				rowList.add(rs.getString(i));
			mutationTable.add(rowList);
		}
		reMap.put("mutationTable", mutationTable);
		mysqlStr = "select dataSet from "+dbName+"."+tableName+" where "+keyCol+"='"+keyValue+"' group by dataSet;";
		ArrayList<String> dataSet = new ArrayList<String>();
		pstmt = conn.prepareStatement(mysqlStr);
		rs = pstmt.executeQuery();
		while(rs.next()){
			dataSet.add(rs.getString(1));
		}
		reMap.put("dataSet", dataSet);
		return reMap;
		
	}

		
	
	@SuppressWarnings("unchecked")
	public String getSnv(HashMap<String, Object> inputMap){
		String reStr = "";
		/*
			{
				"setName":{
					"setSubName":{
						"mutations":[
							{"ty":"Nonsense_Mutation","locus":"405","dataset":"UCEC","sample":"TCGA-A5-A0GB","gene":"setName"},
							{"ty":"Missense_Mutation","locus":"581","dataset":"OV","sample":"TCGA-24-1565","gene":"setName"}
						],
						"gene":"setName",
						"length":766,
						"domains":{
							"PFAM":[
								{"end":713,"start":400,"name":"peak"}
							]
						}
					}
				}
			}
		 */
		String reStrHeader = "";
		String reStrMid = "";
		String reStrTail = "";
		ArrayList<ArrayList<String>> mutationTable = new ArrayList<ArrayList<String>>();
		mutationTable = (ArrayList<ArrayList<String>>) inputMap.get("mutationTable");
		System.out.println("mutationTable size : "+ mutationTable.size());
		if(mutationTable.size()==0){
			System.out.println("Fatal:");
			System.out.println("mutationTable size is 0");
			System.out.println("==========================================");
			return null;
		}
		String subname = (String) inputMap.get("subname");
		if(subname==null || subname.equalsIgnoreCase("")){
			reStrHeader = "{\""+inputMap.get("name")+"\":{\"\":{\"mutations\":[";
		}else{
			reStrHeader = "{\""+inputMap.get("name")+"\":{\""+subname+"\":{\"mutations\":[";
		}
		reStrTail = "],\"gene\":\""+inputMap.get("name")+"\",\"length\":"+inputMap.get("length")+",\"domains\":{\"PFAM\":[{\"end\":"+inputMap.get("end")+",\"start\":"+inputMap.get("start")+",\"name\":\"peak\"}]}}}}";
		for(int i =0 ; i<mutationTable.size(); i++){
			ArrayList<String> mutationList = new ArrayList<String>();
			mutationList = mutationTable.get(i);
			reStrMid = reStrMid+"{\"ty\":\""+mutationList.get(0)+"\",\"locus\":\""+mutationList.get(1)+"\",\"dataset\":\""+mutationList.get(2)+"\",\"sample\":\""+mutationList.get(3)+"\",\"gene\":\""+inputMap.get("name")+"\"},";
		}
		/*
		if(subname==null || subname.equalsIgnoreCase("")){
			reStrHeader = "{\""+inputMap.get("name")+"\":{\"\":{\"mutations\":[";
		}else{
			reStrHeader = "{\""+inputMap.get("name")+"\":{\""+subname+"\":{\"mutations\":[";
		}
		reStrTail = "],\"gene\":\""+inputMap.get("name")+"\",\"length\":"+inputMap.get("length")+",\"domains\":{\"PFAM\":[{\"end\":"+inputMap.get("end")+",\"start\":"+inputMap.get("start")+",\"name\":\""+inputMap.get("domainName")+"\"}]}}}}";
		for(int i =0 ; i<mutationTable.size(); i++){
			ArrayList<String> mutationList = new ArrayList<String>();
			mutationList = mutationTable.get(i);
			reStrMid = reStrMid+"{\"ty\":\""+mutationList.get(0)+"\",\"locus\":\""+mutationList.get(1)+"\",\"dataset\":\""+mutationList.get(2)+"\",\"sample\":\""+mutationList.get(3)+"\",\"gene\":\""+inputMap.get("setName")+"\"}";	
		}
		*/
		reStrMid = reStrMid.substring(0, reStrMid.length()-1);
		
		reStr = reStrHeader+reStrMid+reStrTail;

		System.out.println(reStr);
		return reStr;
	}
}
