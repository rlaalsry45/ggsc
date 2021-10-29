package ggsc.monitoring.service;

import ams.cmm.PageVO;

public class MonitoringVO extends PageVO{
	private String schZoneGb; // 상담구분
	private String schCenterGb; //센터구분
    private String schYearGb; // 년도
    private String schMonthGb; // 월
    
    
    public String getschYearGb() {
  		return schYearGb;
  	}
  	public void setschYearGb(String schYearGb) {
  		this.schYearGb = schYearGb;
  	}
  	
  	public String getschZoneGb() {
  		return schZoneGb;
  	}
  	public void setschZoneGb(String schZoneGb) {
  		this.schZoneGb = schZoneGb;
  	}
  	
  	public String getschCenterGb() {
  		return schCenterGb;
  	}
  	public void setschCenterGb(String schCenterGb) {
  		this.schCenterGb = schCenterGb;
  	}
  	
  	public String getschMonthGb() {
  		return schMonthGb;
  	}
  	public void setschMonthGb(String schMonthGb) {
  		this.schMonthGb = schMonthGb;
  	}
  	
  	
    
}