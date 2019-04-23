package beans;

public class EnhancerPos {
    private String end;
    private String start;
    private String name;
    public EnhancerPos(){
    	
    }
    
	public EnhancerPos(String end, String start) {
		//super();
		this.end = end;
		this.start = start;
		this.name = "enhancer";
	}

	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
    
}
