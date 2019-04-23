package actions;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.rosuda.REngine.RList;
import org.rosuda.REngine.Rserve.RConnection;

import mysqlUtils.SqlPool;
import mysqlUtils.mysqlUtilsSpecific.SearchDbLikelyTable;
import rconnUtils.RConn;
import upload.Upload;


import com.opensymphony.xwork2.ActionSupport;

import beans.DiseaseEnhancer;
import beans.DriverEnhancer;
import beans.alldiseaseenhancer;
import beans.maindiseaseenhancer;
import beans.subdiseaseenhancer;
import configs.Configs;
import configs.RConfig;
import convJson.GsonTools;
import generatName.GenerateTime;
import generatName.RandomString;


@SuppressWarnings("serial")
public class QuerySearchAction1 extends ActionSupport{
	    private String disease;//传进来的disease对应select标签，参数 "", "", "", "" diseasetype
		//private String[] disease; // =
		private String variant; // SNP鎴栬�呭叾浠栫獊鍙�   like   varname
		private String gene;  // geneName like targetgene
		private String chromosome; // chr1:100000-100200 enhchr enhstart enhend
		private File upload  ;
		private String uploadContentType;
		private String uploadFileName;
		private RConn rconn = new RConn(); //R连接池，可以随便从里面拿RConnection
		private RConnection re = null; //R连接对象
		Upload up = new Upload();
		private String message;
		private SearchDbLikelyTable sdblt = new SearchDbLikelyTable();
		private ArrayList<maindiseaseenhancer> MDE = new ArrayList<maindiseaseenhancer>();
		private ArrayList<subdiseaseenhancer> SDE = new ArrayList<subdiseaseenhancer>();
		private ArrayList<alldiseaseenhancer> ADE = new ArrayList<alldiseaseenhancer>();
		private String jsonade;
		private ArrayList<ArrayList<String>> resultTable;
		private String ajaxResultTable;
		public String execute(){
			Connection conn = null;
			PreparedStatement pstmt =null;
			ResultSet RS=null;
			try{
				conn = SqlPool.getConnection();
				//从R连接池中拿出一个连接对象
				//re=rconn.getRConn();
				Statement ST=conn.createStatement();
				
				if(upload == null  && gene.equalsIgnoreCase("") && disease == null && chromosome.equalsIgnoreCase("")){
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
				    		s = s + " diseasetype = '"+temp[i]+"' or";
				    	}
				    	s = s + " diseasetype = '"+temp[temp.length-1]+"')";
						sql = sql + s;
						System.out.println(sql);
				    }
				    //pstmt=conn.prepareStatement(sql);
				    System.out.println(sql);
					RS=ST.executeQuery(sql);
					while(RS.next()){
						//MDE.add(new maindiseaseenhancer(RS.getString(1),RS.getString(2),RS.getString(3),RS.getString(4),RS.getString(5),RS.getString(6),RS.getString(7)));
					}
					
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
					   for(int i = 0;i<MDE.size();i++){
						   ArrayList<subdiseaseenhancer> tempsde = new ArrayList<subdiseaseenhancer>();
						   for(int j = 0;j<SDE.size();j++){
							   if(MDE.get(i).getId().equalsIgnoreCase(SDE.get(j).getId())){
								   tempsde.add(SDE.get(j));
							   }
						   }
						   //ADE.add(new alldiseaseenhancer(MDE.get(i).getId(),MDE.get(i).getEnhchr(),MDE.get(i).getEnhstart(),MDE.get(i).getEnhend(),MDE.get(i).getTargetgene(),MDE.get(i).getDiseasetype(),tempsde));
					   }
					   jsonade = GsonTools.createJsonString(ADE);	
					   System.out.println(jsonade);
				}else{
					GenerateTime st =new GenerateTime();
					RandomString rs=new RandomString();
					String time=st.generateTime("day");
					String randomstring = rs.getRandomString(5);
					String path = ServletActionContext.getServletContext().getRealPath("/upload").replaceAll("\\\\", "/")+"/";
					String filePath = path+time+"/"+randomstring+"/";
					File dirfile = new File(filePath);
					if(!dirfile.exists()||!dirfile.isDirectory()){
						boolean  creadok = dirfile.mkdirs();  //鐢熸垚鍚嶅瓧涓�/upload鐨勬枃浠跺す+ServletActionContext.getRequest().getSession().getId()
						if(!creadok){
							this.message="System error or in busy,please check your submits or wait for a few minutes and try again!";
							return ERROR;
						}
					}
					//文件路径
					String filepath=filePath+this.uploadFileName;
					File dest=new File(filepath);
					FileUtils.copyFile(this.upload, dest);
					
					
					
					re=rconn.getRConn(); 
					// source .R files
	    		 	String sourceR="source('"+RConfig.overlapFunFile+"')";
	    		 	//执行source命令，生明R函数
	    		 	re.eval(sourceR); 
	    		 	//在R语言建立变量并赋值，作为函数的实参
	    		 	if(disease != null){
	    		 		System.out.println(disease);
	    		 		re.assign("disease", disease);//java赋值向量给R对象
	    		 	}else{
	    		 		re.assign("disease", "NULL");
	    		 	}
	    		 	if(!variant.equalsIgnoreCase("")){
	    		 		System.out.println(variant);
	    		 		re.assign("variant", variant);
	    		 	}else{
	    		 		re.assign("variant", "NULL");
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
	    		 	//执行该函数，并得到String数组
	    		 	/*String[] arr = re.eval(RConfig.overlapFun).asStrings();
	    		 	int rowCounts = arr.length/18;
	    		 	resultTable = new ArrayList<ArrayList<String>>();
	    			for(int i=0;i<rowCounts;i++){
	    				ArrayList<String> rowArrayList = new ArrayList<String>();
	    				for(int j=0; j<18; j++){
	    					rowArrayList.add(arr[i*18+j]);
	    				}
	    				resultTable.add(rowArrayList);
	    			}
	    			ajaxResultTable = GsonTools.createJsonString(resultTable);*/
	    		 	//执行该函数，并得到RList
	    		 	RList rl = re.eval(RConfig.overlapFun).asList();
	    		 	
	    			System.out.println(GsonTools.createJsonString(resultTable));
	    			if(dest.exists()){
	    				boolean flag = dest.delete();
	    			}
	    		 	//String [] arr = re.eval(RConfig.overlapFun).asStrings();
					//System.out.println(arr);
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
				//rconn.closeRconn();
				//re.close();
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
		public SearchDbLikelyTable getSdblt() {
			return sdblt;
		}
		public void setSdblt(SearchDbLikelyTable sdblt) {
			this.sdblt = sdblt;
		}
		
		public String getMessage() {
			return message;
		}
		public void setMessage(String message) {
			this.message = message;
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
		public ArrayList<alldiseaseenhancer> getADE() {
			return ADE;
		}
		public void setADE(ArrayList<alldiseaseenhancer> aDE) {
			ADE = aDE;
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
		public String getJsonade() {
			return jsonade;
		}
		public void setJsonade(String jsonade) {
			this.jsonade = jsonade;
		}
		
	    
}