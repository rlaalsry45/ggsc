package ggsc.cnsmng.service;

import org.springframework.web.multipart.MultipartFile;

import ams.cmm.PageVO;

public class PreExamVO extends PageVO {
	
	private int num;
	private String docGb;
	private String cnsGb;
	private String zoneGb;
	private String centerGb;
	private String cnsTargetGb;
	private String cnsleId;
	private int caseNo;
	private String localGb;
	private String writeYn;
	private String cnsleNm;
	private String writeDt;
	private String rank;
	private String year;
	private String month;
	private String day;
	private String jumin1;
	private String jumin2;
	private String seplName;
	private String seplSign;
	private String dbInsTm;
	private String authCd;
	private String regId;
	private String sigunCd;
	private String cnsrNm;
	private String homepage;
	
	private String examDocCd;
	private String cnsrId;
	
	private String guardian;
	private String myselfAgre;
	
	private String idvlInfoCntn1Yn;
	private String idvlInfoCntn2Yn;
	
	private String perInfoCfrmSign;
	private String preInfoSaferSign;
	
	private String docNo;
	private String docNm;
	private String rewdNo;
	private int strtTime;
	private int strtMin;
	private int endTimeHour;
	private int endTimeMin;
	private String gender;
	private int totTime;
	private String birthDt;
	private String ansr1;
	private String ansr1Cntn;
	private String ansr2;
	private String ansr2Cntn;
	private String ansr3;
	private String ansr3Cntn;
	private String qust1Ansr;
	private String qust2Ansr;
	private String qust3Ansr;
	private String qust4Ansr;
	private String qust5Ansr;
	private String qust6Ansr;
	private String qust7Ansr;
	private String qust8Ansr;
	private String qust9Ansr;
	private String qust10Ansr;
	private String qust11Ansr;
	private String qust12Ansr;
	private String qust13Ansr;
	private String qust14Ansr;
	private String qust15Ansr;
	private int yesTotScore;
	private int noTotScore;
	private int cnsrOptnScore;
	private int cnsrOptnTot;
	
	private String schExamDocCd;
	private String schCnsleNm;
	private String schStartDate;
	private String schEndDate;
	
	private MultipartFile file;
	
	private String fileNm;
	private String sysFileNm;
	private String filePath;
	private String fileDesc;
	
	private String agrePath;
	private String perInfoPath;
	private String docCntnPath;
	
	private String schCnsGb;
	private String schZoneGb;
	private String schLocalGb;
	private String schCenterGb;
	private String schAcptNm;
	private String schWriteYn;
	
