package ggsc.cnsmng.service;

import org.springframework.web.multipart.MultipartFile;

import ams.cmm.PageVO;

public class SupperVisionVO extends PageVO{
	
	private int num;
	private int caseNo ;
	private int cnsDtlGbCd;
	private String cnsGb;
	private String cnsrGb;
	private String zoneGb;
	private String localGb;
	private String centerGb;
	private String cnsleId;
	private String cnsrId;
	private String cnsleNm;
	private String title;
	private String reqCnsr;
	private String writeDt;
	private String reqCntn;
	private String fileNm;
	private String sysFileNm;
	private String filePath;
	private String fileSize;
	private MultipartFile file;
	private String relOrgNm;
	private String answerYn;
	private String reqDt;
	private MultipartFile file2;
	private String rplyCnsr;
	private String rplyDt;
	private String rplyCntn;
	
	private String schCnsGb;
	private String schLocalGb;
	private String schCenterGb;
	private String schCnsleNm;
	private String schStartDate;
	private String schEndDate;
	
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
	public MultipartFile getFile2() {
		return file2;
	}
	public void setFile2(MultipartFile file2) {
		this.file2 = file2;
	}
	public String getRplyCnsr() {
		return rplyCnsr;
	}
	public void setRplyCnsr(String rplyCnsr) {
		this.rplyCnsr = rplyCnsr;
	}
	public String getRplyDt() {
		return rplyDt;
	}
	public void setRplyDt(String rplyDt) {
		this.rplyDt = rplyDt;
	}
	public String getRplyCntn() {
		return rplyCntn;
	}
	public void setRplyCntn(String rplyCntn) {
		this.rplyCntn = rplyCntn;
	}
	public String getReqDt() {
		return reqDt;
	}
	public void setReqDt(String reqDt) {
		this.reqDt = reqDt;
	}
	public String getCnsrGb() {
		return cnsrGb;
	}
	public void setCnsrGb(String cnsrGb) {
		this.cnsrGb = cnsrGb;
	}
	public String getAnswerYn() {
		return answerYn;
	}
	public void setAnswerYn(String answerYn) {
		this.answerYn = answerYn;
	}
	public String getRelOrgNm() {
		return relOrgNm;
	}
	public void setRelOrgNm(String relOrgNm) {
		this.relOrgNm = relOrgNm;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getCaseNo() {
		return caseNo;
	}
	public void setCaseNo(int caseNo) {
		this.caseNo = caseNo;
	}
	public int getCnsDtlGbCd() {
		return cnsDtlGbCd;
	}
	public void setCnsDtlGbCd(int cnsDtlGbCd) {
		this.cnsDtlGbCd = cnsDtlGbCd;
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
	public String getCnsleId() {
		return cnsleId;
	}
	public void setCnsleId(String cnsleId) {
		this.cnsleId = cnsleId;
	}
	public String getCnsrId() {
		return cnsrId;
	}
	public void setCnsrId(String cnsrId) {
		this.cnsrId = cnsrId;
	}
	public String getCnsleNm() {
		return cnsleNm;
	}
	public void setCnsleNm(String cnsleNm) {
		this.cnsleNm = cnsleNm;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getReqCnsr() {
		return reqCnsr;
	}
	public void setReqCnsr(String reqCnsr) {
		this.reqCnsr = reqCnsr;
	}
	public String getWriteDt() {
		return writeDt;
	}
	public void setWriteDt(String writeDt) {
		this.writeDt = writeDt;
	}
	public String getReqCntn() {
		return reqCntn;
	}
	public void setReqCntn(String reqCntn) {
		this.reqCntn = reqCntn;
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
	public String getFileSize() {
		return fileSize;
	}
	public void setFileSize(String fileSize) {
		this.fileSize = fileSize;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	
	@Override
	public String toString() {
		return "SupperVisionVO [num=" + num + ", caseNo=" + caseNo + ", cnsDtlGbCd=" + cnsDtlGbCd + ", cnsGb=" + cnsGb
				+ ", cnsrGb=" + cnsrGb + ", zoneGb=" + zoneGb + ", localGb=" + localGb + ", centerGb=" + centerGb
				+ ", cnsleId=" + cnsleId + ", cnsrId=" + cnsrId + ", cnsleNm=" + cnsleNm + ", title=" + title
				+ ", reqCnsr=" + reqCnsr + ", writeDt=" + writeDt + ", reqCntn=" + reqCntn + ", fileNm=" + fileNm
				+ ", sysFileNm=" + sysFileNm + ", filePath=" + filePath + ", fileSize=" + fileSize + ", file=" + file
				+ ", relOrgNm=" + relOrgNm + ", answerYn=" + answerYn + ", reqDt=" + reqDt + ", file2=" + file2
				+ ", rplyCnsr=" + rplyCnsr + ", rplyDt=" + rplyDt + ", rplyCntn=" + rplyCntn + "]";
	}
	
}
