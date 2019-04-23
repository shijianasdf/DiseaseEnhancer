package mysqlUtils.mysqlReadUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class SearchDbAccurateTable{
	private PreparedStatement pstmt;
	private ResultSet rs;

	// 莽虏戮莽隆庐氓聦鹿茅聟聧茂录聦忙聽鹿忙聧庐氓陇職盲赂陋忙聺隆盲禄露茂录聦猫驴聰氓聸聻盲赂聙盲赂陋 table
	//
	// 氓聫聜忙聲掳猫炉麓忙聵聨
	// 1-3.	conn, dbName, tableName 忙聹聸忙聳聡莽聰聼忙聞聫
	// 4.	selectedCols 猫驴聰氓聸聻莽職聞氓聢聴茂录聦盲禄楼茅聙聴氓聫路莽漏潞忙聽录 ", " 氓聢聠茅職聰莽職聞 String 氓聻聥
	// 5-6.	氓聼潞盲潞聨 keyCols 氓聮聦 keyValues 忙聬聹莽麓垄莽禄聯忙聻聹
	// 		猫娄聛忙卤聜忙颅陇盲赂陇猫聙聟盲赂潞 ArrayList<String> 氓聢聠氓聢芦氓聦聟氓聬芦忙拢聙莽麓垄莽職聞氓聢聴氓聬聧氓聮聦氓炉鹿氓潞聰莽職聞氓聙录
	// 8-9.	忙聵炉氓聬娄氓聹篓忙聹聙氓聬聨忙路禄氓聤聽猫娄聛忙卤聜茂录聦猫娄聛忙卤聜 notEqualCol 盲赂聧莽颅聣盲潞聨 notEqualValue
	// 7.	氓聼潞盲潞聨 conditionTypeList 氓掳聠氓陇職盲赂陋忙聺隆盲禄露猫驴聻忙聨楼茂录聦 ArrayList<String>茂录聦猫驴聶盲赂陋氓聫聜忙聲掳氓聟鲁茅聰庐茂录聦盲赂戮盲戮聥猫炉麓忙聵聨
	//			盲戮聥盲赂聙茂录聦氓娄聜忙聻聹氓赂聦忙聹聸氓戮聴氓聢掳 select * from * where (*=A) AND (*=B)
	//			氓聢聶 conditionTypeList 盲赂颅猫戮聯氓聟楼 ") AND ("
	//			盲戮聥盲潞聦茂录聦氓娄聜忙聻聹氓赂聦忙聹聸氓戮聴氓聢掳 select * from * where (*=A) AND (*=B OR *=C)
	//			氓聢聶 conditionTypeList 盲赂颅猫戮聯氓聟楼 ") AND (", " OR "
	//			盲戮聥盲赂聣茂录聦氓娄聜忙聻聹氓赂聦忙聹聸氓戮聴氓聢掳 select * from * where (*=A) AND (*=B) OR (*=C)
	//			氓聢聶 conditionTypeList 盲赂颅猫戮聯氓聟楼 ") AND (", ") OR ("
	// 猫驴聰氓聸聻 ArrayList<ArrayList<String>>
	public ArrayList<ArrayList<String>> queryTableMC(Connection conn, String dbName, String tableName, String selectedCols, ArrayList<String> keyCols, ArrayList<String> keyValues, ArrayList<String> conditionTypeList, String notEqualCol, String notEqualValue) throws SQLException{
		// 忙颅陇氓聡陆忙聲掳猫驴聰氓聸聻莽職聞莽禄聯忙聻聹  ArrayList<ArrayList<String>>
		ArrayList<ArrayList<String>> resultTable=new ArrayList<ArrayList<String>>();
		// 莽隆庐氓庐職忙聹聣氓聢聴忙聲掳茂录聦氓聢聺氓搂聥氓聦聳盲赂潞茅聸露氓聢聴
		int size = 0;
		// 氓娄聜忙聻聹 selectedCols 盲赂颅氓聦聟氓聬芦茅聙聴氓聫路茂录聦猫聨路氓聫聳氓聢聴忙聲掳
		if(selectedCols.contains(", "))
			size = selectedCols.split(", ").length;
		else
			size=1;// 氓娄聜忙聻聹 selectedCols 盲赂颅盲赂聧氓聦聟氓聬芦茅聙聴氓聫路茂录聦氓聢聶氓聢聴忙聲掳盲赂潞盲赂聙
		System.out.println("search for columns numbers ==== "+size);
		// 氓禄潞莽芦聥 mysql 忙聦聡盲禄陇
		// 氓娄聜忙聻聹 keyCols 盲赂颅氓聫陋忙聹聣盲赂聙盲赂陋氓聙录茂录聦茅聜拢盲鹿聢莽颅聣氓聬聦盲潞聨氓聧聲忙聺隆盲禄露忙聬聹莽麓垄莽職聞莽禄聯忙聻聹
		String mysqlStr = "";
		mysqlStr = "select "+selectedCols+" from "+dbName+"."+tableName+" where ("+keyCols.get(0)+"='"+keyValues.get(0)+"'";
		// 氓娄聜忙聻聹 keyCols 莽職聞茅聲驴氓潞娄氓陇搂盲赂聨盲赂聙
		// 氓聢聶氓戮陋莽聨炉 keyCols 盲潞搂莽聰聼氓陇職忙聺隆盲禄露忙聬聹莽麓垄忙聦聡盲禄陇
		if(keyCols.size()>1 && conditionTypeList.size()>0){
			for(int i=1; i<keyCols.size(); i++)
				mysqlStr = mysqlStr+conditionTypeList.get(i-1)+keyCols.get(i)+"='"+keyValues.get(i)+"'";
		}
		// 忙路禄氓聤聽mysql猫炉颅氓聫楼莽職聞氓掳戮氓路麓
		// 氓娄聜忙聻聹忙虏隆忙聹聣茅聶聬氓庐職盲赂聧莽颅聣氓聢聴茂录聦氓聢聶莽聸麓忙聨楼猫隆楼盲赂聤忙聥卢氓聫路莽職聞氓聫鲁氓聧聤猫戮鹿
		// 氓聬娄氓聢聶忙路禄氓聤聽盲赂聧莽颅聣氓聢聴忙聦聡盲禄陇茂录聦氓鹿露猫隆楼盲赂聤忙聥卢氓聫路莽職聞氓聫鲁氓聧聤猫戮鹿
		if(notEqualCol.length()==0)
			mysqlStr = mysqlStr+")";
		else
			mysqlStr = mysqlStr+") AND ("+notEqualCol+"!='"+notEqualValue+"')";
		// 猫戮聯氓聡潞 mysql 忙聦聡盲禄陇
		System.out.println(mysqlStr);
		// 猫驴聬猫隆聦 mysql 忙聦聡盲禄陇
		pstmt = conn.prepareStatement(mysqlStr);
		rs = pstmt.executeQuery();
		// 氓掳聠 mysql 猫驴聰氓聸聻莽職聞忙聲掳忙聧庐猫戮聯氓聟楼氓聢掳 resultTable 盲赂颅
		while(rs.next()){
			// 氓禄潞莽芦聥盲赂麓忙聴露莽職聞 list 盲禄楼氓颅聵氓聜篓猫隆聦盲驴隆忙聛炉
			ArrayList<String> rowList=new ArrayList<String>();
			for(int i=1; i<=size; i++)
				rowList.add(rs.getString(i));
			// 忙路禄氓聤聽猫隆聦盲驴隆忙聛炉茂录聦盲禄楼猫聨路氓戮聴猫驴聰氓聸聻莽職聞 resultTable
			resultTable.add(rowList);
		}
		return resultTable;
	}
	public ArrayList<ArrayList<String>> browseSelectedRows(Connection conn, String dbName, String tableName, String selectedCols, String keyCol, String keyValue, int start, int size) throws SQLException{
		ArrayList<ArrayList<String>> tableElements=new ArrayList<ArrayList<String>>();
		//鑾峰彇杩斿洖缁撴灉鍒楁暟
		int colCounts = 0;
		colCounts = selectedCols.split(",").length;
		//size = sdbc.queryColumnCount(conn,dbName,tableName,selectedCols);
		System.out.println("result table column counts "+colCounts);
		//鑾峰彇mysql鎸囦护
		String mysqlStr = "select "+selectedCols+" from "+dbName+"."+tableName+" where "+keyCol+"='"+keyValue+"' limit "+start+","+size;
		//"select "+selectedCols+" from "+dbName+"."+tableName+" limit "+start+","+size;
		System.out.println(mysqlStr);
		pstmt = conn.prepareStatement(mysqlStr);
		rs = pstmt.executeQuery();
		while(rs.next()){
			// 寤虹珛涓存椂鐨� list 浠ュ瓨鍌ㄨ淇℃伅
			ArrayList<String> rowList=new ArrayList<String>();
			for(int i=1;i<=colCounts;i++){
				String tempStr = "";
				tempStr = rs.getString(i);
				if(tempStr.equalsIgnoreCase("uncertain"))
					tempStr = "NA";
				// 娣诲姞琛屼俊鎭紝浠ヨ幏寰楄繑鍥炵殑 resultTable
				rowList.add(tempStr);
			}
			rowList.remove(4);rowList.remove(4);rowList.remove(4);
			if(rs.getString(5).equals("NA"))
				rowList.add(4, "NA");
			else
				rowList.add(4, rs.getString(5)+":"+rs.getString(6)+"-"+rs.getString(7));
			//;
			rowList.add("more details");
			tableElements.add(rowList);
		}
		/*
		while(rs.next()){
			ArrayList<String> alChild=new ArrayList<String>();
			for(int i=1;i<=colCounts;i++)
				alChild.add(rs.getString(i));
			alChild.add("more details");
			tableElements.add(alChild);
		}
		System.out.println(tableElements);
		System.out.println(tableElements);
		*/
		return tableElements;
	}
	public ArrayList<ArrayList<String>> browseSelectedRows2(Connection conn, String dbName, String tableName, String selectedCols, String keyCol, String keyValue, int start, int size) throws SQLException{
		ArrayList<ArrayList<String>> tableElements=new ArrayList<ArrayList<String>>();
		//鑾峰彇杩斿洖缁撴灉鍒楁暟
		int colCounts = 0;
		colCounts = selectedCols.split(",").length;
		//size = sdbc.queryColumnCount(conn,dbName,tableName,selectedCols);
		System.out.println("result table column counts "+colCounts);
		//鑾峰彇mysql鎸囦护
		String mysqlStr = "select "+selectedCols+" from "+dbName+"."+tableName+" where "+keyCol+"='"+keyValue+"' limit "+start+","+size;
		//"select "+selectedCols+" from "+dbName+"."+tableName+" limit "+start+","+size;
		System.out.println(mysqlStr);
		pstmt = conn.prepareStatement(mysqlStr);
		rs = pstmt.executeQuery();
		while(rs.next()){
			// 寤虹珛涓存椂鐨� list 浠ュ瓨鍌ㄨ淇℃伅
			ArrayList<String> rowList=new ArrayList<String>();
			for(int i=1;i<=colCounts;i++){
				String tempStr = "";
				tempStr = rs.getString(i);
				//if(i==1)
					//tempStr = "<a style='cursor:pointer;'>"+tempStr+"</a>";
					//tempStr = tempStr;
				if(tempStr.equalsIgnoreCase("uncertain"))
					tempStr = "NA";
				// 娣诲姞琛屼俊鎭紝浠ヨ幏寰楄繑鍥炵殑 resultTable
				rowList.add(tempStr);
			}
					rowList.add("<a style='cursor:pointer;'>More details</a>");
			tableElements.add(rowList);
		}
		/*
		while(rs.next()){
			ArrayList<String> alChild=new ArrayList<String>();
			for(int i=1;i<=colCounts;i++)
				alChild.add(rs.getString(i));
			alChild.add("more details");
			tableElements.add(alChild);
		}
		System.out.println(tableElements);
		System.out.println(tableElements);
		*/
		return tableElements;
	}
	
	
	public ArrayList<ArrayList<String>> browseSelectedRows3(Connection conn, String dbName, String tableName, String selectedCols, int start, int size) throws SQLException{
		ArrayList<ArrayList<String>> tableElements=new ArrayList<ArrayList<String>>();
		//鑾峰彇杩斿洖缁撴灉鍒楁暟
		int colCounts = 0;
		colCounts = selectedCols.split(",").length;
		//size = sdbc.queryColumnCount(conn,dbName,tableName,selectedCols);
		System.out.println("result table column counts "+colCounts);
		//鑾峰彇mysql鎸囦护
		String mysqlStr = "select "+selectedCols+" from "+dbName+"."+tableName+" limit "+start+","+size;
		//"select "+selectedCols+" from "+dbName+"."+tableName+" limit "+start+","+size;
		System.out.println(mysqlStr);
		pstmt = conn.prepareStatement(mysqlStr);
		rs = pstmt.executeQuery();
		while(rs.next()){
			// 寤虹珛涓存椂鐨� list 浠ュ瓨鍌ㄨ淇℃伅
			ArrayList<String> rowList=new ArrayList<String>();
			for(int i=1;i<=colCounts;i++){
				String tempStr = "";
				tempStr = rs.getString(i);
				//if(i==1)
					//tempStr = "<a style='cursor:pointer;'>"+tempStr+"</a>";
				//tempStr = tempStr;
				if(tempStr.equalsIgnoreCase("uncertain"))
					tempStr = "NA";
				// 娣诲姞琛屼俊鎭紝浠ヨ幏寰楄繑鍥炵殑 resultTable
				rowList.add(tempStr);
			}
					rowList.add("<a style='cursor:pointer;'>More details</a>");
			tableElements.add(rowList);
		}
		/*
		while(rs.next()){
			ArrayList<String> alChild=new ArrayList<String>();
			for(int i=1;i<=colCounts;i++)
				alChild.add(rs.getString(i));
			alChild.add("more details");
			tableElements.add(alChild);
		}
		System.out.println(tableElements);
		System.out.println(tableElements);
		*/
		return tableElements;
	}
	// 莽虏戮莽隆庐氓聦鹿茅聟聧茂录聦忙聽鹿忙聧庐氓聧聲盲赂陋忙聺隆盲禄露茂录聦猫驴聰氓聸聻盲赂聙盲赂陋 table
	//
	// 氓聫聜忙聲掳猫炉麓忙聵聨
	// 1-3.	conn, dbName, tableName 忙聹聸忙聳聡莽聰聼忙聞聫
	// 4.	selectedCols 猫驴聰氓聸聻莽職聞氓聢聴茂录聦盲禄楼茅聙聴氓聫路莽漏潞忙聽录 ", " 氓聢聠茅職聰莽職聞 String 氓聻聥
	// 5-6.	氓聼潞盲潞聨 keyCol 氓聮聦 keyValue 忙聬聹莽麓垄莽禄聯忙聻聹茂录聦String
	// 猫驴聰氓聸聻 ArrayList<ArrayList<String>>
	public ArrayList<ArrayList<String>> queryTableSC(Connection conn, String dbName, String tableName, String selectedCols, String keyCol, String keyValue) throws SQLException{
		ArrayList<ArrayList<String>> resultTable=new ArrayList<ArrayList<String>>();
		// 莽隆庐氓庐職忙聹聣氓聢聴忙聲掳茂录聦氓聢聺氓搂聥氓聦聳盲赂潞茅聸露氓聢聴
		int size = 0;
		// 氓娄聜忙聻聹 selectedCols 盲赂颅氓聦聟氓聬芦茅聙聴氓聫路茂录聦猫聨路氓聫聳氓聢聴忙聲掳
		if(selectedCols.contains(", "))
			size = selectedCols.split(", ").length;
		else
			size=1;	// 氓娄聜忙聻聹 selectedCols 盲赂颅盲赂聧氓聦聟氓聬芦茅聙聴氓聫路茂录聦氓聢聶氓聢聴忙聲掳盲赂潞盲赂聙
		System.out.println("search for columns numbers ==== "+size);
		// 氓禄潞莽芦聥 mysql 忙聦聡盲禄陇
		String mysqlStr = "";
		mysqlStr = "select "+selectedCols+" from "+dbName+"."+tableName+" where "+keyCol+"='"+keyValue+"';";
		// 猫驴聬猫隆聦 mysql 忙聦聡盲禄陇
		pstmt = conn.prepareStatement(mysqlStr);
		rs = pstmt.executeQuery();
		// 氓掳聠 mysql 猫驴聰氓聸聻莽職聞忙聲掳忙聧庐猫戮聯氓聟楼氓聢掳 resultTable 盲赂颅
		while(rs.next()){
			// 氓禄潞莽芦聥盲赂麓忙聴露莽職聞 list 盲禄楼氓颅聵氓聜篓猫隆聦盲驴隆忙聛炉
			ArrayList<String> rowList=new ArrayList<String>();
			for(int i=1; i<=size; i++)
				rowList.add(rs.getString(i));
			// 忙路禄氓聤聽猫隆聦盲驴隆忙聛炉茂录聦盲禄楼猫聨路氓戮聴猫驴聰氓聸聻莽職聞 resultTable
			resultTable.add(rowList);
		}
		return resultTable;
	}
}
