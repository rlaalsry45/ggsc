package ggsc.cnsmng.service;

import org.springframework.web.multipart.MultipartFile;

import ams.cmm.PageVO;

public class EalyCnsDocVO extends PageVO {
	private int caseNo;
	private String cnsGb;
	private String zoneGb;
	private String centerGb;
	private String localGb;
	private String cnsleId;
	private String cnsrId;
	private String cnsleNm;
	private String cnsrNm;
	private String cnsrGb;
	private String cnsDt;
	private int cnsTimeHourS;
	private int cnsTimeMinS;
	private int cnsTimeHourE;
	private int cnsTimeMinE;
	private int cnsTimeTotMin;
	private String cnsMethd;
	private String cnsDtl;
	private String olderRel;
	private String gender;
	private String birthDt;
	private String mobile;
	private String emgcyTel;
	private String addr;
	private String addrDtl;
	private String edu;
	private String decodeLvl;
	private String relg;
	private String livgForm;
	private String houseForm;
	private String merrStat;
	private String liveForm;
	private String majorApplCd;
	private String cnsCntn;
	private String cnsSummary;
	private String psycExamCntn;
	private String intrLinkCntn;
	private String extrLinkCntn;
	private String writeDt;
	private String dbInsTm;
	private String authCd;
	private String regId;
	private String sigunCd;
	
	private String cnsMethdNm;
	private String cnsDtlNm;
	private String olderRelNm;
	private String eduNm;
	private String decodeLvlNm;
	private String relgNm;
	private String livgFormNm;
	private String houseFormNm;
	private String merrStatNm;
	private String liveFormNm;
	private String majorApplCdNm;
	
	private MultipartFile file;
	private MultipartFile file1;
	private MultipartFile file2;
	
	private String fileNm;
	private String sysFileNm;
	private String filePath;
	private String fileDesc;
	private int fileSize;
	
	private String killsRskn; // 자살위험도
	private String cnsEndResn; // 종결사유
	
	private String schCnsGb;
	private String schZoneGb;
	private String schLocalGb;
	private String schCenterGb;
	private String schAcptNm;
	private String schCnsleNm;
	private String schStartDate;
	private String schEndDate;
	
