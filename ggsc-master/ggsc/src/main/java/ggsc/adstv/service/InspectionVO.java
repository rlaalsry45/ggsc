package ggsc.adstv.service;

import ams.cmm.PageVO;

public class InspectionVO extends PageVO{

	private String cnsGb;
	private String examDocNm;
	private String beingYn;
	private String dbInsTm;
	private String examDocCd;
	
	private String schCnsGb;
	private String schBeingYn;
	private String schExamDocNm;
	
	public String getSchCnsGb() {
		return schCnsGb;
	}
	public void setSchCnsGb(String schCnsGb) {
		this.schCnsGb = schCnsGb;
	}
	public String getSchBeingYn() {
		return schBeingYn;
	}
	public void setSchBeingYn(String schBeingYn) {
		this.schBeingYn = schBeingYn;
	}
	public String getSchExamDocNm() {
		return schExamDocNm;
	}
	public void setSchExamDocNm(String schExamDocNm) {
		this.schExamDocNm = schExamDocNm;
	}
	public String getCnsGb() {
		return cnsGb;
	}
	public void setCnsGb(String cnsGb) {
		this.cnsGb = cnsGb;
	}
	public String getExamDocNm() {
		return examDocNm;
	}
	public void setExamDocNm(String examDocNm) {
		this.examDocNm = examDocNm;
	}
	public String getBeingYn() {
		return beingYn;
	}
	public void setBeingYn(String beingYn) {
		this.beingYn = beingYn;
	}
	public String getDbInsTm() {
		return dbInsTm;
	}
	public void setDbInsTm(String dbInsTm) {
		this.dbInsTm = dbInsTm;
	}
	public String getExamDocCd() {
		return examDocCd;
	}
	public void setExamDocCd(String examDocCd) {
		this.examDocCd = examDocCd;
	}
	
}
