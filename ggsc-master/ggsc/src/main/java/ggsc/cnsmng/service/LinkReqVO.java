package ggsc.cnsmng.service;

import org.springframework.web.multipart.MultipartFile;

import ams.cmm.PageVO;

public class LinkReqVO extends PageVO{

	private int num;
	private int caseNo;
	private String cnsGb;
	private int cnsDtlGbCd;
	private String zoneGb;
	private String localGb;
	private String centerGb;
	private String cnsleId;
	private String cnsrId;
	private String reqDept;
	private String reqDept2; // 외부연계의뢰서 연계기관명
	private String reqDeptPer;
	private String reqDt;
	private String helpDept;
	private String helpDeptPer;
	private String relyTerm;
	private String cnsleNm;
	private String cnsleNm2; // 외부연계의뢰서 내담자 상명
	private String gender;
	private String birthDt;
	private String addr;
	private String addr2; // 외부연계의뢰서 주소
	private String addrDtl;
	private String telNo;
	private String rcptSgct;
	private String reqResnCntn;
	private String pgrsRslt;
	private String offiNoteYn;
	private String linkReqGb;
	private String etc;
	private String authCd;
	private String internalGb;
	private String outernalGb;
	
	private String linkReqName;
	private String linkReqNmTel;
	private String cnsleHelth;
	private String cnsleGongGb;
	private String cnslePsycRst;
	private int psycRstMmseds;
	private String psycRstEtc;
	private String cnsrOp;
	private String linkReqDesc;
	private String linkReqOrgNm;
	private String linkReqOrgTel;
	private String linkReqRecvName;
	private String linkReqRecvYear;
	private String linkReqRecvMonth;
	private String linkReqRecvDay;
	private String linkReqRecvRst;
	private String year;
	private String month;
	private String day;
	private String reqName;
	private String orgName;
	private String docSignPath;
	private String regId;
	private String dbInsTm;
	private String age;

	// 상담내용 변수명
	private String cnsStat;
	private String cnsCnt;
	private String killRskn;
	private String cnsrNm;
	private String edu;
	private String cnsDt;
	
	// 유관기관관리 변수명
	private String relOrgNm;
	private String relOrgCd;
	private String tel;
	
	// 연계의뢰서 PDF
	private MultipartFile file;
	private MultipartFile file2;
	private int linkReqPdfNum;
	private String fileNm;
	private String sysFileNm;
	private String filePath;
	private String fileSize;
	private String fileDesc;
	
	// 연계의뢰서
	private String fileNm2;
	private String sysFileNm2;
	private String filePath2;
	private String fileSize2;
	private String fileDesc2;
	
	// 연계의뢰서 공문
	private String fileNm3;
	private String sysFileNm3;
	private String filePath3;
	private String fileSize3;
	private String fileDesc3;
	
	private String schCnsGb;
	private String schCnsleNm;
	private String schCenterGb;
	private String schLinkReqGb;
	private String schStartDate;
	private String schEndDate;
	
