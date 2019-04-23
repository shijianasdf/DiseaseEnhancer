package actions;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;



import com.opensymphony.xwork2.ActionSupport;

import configs.RConfig;

@SuppressWarnings("serial")
public class DownloadAction extends ActionSupport{
	private String filename;
	private String message;
	public InputStream getDiseaseEnhancer(){
		InputStream in = null;
		String filepath = RConfig.rFunDir+"enh2disease.txt";
		try{
			File file = new File(filepath);
			if(file.exists()){
				in = new FileInputStream(filepath);
			}else{
				return null;
			}
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		filename = "DiseaseEnhancer.txt";
		return in;
	}
	public String execute(){
		String filepath = RConfig.rFunDir+"enh2disease.txt";
		File file=new File(filepath);
		if(!file.exists()){
			 message="Sorry,please try again.";
			 return ERROR;
		 }
		return SUCCESS;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
}
