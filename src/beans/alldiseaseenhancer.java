package beans;

import java.util.ArrayList;

public class alldiseaseenhancer {
	private String id;
    private String enhchr;
    private String enhstart;
    private String enhend;
    private String targetgene;
    private String diseasetype;
    private String pmidnum;
    private ArrayList<subdiseaseenhancer> ASDE;
	public String getId(){
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getEnhchr() {
		return enhchr;
	}
	public void setEnhchr(String enhchr) {
		this.enhchr = enhchr;
	}
	public String getEnhstart() {
		return enhstart;
	}
	public void setEnhstart(String enhstart) {
		this.enhstart = enhstart;
	}
	public String getEnhend() {
		return enhend;
	}
	public void setEnhend(String enhend) {
		this.enhend = enhend;
	}
	public String getTargetgene() {
		return targetgene;
	}
	public void setTargetgene(String targetgene) {
		this.targetgene = targetgene;
	}
	public String getDiseasetype() {
		return diseasetype;
	}
	public void setDiseasetype(String diseasetype) {
		this.diseasetype = diseasetype;
	}
	public String getPmidnum() {
		return pmidnum;
	}
	public void setPmidnum(String pmidnum) {
		this.pmidnum = pmidnum;
	}
	public ArrayList<subdiseaseenhancer> getASDE() {
		return ASDE;
	}
	public void setASDE(ArrayList<subdiseaseenhancer> aSDE) {
		ASDE = aSDE;
	}
	public alldiseaseenhancer(String id, String enhchr, String enhstart, String enhend, String targetgene,
			String diseasetype, String pmidnum, ArrayList<subdiseaseenhancer> aSDE) {
		super();
		this.id = id;
		this.enhchr = enhchr;
		this.enhstart = enhstart;
		this.enhend = enhend;
		this.targetgene = targetgene;
		this.diseasetype = diseasetype;
		this.pmidnum = pmidnum;
		ASDE = aSDE;
	}
    public alldiseaseenhancer(){
    	
    }
}