	public String getInternalGb() {
		return internalGb;
	}
	public void setInternalGb(String internalGb) {
		this.internalGb = internalGb;
	}
	public String getOuternalGb() {
		return outernalGb;
	}
	public void setOuternalGb(String outernalGb) {
		this.outernalGb = outernalGb;
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
	public String getAuthCd() {
		return authCd;
	}
	public void setAuthCd(String authCd) {
		this.authCd = authCd;
	}
	public String getFileNm2() {
		return fileNm2;
	}
	public void setFileNm2(String fileNm2) {
		this.fileNm2 = fileNm2;
	}
	public String getSysFileNm2() {
		return sysFileNm2;
	}
	public void setSysFileNm2(String sysFileNm2) {
		this.sysFileNm2 = sysFileNm2;
	}
	public String getFilePath2() {
		return filePath2;
	}
	public void setFilePath2(String filePath2) {
		this.filePath2 = filePath2;
	}
	public String getFileSize2() {
		return fileSize2;
	}
	public void setFileSize2(String fileSize2) {
		this.fileSize2 = fileSize2;
	}
	public String getFileDesc2() {
		return fileDesc2;
	}
	public void setFileDesc2(String fileDesc2) {
		this.fileDesc2 = fileDesc2;
	}
	public String getFileNm3() {
		return fileNm3;
	}
	public void setFileNm3(String fileNm3) {
		this.fileNm3 = fileNm3;
	}
	public String getSysFileNm3() {
		return sysFileNm3;
	}
	public void setSysFileNm3(String sysFileNm3) {
		this.sysFileNm3 = sysFileNm3;
	}
	public String getFilePath3() {
		return filePath3;
	}
	public void setFilePath3(String filePath3) {
		this.filePath3 = filePath3;
	}
	public String getFileSize3() {
		return fileSize3;
	}
	public void setFileSize3(String fileSize3) {
		this.fileSize3 = fileSize3;
	}
	public String getFileDesc3() {
		return fileDesc3;
	}
	public void setFileDesc3(String fileDesc3) {
		this.fileDesc3 = fileDesc3;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getSchCenterGb() {
		return schCenterGb;
	}
	public void setSchCenterGb(String schCenterGb) {
		this.schCenterGb = schCenterGb;
	}
	public String getSchLinkReqGb() {
		return schLinkReqGb;
	}
	public void setSchLinkReqGb(String schLinkReqGb) {
		this.schLinkReqGb = schLinkReqGb;
	}
	public String getSchCnsGb() {
		return schCnsGb;
	}
	public void setSchCnsGb(String schCnsGb) {
		this.schCnsGb = schCnsGb;
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
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	public int getLinkReqPdfNum() {
		return linkReqPdfNum;
	}
	public void setLinkReqPdfNum(int linkReqPdfNum) {
		this.linkReqPdfNum = linkReqPdfNum;
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
	public String getFileDesc() {
		return fileDesc;
	}
	public void setFileDesc(String fileDesc) {
		this.fileDesc = fileDesc;
	}
	public int getPsycRstMmseds() {
		return psycRstMmseds;
	}
	public void setPsycRstMmseds(int psycRstMmseds) {
		this.psycRstMmseds = psycRstMmseds;
	}
	public String getPsycRstEtc() {
		return psycRstEtc;
	}
	public void setPsycRstEtc(String psycRstEtc) {
		this.psycRstEtc = psycRstEtc;
	}
	public String getReqDept2() {
		return reqDept2;
	}
	public void setReqDept2(String reqDept2) {
		this.reqDept2 = reqDept2;
	}
	public String getCnsleNm2() {
		return cnsleNm2;
	}
	public void setCnsleNm2(String cnsleNm2) {
		this.cnsleNm2 = cnsleNm2;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getLinkReqName() {
		return linkReqName;
	}
	public void setLinkReqName(String linkReqName) {
		this.linkReqName = linkReqName;
	}
	public String getLinkReqNmTel() {
		return linkReqNmTel;
	}
	public void setLinkReqNmTel(String linkReqNmTel) {
		this.linkReqNmTel = linkReqNmTel;
	}
	public String getCnsleHelth() {
		return cnsleHelth;
	}
	public void setCnsleHelth(String cnsleHelth) {
		this.cnsleHelth = cnsleHelth;
	}
	public String getCnsleGongGb() {
		return cnsleGongGb;
	}
	public void setCnsleGongGb(String cnsleGongGb) {
		this.cnsleGongGb = cnsleGongGb;
	}
	public String getCnslePsycRst() {
		return cnslePsycRst;
	}
	public void setCnslePsycRst(String cnslePsycRst) {
		this.cnslePsycRst = cnslePsycRst;
	}
	public String getCnsrOp() {
		return cnsrOp;
	}
	public void setCnsrOp(String cnsrOp) {
		this.cnsrOp = cnsrOp;
	}
	public String getLinkReqDesc() {
		return linkReqDesc;
	}
	public void setLinkReqDesc(String linkReqDesc) {
		this.linkReqDesc = linkReqDesc;
	}
	public String getLinkReqOrgNm() {
		return linkReqOrgNm;
	}
	public void setLinkReqOrgNm(String linkReqOrgNm) {
		this.linkReqOrgNm = linkReqOrgNm;
	}
	public String getLinkReqOrgTel() {
		return linkReqOrgTel;
	}
	public void setLinkReqOrgTel(String linkReqOrgTel) {
		this.linkReqOrgTel = linkReqOrgTel;
	}
	public String getLinkReqRecvName() {
		return linkReqRecvName;
	}
	public void setLinkReqRecvName(String linkReqRecvName) {
		this.linkReqRecvName = linkReqRecvName;
	}
	public String getLinkReqRecvYear() {
		return linkReqRecvYear;
	}
	public void setLinkReqRecvYear(String linkReqRecvYear) {
		this.linkReqRecvYear = linkReqRecvYear;
	}
	public String getLinkReqRecvMonth() {
		return linkReqRecvMonth;
	}
	public void setLinkReqRecvMonth(String linkReqRecvMonth) {
		this.linkReqRecvMonth = linkReqRecvMonth;
	}
	public String getLinkReqRecvDay() {
		return linkReqRecvDay;
	}
	public void setLinkReqRecvDay(String linkReqRecvDay) {
		this.linkReqRecvDay = linkReqRecvDay;
	}
	public String getLinkReqRecvRst() {
		return linkReqRecvRst;
	}
	public void setLinkReqRecvRst(String linkReqRecvRst) {
		this.linkReqRecvRst = linkReqRecvRst;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public String getReqName() {
		return reqName;
	}
	public void setReqName(String reqName) {
		this.reqName = reqName;
	}
	public String getOrgName() {
		return orgName;
	}
	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}
	public String getDocSignPath() {
		return docSignPath;
	}
	public void setDocSignPath(String docSignPath) {
		this.docSignPath = docSignPath;
	}
	public String getRegId() {
		return regId;
	}
	public void setRegId(String regId) {
		this.regId = regId;
	}
	public String getDbInsTm() {
		return dbInsTm;
	}
	public void setDbInsTm(String dbInsTm) {
		this.dbInsTm = dbInsTm;
	}
	public String getLinkReqGb() {
		return linkReqGb;
	}
	public void setLinkReqGb(String linkReqGb) {
		this.linkReqGb = linkReqGb;
	}
	public String getOffiNoteYn() {
		return offiNoteYn;
	}
	public void setOffiNoteYn(String offiNoteYn) {
		this.offiNoteYn = offiNoteYn;
	}
	public String getCnsGb() {
		return cnsGb;
	}
	public void setCnsGb(String cnsGb) {
		this.cnsGb = cnsGb;
	}
	public String getRelOrgCd() {
		return relOrgCd;
	}
	public void setRelOrgCd(String relOrgCd) {
		this.relOrgCd = relOrgCd;
	}
	public String getRelOrgNm() {
		return relOrgNm;
	}
	public void setRelOrgNm(String relOrgNm) {
		this.relOrgNm = relOrgNm;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getCnsStat() {
		return cnsStat;
	}
	public void setCnsStat(String cnsStat) {
		this.cnsStat = cnsStat;
	}
	public String getCnsCnt() {
		return cnsCnt;
	}
	public void setCnsCnt(String cnsCnt) {
		this.cnsCnt = cnsCnt;
	}
	public String getKillRskn() {
		return killRskn;
	}
	public void setKillRskn(String killRskn) {
		this.killRskn = killRskn;
	}
	public String getCnsrNm() {
		return cnsrNm;
	}
	public void setCnsrNm(String cnsrNm) {
		this.cnsrNm = cnsrNm;
	}
	public String getEdu() {
		return edu;
	}
	public void setEdu(String edu) {
		this.edu = edu;
	}
	public String getCnsDt() {
		return cnsDt;
	}
	public void setCnsDt(String cnsDt) {
		this.cnsDt = cnsDt;
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
	public String getReqDept() {
		return reqDept;
	}
	public void setReqDept(String reqDept) {
		this.reqDept = reqDept;
	}
	public String getReqDeptPer() {
		return reqDeptPer;
	}
	public void setReqDeptPer(String reqDeptPer) {
		this.reqDeptPer = reqDeptPer;
	}
	public String getReqDt() {
		return reqDt;
	}
	public void setReqDt(String reqDt) {
		this.reqDt = reqDt;
	}
	public String getHelpDept() {
		return helpDept;
	}
	public void setHelpDept(String helpDept) {
		this.helpDept = helpDept;
	}
	public String getHelpDeptPer() {
		return helpDeptPer;
	}
	public void setHelpDeptPer(String helpDeptPer) {
		this.helpDeptPer = helpDeptPer;
	}
	public String getRelyTerm() {
		return relyTerm;
	}
	public void setRelyTerm(String relyTerm) {
		this.relyTerm = relyTerm;
	}
	public String getCnsleNm() {
		return cnsleNm;
	}
	public void setCnsleNm(String cnsleNm) {
		this.cnsleNm = cnsleNm;
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
	public String getTelNo() {
		return telNo;
	}
	public void setTelNo(String telNo) {
		this.telNo = telNo;
	}
	public String getRcptSgct() {
		return rcptSgct;
	}
	public void setRcptSgct(String rcptSgct) {
		this.rcptSgct = rcptSgct;
	}
	public String getReqResnCntn() {
		return reqResnCntn;
	}
	public void setReqResnCntn(String reqResnCntn) {
		this.reqResnCntn = reqResnCntn;
	}
	public String getPgrsRslt() {
		return pgrsRslt;
	}
	public void setPgrsRslt(String pgrsRslt) {
		this.pgrsRslt = pgrsRslt;
	}
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc;
	}
	@Override
	public String toString() {
		return "LinkReqVO [num=" + num + ", caseNo=" + caseNo + ", cnsGb=" + cnsGb + ", cnsDtlGbCd=" + cnsDtlGbCd
				+ ", zoneGb=" + zoneGb + ", localGb=" + localGb + ", centerGb=" + centerGb + ", cnsleId=" + cnsleId
				+ ", cnsrId=" + cnsrId + ", reqDept=" + reqDept + ", reqDept2=" + reqDept2 + ", reqDeptPer="
				+ reqDeptPer + ", reqDt=" + reqDt + ", helpDept=" + helpDept + ", helpDeptPer=" + helpDeptPer
				+ ", relyTerm=" + relyTerm + ", cnsleNm=" + cnsleNm + ", cnsleNm2=" + cnsleNm2 + ", gender=" + gender
				+ ", birthDt=" + birthDt + ", addr=" + addr + ", addr2=" + addr2 + ", addrDtl=" + addrDtl + ", telNo="
				+ telNo + ", rcptSgct=" + rcptSgct + ", reqResnCntn=" + reqResnCntn + ", pgrsRslt=" + pgrsRslt
				+ ", offiNoteYn=" + offiNoteYn + ", linkReqGb=" + linkReqGb + ", etc=" + etc + ", linkReqName="
				+ linkReqName + ", linkReqNmTel=" + linkReqNmTel + ", cnsleHelth=" + cnsleHelth + ", cnsleGongGb="
				+ cnsleGongGb + ", cnslePsycRst=" + cnslePsycRst + ", psycRstMmseds=" + psycRstMmseds + ", psycRstEtc="
				+ psycRstEtc + ", cnsrOp=" + cnsrOp + ", linkReqDesc=" + linkReqDesc + ", linkReqOrgNm=" + linkReqOrgNm
				+ ", linkReqOrgTel=" + linkReqOrgTel + ", linkReqRecvName=" + linkReqRecvName + ", linkReqRecvYear="
				+ linkReqRecvYear + ", linkReqRecvMonth=" + linkReqRecvMonth + ", linkReqRecvDay=" + linkReqRecvDay
				+ ", linkReqRecvRst=" + linkReqRecvRst + ", year=" + year + ", month=" + month + ", day=" + day
				+ ", reqName=" + reqName + ", orgName=" + orgName + ", docSignPath=" + docSignPath + ", regId=" + regId
				+ ", dbInsTm=" + dbInsTm + ", cnsStat=" + cnsStat + ", cnsCnt=" + cnsCnt + ", killRskn=" + killRskn
				+ ", cnsrNm=" + cnsrNm + ", edu=" + edu + ", cnsDt=" + cnsDt + ", relOrgNm=" + relOrgNm + ", relOrgCd="
				+ relOrgCd + ", tel=" + tel + ", file=" + file + ", linkReqPdfNum=" + linkReqPdfNum + ", fileNm="
				+ fileNm + ", sysFileNm=" + sysFileNm + ", filePath=" + filePath + ", fileSize=" + fileSize
				+ ", fileDesc=" + fileDesc + "]";
	}

}
