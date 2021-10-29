package ggsc.cnsmng.service;

import ams.cmm.PageVO;

public class GcnsVO extends PageVO {
	
	private int num;
	private int caseNo;
	private String cnsGb;
	private int cnsDtlGbCd;
	private String zoneGb;
	private String localGb;
	private String centerGb;
	private String cnsleId;
	private String cnsleNm;
	private String pgrmCd;
	private String pgrmNm;
	private String authCd;
	private String cnsType;
	private String birthDt;
	private String olderRel;
	private String sigunCd;
	private String clearYn;
	
	private String cnsrId;
	private int cnsCnt;
	private String atvyTitle;
	private String atvyDt;
	private int atvyStrtHour;
	private int atvyStrtMin;
	private int atvyEndHour;
	private int atvyEndMin;
	private int atvyTotMin;
	private String atvyPlace;
	private String leader;
	private String leaderGb;
	private String anchor;
	private String inputNm;
	private int atdeCnt;
	private String atdeNm;
	private	String atdeId;
	private String oriAtdeId;
	private String oriAtdeNm;
	private String atvyGoal;
	private String pgrmCntn;
	private String evat;
	private String afterPlan;
	private String etc;
	
	private String cnsrNm;
	private String majorApplCd;
	private String regId;
	
	private String psycQust;
	private String perRelQust;
	private String psng;
	private String dmta;
	private String dsm;
	private String helthQust;
	private String sungQust;
	private String econoQust;
	private String lifeQust;
	private String coupleQust;
	private String familyQust;
	private String partQust;
	private String etcQust;
	
	private String fileNm;
	private String sysFileNm;
	private String filePath;
	private String fileDesc;
	private int fileSize;
	
	private String schCnsGb;
	private String schCenterGb;
	private String schPgrmNm;
	private String schLeaderNm;
	private String schCnsleNm;
	private String schStartDate;
	private String schEndDate;
	
	public String getOriAtdeNm() {
		return oriAtdeNm;
	}

	public void setOriAtdeNm(String oriAtdeNm) {
		this.oriAtdeNm = oriAtdeNm;
	}

	public String getOriAtdeId() {
		return oriAtdeId;
	}

	public void setOriAtdeId(String oriAtdeId) {
		this.oriAtdeId = oriAtdeId;
	}

	public String getClearYn() {
		return clearYn;
	}

	public void setClearYn(String clearYn) {
		this.clearYn = clearYn;
	}

	public String getAtdeId() {
		return atdeId;
	}

	public void setAtdeId(String atdeId) {
		this.atdeId = atdeId;
	}

	public String getSigunCd() {
		return sigunCd;
	}

	public void setSigunCd(String sigunCd) {
		this.sigunCd = sigunCd;
	}

	public String getOlderRel() {
		return olderRel;
	}

	public void setOlderRel(String olderRel) {
		this.olderRel = olderRel;
	}

	public String getBirthDt() {
		return birthDt;
	}

	public void setBirthDt(String birthDt) {
		this.birthDt = birthDt;
	}

	public String getCnsType() {
		return cnsType;
	}

