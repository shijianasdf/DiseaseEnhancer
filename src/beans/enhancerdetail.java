package beans;

public class enhancerdetail {
	private String id;
	private String targetgene;
	private String diseasetype;
	private String vartype;
	private String varname;
    private String varchr;
    private String varstart;
    private String varend;
    private String muttype;
    private String varcons;
    private String pmid;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public String getVartype() {
		return vartype;
	}
	public void setVartype(String vartype) {
		this.vartype = vartype;
	}
	public String getVarname() {
		return varname;
	}
	public void setVarname(String varname) {
		this.varname = varname;
	}
	public String getVarchr() {
		return varchr;
	}
	public void setVarchr(String varchr) {
		this.varchr = varchr;
	}
	public String getVarstart() {
		return varstart;
	}
	public void setVarstart(String varstart) {
		this.varstart = varstart;
	}
	public String getVarend() {
		return varend;
	}
	public void setVarend(String varend) {
		this.varend = varend;
	}
	public String getMuttype() {
		return muttype;
	}
	public void setMuttype(String muttype) {
		this.muttype = muttype;
	}
	public String getVarcons() {
		return varcons;
	}
	public void setVarcons(String varcons) {
		this.varcons = varcons;
	}
	public String getPmid() {
		return pmid;
	}
	public void setPmid(String pmid) {
		this.pmid = pmid;
	}
	public enhancerdetail(String id, String targetgene, String diseasetype, String vartype, String varname,
			String varchr, String varstart, String varend, String muttype, String varcons, String pmid) {
		super();
		this.id = id;
		this.targetgene = targetgene;
		this.diseasetype = diseasetype;
		this.vartype = vartype;
		this.varname = varname;
		this.varchr = varchr;
		this.varstart = varstart;
		this.varend = varend;
		this.muttype = muttype;
		this.varcons = varcons;
		this.pmid = pmid;
	}
    public enhancerdetail(){
    	
    }
}
