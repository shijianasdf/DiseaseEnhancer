package configs;

import org.apache.struts2.ServletActionContext;

public class RConfig {
	public static String rHost="127.0.0.1"; //连接本地R
	public static int rPort;
	public static String rFunDir=ServletActionContext.getServletContext().getRealPath("/RFunctions").replaceAll("\\\\", "/")+"/";
	public static String overlapFunFile = rFunDir+"bedOverlap_DAEC1.r";
	public static String overlapFun = "bed_overlap(filepath,disease)";
}