	public String getSigunCd() {
		return sigunCd;
	}
	public void setSigunCd(String sigunCd) {
		this.sigunCd = sigunCd;
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
	public String getRegId() {
		return regId;
	}
	public void setRegId(String regId) {
		this.regId = regId;
	}
	public String getAuthCd() {
		return authCd;
	}
	public void setAuthCd(String authCd) {
		this.authCd = authCd;
	}
	public String getCnsMethdNm() {
		return cnsMethdNm;
	}
	public void setCnsMethdNm(String cnsMethdNm) {
		this.cnsMethdNm = cnsMethdNm;
	}
	public String getCnsDtlNm() {
		return cnsDtlNm;
	}
	public void setCnsDtlNm(String cnsDtlNm) {
		this.cnsDtlNm = cnsDtlNm;
	}
	public String getOlderRelNm() {
		return olderRelNm;
	}
	public void setOlderRelNm(String olderRelNm) {
		this.olderRelNm = olderRelNm;
	}
	public String getEduNm() {
		return eduNm;
	}
	public void setEduNm(String eduNm) {
		this.eduNm = eduNm;
	}
	public String getDecodeLvlNm() {
		return decodeLvlNm;
	}
	public void setDecodeLvlNm(String decodeLvlNm) {
		this.decodeLvlNm = decodeLvlNm;
	}
	public String getRelgNm() {
		return relgNm;
	}
	public void setRelgNm(String relgNm) {
		this.relgNm = relgNm;
	}
	public String getLivgFormNm() {
		return livgFormNm;
	}
	public void setLivgFormNm(String livgFormNm) {
		this.livgFormNm = livgFormNm;
	}
	public String getHouseFormNm() {
		return houseFormNm;
	}
	public void setHouseFormNm(String houseFormNm) {
		this.houseFormNm = houseFormNm;
	}
	public String getMerrStatNm() {
		return merrStatNm;
	}
	public void setMerrStatNm(String merrStatNm) {
		this.merrStatNm = merrStatNm;
	}
	public String getLiveFormNm() {
		return liveFormNm;
	}
	public void setLiveFormNm(String liveFormNm) {
		this.liveFormNm = liveFormNm;
	}
	public String getMajorApplCdNm() {
		return majorApplCdNm;
	}
	public void setMajorApplCdNm(String majorApplCdNm) {
		this.majorApplCdNm = majorApplCdNm;
	}
	public String getSchCnsleNm() {
		return schCnsleNm;
	}
	public void setSchCnsleNm(String schCnsleNm) {
		this.schCnsleNm = schCnsleNm;
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
	public String getSchAcptNm() {
		return schAcptNm;
	}
	public void setSchAcptNm(String schAcptNm) {
		this.schAcptNm = schAcptNm;
	}
	public int getCaseNo() {
		return caseNo;
	}
	public void setCaseNo(int caseNo) {
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
	public String getCenterGb() {
		return centerGb;
	}
	public void setCenterGb(String centerGb) {
		this.centerGb = centerGb;
	}
	public String getLocalGb() {
		return localGb;
	}
	public void setLocalGb(String localGb) {
		this.localGb = localGb;
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
	public String getCnsrGb() {
		return cnsrGb;
	}
	public void setCnsrGb(String cnsrGb) {
		this.cnsrGb = cnsrGb;
	}
	public String getCnsDt() {
		return cnsDt;
	}
	public void setCnsDt(String cnsDt) {
		this.cnsDt = cnsDt;
	}
	public int getCnsTimeHourS() {
		return cnsTimeHourS;
	}
	public void setCnsTimeHourS(int cnsTimeHourS) {
		this.cnsTimeHourS = cnsTimeHourS;
	}
	public int getCnsTimeMinS() {
		return cnsTimeMinS;
	}
	public void setCnsTimeMinS(int cnsTimeMinS) {
		this.cnsTimeMinS = cnsTimeMinS;
	}
	public int getCnsTimeHourE() {
		return cnsTimeHourE;
	}
	public void setCnsTimeHourE(int cnsTimeHourE) {
		this.cnsTimeHourE = cnsTimeHourE;
	}
	public int getCnsTimeMinE() {
		return cnsTimeMinE;
	}
	public void setCnsTimeMinE(int cnsTimeMinE) {
		this.cnsTimeMinE = cnsTimeMinE;
	}
	public String getCnsDtl() {
		return cnsDtl;
	}
	public void setCnsDtl(String cnsDtl) {
		this.cnsDtl = cnsDtl;
	}
	public String getOlderRel() {
		return olderRel;
	}
	public void setOlderRel(String olderRel) {
		this.olderRel = olderRel;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getBirthDt() {
		return birthDt;
	}
	public void setBirthDt(String birthDt) {
		this.birthDt = birthDt;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getEmgcyTel() {
		return emgcyTel;
	}
	public void setEmgcyTel(String emgcyTel) {
		this.emgcyTel = emgcyTel;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getAddrDtl() {
		return addrDtl;
	}
	public void setAddrDtl(String addrDtl) {
		this.addrDtl = addrDtl;
	}
	public String getEdu() {
		return edu;
	}
	public void setEdu(String edu) {
		this.edu = edu;
	}
	public String getRelg() {
		return relg;
	}
	public void setRelg(String relg) {
		this.relg = relg;
	}
	public String getLivgForm() {
		return livgForm;
	}
	public void setLivgForm(String livgForm) {
		this.livgForm = livgForm;
	}
	public String getHouseForm() {
		return houseForm;
	}
	public void setHouseForm(String houseForm) {
		this.houseForm = houseForm;
	}
	public String getMerrStat() {
		return merrStat;
	}
	public void setMerrStat(String merrStat) {
		this.merrStat = merrStat;
	}
	public String getLiveForm() {
		return liveForm;
	}
	public void setLiveForm(String liveForm) {
		this.liveForm = liveForm;
	}
	public String getMajorApplCd() {
		return majorApplCd;
	}
	public void setMajorApplCd(String majorApplCd) {
		this.majorApplCd = majorApplCd;
	}
	public String getCnsCntn() {
		return cnsCntn;
	}
	public void setCnsCntn(String cnsCntn) {
		this.cnsCntn = cnsCntn;
	}
	public String getPsycExamCntn() {
		return psycExamCntn;
	}
	public void setPsycExamCntn(String psycExamCntn) {
		this.psycExamCntn = psycExamCntn;
	}
	public String getIntrLinkCntn() {
		return intrLinkCntn;
	}
	public void setIntrLinkCntn(String intrLinkCntn) {
		this.intrLinkCntn = intrLinkCntn;
	}
	public String getExtrLinkCntn() {
		return extrLinkCntn;
	}
	public void setExtrLinkCntn(String extrLinkCntn) {
		this.extrLinkCntn = extrLinkCntn;
	}
	public String getWriteDt() {
		return writeDt;
	}
	public void setWriteDt(String writeDt) {
		this.writeDt = writeDt;
	}
	public String getDbInsTm() {
		return dbInsTm;
	}
	public void setDbInsTm(String dbInsTm) {
		this.dbInsTm = dbInsTm;
	}
	public String getCnsrNm() {
		return cnsrNm;
	}
	public void setCnsrNm(String cnsrNm) {
		this.cnsrNm = cnsrNm;
	}
	public int getCnsTimeTotMin() {
		return cnsTimeTotMin;
	}
	public void setCnsTimeTotMin(int cnsTimeTotMin) {
		this.cnsTimeTotMin = cnsTimeTotMin;
	}
	public String getCnsMethd() {
		return cnsMethd;
	}
	public void setCnsMethd(String cnsMethd) {
		this.cnsMethd = cnsMethd;
	}
	public String getCnsSummary() {
		return cnsSummary;
	}
	public void setCnsSummary(String cnsSummary) {
		this.cnsSummary = cnsSummary;
	}
	public String getDecodeLvl() {
		return decodeLvl;
	}
	public void setDecodeLvl(String decodeLvl) {
		this.decodeLvl = decodeLvl;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	public MultipartFile getFile1() {
		return file1;
	}
	public void setFile1(MultipartFile file1) {
		this.file1 = file1;
	}
	public MultipartFile getFile2() {
		return file2;
	}
	public void setFile2(MultipartFile file2) {
		this.file2 = file2;
	}
	public String getKillsRskn() {
		return killsRskn;
	}
	public void setKillsRskn(String killsRskn) {
		this.killsRskn = killsRskn;
	}
	public String getCnsEndResn() {
		return cnsEndResn;
	}
	public void setCnsEndResn(String cnsEndResn) {
		this.cnsEndResn = cnsEndResn;
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
	public String getFileDesc() {
		return fileDesc;
	}
	public void setFileDesc(String fileDesc) {
		this.fileDesc = fileDesc;
	}
	public int getFileSize() {
		return fileSize;
	}
	public void setFileSize(int fileSize) {
		this.fileSize = fileSize;
	}
	
	@Override
	public String toString() {
		return "EalyCnsDocVO [caseNo=" + caseNo + ", cnsGb=" + cnsGb + ", zoneGb=" + zoneGb + ", centerGb=" + centerGb
				+ ", localGb=" + localGb + ", cnsleId=" + cnsleId + ", cnsrId=" + cnsrId + ", cnsleNm=" + cnsleNm
				+ ", cnsrNm=" + cnsrNm + ", cnsrGb=" + cnsrGb + ", cnsDt=" + cnsDt + ", cnsTimeHourS=" + cnsTimeHourS
				+ ", cnsTimeMinS=" + cnsTimeMinS + ", cnsTimeHourE=" + cnsTimeHourE + ", cnsTimeMinE=" + cnsTimeMinE
				+ ", cnsTimeTotMin=" + cnsTimeTotMin + ", cnsMethd=" + cnsMethd + ", cnsDtl=" + cnsDtl + ", olderRel="
				+ olderRel + ", gender=" + gender + ", birthDt=" + birthDt + ", mobile=" + mobile + ", emgcyTel="
				+ emgcyTel + ", addr=" + addr + ", addrDtl=" + addrDtl + ", edu=" + edu + ", decodeLvl=" + decodeLvl
				+ ", relg=" + relg + ", livgForm=" + livgForm + ", houseForm=" + houseForm + ", merrStat=" + merrStat
				+ ", liveForm=" + liveForm + ", majorApplCd=" + majorApplCd + ", cnsCntn=" + cnsCntn + ", cnsSummary="
				+ cnsSummary + ", psycExamCntn=" + psycExamCntn + ", intrLinkCntn=" + intrLinkCntn + ", extrLinkCntn="
				+ extrLinkCntn + ", writeDt=" + writeDt + ", dbInsTm=" + dbInsTm + ", file=" + file + ", file1=" + file1
				+ ", file2=" + file2 + ", killsRskn=" + killsRskn + ", cnsEndResn=" + cnsEndResn + "]";
	}
	
}
