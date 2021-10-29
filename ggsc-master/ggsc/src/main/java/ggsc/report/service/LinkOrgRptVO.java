package ggsc.report.service;

import org.springframework.web.multipart.MultipartFile;

import ams.cmm.PageVO;

public class LinkOrgRptVO extends PageVO{
	private String schCnsGb;
    private String schZoneGb;
    private String schLocalGb;
    private String schCenterGb;
    private String schCnsleNm;
    private String schStartDate;
    private String schEndDate;
	private String schVisitOrgGb;
	private String schCnsrNm;
	private String schSigunNm;
	
	public String getSchSigunNm() {
		return schSigunNm;
	}
	public void setSchSigunNm(String schSigunNm) {
		this.schSigunNm = schSigunNm;
	}
	public String getSchVisitOrgGb() {
		return schVisitOrgGb;
	}
	public void setSchVisitOrgGb(String schVisitOrgGb) {
		this.schVisitOrgGb = schVisitOrgGb;
	}
	public String getSchCnsrNm() {
		return schCnsrNm;
	}
	public void setSchCnsrNm(String schCnsrNm) {
		this.schCnsrNm = schCnsrNm;
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
	private String linkOrgNo;
	private String caseNo;
	private String cnsGb;
	private String zoneGb;
	private String localGb;
	private String centerGb;
	private String visitOrgNm;
	private String visitOrgGb;
	private String visitDt;
	private String visitManCnt;
	private String visitr;
	private String fileNm;
	private String sysFileNm;
	private String filePath;
	private int fileSize;
	private String visitCntn;
	private String inputNm;
	private String writeDt;
	private String sigunCd;
	private String fDel, delYn;
	private String cnsrId;
	
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
	public String getLinkOrgNo() {
		return linkOrgNo;
	}
	public void setLinkOrgNo(String linkOrgNo) {
		this.linkOrgNo = linkOrgNo;
	}
	public String getCaseNo() {
		return caseNo;
	}
	public void setCaseNo(String caseNo) {
		this.caseNo = caseNo;
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
	public String getVisitOrgNm() {
		return visitOrgNm;
	}
	public void setVisitOrgNm(String visitOrgNm) {
		this.visitOrgNm = visitOrgNm;
	}
	public String getVisitOrgGb() {
		return visitOrgGb;
	}
	public void setVisitOrgGb(String visitOrgGb) {
		this.visitOrgGb = visitOrgGb;
	}
	public String getVisitDt() {
		return visitDt;
	}
	public void setVisitDt(String visitDt) {
		this.visitDt = visitDt;
	}
	public String getVisitManCnt() {
		return visitManCnt;
	}
	public void setVisitManCnt(String visitManCnt) {
		this.visitManCnt = visitManCnt;
	}
	public String getVisitr() {
		return visitr;
	}
	public void setVisitr(String visitr) {
		this.visitr = visitr;
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
	public String getVisitCntn() {
		return visitCntn;
	}
	public void setVisitCntn(String visitCntn) {
		this.visitCntn = visitCntn;
	}
	public String getInputNm() {
		return inputNm;
	}
	public void setInputNm(String inputNm) {
		this.inputNm = inputNm;
	}
	public String getWriteDt() {
		return writeDt;
	}
	public void setWriteDt(String writeDt) {
		this.writeDt = writeDt;
	}
	
}