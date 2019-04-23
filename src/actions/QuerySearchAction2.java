package actions;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.rosuda.REngine.Rserve.RConnection;

import mysqlUtils.SqlPool;
import mysqlUtils.mysqlUtilsSpecific.SearchDbLikelyTable;
import rconnUtils.RConn;
import upload.Upload;


import com.opensymphony.xwork2.ActionSupport;

import beans.DriverEnhancer;
import beans.maindiseaseenhancer;
import configs.Configs;
import configs.RConfig;
import convJson.GsonTools;
import generatName.GenerateTime;
import generatName.RandomString;


@SuppressWarnings("serial")
public class QuerySearchAction2 extends ActionSupport{
	    private String disease;//浼犺繘鏉ョ殑disease瀵瑰簲select鏍囩锛屽弬鏁� "", "", "", "" diseasetype
		//private String[] disease; // =
		private String variant; // SNP閹存牞锟藉懎鍙炬禒鏍崐閸欙拷   like   varname
		private String gene;  // geneName like targetgene
		private String chromosome; // chr1:100000-100200 enhchr enhstart enhend
		private String disease2; //"", "", "", "" diseasetype
		private String chromosomes; // chr1:100000-100200 enhchr enhstart enhend
		private File upload  ;
		private String uploadContentType;
		private String uploadFileName;
		private RConn rconn = new RConn(); //R杩炴帴姹狅紝鍙互闅忎究浠庨噷闈㈡嬁RConnection
		private RConnection re = null; //R杩炴帴瀵硅薄
		Upload up = new Upload();
		private String message;
		
		private ArrayList<maindiseaseenhancer> result = new ArrayList<maindiseaseenhancer>();
		private String jsonTable;
		private ArrayList<ArrayList<String>> resultTable;
		private String ajaxResultTable;
		public String execute(){
			Connection conn = null;
			PreparedStatement pstmt =null;
			ResultSet RS=null;
			try{
				conn = SqlPool.getConnection();
				//浠嶳杩炴帴姹犱腑鎷垮嚭涓�涓繛鎺ュ璞�,骞朵笖璧嬪�肩粰re
				Statement ST=conn.createStatement();
				//if(upload == null && gene.equalsIgnoreCase("") && disease == null && chromosome.equalsIgnoreCase("")){
				if(upload == null && gene == null && disease == null && disease2 == null && chromosome.equalsIgnoreCase("") && chromosomes.equalsIgnoreCase("")){
			    	System.out.println("hello hehe");
			    	message = "you input nothing";
					return ERROR;
				}
				
				
				
				if(upload == null){
					String sql = "select * from daec.maindiseaseenhancer where targetgene like '%"+this.gene+"%'";
					if(chromosome!=null && !chromosome.equalsIgnoreCase("")){
						String[] a = chromosome.split(":");
				    	String[] b = a[1].split("-");
					    String chr = a[0];
						String begin = b[0];
						String end = b[1];
						sql = sql + " and ((enhchr = '"+chr+"' and enhstart <= '"+begin+"' and enhend >= '"+begin+"') or (enhchr = '"+chr+"' and enhstart <= '"+end+"' and enhend >= '"+end+"') or (enhchr = '"+chr+"' and enhstart >= '"+begin+"' and enhend <= '"+end+"') or (enhchr = '"+chr+"' and enhstart <= '"+begin+"' and enhend >= '"+end+"'))";	
				    }
				    if(disease!=null){
				    	String s = " and (";
				    	String[] temp = disease.split(", ");
				    	for(int i =0;i<temp.length-1;i++){
				    		s = s + " diseasetype = \""+temp[i]+"\" or";
				    	}
				    	s = s + " diseasetype = \""+temp[temp.length-1]+"\")";
						sql = sql + s;
						System.out.println(sql);
				    }
				    //pstmt=conn.prepareStatement(sql);
				    System.out.println(sql);
					RS=ST.executeQuery(sql);
					while(RS.next()){
						result.add(new maindiseaseenhancer(RS.getString(1),RS.getString(2),RS.getString(3),RS.getString(4),RS.getString(5),RS.getString(6)));
					}
					jsonTable = GsonTools.createJsonString(result);
					System.out.println(result);
				}else{
					
					re=rconn.getRConn();
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
	    		 	if(disease != null){
	    		 		System.out.println(disease);
	    		 		re.assign("disease", disease);//java璧嬪�煎悜閲忕粰R瀵硅薄
	    		 	}else{
	    		 		re.assign("disease", "NULL");
	    		 	}
	    		 	if(!gene.equalsIgnoreCase("")){
	    		 		System.out.println(gene);
	    		 		re.assign("gene", gene);
	    		 	}else{
	    		 		re.assign("gene", "NULL");
	    		 	}
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
	    			System.out.println(GsonTools.createJsonString(resultTable));
	    			if(dest.exists()){
	    				boolean flag = dest.delete();
	    			}
	    		 	
				}
			}	
			catch (Exception e){
				e.printStackTrace();
				return ERROR;
			}
			finally{
				SqlPool.putBackConnection(conn);
				if(upload != null){
					rconn.closeRconn();
					re.close();
				}
			}	
				    
			return SUCCESS;
		}
		public String getDisease() {
			return disease;
		}
		public void setDisease(String disease) {
			this.disease = disease;
		}
		
		public String getVariant() {
			return variant;
		}
		/*public String[] getDisease() {
			return disease;
		}

		public void setDisease(String[] disease) {
			this.disease = disease;
		}*/

		public void setVariant(String variant) {
			this.variant = variant;
		}
		public String getGene() {
			return gene;
		}
		public void setGene(String gene) {
			this.gene = gene;
		}
		
		
		
		public File getUpload() {
			return upload;
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
		public void setUpload(File upload) {
			this.upload = upload;
		}
		
		
		public String getMessage() {
			return message;
		}
		public void setMessage(String message) {
			this.message = message;
		}
		
		public ArrayList<maindiseaseenhancer> getResult() {
			return result;
		}
		public void setResult(ArrayList<maindiseaseenhancer> result) {
			this.result = result;
		}
		public String getChromosome() {
			return chromosome;
		}
		public void setChromosome(String chromosome) {
			this.chromosome = chromosome;
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
		public String getJsonTable() {
			return jsonTable;
		}
		public void setJsonTable(String jsonTable) {
			this.jsonTable = jsonTable;
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
	    
}