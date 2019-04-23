package actions;

import java.sql.Connection;

import org.rosuda.REngine.REXPMismatchException;
import org.rosuda.REngine.RList;
import org.rosuda.REngine.Rserve.RConnection;
import org.rosuda.REngine.Rserve.RserveException;

import mysqlUtils.mysqlReadUtils.SearchDbAccurateSingle;
import rconnUtils.RConn;
import mysqlUtils.SqlPool;
import com.opensymphony.xwork2.ActionSupport;
import configs.Configs;
import convJson.GsonTools;


@SuppressWarnings("serial")
public class TestAction extends ActionSupport{
	private String disease;
	public String execute() throws REXPMismatchException{
		RConn rconn = new RConn(); //R连接池，可以随便从里面拿RConnection
		try {
			RConnection re = rconn.getRConn(); //R连接对象
			String[] rr = re.eval("rnorm(10)").asStrings();
			String[] rm = re.eval("matrix(rnorm(100),nrow=10,ncol=10)").asStrings();
			RList l = re.eval("list(shi=data.frame(id=1:10,name=1:10),jian=matrix(1:100,nrow=10))").asList();
			System.out.println(l.names);
			int[] a = l.at(1).asIntegers();
			//int[] b = l.at(0).asIntegers();
			System.out.println(GsonTools.createJsonString(a));
			//System.out.println(GsonTools.createJsonString(b));
			System.out.println(GsonTools.createJsonString(l));
			System.out.println(GsonTools.createJsonString(rr));
			System.out.println(GsonTools.createJsonString(rm));
		} catch (RserveException e) {
			
			e.printStackTrace();
		} 
		return SUCCESS;
	}
	public String getDisease() {
		return disease;
	}
	public void setDisease(String disease) {
		this.disease = disease;
	}
	
	
}