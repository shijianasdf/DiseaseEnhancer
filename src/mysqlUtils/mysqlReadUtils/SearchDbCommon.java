package mysqlUtils.mysqlReadUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class SearchDbCommon {
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	// 查看行数
	public int queryRowCount(Connection conn, String dbName, String tableName) throws SQLException{
		int rowCount=0;
		pstmt = conn.prepareStatement("select count(*) from "+dbName+"."+tableName);
		rs = pstmt.executeQuery();
		while(rs.next())
			rowCount=rs.getInt(1);
		System.out.println("rowCount"+rowCount);
		return rowCount;
	}
	public int queryRowCount2(Connection conn, String dbName, String tableName, String key, String value) throws SQLException{
		int rowCount=0;
		String mysqlStr = "select count(*) from "+dbName+"."+tableName+" where "+key+"='"+value+"'";
		System.out.println(mysqlStr);
		pstmt = conn.prepareStatement(mysqlStr);
		rs = pstmt.executeQuery();
		while(rs.next())
			rowCount=rs.getInt(1);
		System.out.println("rowCount"+rowCount);
		return rowCount;
	}
	// 查看列数
	public int queryColumnCount(Connection conn,String dbName,String tableName) throws SQLException{
		int columnCount=0;
		/*这是另一种计算列数的方法；推荐使用下方方法
		pstmt = conn.prepareStatement("select * from "+dbName+"."+tableName+" limit 1");
		rs = pstmt.executeQuery();
		ResultSetMetaData data=rs.getMetaData();
		while(rs.next()){
			columnCount=data.getColumnCount();
		}
		System.out.println("columnCount"+columnCount);
		*/
		//另一种计算列数的方法
		rs=conn.prepareStatement("desc "+dbName+"."+tableName).executeQuery();	//覆盖原来的mysql语句
		rs.last();
		columnCount = rs.getRow();
		//System.out.println("my col num: "+rs.getRow());
		return columnCount;
	}
	
	// 查看列名
	public ArrayList<String> queryColName(Connection conn,String dbName,String tableName,int columnCount) throws SQLException{
		ArrayList<String> colName = new ArrayList<String>();
		Statement stmt = conn.createStatement();
		/*//这是另一种列名方法；推荐使用下方方法
		String sqlStr="select * from "+dbName+"."+tableName+" limit 1";
		rs=stmt.executeQuery(sqlStr);
		ResultSetMetaData data=rs.getMetaData();
		for(int i=1; i<=columnCount; i++)
			colName.add(data.getColumnName(i));	
		System.out.println("colname="+colName.size());
		*/
		//另一种计算列名的方法
		rs=stmt.executeQuery("desc "+dbName+"."+tableName);
		while(rs.next()){
			colName.add(rs.getString("Field"));
			//System.out.println(rs.getString("Field"));
		}
		System.out.println(colName);
		return colName;
	}
}