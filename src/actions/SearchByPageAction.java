package actions;

import java.sql.Connection;
import java.util.ArrayList;
import mysqlUtils.SqlPool;
import mysqlUtils.mysqlReadUtils.SearchDbAccurateTable;
import mysqlUtils.mysqlReadUtils.SearchDbCommon;
import com.opensymphony.xwork2.ActionSupport;

import configs.Configs;

@SuppressWarnings("serial")
public class SearchByPageAction extends ActionSupport{
	// 引入需要的类
	//private SearchDbAccurateSingle sdbas = new SearchDbAccurateSingle();
	//private SearchDbAccurateTable sdbat = new SearchDbAccurateTable();
	//private BrowseAll ba = new BrowseAll();
	private SearchDbCommon sdbc = new SearchDbCommon();
	private SearchDbAccurateTable sdbat = new SearchDbAccurateTable();
	
	private int pageSize = 10;
	// 输入变量
	private int queryPage = 1;
	private int displayStart = 1;
	private int displayEnd = 1;
	private String disease = "Acute myeloid leukemia";
	
	// 输出变量
	private int totalRows = 0;
	private int pageCounts = 0;
	// start 是 0-based
	private int start = 0;
	private int end = 1;
	private ArrayList<ArrayList<String>> result = new ArrayList<ArrayList<String>>();
	//private String ajaxResultTable = "";
	
    private String reStr = "success";
	public String execute() {
		Connection conn = null;
		ArrayList<ArrayList<String>> tempResult = new ArrayList<ArrayList<String>>();
		try{
			conn = SqlPool.getConnection();
			//int rowCountLow = 0;
			//int rowCountHigh = 0;
			totalRows = sdbc.queryRowCount2(conn, "daec", "maindiseaseenhancer", "diseasetype", disease);
			if(disease.equals("all"))
				totalRows = sdbc.queryRowCount(conn, "daec", "maindiseaseenhancer");
			
			/*rowCountHigh = sdbc.queryRowCount(conn, Configs.dbName, "lnc2target_high");
			totalRows = rowCountLow + rowCountHigh;*/
			// 向上取整
			System.out.println((double)totalRows/pageSize);
			System.out.println(Math.ceil((double)totalRows/pageSize));
			pageCounts = (int) Math.ceil((double)totalRows/pageSize);
			// 提取的列
			String selectedCols = "id, enhchr, enhstart, enhend, targetgene, diseasetype";
			if(queryPage>=pageCounts){
				System.out.println("out of index");
				System.out.println("pageCounts            "+pageCounts);
				System.out.println("totalRows            "+totalRows);
				queryPage = pageCounts;
				
			}
			start = start + pageSize*(queryPage-1);
			end = start+pageSize-1;
			displayStart = start+1;
			displayEnd = end+1;
			// 搜索低通量
			if(queryPage>=pageCounts){
			displayEnd = totalRows;
			}
			
			if(disease.equals("all"))
				result = sdbat.browseSelectedRows3(conn, "daec", "maindiseaseenhancer", selectedCols, start, pageSize);
			else
				result = sdbat.browseSelectedRows2(conn, "daec", "maindiseaseenhancer", selectedCols, "diseasetype", disease, start, pageSize);
			
			// 搜索高通量
			//tempResult = ba.browseSelectedRows(conn, Configs.dbName, "lnc2target_high", selectedCols, start, pageSize);
			//}
			if(!result.isEmpty())
				result.removeAll(tempResult);
			result.addAll(tempResult);
			//ajaxResultTable=GsonTools.createJsonString(result);
			//System.out.println(ajaxResultTable);
		}
		catch (Exception e){
			e.printStackTrace();
			reStr = "error";
		}
		finally{
			SqlPool.putBackConnection(conn);
		}
		return SUCCESS;
	}
	public int getQueryPage() {
		return queryPage;
	}
	public void setQueryPage(int queryPage) {
		this.queryPage = queryPage;
	}
	public int getTotalRows() {
		return totalRows;
	}
	public void setTotalRows(int totalRows) {
		this.totalRows = totalRows;
	}
	public int getPageCounts() {
		return pageCounts;
	}
	public void setPageCounts(int pageCounts) {
		this.pageCounts = pageCounts;
	}
	
	public ArrayList<ArrayList<String>> getResult() {
		return result;
	}
	public void setResult(ArrayList<ArrayList<String>> result) {
		this.result = result;
	}
	public String getReStr() {
		return reStr;
	}
	public void setReStr(String reStr) {
		this.reStr = reStr;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public String getDisease() {
		return disease;
	}
	public void setDisease(String disease) {
		this.disease = disease;
	}
	public int getDisplayStart() {
		return displayStart;
	}
	public void setDisplayStart(int displayStart) {
		this.displayStart = displayStart;
	}
	public int getDisplayEnd() {
		return displayEnd;
	}
	public void setDisplayEnd(int displayEnd) {
		this.displayEnd = displayEnd;
	}


}