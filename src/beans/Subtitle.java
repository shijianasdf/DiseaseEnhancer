package beans;

import java.util.HashMap;

public class Subtitle {
	private HashMap<String,Object> mapMutations;
	private Gene gene;
	private Length length;
	private HashMap<String,Object> mapDomains;
	public HashMap<String, Object> getMapMutations() {
		return mapMutations;
	}
	public void setMapMutations(HashMap<String, Object> mapMutations) {
		this.mapMutations = mapMutations;
	}
	public Gene getGene() {
		return gene;
	}
	public void setGene(Gene gene) {
		this.gene = gene;
	}
	public Length getLength() {
		return length;
	}
	public void setLength(Length length) {
		this.length = length;
	}
	public HashMap<String, Object> getMapDomains() {
		return mapDomains;
	}
	public void setMapDomains(HashMap<String, Object> mapDomains) {
		this.mapDomains = mapDomains;
	}
	
	
}
