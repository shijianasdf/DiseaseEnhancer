package mysqlUtils.mysqlUtilsSpecific;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class SearchDbAccurateTable{
	private PreparedStatement pstmt;
	private ResultSet rs;

	// 精确匹配，根据多个条件，返回一个 table
	//
	// 参数说明
	// 1-3.	conn, dbName, tableName 望文生意
	// 4.	selectedCols 返回的列，以逗号空格 ", " 分隔的 String 型
	// 5-6.	基于 keyCols 和 keyValues 搜索结果
	// 		要求此两者为 ArrayList<String> 分别包含检索的列名和对应的值
	// 8-9.	是否在最后添加要求，要求 notEqualCol 不等于 notEqualValue
	// 7.	基于 conditionTypeList 将多个条件连接， ArrayList<String>，这个参数关键，举例说明
	//			例一，如果希望得到 select * from * where (*=A) AND (*=B)
	//			则 conditionTypeList 中输入 ") AND ("
	//			例二，如果希望得到 select * from * where (*=A) AND (*=B OR *=C)
	//			则 conditionTypeList 中输入 ") AND (", " OR "
	//			例三，如果希望得到 select * from * where (*=A) AND (*=B) OR (*=C)
	//			则 conditionTypeList 中输入 ") AND (", ") OR ("
	// 返回 ArrayList<ArrayList<String>>
	public ArrayList<ArrayList<String>> queryTableMC(Connection conn, String dbName, String tableName, String selectedCols, ArrayList<String> keyCols, ArrayList<String> keyValues, ArrayList<String> conditionTypeList, String notEqualCol, String notEqualValue) throws SQLException{
		// 此函数返回的结果  ArrayList<ArrayList<String>>
		ArrayList<ArrayList<String>> resultTable=new ArrayList<ArrayList<String>>();
		// 确定有列数，初始化为零列
		int size = 0;
		// 如果 selectedCols 中包含逗号，获取列数
		if(selectedCols.contains(", "))
			size = selectedCols.split(", ").length;
		else
			size=1;// 如果 selectedCols 中不包含逗号，则列数为一
		System.out.println("search for columns numbers ==== "+size);
		// 建立 mysql 指令
		// 如果 keyCols 中只有一个值，那么等同于单条件搜索的结果
		String mysqlStr = "";
		mysqlStr = "select "+selectedCols+" from "+dbName+"."+tableName+" where ("+keyCols.get(0)+"='"+keyValues.get(0)+"'";
		// 如果 keyCols 的长度大与一
		// 则循环 keyCols 产生多条件搜索指令
		if(keyCols.size()>1 && conditionTypeList.size()>0){
			for(int i=1; i<keyCols.size(); i++)
				mysqlStr = mysqlStr+conditionTypeList.get(i-1)+keyCols.get(i)+"='"+keyValues.get(i)+"'";
		}
		// 添加mysql语句的尾巴
		// 如果没有限定不等列，则直接补上括号的右半边
		// 否则添加不等列指令，并补上括号的右半边
		if(notEqualCol.length()==0)
			mysqlStr = mysqlStr+")";
		else
			mysqlStr = mysqlStr+") AND ("+notEqualCol+"!='"+notEqualValue+"')";
		// 输出 mysql 指令
		System.out.println(mysqlStr);
		// 运行 mysql 指令
		pstmt = conn.prepareStatement(mysqlStr);
		rs = pstmt.executeQuery();
		// 将 mysql 返回的数据输入到 resultTable 中
		while(rs.next()){
			// 建立临时的 list 以存储行信息
			ArrayList<String> rowList=new ArrayList<String>();
			for(int i=1; i<=size; i++){
				String tmpStr = rs.getString(i);
				if(tmpStr.equalsIgnoreCase("uncertain"))
					tmpStr = "NA";
				rowList.add(tmpStr);
			}
				
			rowList.add("more details");
			resultTable.add(rowList);
		}
		return resultTable;
	}
	
	
	// 精确匹配，根据单个条件，返回一个 table
	//
	// 参数说明
	// 1-3.	conn, dbName, tableName 望文生意
	// 4.	selectedCols 返回的列，以逗号空格 ", " 分隔的 String 型
	// 5-6.	基于 keyCol 和 keyValue 搜索结果，String
	// 返回 ArrayList<ArrayList<String>>
	public ArrayList<ArrayList<String>> queryTableSC(Connection conn, String dbName, String tableName, String selectedCols, String keyCol, String keyValue) throws SQLException{
		ArrayList<ArrayList<String>> resultTable=new ArrayList<ArrayList<String>>();
		// 确定有列数，初始化为零列
		int size = 0;
		// 如果 selectedCols 中包含逗号，获取列数
		if(selectedCols.contains(", "))
			size = selectedCols.split(", ").length;
		else
			size=1;	// 如果 selectedCols 中不包含逗号，则列数为一
		System.out.println("search for columns numbers ==== "+size);
		// 建立 mysql 指令
		String mysqlStr = "";
		mysqlStr = "select "+selectedCols+" from "+dbName+"."+tableName+" where "+keyCol+"='"+keyValue+"';";
		// 运行 mysql 指令
		pstmt = conn.prepareStatement(mysqlStr);
		rs = pstmt.executeQuery();
		// 将 mysql 返回的数据输入到 resultTable 中
		while(rs.next()){
			// 建立临时的 list 以存储行信息
			ArrayList<String> rowList=new ArrayList<String>();
			for(int i=1; i<=size; i++){
				String tmpStr = rs.getString(i);
				if(tmpStr.equalsIgnoreCase("uncertain"))
					tmpStr = "NA";
				rowList.add(tmpStr);
			}
			// 添加行信息，以获得返回的 resultTable
			resultTable.add(rowList);
		}
		return resultTable;
	}
}
