package actions;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class JumpToAdvancedSearchAction extends ActionSupport{
	private String status;
    public String execute(){
    	status = "1";
    	return SUCCESS;
    }
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
    
}
