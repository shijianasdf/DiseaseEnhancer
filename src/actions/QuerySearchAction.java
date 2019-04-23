package actions;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import mysqlUtils.SqlPool;
import com.opensymphony.xwork2.ActionSupport;
import beans.maindiseaseenhancer;
import convJson.GsonTools;



@SuppressWarnings("serial")
public class QuerySearchAction extends ActionSupport{
	    private String disease;//浼犺繘鏉ョ殑disease瀵瑰簲select鏍囩锛屽弬鏁� "", "", "", "" diseasetype
		private String gene;  // geneName like targetgene
		private String chromosome; // chr1:100000-100200 enhchr enhstart enhend
		private String message;
		private ArrayList<maindiseaseenhancer> result = new ArrayList<maindiseaseenhancer>();
		private String jsonTable;
		private String status;
		public String execute(){
			Connection conn = null;
			PreparedStatement pstmt =null;
			ResultSet RS=null;
			try{
				conn = SqlPool.getConnection();
                if(disease == null && gene.equalsIgnoreCase("") && chromosome.equalsIgnoreCase("")){
                	message = "you input nothing";
        			return ERROR;
                }
                	String sql = "select * from daec.maindiseaseenhancer where ";
					if(gene!=null && !gene.equalsIgnoreCase("")){
						String s = "(";
						String[] genes = gene.split(",");
						for(int i = 0;i<genes.length-1;i++){
				    		s = s + " targetgene like \"%"+genes[i]+"%\" or";
				    	}
				    	s = s + " targetgene like \"%"+genes[genes.length-1]+"%\")";
						sql = sql + s;
					}else{
						sql = sql + "targetgene like \"%"+gene+"%\"";
					}
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
				    System.out.println(sql);
				    pstmt = conn.prepareStatement(sql);
					RS=pstmt.executeQuery();
					while(RS.next()){
						result.add(new maindiseaseenhancer(RS.getString(1),RS.getString(2),RS.getString(3),RS.getString(4),RS.getString(5),RS.getString(6)));
					}
					status = "success";
					jsonTable = GsonTools.createJsonString(result);
					System.out.println(result);
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
		public String getDisease() {
			return disease;
		}
		public void setDisease(String disease) {
			this.disease = disease;
		}
		public String getGene() {
			return gene;
		}
		public void setGene(String gene) {
			this.gene = gene;
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
		public String getJsonTable() {
			return jsonTable;
		}
		public void setJsonTable(String jsonTable) {
			this.jsonTable = jsonTable;
		}
		public String getStatus() {
			return status;
		}
		public void setStatus(String status) {
			this.status = status;
		}
		
		
	    
}