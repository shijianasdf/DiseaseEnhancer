package actions;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import beans.DriverEnhancer;
import convJson.GsonTools;
import mysqlUtils.SqlPool;


@SuppressWarnings("serial")
public class QuickSearchAction extends ActionSupport{
    private String query;
    private String querytype;
    private ArrayList<DriverEnhancer> AD;
    private String jsonad;
    private String message;
    public String execute(){
    	Connection conn = null;
		PreparedStatement pstmt =null;
		ResultSet RS=null;
		AD = new ArrayList<DriverEnhancer>();
		System.out.println("hello");
		String chr = "";
		String begin = "";
		String end = "";
		if(this.query==null || this.query.equalsIgnoreCase("")){message = "you input nothing";return ERROR;}
		String sql = "";
		this.query=this.query.replaceAll("^[\\s,']+|[\\s,']+$", "");
		if(query.length()>1){			
			if(query.startsWith("chr")){
				String[] a = query.split(":"); // chr6  3465346-64567425
				String[] b = a[1].split("-"); //   3465346 64567425
				chr = a[0];
				begin = b[0];
				end = b[1];
				querytype = "position";
                //                                                                        begin          begin                              end            end                               begin            end                               begin           end
				sql = "select * from daec.driverenhancer where (enhchr = ? and enhstart <= ? and enhend >= ?) or (enhchr = ? and enhstart <= ? and enhend >= ?) or (enhchr = ? and enhstart >= ? and enhend <= ?) or (enhchr = ? and enhstart <= ? and enhend >= ?)";
			}else{
				querytype = "geneOrdisease";
				sql = "select * from daec.driverenhancer where targetgene like ? or diseasetype like ?";
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
		   }else{
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
			   
		   }
		   System.out.println(pstmt);
		   RS=pstmt.executeQuery();		
		   while(RS.next()){
				AD.add(new DriverEnhancer(RS.getString(1),RS.getString(2),RS.getString(3),RS.getString(4),RS.getString(5),RS.getString(6),RS.getString(7),RS.getString(8),RS.getString(9),RS.getString(10),RS.getString(11),RS.getString(12),RS.getString(13),RS.getString(14),RS.getString(15),RS.getString(16),RS.getString(17),RS.getString(18)));
			}	
		   System.out.println(AD);	
		   jsonad = GsonTools.createJsonString(AD);	
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
	
	public ArrayList<DriverEnhancer> getAD() {
		return AD;
	}
	public void setAD(ArrayList<DriverEnhancer> aD) {
		AD = aD;
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
