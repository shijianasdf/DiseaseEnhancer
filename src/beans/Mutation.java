package beans;

public class Mutation {
     private String ty;
     private String locus;
     private String dataset;
     private String sample;
     public Mutation(){
    	 
     }
	public String getTy() {
		return ty;
	}
	public void setTy(String ty) {
		this.ty = ty;
	}
	public String getLocus() {
		return locus;
	}
	public void setLocus(String locus) {
		this.locus = locus;
	}
	public String getDataset() {
		return dataset;
	}
	public void setDataset(String dataset) {
		this.dataset = dataset;
	}
	public String getSample() {
		return sample;
	}
	public void setSample(String sample) {
		this.sample = sample;
	}
	public Mutation(String ty, String locus, String dataset, String sample) {
		//super();
		this.ty = ty;
		this.locus = locus;
		this.dataset = dataset;
		this.sample = sample;
	}
     
}
