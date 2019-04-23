package actions;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.rosuda.REngine.Rserve.RConnection;

import com.opensymphony.xwork2.ActionSupport;

import beans.maindiseaseenhancer;
import configs.Configs;
import configs.RConfig;
import convJson.GsonTools;
import generatName.GenerateTime;
import generatName.RandomString;
import mysqlUtils.SqlPool;
import rconnUtils.RConn;
import readWrite.WriteFile;

@SuppressWarnings("serial")
public class BatchSearchAction extends ActionSupport{
	private String disease2; //"", "", "", "" diseasetype
	private String chromosomes; // chr1:100000-100200 enhchr enhstart enhend
	private File upload  ;
	private String uploadContentType;
	private String uploadFileName;
	private String message;
	private ArrayList<ArrayList<String>> resultTable;
	private String ajaxResultTable;
	private WriteFile wf = new WriteFile();
	private String status;
	public String execute(){
		if(chromosomes.equalsIgnoreCase("") && upload == null){
			message = "you did not input genomic regions";
			return ERROR;
		}
		RConn rconn = null;
		RConnection re = null;
		try{
			rconn = new RConn();
			re = rconn.getRConn();
			if(upload == null){
				String filePath = wf.writeFile(chromosomes, Configs.filePath);
				if(!filePath.isEmpty()){
					// source .R files
	    		 	String sourceR="source('"+RConfig.overlapFunFile+"')";
	    		 	re.eval(sourceR); 
	    		 	if(disease2 != null){
	    		 		System.out.println(disease2);
	    		 		re.assign("disease", disease2);//java璧嬪�煎悜閲忕粰R瀵硅薄
	    		 	}else{
	    		 		re.assign("disease", "NULL");
	    		 	}
	    		 	re.assign("filepath", filePath);
	    		 	String[] arr = re.eval(RConfig.overlapFun).asStrings();
	    		 	System.out.println(arr.toString());
	    		 	System.out.println(arr.length);
	    		 	int rowCounts = arr.length/6;
	    		 	resultTable = new ArrayList<ArrayList<String>>();
	    			for(int i=0;i<rowCounts;i++){
	    				ArrayList<String> rowArrayList = new ArrayList<String>();
	    				for(int j=0; j<6; j++){
	    					rowArrayList.add(arr[i*6+j]);
	    				}
	    				resultTable.add(rowArrayList);
	    			}
	    			ajaxResultTable = GsonTools.createJsonString(resultTable);
	    			status = "success";
	    			System.out.println(GsonTools.createJsonString(resultTable));
	    			File dest = new File(filePath);
	    			if(dest.exists()){
	    				dest.delete();
	    			}
				}
			}else{
				GenerateTime st =new GenerateTime();
				RandomString rs=new RandomString();
				String time=st.generateTime("day");
				String randomstring = rs.getRandomString(5);
				String path = ServletActionContext.getServletContext().getRealPath("/upload").replaceAll("\\\\", "/")+"/";
				String filePath = path+time+"/"+randomstring+"/";
				File dirfile = new File(filePath);
				if(!dirfile.exists()||!dirfile.isDirectory()){
					boolean  creadok = dirfile.mkdirs();  //閻㈢喐鍨氶崥宥呯摟娑擄拷/upload閻ㄥ嫭鏋冩禒璺恒仚+ServletActionContext.getRequest().getSession().getId()
					if(!creadok){
						this.message="System error or in busy,please check your submits or wait for a few minutes and try again!";
						return ERROR;
					}
				}
				//鏂囦欢璺緞
				String filepath=filePath+this.uploadFileName;
				File dest=new File(filepath);
				FileUtils.copyFile(this.upload, dest);
				// source .R files
    		 	String sourceR="source('"+RConfig.overlapFunFile+"')";
    		 	//鎵цsource鍛戒护锛岀敓鏄嶳鍑芥暟
    		 	re.eval(sourceR); 
    		 	//鍦≧璇█寤虹珛鍙橀噺骞惰祴鍊硷紝浣滀负鍑芥暟鐨勫疄鍙�
    		 	if(disease2 != null){
    		 		System.out.println(disease2);
    		 		re.assign("disease", disease2);//java璧嬪�煎悜閲忕粰R瀵硅薄
    		 	}else{
    		 		re.assign("disease", "NULL");
    		 	}
//    		 	if(!gene.equalsIgnoreCase("")){
//    		 		System.out.println(gene);
//    		 		re.assign("gene", gene);
//    		 	}else{
//    		 		re.assign("gene", "NULL");
//    		 	}
    		 	if(!filePath.equalsIgnoreCase("")){
    		 		System.out.println(filepath);
    		 		re.assign("filepath", filepath);
    		 	}else{
    		 		re.assign("filepath", "NULL");
    		 	}
    		 	//鎵ц璇ュ嚱鏁帮紝骞跺緱鍒癝tring鏁扮粍
    		 	String[] arr = re.eval(RConfig.overlapFun).asStrings();
    		 	System.out.println(arr.toString());
    		 	System.out.println(arr.length);
    		 	int rowCounts = arr.length/6;
    		 	resultTable = new ArrayList<ArrayList<String>>();
    			for(int i=0;i<rowCounts;i++){
    				ArrayList<String> rowArrayList = new ArrayList<String>();
    				for(int j=0; j<6; j++){
    					rowArrayList.add(arr[i*6+j]);
    				}
    				resultTable.add(rowArrayList);
    			}
    			ajaxResultTable = GsonTools.createJsonString(resultTable);
    			status = "success";
    			System.out.println(GsonTools.createJsonString(resultTable));
    			if(dest.exists()){
    				boolean flag = dest.delete();
    			}
			}
		}catch(Exception e){
			e.printStackTrace();
			return ERROR;
		}finally{
			rconn.closeRconn();
			re.close();
		}
		
		return SUCCESS;
	}
	public String getDisease2() {
		return disease2;
	}
	public void setDisease2(String disease2) {
		this.disease2 = disease2;
	}
	public String getChromosomes() {
		return chromosomes;
	}
	public void setChromosomes(String chromosomes) {
		this.chromosomes = chromosomes;
	}
	public File getUpload() {
		return upload;
	}
	public void setUpload(File upload) {
		this.upload = upload;
	}
	public String getUploadContentType() {
		return uploadContentType;
	}
	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}
	public String getUploadFileName() {
		return uploadFileName;
	}
	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public ArrayList<ArrayList<String>> getResultTable() {
		return resultTable;
	}
	public void setResultTable(ArrayList<ArrayList<String>> resultTable) {
		this.resultTable = resultTable;
	}
	public String getAjaxResultTable() {
		return ajaxResultTable;
	}
	public void setAjaxResultTable(String ajaxResultTable) {
		this.ajaxResultTable = ajaxResultTable;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
}