	public String getCnsrNm() {
		return cnsrNm;
	}
	public void setCnsrNm(String cnsrNm) {
		this.cnsrNm = cnsrNm;
	}
	public String getHomepage() {
		return homepage;
	}
	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}
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
	public String getSchCenterGb() {
		return schCenterGb;
	}
	public void setSchCenterGb(String schCenterGb) {
		this.schCenterGb = schCenterGb;
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
	public String getGuardian() {
		return guardian;
	}
	public void setGuardian(String guardian) {
		this.guardian = guardian;
	}
	public String getMyselfAgre() {
		return myselfAgre;
	}
	public void setMyselfAgre(String myselfAgre) {
		this.myselfAgre = myselfAgre;
	}
	public String getCnsTargetGb() {
		return cnsTargetGb;
	}
	public void setCnsTargetGb(String cnsTargetGb) {
		this.cnsTargetGb = cnsTargetGb;
	}
	public String getAgrePath() {
		return agrePath;
	}
	public void setAgrePath(String agrePath) {
		this.agrePath = agrePath;
	}
	public String getPerInfoPath() {
		return perInfoPath;
	}
	public void setPerInfoPath(String perInfoPath) {
		this.perInfoPath = perInfoPath;
	}
	public String getDocCntnPath() {
		return docCntnPath;
	}
	public void setDocCntnPath(String docCntnPath) {
		this.docCntnPath = docCntnPath;
	}
	public String getSchWriteYn() {
		return schWriteYn;
	}
	public void setSchWriteYn(String schWriteYn) {
		this.schWriteYn = schWriteYn;
	}
	public String getschCnsGb() {
		return schCnsGb;
	}
	public void setschCnsGb(String schCnsGb) {
		this.schCnsGb = schCnsGb;
	}
	
	public String getschAcptNm() {
		return schAcptNm;
	}
	public void setschAcptNm(String schAcptNm) {
		this.schAcptNm = schAcptNm;
	}
	
	public String getschZoneGb() {
		return schZoneGb;
	}
	public void setschZoneGb(String schZoneGb) {
		this.schZoneGb = schZoneGb;
	}
	public String getschLocalGb() {
		return schLocalGb;
	}
	public void setschLocalGb(String schLocalGb) {
		this.schLocalGb = schLocalGb;
	}
	
	
	
	
	
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getDocGb() {
		return docGb;
	}
	public void setDocGb(String docGb) {
		this.docGb = docGb;
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
	public String getCnsleId() {
		return cnsleId;
	}
	public void setCnsleId(String cnsleId) {
		this.cnsleId = cnsleId;
	}
	public int getCaseNo() {
		return caseNo;
	}
	public void setCaseNo(int caseNo) {
		this.caseNo = caseNo;
	}
	public String getLocalGb() {
		return localGb;
	}
	public void setLocalGb(String localGb) {
		this.localGb = localGb;
	}
	public String getWriteYn() {
		return writeYn;
	}
	public void setWriteYn(String writeYn) {
		this.writeYn = writeYn;
	}
	public String getCnsleNm() {
		return cnsleNm;
	}
	public void setCnsleNm(String cnsleNm) {
		this.cnsleNm = cnsleNm;
	}
	public String getWriteDt() {
		return writeDt;
	}
	public void setWriteDt(String writeDt) {
		this.writeDt = writeDt;
	}
	public String getRank() {
		return rank;
	}
	public void setRank(String rank) {
		this.rank = rank;
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
	public String getJumin1() {
		return jumin1;
	}
	public void setJumin1(String jumin1) {
		this.jumin1 = jumin1;
	}
	public String getJumin2() {
		return jumin2;
	}
	public void setJumin2(String jumin2) {
		this.jumin2 = jumin2;
	}
	public String getSeplName() {
		return seplName;
	}
	public void setSeplName(String seplName) {
		this.seplName = seplName;
	}
	public String getSeplSign() {
		return seplSign;
	}
	public void setSeplSign(String seplSign) {
		this.seplSign = seplSign;
	}
	public String getDbInsTm() {
		return dbInsTm;
	}
	public void setDbInsTm(String dbInsTm) {
		this.dbInsTm = dbInsTm;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	public String getExamDocCd() {
		return examDocCd;
	}
	public void setExamDocCd(String examDocCd) {
		this.examDocCd = examDocCd;
	}
	public String getCnsrId() {
		return cnsrId;
	}
	public void setCnsrId(String cnsrId) {
		this.cnsrId = cnsrId;
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
	public String getSchExamDocCd() {
		return schExamDocCd;
	}
	public void setSchExamDocCd(String schExamDocCd) {
		this.schExamDocCd = schExamDocCd;
	}
	public String getSchCnsleNm() {
		return schCnsleNm;
	}
	public void setSchCnsleNm(String schCnsleNm) {
		this.schCnsleNm = schCnsleNm;
	}
	public String getIdvlInfoCntn1Yn() {
		return idvlInfoCntn1Yn;
	}
	public void setIdvlInfoCntn1Yn(String idvlInfoCntn1Yn) {
		this.idvlInfoCntn1Yn = idvlInfoCntn1Yn;
	}
	public String getIdvlInfoCntn2Yn() {
		return idvlInfoCntn2Yn;
	}
	public void setIdvlInfoCntn2Yn(String idvlInfoCntn2Yn) {
		this.idvlInfoCntn2Yn = idvlInfoCntn2Yn;
	}
	public String getPerInfoCfrmSign() {
		return perInfoCfrmSign;
	}
	public void setPerInfoCfrmSign(String perInfoCfrmSign) {
		this.perInfoCfrmSign = perInfoCfrmSign;
	}
	public String getPreInfoSaferSign() {
		return preInfoSaferSign;
	}
	public void setPreInfoSaferSign(String preInfoSaferSign) {
		this.preInfoSaferSign = preInfoSaferSign;
	}
	public String getDocNo() {
		return docNo;
	}
	public void setDocNo(String docNo) {
		this.docNo = docNo;
	}
	public String getDocNm() {
		return docNm;
	}
	public void setDocNm(String docNm) {
		this.docNm = docNm;
	}
	public String getRewdNo() {
		return rewdNo;
	}
	public void setRewdNo(String rewdNo) {
		this.rewdNo = rewdNo;
	}
	public int getStrtTime() {
		return strtTime;
	}
	public void setStrtTime(int strtTime) {
		this.strtTime = strtTime;
	}
	public int getStrtMin() {
		return strtMin;
	}
	public void setStrtMin(int strtMin) {
		this.strtMin = strtMin;
	}
	public int getEndTimeHour() {
		return endTimeHour;
	}
	public void setEndTimeHour(int endTimeHour) {
		this.endTimeHour = endTimeHour;
	}
	public int getEndTimeMin() {
		return endTimeMin;
	}
	public void setEndTimeMin(int endTimeMin) {
		this.endTimeMin = endTimeMin;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getTotTime() {
		return totTime;
	}
	public void setTotTime(int totTime) {
		this.totTime = totTime;
	}
	public String getAnsr1() {
		return ansr1;
	}
	public void setAnsr1(String ansr1) {
		this.ansr1 = ansr1;
	}
	public String getAnsr1Cntn() {
		return ansr1Cntn;
	}
	public void setAnsr1Cntn(String ansr1Cntn) {
		this.ansr1Cntn = ansr1Cntn;
	}
	public String getAnsr2() {
		return ansr2;
	}
	public void setAnsr2(String ansr2) {
		this.ansr2 = ansr2;
	}
	public String getAnsr2Cntn() {
		return ansr2Cntn;
	}
	public void setAnsr2Cntn(String ansr2Cntn) {
		this.ansr2Cntn = ansr2Cntn;
	}
	public String getAnsr3() {
		return ansr3;
	}
	public void setAnsr3(String ansr3) {
		this.ansr3 = ansr3;
	}
	public String getAnsr3Cntn() {
		return ansr3Cntn;
	}
	public void setAnsr3Cntn(String ansr3Cntn) {
		this.ansr3Cntn = ansr3Cntn;
	}
	public String getQust1Ansr() {
		return qust1Ansr;
	}
	public void setQust1Ansr(String qust1Ansr) {
		this.qust1Ansr = qust1Ansr;
	}
	public String getQust2Ansr() {
		return qust2Ansr;
	}
	public void setQust2Ansr(String qust2Ansr) {
		this.qust2Ansr = qust2Ansr;
	}
	public String getQust3Ansr() {
		return qust3Ansr;
	}
	public void setQust3Ansr(String qust3Ansr) {
		this.qust3Ansr = qust3Ansr;
	}
	public String getQust4Ansr() {
		return qust4Ansr;
	}
	public void setQust4Ansr(String qust4Ansr) {
		this.qust4Ansr = qust4Ansr;
	}
	public String getQust5Ansr() {
		return qust5Ansr;
	}
	public void setQust5Ansr(String qust5Ansr) {
		this.qust5Ansr = qust5Ansr;
	}
	public String getQust6Ansr() {
		return qust6Ansr;
	}
	public void setQust6Ansr(String qust6Ansr) {
		this.qust6Ansr = qust6Ansr;
	}
	public String getQust7Ansr() {
		return qust7Ansr;
	}
	public void setQust7Ansr(String qust7Ansr) {
		this.qust7Ansr = qust7Ansr;
	}
	public String getQust8Ansr() {
		return qust8Ansr;
	}
	public void setQust8Ansr(String qust8Ansr) {
		this.qust8Ansr = qust8Ansr;
	}
	public String getQust9Ansr() {
		return qust9Ansr;
	}
	public void setQust9Ansr(String qust9Ansr) {
		this.qust9Ansr = qust9Ansr;
	}
	public String getQust10Ansr() {
		return qust10Ansr;
	}
	public void setQust10Ansr(String qust10Ansr) {
		this.qust10Ansr = qust10Ansr;
	}
	public String getQust11Ansr() {
		return qust11Ansr;
	}
	public void setQust11Ansr(String qust11Ansr) {
		this.qust11Ansr = qust11Ansr;
	}
	public String getQust12Ansr() {
		return qust12Ansr;
	}
	public void setQust12Ansr(String qust12Ansr) {
		this.qust12Ansr = qust12Ansr;
	}
	public String getQust13Ansr() {
		return qust13Ansr;
	}
	public void setQust13Ansr(String qust13Ansr) {
		this.qust13Ansr = qust13Ansr;
	}
	public String getQust14Ansr() {
		return qust14Ansr;
	}
	public void setQust14Ansr(String qust14Ansr) {
		this.qust14Ansr = qust14Ansr;
	}
	public String getQust15Ansr() {
		return qust15Ansr;
	}
	public void setQust15Ansr(String qust15Ansr) {
		this.qust15Ansr = qust15Ansr;
	}
	public int getYesTotScore() {
		return yesTotScore;
	}
	public void setYesTotScore(int yesTotScore) {
		this.yesTotScore = yesTotScore;
	}
	public int getNoTotScore() {
		return noTotScore;
	}
	public void setNoTotScore(int noTotScore) {
		this.noTotScore = noTotScore;
	}
	public int getCnsrOptnScore() {
		return cnsrOptnScore;
	}
	public void setCnsrOptnScore(int cnsrOptnScore) {
		this.cnsrOptnScore = cnsrOptnScore;
	}
	public int getCnsrOptnTot() {
		return cnsrOptnTot;
	}
	public void setCnsrOptnTot(int cnsrOptnTot) {
		this.cnsrOptnTot = cnsrOptnTot;
	}
	public String getBirthDt() {
		return birthDt;
	}
	public void setBirthDt(String birthDt) {
		this.birthDt = birthDt;
	}
	@Override
	public String toString() {
		return "CcrtPlgrVO [num=" + num + ", docGb=" + docGb + ", cnsGb=" + cnsGb + ", zoneGb=" + zoneGb + ", centerGb="
				+ centerGb + ", cnsleId=" + cnsleId + ", caseNo=" + caseNo + ", localGb=" + localGb + ", writeYn="
				+ writeYn + ", cnsleNm=" + cnsleNm + ", writeDt=" + writeDt + ", rank=" + rank + ", year=" + year
				+ ", month=" + month + ", day=" + day + ", jumin1=" + jumin1 + ", jumin2=" + jumin2 + ", seplName="
				+ seplName + ", seplSign=" + seplSign + ", dbInsTm=" + dbInsTm + ", examDocCd=" + examDocCd
				+ ", cnsrId=" + cnsrId + ", file=" + file + "]";
	}
	
}
