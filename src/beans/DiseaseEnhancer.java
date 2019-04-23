package beans;

public class DiseaseEnhancer {
	private String id;
    private String enhchr;
    private String enhstart;
    private String enhend;
    private String targetgene;
    private String diseasetype;
    private String  pmid;
	public String getId() {
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
	public String getPmid() {
		return pmid;
	}
	public void setPmid(String pmid) {
		this.pmid = pmid;
	}
	public DiseaseEnhancer(String id, String enhchr, String enhstart, String enhend, String targetgene,
			String diseasetype, String pmid) {
		super();
		this.id = id;
		this.enhchr = enhchr;
		this.enhstart = enhstart;
		this.enhend = enhend;
		this.targetgene = targetgene;
		this.diseasetype = diseasetype;
		this.pmid = pmid;
	}
    public DiseaseEnhancer(){
    	
    }
}