	public void setCnsType(String cnsType) {
		this.cnsType = cnsType;
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

	public String getSungQust() {
		return sungQust;
	}

	public void setSungQust(String sungQust) {
		this.sungQust = sungQust;
	}

	public String getPsycQust() {
		return psycQust;
	}

	public void setPsycQust(String psycQust) {
		this.psycQust = psycQust;
	}

	public String getPerRelQust() {
		return perRelQust;
	}

	public void setPerRelQust(String perRelQust) {
		this.perRelQust = perRelQust;
	}

	public String getPsng() {
		return psng;
	}

	public void setPsng(String psng) {
		this.psng = psng;
	}

	public String getDmta() {
		return dmta;
	}

	public void setDmta(String dmta) {
		this.dmta = dmta;
	}

	public String getDsm() {
		return dsm;
	}

	public void setDsm(String dsm) {
		this.dsm = dsm;
	}

	public String getHelthQust() {
		return helthQust;
	}

	public void setHelthQust(String helthQust) {
		this.helthQust = helthQust;
	}

	public String getEconoQust() {
		return econoQust;
	}

	public void setEconoQust(String econoQust) {
		this.econoQust = econoQust;
	}

	public String getLifeQust() {
		return lifeQust;
	}

	public void setLifeQust(String lifeQust) {
		this.lifeQust = lifeQust;
	}

	public String getCoupleQust() {
		return coupleQust;
	}

	public void setCoupleQust(String coupleQust) {
		this.coupleQust = coupleQust;
	}

	public String getFamilyQust() {
		return familyQust;
	}

	public void setFamilyQust(String familyQust) {
		this.familyQust = familyQust;
	}

	public String getPartQust() {
		return partQust;
	}

	public void setPartQust(String partQust) {
		this.partQust = partQust;
	}

	public String getEtcQust() {
		return etcQust;
	}

	public void setEtcQust(String etcQust) {
		this.etcQust = etcQust;
	}

	public String getSchLeaderNm() {
		return schLeaderNm;
	}

	public void setSchLeaderNm(String schLeaderNm) {
		this.schLeaderNm = schLeaderNm;
	}

	public String getSchCnsGb() {
		return schCnsGb;
	}

	public void setSchCnsGb(String schCnsGb) {
		this.schCnsGb = schCnsGb;
	}

	public String getSchCenterGb() {
		return schCenterGb;
	}

	public void setSchCenterGb(String schCenterGb) {
		this.schCenterGb = schCenterGb;
	}

	public String getSchPgrmNm() {
		return schPgrmNm;
	}

	public void setSchPgrmNm(String schPgrmNm) {
		this.schPgrmNm = schPgrmNm;
	}

	public String getSchCnsleNm() {
		return schCnsleNm;
	}

	public void setSchCnsleNm(String schCnsleNm) {
		this.schCnsleNm = schCnsleNm;
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

	public String getCnsGb() {
		return cnsGb;
	}

	public void setCnsGb(String cnsGb) {
		this.cnsGb = cnsGb;
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

	public String getCnsleNm() {
		return cnsleNm;
	}

	public void setCnsleNm(String cnsleNm) {
		this.cnsleNm = cnsleNm;
	}

	public String getPgrmCd() {
		return pgrmCd;
	}

	public void setPgrmCd(String pgrmCd) {
		this.pgrmCd = pgrmCd;
	}

	public String getPgrmNm() {
		return pgrmNm;
	}

	public void setPgrmNm(String pgrmNm) {
		this.pgrmNm = pgrmNm;
	}

	public String getCnsrId() {
		return cnsrId;
	}

	public void setCnsrId(String cnsrId) {
		this.cnsrId = cnsrId;
	}

	public int getCnsCnt() {
		return cnsCnt;
	}

	public void setCnsCnt(int cnsCnt) {
		this.cnsCnt = cnsCnt;
	}

	public String getAtvyDt() {
		return atvyDt;
	}

	public void setAtvyDt(String atvyDt) {
		this.atvyDt = atvyDt;
	}

	public int getAtvyStrtHour() {
		return atvyStrtHour;
	}

	public void setAtvyStrtHour(int atvyStrtHour) {
		this.atvyStrtHour = atvyStrtHour;
	}

	public int getAtvyStrtMin() {
		return atvyStrtMin;
	}

	public void setAtvyStrtMin(int atvyStrtMin) {
		this.atvyStrtMin = atvyStrtMin;
	}

	public int getAtvyEndHour() {
		return atvyEndHour;
	}

	public void setAtvyEndHour(int atvyEndHour) {
		this.atvyEndHour = atvyEndHour;
	}

	public int getAtvyEndMin() {
		return atvyEndMin;
	}

	public void setAtvyEndMin(int atvyEndMin) {
		this.atvyEndMin = atvyEndMin;
	}

	public int getAtvyTotMin() {
		return atvyTotMin;
	}

	public void setAtvyTotMin(int atvyTotMin) {
		this.atvyTotMin = atvyTotMin;
	}

	public String getAtvyPlace() {
		return atvyPlace;
	}

	public void setAtvyPlace(String atvyPlace) {
		this.atvyPlace = atvyPlace;
	}

	public String getLeader() {
		return leader;
	}

	public void setLeader(String leader) {
		this.leader = leader;
	}

	public String getLeaderGb() {
		return leaderGb;
	}

	public void setLeaderGb(String leaderGb) {
		this.leaderGb = leaderGb;
	}

	public String getAnchor() {
		return anchor;
	}

	public void setAnchor(String anchor) {
		this.anchor = anchor;
	}

	public String getInputNm() {
		return inputNm;
	}

	public void setInputNm(String inputNm) {
		this.inputNm = inputNm;
	}

	public int getAtdeCnt() {
		return atdeCnt;
	}

	public void setAtdeCnt(int atdeCnt) {
		this.atdeCnt = atdeCnt;
	}

	public String getAtdeNm() {
		return atdeNm;
	}

	public void setAtdeNm(String atdeNm) {
		this.atdeNm = atdeNm;
	}

	public String getAtvyGoal() {
		return atvyGoal;
	}

	public void setAtvyGoal(String atvyGoal) {
		this.atvyGoal = atvyGoal;
	}

	public String getPgrmCntn() {
		return pgrmCntn;
	}

	public void setPgrmCntn(String pgrmCntn) {
		this.pgrmCntn = pgrmCntn;
	}

	public String getEvat() {
		return evat;
	}

	public void setEvat(String evat) {
		this.evat = evat;
	}

	public String getAfterPlan() {
		return afterPlan;
	}

	public void setAfterPlan(String afterPlan) {
		this.afterPlan = afterPlan;
	}

	public String getEtc() {
		return etc;
	}

	public void setEtc(String etc) {
		this.etc = etc;
	}
	
	public String getCnsrNm() {
		return cnsrNm;
	}

	public void setCnsrNm(String cnsrNm) {
		this.cnsrNm = cnsrNm;
	}

	public String getAtvyTitle() {
		return atvyTitle;
	}

	public void setAtvyTitle(String atvyTitle) {
		this.atvyTitle = atvyTitle;
	}

	public String getMajorApplCd() {
		return majorApplCd;
	}

	public void setMajorApplCd(String majorApplCd) {
		this.majorApplCd = majorApplCd;
	}

	public String getRegId() {
		return regId;
	}

	public void setRegId(String regId) {
		this.regId = regId;
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
		return "GcnsVO [num=" + num + ", caseNo=" + caseNo + ", cnsGb=" + cnsGb + ", cnsDtlGbCd=" + cnsDtlGbCd
				+ ", zoneGb=" + zoneGb + ", localGb=" + localGb + ", centerGb=" + centerGb + ", cnsleId=" + cnsleId
				+ ", cnsleNm=" + cnsleNm + ", pgrmCd=" + pgrmCd + ", pgrmNm=" + pgrmNm + ", cnsrId=" + cnsrId
				+ ", cnsCnt=" + cnsCnt + ", atvyTitle=" + atvyTitle + ", atvyDt=" + atvyDt + ", atvyStrtHour="
				+ atvyStrtHour + ", atvyStrtMin=" + atvyStrtMin + ", atvyEndHour=" + atvyEndHour + ", atvyEndMin="
				+ atvyEndMin + ", atvyTotMin=" + atvyTotMin + ", atvyPlace=" + atvyPlace + ", leader=" + leader
				+ ", leaderGb=" + leaderGb + ", anchor=" + anchor + ", inputNm=" + inputNm + ", atdeCnt=" + atdeCnt
				+ ", atdeNm=" + atdeNm + ", atvyGoal=" + atvyGoal + ", pgrmCntn=" + pgrmCntn + ", evat=" + evat
				+ ", afterPlan=" + afterPlan + ", etc=" + etc + ", cnsrNm=" + cnsrNm + ", majorApplCd=" + majorApplCd
				+ ", regId=" + regId + ", fileNm=" + fileNm + ", sysFileNm=" + sysFileNm + ", filePath=" + filePath
				+ ", fileDesc=" + fileDesc + ", fileSize=" + fileSize + "]";
	}
}
