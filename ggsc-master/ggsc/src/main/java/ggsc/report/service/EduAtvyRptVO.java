package ggsc.report.service;

import org.springframework.web.multipart.MultipartFile;

import ams.cmm.PageVO;

public class EduAtvyRptVO extends PageVO{
	private String schCnsGb;
    private String schZoneGb;
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
	private String eduAtvyNo;
	private String cnsGb;
	private String zoneGb;
	private String localGb;
	private String centerGb;
	private String eduGbCd;
	private String eduGbNm;
	private String eduTitle;
	private String eduWay;
	private String eduMan;
	private String psycExamCntn;
	private String majorCntn;
	private String eduDt;
	private String eduSttHour;
	private String eduSttMin;
	private String eduEndHour;
	private String eduEndMin;
	private String writeDt;
	private String inputNm;
	private String hostGb;
	private String cnsrId;
	private int eduPeople;
	private String schEduManGb;
	private String schCnsrNm;
	
	private String fileName;
	private String sysFileName;
	private String filePath;
	private int fileSize;
	private String fDel, delYn;
	private MultipartFile file;
	
	public String getCnsrId() {
		return cnsrId;
	}
	public void setCnsrId(String cnsrId) {
		this.cnsrId = cnsrId;
	}
	public String getSchCnsrNm() {
		return schCnsrNm;
	}
	public void setSchCnsrNm(String schCnsrNm) {
		this.schCnsrNm = schCnsrNm;
	}
	public String getSchEduManGb() {
		return schEduManGb;
	}
	public void setSchEduManGb(String schEduManGb) {
		this.schEduManGb = schEduManGb;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getSysFileName() {
		return sysFileName;
	}
	public void setSysFileName(String sysFileName) {
		this.sysFileName = sysFileName;
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
	public int getEduPeople() {
		return eduPeople;
	}
	public void setEduPeople(int eduPeople) {
		this.eduPeople = eduPeople;
	}
	public String getHostGb() {
		return hostGb;
	}
	public void setHostGb(String hostGb) {
		this.hostGb = hostGb;
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
	public String getEduGbCd() {
		return eduGbCd;
	}
	public void setEduGbCd(String eduGbCd) {
		this.eduGbCd = eduGbCd;
	}
	public String getEduGbNm() {
		return eduGbNm;
	}
	public void setEduGbNm(String eduGbNm) {
		this.eduGbNm = eduGbNm;
	}
	public String getEduTitle() {
		return eduTitle;
	}
	public void setEduTitle(String eduTitle) {
		this.eduTitle = eduTitle;
	}
	public String getEduWay() {
		return eduWay;
	}
	public void setEduWay(String eduWay) {
		this.eduWay = eduWay;
	}
	public String getEduMan() {
		return eduMan;
	}
	public void setEduMan(String eduMan) {
		this.eduMan = eduMan;
	}
	public String getPsycExamCntn() {
		return psycExamCntn;
	}
	public void setPsycExamCntn(String psycExamCntn) {
		this.psycExamCntn = psycExamCntn;
	}
	public String getMajorCntn() {
		return majorCntn;
	}
	public void setMajorCntn(String majorCntn) {
		this.majorCntn = majorCntn;
	}
	public String getWriteDt() {
		return writeDt;
	}
	public void setWriteDt(String writeDt) {
		this.writeDt = writeDt;
	}
	public String getInputNm() {
		return inputNm;
	}
	public void setInputNm(String inputNm) {
		this.inputNm = inputNm;
	}
	public String getEduAtvyNo() {
		return eduAtvyNo;
	}
	public void setEduAtvyNo(String eduAtvyNo) {
		this.eduAtvyNo = eduAtvyNo;
	}
	public String getEduDt() {
		return eduDt;
	}
	public void setEduDt(String eduDt) {
		this.eduDt = eduDt;
	}
	public String getEduSttHour() {
		return eduSttHour;
	}
	public void setEduSttHour(String eduSttHour) {
		this.eduSttHour = eduSttHour;
	}
	public String getEduSttMin() {
		return eduSttMin;
	}
	public void setEduSttMin(String eduSttMin) {
		this.eduSttMin = eduSttMin;
	}
	public String getEduEndHour() {
		return eduEndHour;
	}
	public void setEduEndHour(String eduEndHour) {
		this.eduEndHour = eduEndHour;
	}
	public String getEduEndMin() {
		return eduEndMin;
	}
	public void setEduEndMin(String eduEndMin) {
		this.eduEndMin = eduEndMin;
	}
	@Override
	public String toString() {
		return "EduAtvyRptVO [eduAtvyNo=" + eduAtvyNo + ", cnsGb=" + cnsGb + ", zoneGb=" + zoneGb + ", localGb="
				+ localGb + ", centerGb=" + centerGb + ", eduGbCd=" + eduGbCd + ", eduGbNm=" + eduGbNm + ", eduTitle="
				+ eduTitle + ", eduWay=" + eduWay + ", eduMan=" + eduMan + ", psycExamCntn=" + psycExamCntn
				+ ", majorCntn=" + majorCntn + ", eduDt=" + eduDt + ", eduSttHour=" + eduSttHour + ", eduSttMin="
				+ eduSttMin + ", eduEndHour=" + eduEndHour + ", eduEndMin=" + eduEndMin + ", writeDt=" + writeDt
				+ ", inputNm=" + inputNm + "]";
	}
	
	
}