package ggsc.report.service;

import org.springframework.web.multipart.MultipartFile;

import ams.cmm.PageVO;

public class PrAtvyRptVO extends PageVO{
	private String schCnsGb;
    private String schZoneGb;
    private String schLocalGb;
    private String schCenterGb;
    private String schCnsleNm;
    private String schStartDate;
    private String schEndDate;
    private String schCnsrNm;
    private String schPromotionGb;
    
	public String getSchCnsrNm() {
		return schCnsrNm;
	}
	public void setSchCnsrNm(String schCnsrNm) {
		this.schCnsrNm = schCnsrNm;
	}
	public String getSchPromotionGb() {
		return schPromotionGb;
	}
	public void setSchPromotionGb(String schPromotionGb) {
		this.schPromotionGb = schPromotionGb;
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
	public String getSchCnsGb() {
		return schCnsGb;
	}
	public void setSchCnsGb(String schCnsGb) {
		this.schCnsGb = schCnsGb;
	}
	public String getSchZoneGb() {
		return schZoneGb;
	}
	public void setSchZoneGb(String schZoneGb) {
		this.schZoneGb = schZoneGb;
	}
	public String getSchLocalGb() {
		return schLocalGb;
	}
	public void setSchLocalGb(String schLocalGb) {
		this.schLocalGb = schLocalGb;
	}
	public String getSchCenterGb() {
		return schCenterGb;
	}
	public void setSchCenterGb(String schCenterGb) {
		this.schCenterGb = schCenterGb;
	}
	public String getSchCnsleNm() {
		return schCnsleNm;
	}
	public void setSchCnsleNm(String schCnsleNm) {
		this.schCnsleNm = schCnsleNm;
	}
	private String prAtvyNo;
	private String cnsGb;
	private String zoneGb;
	private String localGb;
	private String centerGb;
	private String writeDt;
	private String promotion;
	private String prAtvyArea;
	private String prAtvyPtct;
	private String prAtvyRcpt;
	private String prAtvyMan;
	private String prAtvyPlace;
	private String psycExam;
	private String fileNm;
	private String sysFileNm;
	private String filePath;
	private int fileSize;
	private String prAtvyCntn;
	private String inputNm;
	private String prAtvyDt;
	private String prSttHour;
	private String prSttMin;
	private String prEndHour;
	private String prEndMin;
	private String prAtvyPtctGb;
	private String sigunCd;
	private String cnsrId;
	
	private String fDel, delYn;
	private MultipartFile file;
	
	public String getCnsrId() {
		return cnsrId;
	}
	public void setCnsrId(String cnsrId) {
		this.cnsrId = cnsrId;
	}
	public String getfDel() {
		return fDel;
	}
	public void setfDel(String fDel) {
		this.fDel = fDel;
	}
	public String getDelYn() {
		return delYn;
	}
	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	public String getSigunCd() {
		return sigunCd;
	}
	public void setSigunCd(String sigunCd) {
		this.sigunCd = sigunCd;
	}
	public String getPrAtvyPtctGb() {
		return prAtvyPtctGb;
	}
	public void setPrAtvyPtctGb(String prAtvyPtctGb) {
		this.prAtvyPtctGb = prAtvyPtctGb;
	}
	public String getPromotion() {
		return promotion;
	}
	public void setPromotion(String promotion) {
		this.promotion = promotion;
	}
	public String getPrAtvyNo() {
		return prAtvyNo;
	}
	public void setPrAtvyNo(String prAtvyNo) {
		this.prAtvyNo = prAtvyNo;
	}
	public String getCnsGb() {
		return cnsGb;
	}
	public void setCnsGb(String cnsGb) {
		this.cnsGb = cnsGb;
	}
	public String getZoneGb() {
		return zoneGb;
	}
	public void setZoneGb(String zoneGb) {
		this.zoneGb = zoneGb;
	}
	public String getLocalGb() {
		return localGb;
	}
	public void setLocalGb(String localGb) {
		this.localGb = localGb;
	}
	public String getCenterGb() {
		return centerGb;
	}
	public void setCenterGb(String centerGb) {
		this.centerGb = centerGb;
	}
	public String getWriteDt() {
		return writeDt;
	}
	public void setWriteDt(String writeDt) {
		this.writeDt = writeDt;
	}
	public String getPrAtvyArea() {
		return prAtvyArea;
	}
	public void setPrAtvyArea(String prAtvyArea) {
		this.prAtvyArea = prAtvyArea;
	}
	public String getPrAtvyPtct() {
		return prAtvyPtct;
	}
	public void setPrAtvyPtct(String prAtvyPtct) {
		this.prAtvyPtct = prAtvyPtct;
	}
	public String getPrAtvyRcpt() {
		return prAtvyRcpt;
	}
	public void setPrAtvyRcpt(String prAtvyRcpt) {
		this.prAtvyRcpt = prAtvyRcpt;
	}
	public String getPrAtvyMan() {
		return prAtvyMan;
	}
	public void setPrAtvyMan(String prAtvyMan) {
		this.prAtvyMan = prAtvyMan;
	}
	public String getPrAtvyPlace() {
		return prAtvyPlace;
	}
	public void setPrAtvyPlace(String prAtvyPlace) {
		this.prAtvyPlace = prAtvyPlace;
	}
	public String getPsycExam() {
		return psycExam;
	}
	public void setPsycExam(String psycExam) {
		this.psycExam = psycExam;
	}
	public String getFileNm() {
		return fileNm;
	}
	public void setFileNm(String fileNm) {
		this.fileNm = fileNm;
	}
	public String getSysFileNm() {
		return sysFileNm;
	}
	public void setSysFileNm(String sysFileNm) {
		this.sysFileNm = sysFileNm;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public int getFileSize() {
		return fileSize;
	}
	public void setFileSize(int fileSize) {
		this.fileSize = fileSize;
	}
	public String getPrAtvyCntn() {
		return prAtvyCntn;
	}
	public void setPrAtvyCntn(String prAtvyCntn) {
		this.prAtvyCntn = prAtvyCntn;
	}
	public String getInputNm() {
		return inputNm;
	}
	public void setInputNm(String inputNm) {
		this.inputNm = inputNm;
	}
	public String getPrAtvyDt() {
		return prAtvyDt;
	}
	public void setPrAtvyDt(String prAtvyDt) {
		this.prAtvyDt = prAtvyDt;
	}
	public String getPrSttHour() {
		return prSttHour;
	}
	public void setPrSttHour(String prSttHour) {
		this.prSttHour = prSttHour;
	}
	public String getPrSttMin() {
		return prSttMin;
	}
	public void setPrSttMin(String prSttMin) {
		this.prSttMin = prSttMin;
	}
	public String getPrEndHour() {
		return prEndHour;
	}
	public void setPrEndHour(String prEndHour) {
		this.prEndHour = prEndHour;
	}
	public String getPrEndMin() {
		return prEndMin;
	}
	public void setPrEndMin(String prEndMin) {
		this.prEndMin = prEndMin;
	}
}