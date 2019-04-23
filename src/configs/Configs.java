package configs;

import org.apache.struts2.ServletActionContext;

public class Configs {
	// /bkDir/Software/tomcat7/webapps/LnChrom/tmpFiles
	public static String filePath=ServletActionContext.getServletContext().getRealPath("/tmpFiles").replaceAll("\\\\", "/")+"/";
	

}
