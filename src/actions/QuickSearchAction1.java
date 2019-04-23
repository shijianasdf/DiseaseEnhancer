package actions;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import beans.DiseaseEnhancer;
import beans.DriverEnhancer;
import beans.EnhancerDisease1;
import beans.maindiseaseenhancer;
import convJson.GsonTools;
import mysqlUtils.SqlPool;


@SuppressWarnings("serial")
public class QuickSearchAction1 extends ActionSupport{
    private String query;
    private String querytype;
    private ArrayList<maindiseaseenhancer> DE;
    private String jsonad;
    private String message;
    public String execute(){
    	Connection conn = null;
		PreparedStatement pstmt =null;
		ResultSet RS=null;
		DE = new ArrayList<maindiseaseenhancer>();
		System.out.println("hello");
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
				DE.add(new maindiseaseenhancer(RS.getString(1),RS.getString(2),RS.getString(3),RS.getString(4),RS.getString(5),RS.getString(6)));
		   }	
		   System.out.println(DE);	
		   jsonad = GsonTools.createJsonString(DE);	
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
	public ArrayList<maindiseaseenhancer> getDE() {
		return DE;
	}
	public void setDE(ArrayList<maindiseaseenhancer> dE) {
		DE = dE;
	}
	public String getJsonad() {
		return jsonad;
	}
	public void setJsonad(String jsonad) {
		this.jsonad = jsonad;
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
	
    
}
