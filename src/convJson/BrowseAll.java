package convJson;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
// 注意
// 这个 class 没有用了
// 这是作为一个生成 json 的例子放在这里
public class BrowseAll {
	private PreparedStatement pstmt;
	private ResultSet rs;
	//提取mysql数据时返回标准json String
	public String browseTableJson (Connection conn,String dbName,String tableName,String selectedCols) throws SQLException{
		//把mysql的列名作为json名称
		String jsonstring = "";
		//mysql提取结果
		ArrayList<ArrayList<String>> tableElements=new ArrayList<ArrayList<String>>();
		//获取返回结果列数
		int size = 0;
		//提取结果的列信息
		String[] selectedColnames = selectedCols.split(",");
		size = selectedColnames.length;
		//System.out.println("result table column counts "+selectedColnames.length);
		String mysqlStr = "select "+selectedCols+" from "+dbName+"."+tableName+" order by updateTime desc";
		//String mysqlStr = "select "+selectedCols+" from "+dbName+"."+tableName+" order by updateTime desc limit 50";
		System.out.println(mysqlStr);
		pstmt = conn.prepareStatement(mysqlStr);
		rs = pstmt.executeQuery();
		while(rs.next()){
		ArrayList<String> alChild=new ArrayList<String>();
		for(int i=1;i<=size;i++)
			//根据提供的json名称，提取mysql数据，注意名字的顺序
			alChild.add("\""+selectedColnames[i-1]+"\":\""+rs.getString(i)+"\"");
		tableElements.add(alChild);
		}
		//System.out.println(tableElements);
		//转成标准json字符串
		jsonstring = tableElements.toString().replace("[", "{");
		jsonstring = jsonstring.replace("]", "}");
		jsonstring = "["+jsonstring.substring(1,jsonstring.length()-1)+"]";
		return jsonstring;
	}
	
}
