package mysqlUtils.mysqlReadUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class SearchDbLikelySingle {
	private PreparedStatement pstmt;
	private ResultSet rs;
	// 模糊搜索，返回特定列的list
	public ArrayList<String> likelySearchList(Connection conn, String dbName, String tableName, String selectedCol, String searchName) throws SQLException{
		System.out.println("select "+selectedCol+" from "+dbName+"."+tableName+" where "+selectedCol+" like '%"+searchName+"%';");
		pstmt = conn.prepareStatement("select "+selectedCol+" from "+dbName+"."+tableName+" where "+selectedCol+" like '%"+searchName+"%';");
		rs = pstmt.executeQuery();
		ArrayList<String> al = new ArrayList<String>();
		while(rs.next())
			al.add(rs.getString(1));
		return al;
	}

}
