package actions;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import beans.DiseaseEnhancer;
import beans.DriverEnhancer;
import beans.EnhancerDisease1;
import beans.alldiseaseenhancer;
import beans.maindiseaseenhancer;
import beans.subdiseaseenhancer;
import convJson.GsonTools;
import mysqlUtils.SqlPool;


@SuppressWarnings("serial")
public class QuickSearchAction2 extends ActionSupport{
    private String query;
    private String querytype;
    private ArrayList<maindiseaseenhancer> MDE;
    private ArrayList<subdiseaseenhancer> SDE;
    private ArrayList<alldiseaseenhancer> ADE;
    private String jsonmde;
    private String jsonsde;
    private String jsonade;
    private String message;
    public String execute(){
    	Connection conn = null;
		PreparedStatement pstmt =null;
		ResultSet RS=null;
		MDE = new ArrayList<maindiseaseenhancer>();
		SDE = new ArrayList<subdiseaseenhancer>();
		String chr = "";
		String begin = "";
		String end = "";
		
		if(this.query==null || this.query.equalsIgnoreCase("")){message = "you input nothing";return ERROR;}
		
		
		String sql = "";
		this.query=this.query.replaceAll("^[\\s,']+|[\\s,']+$", "");
		if(query.length()>1){			
			if(query.startsWith("chr")){
				if(query.contains(":") && query.contains("-")){
					String[] a = query.split(":"); // chr6  3465346-64567425
					String[] b = a[1].split("-"); //   3465346 64567425
					chr = a[0];
					begin = b[0];
					end = b[1];
					querytype = "position";
	                //                                                                        begin          begin                              end            end                               begin            end                               begin           end
					sql = "select * from daec.maindiseaseenhancer where (enhchr = ? and enhstart <= ? and enhend >= ?) or (enhchr = ? and enhstart <= ? and enhend >= ?) or (enhchr = ? and enhstart >= ? and enhend <= ?) or (enhchr = ? and enhstart <= ? and enhend >= ?)";
				}else{
					querytype = "chromosome";
					sql = "select * from daec.maindiseaseenhancer where enhchr = ?";
				}
			}else{
				querytype = "geneOrdisease";
				sql = "select * from daec.maindiseaseenhancer where targetgene like ? or diseasetype like ?";
			}			
		}else{
			return "empty";// not valid search,包括单个字符认为也不合法
		}
		try{
		   conn=SqlPool.getConnection();
		   pstmt=conn.prepareStatement(sql);
		   if(querytype == "geneOrdisease"){
			   pstmt.setString(1,"%"+query+"%");
			   pstmt.setString(2,"%"+query+"%");
		   }else if(querytype == "position"){
			   pstmt.setString(1,chr);
			   pstmt.setString(2,begin);
			   pstmt.setString(3,begin);
			   pstmt.setString(4,chr);
			   pstmt.setString(5,end);
			   pstmt.setString(6,end);
			   pstmt.setString(7,chr);
			   pstmt.setString(8,begin);
			   pstmt.setString(9,end);
			   pstmt.setString(10,chr);
			   pstmt.setString(11,begin);
			   pstmt.setString(12,end);
			   
		   }else{
			   pstmt.setString(1, query);
		   }
		   System.out.println(pstmt);
		   RS=pstmt.executeQuery();		
		   while(RS.next()){
			   //MDE.add(new maindiseaseenhancer(RS.getString(1),RS.getString(2),RS.getString(3),RS.getString(4),RS.getString(5),RS.getString(6),RS.getString(7)));
		   }	
		   jsonmde = GsonTools.createJsonString(MDE);	
		   System.out.println(jsonmde);
		   String sql1 = "select * from daec.subdiseaseenhancer where ";
		   for(int i=0;i<MDE.size()-1;i++){
			   sql1 = sql1 + "id = '"+ MDE.get(i).getId() + "' or "; 
		   }
		   sql1 = sql1 + "id = '" + MDE.get(MDE.size()-1).getId() +"'";
		   System.out.println(sql1);
		   pstmt=conn.prepareStatement(sql1);
		   RS = pstmt.executeQuery();
		   while(RS.next()){
			   //SDE.add(new subdiseaseenhancer(RS.getString(1),RS.getString(2),RS.getString(3),RS.getString(4),RS.getString(5),RS.getString(6),RS.getString(7),RS.getString(8),RS.getString(9)));
		   }
		   jsonsde = GsonTools.createJsonString(SDE);	
		   System.out.println(jsonsde);
		   
		   ADE = new ArrayList<alldiseaseenhancer>();
		   for(int i = 0;i<MDE.size();i++){
			   ArrayList<subdiseaseenhancer> tempsde = new ArrayList<subdiseaseenhancer>();
			   for(int j = 0;j<SDE.size();j++){
				   if(MDE.get(i).getId().equalsIgnoreCase(SDE.get(j).getId())){
					   tempsde.add(SDE.get(j));
				   }
			   }
			   //ADE.add(new alldiseaseenhancer(MDE.get(i).getId(),MDE.get(i).getEnhchr(),MDE.get(i).getEnhstart(),MDE.get(i).getEnhend(),MDE.get(i).getTargetgene(),MDE.get(i).getDiseasetype(),MDE.get(i).getPmidnum(),tempsde));
		   }
		   jsonade = GsonTools.createJsonString(ADE);
		   
		   System.out.println(jsonade);
		}
		catch (Exception e){
			e.printStackTrace();
			return ERROR;
		}
		finally{
			SqlPool.putBackConnection(conn);
		}
		return SUCCESS;
    }
	
	
	

	
	public ArrayList<maindiseaseenhancer> getMDE() {
		return MDE;
	}





	public void setMDE(ArrayList<maindiseaseenhancer> mDE) {
		MDE = mDE;
	}





	public ArrayList<subdiseaseenhancer> getSDE() {
		return SDE;
	}





	public void setSDE(ArrayList<subdiseaseenhancer> sDE) {
		SDE = sDE;
	}





	public String getJsonmde() {
		return jsonmde;
	}





	public void setJsonmde(String jsonmde) {
		this.jsonmde = jsonmde;
	}





	public String getJsonsde() {
		return jsonsde;
	}





	public void setJsonsde(String jsonsde) {
		this.jsonsde = jsonsde;
	}





	public String getQuery() {
		return query;
	}

	public void setQuery(String query) {
		this.query = query;
	}

	public String getQuerytype() {
		return querytype;
	}

	public void setQuerytype(String querytype) {
		this.querytype = querytype;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}





	public ArrayList<alldiseaseenhancer> getADE() {
		return ADE;
	}





	public void setADE(ArrayList<alldiseaseenhancer> aDE) {
		ADE = aDE;
	}





	public String getJsonade() {
		return jsonade;
	}





	public void setJsonade(String jsonade) {
		this.jsonade = jsonade;
	}
	
    
}
