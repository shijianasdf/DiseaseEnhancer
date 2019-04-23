package actions;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.opensymphony.xwork2.ActionSupport;

import mysqlUtils.SqlPool;

@SuppressWarnings("serial")
public class ContactAction extends ActionSupport{
   private String useremail;
   private String username;
   private String subject;
   private String message;
   private String status = "success";
   public String execute(){
	   Connection conn = null;
	   PreparedStatement pstmt =null;
	   String sql = "insert into daec.contact values(null,?,?,?,?)";
	   try{
		   conn=SqlPool.getConnection();
		   pstmt=conn.prepareStatement(sql);
		   pstmt.setString(1, useremail);
		   pstmt.setString(2, username);
		   pstmt.setString(3, subject);
		   pstmt.setString(4, message);
		   pstmt.executeUpdate();
		   System.out.println(pstmt);
		}catch(Exception e){
			e.printStackTrace();
			status = "error";
			return ERROR;
		}
		finally{
			SqlPool.putBackConnection(conn);
		}
	   return SUCCESS;
   }
public String getUseremail() {
	return useremail;
}
public void setUseremail(String useremail) {
	this.useremail = useremail;
}
public String getUsername() {
	return username;
}
public void setUsername(String username) {
	this.username = username;
}
public String getSubject() {
	return subject;
}
public void setSubject(String subject) {
	this.subject = subject;
}
public String getMessage() {
	return message;
}
public void setMessage(String message) {
	this.message = message;
}
public String getStatus() {
	return status;
}
public void setStatus(String status) {
	this.status = status;
}
   
}
