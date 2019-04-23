package actions;

import java.sql.Connection;
import java.sql.PreparedStatement;


import com.opensymphony.xwork2.ActionSupport;


import mysqlUtils.SqlPool;

@SuppressWarnings("serial")
public class SubmitAction extends ActionSupport{
	private String species;
	private String enhancerregion;
	private String targetgene;
	private String disease;
	private String vartype;
	private String varname;
	private String varsite;
	private String muttype;
	private String varcons;
	//private String assembly;
	private String pmid;
	//private String journal;
	//private String year;
	private String status = "success";
	private String message;
	private String name;
	private String email;
	private String suggestion;
	public String execute(){
		String[] a = enhancerregion.split(":");
		String[] b = a[1].split("-");
		String[] c = varsite.split(":");
		String[] d = c[1].split("-");
		Connection conn = null;
		PreparedStatement pstmt =null;
		String sql = "insert into daec.submit values(null,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		try{
			   conn=SqlPool.getConnection();
			   pstmt=conn.prepareStatement(sql);
			   pstmt.setString(1, species);
			   pstmt.setString(2, a[0]);
			   pstmt.setString(3, b[0]);
			   pstmt.setString(4, b[1]);
			   pstmt.setString(5, targetgene);
			   pstmt.setString(6, disease);
			   pstmt.setString(7, vartype);
			   pstmt.setString(8, varname);
			   pstmt.setString(9, c[0]);
			   pstmt.setString(10, d[0]);
			   pstmt.setString(11, d[1]);
			   pstmt.setString(12, muttype);
			   pstmt.setString(13, varcons);
			   pstmt.setString(14, pmid);
			   pstmt.setString(15, name);
			   pstmt.setString(16, email);
			   pstmt.setString(17, suggestion);
			   pstmt.executeUpdate();
			   System.out.println(pstmt);
			}
			catch (Exception e){
				e.printStackTrace();
				status = "error";
				message = "sorry,system busy,please try later.";
				return ERROR;
			}
			finally{
				SqlPool.putBackConnection(conn);
			}
		status = "success";
		message = "you have submit successfully";
		return SUCCESS;
	}
	public String getSpecies() {
		return species;
	}
	public void setSpecies(String species) {
		this.species = species;
	}
	public String getEnhancerregion() {
		return enhancerregion;
	}
	public void setEnhancerregion(String enhancerregion) {
		this.enhancerregion = enhancerregion;
	}
	public String getTargetgene() {
		return targetgene;
	}
	public void setTargetgene(String targetgene) {
		this.targetgene = targetgene;
	}
	public String getDisease() {
		return disease;
	}
	public void setDisease(String disease) {
		this.disease = disease;
	}
	public String getVartype() {
		return vartype;
	}
	public void setVartype(String vartype) {
		this.vartype = vartype;
	}
	public String getVarname() {
		return varname;
	}
	public void setVarname(String varname) {
		this.varname = varname;
	}
	public String getVarsite() {
		return varsite;
	}
	public void setVarsite(String varsite) {
		this.varsite = varsite;
	}
	public String getMuttype() {
		return muttype;
	}
	public void setMuttype(String muttype) {
		this.muttype = muttype;
	}
	public String getVarcons() {
		return varcons;
	}
	public void setVarcons(String varcons) {
		this.varcons = varcons;
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
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSuggestion() {
		return suggestion;
	}
	public void setSuggestion(String suggestion) {
		this.suggestion = suggestion;
	}
	
}
