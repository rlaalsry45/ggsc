package ggsc.stats.service;

import ams.cmm.PageVO;

public class ResultReportVO extends PageVO{
	private String schCnsGb; // 상담구분
	private String schCenterGb; //센터구분
    private String schDateGb; // 일자
    private String schCnsrGb; // 상담사구분
    private String schGenderGb; //성별구분
    private String schAddrGb; // 지역구분
    private String schPsyGb; // 심리검사 구분
    private String schYearGb; // 년도
    private String schMonthGb; // 월
    private String schCnsrId;
    private String centerGb;
    
    private String schStartDate;
	private String schEndDate; 
   
	
    public String getSchCnsrId() {
		return schCnsrId;
	}
	public void setSchCnsrId(String schCnsrId) {
		this.schCnsrId = schCnsrId;
	}
	public String getCenterGb() {
		return centerGb;
	}
	public void setCenterGb(String centerGb) {
		this.centerGb = centerGb;
	}
	public String getSchStartDate() {
		return schStartDate;
	}
	public void setSchStartDate(String schStartDate) {
		this.schStartDate = schStartDate;
	}
	public String getSchEndDate() {
		return schEndDate;
	}
	public void setSchEndDate(String schEndDate) {
		this.schEndDate = schEndDate;
	}
	public String getschYearGb() {
  		return schYearGb;
  	}
  	public void setschYearGb(String schYearGb) {
  		this.schYearGb = schYearGb;
  	}
  	
    public String getschMonthGb() {
  		return schMonthGb;
  	}
  	public void setschMonthGb(String schMonthGb) {
  		this.schMonthGb = schMonthGb;
  	}

    public String getschPsyGb() {
		return schPsyGb;
	}
	public void setschPsyGb(String schPsyGb) {
		this.schPsyGb = schPsyGb;
	}
    
    public String getschAddrGb() {
		return schAddrGb;
	}
	public void setschAddrGb(String schAddrGb) {
		this.schAddrGb = schAddrGb;
	}
	
    public String getschCnsGb() {
		return schCnsGb;
	}
	public void setschCnsGb(String schCnsGb) {
		this.schCnsGb = schCnsGb;
	}
	
	public String getschCenterGb() {
		return schCenterGb;
	}
	public void setschCenterGb(String schCenterGb) {
		this.schCenterGb = schCenterGb;
	}
	
	public String getschDateGb() {
		return schDateGb;
	}
	public void setschDateGb(String schDateGb) {
		this.schDateGb = schDateGb;
	}
	
	public String getschCnsrGb() {
		return schCnsrGb;
	}
	public void setschCnsrGb(String schCnsrGb) {
		this.schCnsrGb = schCnsrGb;
	}
	
	public String getschGenderGb() {
		return schGenderGb;
	}
	public void setschGenderGb(String schGenderGb) {
		this.schGenderGb = schGenderGb;
	}
	
	
	
	
}