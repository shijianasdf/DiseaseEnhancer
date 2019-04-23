package actions;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

import com.opensymphony.xwork2.ActionSupport;

import beans.DiseaseEnhancer;
import beans.EnhancerPos;
import beans.Length;
import beans.Mutation;
import beans.PFAM;
import beans.enhancerdetail;
import beans.subdiseaseenhancer;
import convJson.GsonTools;
import mysqlUtils.SqlPool;

@SuppressWarnings("serial")
public class SearchDetailAction extends ActionSupport{
       private String id;
       private String diseasetype;
       private String pmid;
       private String jsonresult;
       private String snvresult;
   	   private String categories;
   	   private String status = "success";
       public String execute(){
    	   Connection conn = null;
   		   PreparedStatement pstmt =null;
   		   ResultSet RS=null;
   		   ArrayList<subdiseaseenhancer> ADE = new ArrayList<subdiseaseenhancer>();//附表
   		  
   		   Length length = new Length();
		   String title = "";
		   String subtitle = "";
		   ArrayList<Mutation> AM = new ArrayList<Mutation>();
		   ArrayList<EnhancerPos> AE = new ArrayList<EnhancerPos>();
		   ArrayList<EnhancerPos> AEtemp = new ArrayList<EnhancerPos>();
		   HashMap<String,Object> mapMutations = new HashMap<String,Object>();
		   HashMap<String,Object> mapSubtitle = new HashMap<String,Object>();
		   HashMap<String,Object> mapTitle = new HashMap<String,Object>();
   		
	   try{
		   //搜索附表
 		   conn=SqlPool.getConnection();
 		   pstmt=conn.prepareStatement("select * from daec.subdiseaseenhancer where id = ?");
 		   pstmt.setString(1, id);		
 		   RS=pstmt.executeQuery();		
		   while(RS.next()){
				ADE.add(new subdiseaseenhancer(RS.getString(1),RS.getString(2),RS.getString(3),RS.getString(4),RS.getString(5),RS.getString(6),RS.getString(7),RS.getString(8),RS.getString(9),RS.getString(10)));
			}
		   jsonresult = GsonTools.createJsonString(ADE);	
		   System.out.println(jsonresult);
		   
		    //搜索突变
		    String sql = "select ty,locus,dataset,sample,length,end,start from daec.enhancermutation where id = ?";
		    System.out.println(sql);
		    pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,id);	
			System.out.println(pstmt);
			RS=pstmt.executeQuery();
			System.out.println("=====hello");//走了
			while(RS.next()){
				Mutation mt = new Mutation(RS.getString("ty"),RS.getString("locus"),RS.getString("dataset"),RS.getString("sample"));
				AM.add(mt);
				length.setLength(RS.getString("length"));
				//title = RS.getString("title");
				//subtitle = RS.getString("subtitle");
				System.out.println("hello");
				EnhancerPos EP = new EnhancerPos(RS.getString("end"),RS.getString("start"));
				AEtemp.add(EP);
			}
			System.out.println(AM);//走了
			if(length.getLength() == null || length.getLength().equalsIgnoreCase("")){
				System.out.println("=====byebye");//走了
				snvresult = "";
				categories = "";
			}else{//没走
				System.out.println("=====hehe");
				String sql1 = "select dataset from daec.enhancermutation where id = ? group by dataset";
				pstmt=conn.prepareStatement(sql1);
				pstmt.setString(1,id);
				System.out.println("=====hello");
				System.out.println(pstmt);
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
   		}
 		catch (Exception e){
 			e.printStackTrace();
 			status = "error";
 			return ERROR;
 		}
 		finally{
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
	public String getDiseasetype() {
		return diseasetype;
	}
	public void setDiseasetype(String diseasetype) {
		this.diseasetype = diseasetype;
	}
	public String getPmid() {
		return pmid;
	}
	public void setPmid(String pmid) {
		this.pmid = pmid;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getJsonresult() {
		return jsonresult;
	}
	public void setJsonresult(String jsonresult) {
		this.jsonresult = jsonresult;
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
       
}
