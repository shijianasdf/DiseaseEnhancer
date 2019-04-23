package mysqlUtils.mysqlReadUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

//主頁顯示的表格
//設置最大顯示50條記錄
public class BrowseAll {
	private PreparedStatement pstmt;
	private ResultSet rs;
	//获得选择的列组成的表
	public ArrayList<ArrayList<String>> browseAllRows(Connection conn, String dbName,String tableName,String selectedCols) throws SQLException{
		ArrayList<ArrayList<String>> tableElements=new ArrayList<ArrayList<String>>();
		//获取返回结果列数
		int size = 0;
		size = selectedCols.split(",").length;
		//size = sdbc.queryColumnCount(conn, dbName, tableName, selectedCols);
		System.out.println("result table column counts "+size);
		//获取mysql指令
		String mysqlStr = "select "+selectedCols+" from "+dbName+"."+tableName;
		//String mysqlStr = "select "+selectedCols+" from "+dbName+"."+tableName+" order by updateTime desc limit 50";
		System.out.println(mysqlStr);
		pstmt = conn.prepareStatement(mysqlStr);
		rs = pstmt.executeQuery();
		while(rs.next()){
		ArrayList<String> alChild=new ArrayList<String>();
		for(int i=1;i<=size;i++)
		alChild.add(rs.getString(i));
		tableElements.add(alChild);
		}
		System.out.println(tableElements);
		System.out.println(tableElements);
		return tableElements;
	}
	//获得选择的列组成的表
	public ArrayList<ArrayList<String>> browse50Rows(Connection conn,String dbName,String tableName,String selectedCols) throws SQLException{
		ArrayList<ArrayList<String>> tableElements=new ArrayList<ArrayList<String>>();
		//获取返回结果列数
		int size = 0;
		size = selectedCols.split(",").length;
		//size = sdbc.queryColumnCount(conn,dbName,tableName,selectedCols);
		System.out.println("result table column counts "+size);
		//获取mysql指令
		String mysqlStr = "select "+selectedCols+" from "+dbName+"."+tableName+" limit 50";
		System.out.println(mysqlStr);
		pstmt = conn.prepareStatement(mysqlStr);
		rs = pstmt.executeQuery();
		while(rs.next()){
			ArrayList<String> alChild=new ArrayList<String>();
			for(int i=1;i<=size;i++)
				alChild.add(rs.getString(i));
			tableElements.add(alChild);
		}
		System.out.println(tableElements);
		System.out.println(tableElements);
		return tableElements;
	}
}