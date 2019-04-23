package actions;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

import com.opensymphony.xwork2.ActionSupport;

import beans.DriverEnhancer;
import beans.EnhancerPos;
import beans.Gene;
import beans.Length;
import beans.Mutation;
import beans.PFAM;
import beans.Subtitle;
import convJson.GsonTools;
import mysqlUtils.SqlPool;

@SuppressWarnings("serial")
public class SearchSnvAction extends ActionSupport{
	private String id;
	private String snvresult;
	private String categories;
	private String status = "success";
	public String execute(){
		Connection conn = null;
		PreparedStatement pstmt =null;
		ResultSet RS=null;
		System.out.println(id);
		Length length = new Length();
		String title = "";
		String subtitle = "";
		ArrayList<Mutation> AM = new ArrayList<Mutation>();
		ArrayList<EnhancerPos> AE = new ArrayList<EnhancerPos>();
		ArrayList<EnhancerPos> AEtemp = new ArrayList<EnhancerPos>();
		HashMap<String,Object> mapMutations = new HashMap<String,Object>();
		HashMap<String,Object> mapSubtitle = new HashMap<String,Object>();
		HashMap<String,Object> mapTitle = new HashMap<String,Object>();
		try{ //title,subtitle,
			String sql = "select ty,locus,dataset,sample,length,end,start from daec.enhancermutation where id = ?";
			conn = SqlPool.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,id);		
			RS=pstmt.executeQuery();
			while(RS.next()){
				Mutation mt = new Mutation(RS.getString("ty"),RS.getString("locus"),RS.getString("dataset"),RS.getString("sample"));
				AM.add(mt);
				length.setLength(RS.getString("length"));
				//title = RS.getString("title");
				//subtitle = RS.getString("subtitle");
				System.out.println(title);
				EnhancerPos EP = new EnhancerPos(RS.getString("end"),RS.getString("start"));
				AEtemp.add(EP);
			}
			if(length.getLength() == null || length.getLength().equalsIgnoreCase("")){
				snvresult = "";
				categories = "";
			}else{
				String sql1 = "select dataset from daec.enhancermutation where id = ? group by dataset";
				pstmt=conn.prepareStatement(sql1);
				pstmt.setString(1,id);		
				RS=pstmt.executeQuery();
				ArrayList<String> ct = new ArrayList<String>();
				while(RS.next()){
					ct.add(RS.getString("dataset"));
				}
				categories = GsonTools.createJsonString(ct);
				System.out.println(categories);
				//System.out.println(title);
				//System.out.println(subtitle);
				System.out.println(length.getLength());
				PFAM pfam =new PFAM();
				AE.add(AEtemp.get(0));
				pfam.setPFAM(AE);
				mapSubtitle.put("mutations", AM);
				mapSubtitle.put("gene", "genome");
				mapSubtitle.put("length",length.getLength());
				mapSubtitle.put("domains",pfam);
				mapMutations.put(subtitle, mapSubtitle);
				//mapMutations.put("", mapSubtitle);
				mapTitle.put(title, mapMutations);
				//mapTitle.put("", mapMutations);
				//snvresult = GsonTools.createJsonString(mapTitle);
				snvresult = GsonTools.createJsonString(mapTitle);
				System.out.println(mapTitle);
				System.out.println(snvresult);
			}
			
		}catch(Exception e){
			e.printStackTrace();
			status = "error";
			return ERROR;
		}finally{
			SqlPool.putBackConnection(conn);
		}
		return SUCCESS;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public String getSnvresult() {
		return snvresult;
	}
	public void setSnvresult(String snvresult) {
		this.snvresult = snvresult;
	}
	public String getCategories() {
		return categories;
	}
	public void setCategories(String categories) {
		this.categories = categories;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
}
