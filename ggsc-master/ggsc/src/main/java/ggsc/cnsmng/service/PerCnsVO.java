package ggsc.cnsmng.service;

import org.springframework.web.multipart.MultipartFile;

import ams.cmm.PageVO;

public class PerCnsVO extends PageVO {
	private int num;
	private int caseNo;
	private String cnsGb;
	private int cnsDtlGbCd;
	private String zoneGb;
	private String centerGb;
	private String localGb;
	private String cnsleId;
	private String cnsleNm;
	private String cnsrNm;
	private String cnsrGb;
	private String cnsStat;
	private String cnsEndCd;
	private String cnsEndDt;
	private String defrCd;
	private String defrDt;
	private String reReqDt;
	private String cmbkDt;
	private String birthDt;
	private String gender;
	private String mobile;
	private String emgcyTel;
	private String addr;
	private String addrDtl;
	private String cnsEndYn;
	private String cnsrId;
	private String sigunCd;
	
	private String cnsEfftPlace;
	private String cnsRsvtPlace;
	private int cnsCnt;
	private String emgcyUrgt;
	private String cnsDt;
	private String cnsDtWeekCd;
	private int cnsDtStdHour;
	private int cnsDtStdMin;
	private int cnsDtEndHour;
	private int cnsDtEndMin;
	private int cnsTimeTotMin;
	private String cnsRsvtDt;
	private String cnsRsvtWeekCd;
	private int cnsRsvtStrtHour;
	private int cnsRsvtStrtMin;
	private int cnsRsvtEndHour;
	private int cnsRsvtEndMin;
	private int cnsRsvtTotMin;
	private String cnsleRel;
	private String cnsMethd;
	private String cnsMethdNm;
	private String killsOptn;
	private String majorApplCd;
	private String majorApplNm;
	private String ahydSuptYn;
	private String ahydAcptDt;
	private String ahydEndDt;
	private String abusOptn;
	private String livgForm;
	private String houseForm;
	private String houseChng;
	private String merrStat;
	private String liveForm;
	private String sujtHelcyStat;
	private String dignMhist;
	private String mnds;
	private String econoStat;
	private String recntFmlyDeth;
	private String recntMmanDeth;
	private String olderWorkPtptYn;
	private String killsRskn;
	private String psycQust;
	private String psycQustArr;
	private String perRelQust;
	private String psng;
	private String dmta;
	private String dsm;
	private String helthQust;
	private String econoQust;
	private String lifeQust;
	private String cnsItvtLink;
	private String cnsCntEvatCntn;
	private String daftMng;
	private String cnsCntn;
	private String emotCptvDegr;
	private String helpDegr;
	private String cnsChngDegr;
	private String CnsType;
	
	private MultipartFile file;
	private MultipartFile file1;
	private MultipartFile file2;
	
	private String fileNm;
	private String sysFileNm;
	private String filePath;
	private String fileDesc;
	private int fileSize;
	
	
	public String getCnsType() {
		return CnsType;
	}
	public void setCnsType(String cnsType) {
		CnsType = cnsType;
	}
	public String getSigunCd() {
		return sigunCd;
	}
	public void setSigunCd(String sigunCd) {
		this.sigunCd = sigunCd;
	}
	public String getCnsrId() {
		return cnsrId;
	}
	public void setCnsrId(String cnsrId) {
		this.cnsrId = cnsrId;
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
	public String getCnsleNm() {
		return cnsleNm;
	}
	public void setCnsleNm(String cnsleNm) {
		this.cnsleNm = cnsleNm;
	}
	public String getCnsrNm() {
		return cnsrNm;
	}
	public void setCnsrNm(String cnsrNm) {
		this.cnsrNm = cnsrNm;
	}
	public String getCnsrGb() {
		return cnsrGb;
	}
	public void setCnsrGb(String cnsrGb) {
		this.cnsrGb = cnsrGb;
	}
	public String getCnsStat() {
		return cnsStat;
	}
	public void setCnsStat(String cnsStat) {
		this.cnsStat = cnsStat;
	}
	public String getCnsEndCd() {
		return cnsEndCd;
	}
	public void setCnsEndCd(String cnsEndCd) {
		this.cnsEndCd = cnsEndCd;
	}
	public String getCnsEndDt() {
		return cnsEndDt;
	}
	public void setCnsEndDt(String cnsEndDt) {
		this.cnsEndDt = cnsEndDt;
	}
	public String getDefrCd() {
		return defrCd;
	}
	public void setDefrCd(String defrCd) {
		this.defrCd = defrCd;
	}
	public String getDefrDt() {
		return defrDt;
	}
	public void setDefrDt(String defrDt) {
		this.defrDt = defrDt;
	}
	public String getReReqDt() {
		return reReqDt;
	}
	public void setReReqDt(String reReqDt) {
		this.reReqDt = reReqDt;
	}
	public String getCmbkDt() {
		return cmbkDt;
	}
	public void setCmbkDt(String cmbkDt) {
		this.cmbkDt = cmbkDt;
	}
	public String getBirthDt() {
		return birthDt;
	}
	public void setBirthDt(String birthDt) {
		this.birthDt = birthDt;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
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
	public String getCnsEndYn() {
		return cnsEndYn;
	}
	public void setCnsEndYn(String cnsEndYn) {
		this.cnsEndYn = cnsEndYn;
	}
	public String getCnsEfftPlace() {
		return cnsEfftPlace;
	}
	public void setCnsEfftPlace(String cnsEfftPlace) {
		this.cnsEfftPlace = cnsEfftPlace;
	}
	public String getCnsRsvtPlace() {
		return cnsRsvtPlace;
	}
	public void setCnsRsvtPlace(String cnsRsvtPlace) {
		this.cnsRsvtPlace = cnsRsvtPlace;
	}
	public int getCnsCnt() {
		return cnsCnt;
	}
	public void setCnsCnt(int cnsCnt) {
		this.cnsCnt = cnsCnt;
	}
	public String getEmgcyUrgt() {
		return emgcyUrgt;
	}
	public void setEmgcyUrgt(String emgcyUrgt) {
		this.emgcyUrgt = emgcyUrgt;
	}
	public String getCnsDt() {
		return cnsDt;
	}
	public void setCnsDt(String cnsDt) {
		this.cnsDt = cnsDt;
	}
	public String getCnsDtWeekCd() {
		return cnsDtWeekCd;
	}
	public void setCnsDtWeekCd(String cnsDtWeekCd) {
		this.cnsDtWeekCd = cnsDtWeekCd;
	}
	public int getCnsDtStdHour() {
		return cnsDtStdHour;
	}
	public void setCnsDtStdHour(int cnsDtStdHour) {
		this.cnsDtStdHour = cnsDtStdHour;
	}
	public int getCnsDtStdMin() {
		return cnsDtStdMin;
	}
	public void setCnsDtStdMin(int cnsDtStdMin) {
		this.cnsDtStdMin = cnsDtStdMin;
	}
	public int getCnsDtEndHour() {
		return cnsDtEndHour;
	}
	public void setCnsDtEndHour(int cnsDtEndHour) {
		this.cnsDtEndHour = cnsDtEndHour;
	}
	public int getCnsDtEndMin() {
		return cnsDtEndMin;
	}
	public void setCnsDtEndMin(int cnsDtEndMin) {
		this.cnsDtEndMin = cnsDtEndMin;
	}
	public int getCnsTimeTotMin() {
		return cnsTimeTotMin;
	}
	public void setCnsTimeTotMin(int cnsTimeTotMin) {
		this.cnsTimeTotMin = cnsTimeTotMin;
	}
	public String getCnsRsvtDt() {
		return cnsRsvtDt;
	}
	public void setCnsRsvtDt(String cnsRsvtDt) {
		this.cnsRsvtDt = cnsRsvtDt;
	}
	public String getCnsRsvtWeekCd() {
		return cnsRsvtWeekCd;
	}
	public void setCnsRsvtWeekCd(String cnsRsvtWeekCd) {
		this.cnsRsvtWeekCd = cnsRsvtWeekCd;
	}
	public int getCnsRsvtStrtHour() {
		return cnsRsvtStrtHour;
	}
	public void setCnsRsvtStrtHour(int cnsRsvtStrtHour) {
		this.cnsRsvtStrtHour = cnsRsvtStrtHour;
	}
	public int getCnsRsvtStrtMin() {
		return cnsRsvtStrtMin;
	}
	public void setCnsRsvtStrtMin(int cnsRsvtStrtMin) {
		this.cnsRsvtStrtMin = cnsRsvtStrtMin;
	}
	public int getCnsRsvtEndHour() {
		return cnsRsvtEndHour;
	}
	public void setCnsRsvtEndHour(int cnsRsvtEndHour) {
		this.cnsRsvtEndHour = cnsRsvtEndHour;
	}
	public int getCnsRsvtEndMin() {
		return cnsRsvtEndMin;
	}
	public void setCnsRsvtEndMin(int cnsRsvtEndMin) {
		this.cnsRsvtEndMin = cnsRsvtEndMin;
	}
	public int getCnsRsvtTotMin() {
		return cnsRsvtTotMin;
	}
	public void setCnsRsvtTotMin(int cnsRsvtTotMin) {
		this.cnsRsvtTotMin = cnsRsvtTotMin;
	}
	public String getCnsleRel() {
		return cnsleRel;
	}
	public void setCnsleRel(String cnsleRel) {
		this.cnsleRel = cnsleRel;
	}
	public String getCnsMethd() {
		return cnsMethd;
	}
	public void setCnsMethd(String cnsMethd) {
		this.cnsMethd = cnsMethd;
	}
	public String getKillsOptn() {
		return killsOptn;
	}
	public void setKillsOptn(String killsOptn) {
		this.killsOptn = killsOptn;
	}
	public String getAhydSuptYn() {
		return ahydSuptYn;
	}
	public void setAhydSuptYn(String ahydSuptYn) {
		this.ahydSuptYn = ahydSuptYn;
	}
	public String getAhydAcptDt() {
		return ahydAcptDt;
	}
	public void setAhydAcptDt(String ahydAcptDt) {
		this.ahydAcptDt = ahydAcptDt;
	}
	public String getAhydEndDt() {
		return ahydEndDt;
	}
	public void setAhydEndDt(String ahydEndDt) {
		this.ahydEndDt = ahydEndDt;
	}
	public String getAbusOptn() {
		return abusOptn;
	}
	public void setAbusOptn(String abusOptn) {
		this.abusOptn = abusOptn;
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
	public String getHouseChng() {
		return houseChng;
	}
	public void setHouseChng(String houseChng) {
		this.houseChng = houseChng;
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
	public String getSujtHelcyStat() {
		return sujtHelcyStat;
	}
	public void setSujtHelcyStat(String sujtHelcyStat) {
		this.sujtHelcyStat = sujtHelcyStat;
	}
	public String getDignMhist() {
		return dignMhist;
	}
	public void setDignMhist(String dignMhist) {
		this.dignMhist = dignMhist;
	}
	public String getMnds() {
		return mnds;
	}
	public void setMnds(String mnds) {
		this.mnds = mnds;
	}
	public String getEconoStat() {
		return econoStat;
	}
	public void setEconoStat(String econoStat) {
		this.econoStat = econoStat;
	}
	public String getRecntFmlyDeth() {
		return recntFmlyDeth;
	}
	public void setRecntFmlyDeth(String recntFmlyDeth) {
		this.recntFmlyDeth = recntFmlyDeth;
	}
	public String getRecntMmanDeth() {
		return recntMmanDeth;
	}
	public void setRecntMmanDeth(String recntMmanDeth) {
		this.recntMmanDeth = recntMmanDeth;
	}
	public String getOlderWorkPtptYn() {
		return olderWorkPtptYn;
	}
	public void setOlderWorkPtptYn(String olderWorkPtptYn) {
		this.olderWorkPtptYn = olderWorkPtptYn;
	}
	public String getKillsRskn() {
		return killsRskn;
	}
	public void setKillsRskn(String killsRskn) {
		this.killsRskn = killsRskn;
	}
	public String getPsycQust() {
		return psycQust;
	}
	public void setPsycQust(String psycQust) {
		this.psycQust = psycQust;
	}
	public String getPsycQustArr() {
		return psycQustArr;
	}
	public void setPsycQustArr(String psycQustArr) {
		this.psycQustArr = psycQustArr;
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
	public String getCnsItvtLink() {
		return cnsItvtLink;
	}
	public void setCnsItvtLink(String cnsItvtLink) {
		this.cnsItvtLink = cnsItvtLink;
	}
	public String getCnsCntEvatCntn() {
		return cnsCntEvatCntn;
	}
	public void setCnsCntEvatCntn(String cnsCntEvatCntn) {
		this.cnsCntEvatCntn = cnsCntEvatCntn;
	}
	public String getDaftMng() {
		return daftMng;
	}
	public void setDaftMng(String daftMng) {
		this.daftMng = daftMng;
	}
	public String getCnsCntn() {
		return cnsCntn;
	}
	public void setCnsCntn(String cnsCntn) {
		this.cnsCntn = cnsCntn;
	}
	public String getEmotCptvDegr() {
		return emotCptvDegr;
	}
	public void setEmotCptvDegr(String emotCptvDegr) {
		this.emotCptvDegr = emotCptvDegr;
	}
	public String getHelpDegr() {
		return helpDegr;
	}
	public void setHelpDegr(String helpDegr) {
		this.helpDegr = helpDegr;
	}
	public String getCnsChngDegr() {
		return cnsChngDegr;
	}
	public void setCnsChngDegr(String cnsChngDegr) {
		this.cnsChngDegr = cnsChngDegr;
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
	public String getMajorApplCd() {
		return majorApplCd;
	}
	public void setMajorApplCd(String majorApplCd) {
		this.majorApplCd = majorApplCd;
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
	public String getCnsMethdNm() {
		return cnsMethdNm;
	}
	public void setCnsMethdNm(String cnsMethdNm) {
		this.cnsMethdNm = cnsMethdNm;
	}
	public String getMajorApplNm() {
		return majorApplNm;
	}
	public void setMajorApplNm(String majorApplNm) {
		this.majorApplNm = majorApplNm;
	}
	
	@Override
	public String toString() {
		return "PerCnsVO [caseNo=" + caseNo + ", cnsGb=" + cnsGb + ", cnsDtlGbCd=" + cnsDtlGbCd + ", zoneGb=" + zoneGb
				+ ", centerGb=" + centerGb + ", localGb=" + localGb + ", cnsleId=" + cnsleId + ", cnsleNm=" + cnsleNm
				+ ", cnsrNm=" + cnsrNm + ", cnsrGb=" + cnsrGb + ", cnsStat=" + cnsStat + ", cnsEndCd=" + cnsEndCd
				+ ", cnsEndDt=" + cnsEndDt + ", defrCd=" + defrCd + ", defrDt=" + defrDt + ", reReqDt=" + reReqDt
				+ ", cmbkDt=" + cmbkDt + ", birthDt=" + birthDt + ", gender=" + gender + ", mobile=" + mobile
				+ ", emgcyTel=" + emgcyTel + ", addr=" + addr + ", addrDtl=" + addrDtl + ", cnsEndYn=" + cnsEndYn
				+ ", cnsEfftPlace=" + cnsEfftPlace + ", cnsRsvtPlace=" + cnsRsvtPlace + ", cnsCnt=" + cnsCnt
				+ ", emgcyUrgt=" + emgcyUrgt + ", cnsDt=" + cnsDt + ", cnsDtWeekCd=" + cnsDtWeekCd + ", cnsDtStdHour="
				+ cnsDtStdHour + ", cnsDtStdMin=" + cnsDtStdMin + ", cnsDtEndHour=" + cnsDtEndHour + ", cnsDtEndMin="
				+ cnsDtEndMin + ", cnsTimeTotMin=" + cnsTimeTotMin + ", cnsRsvtDt=" + cnsRsvtDt + ", cnsRsvtWeekCd="
				+ cnsRsvtWeekCd + ", cnsRsvtStrtHour=" + cnsRsvtStrtHour + ", cnsRsvtStrtMin=" + cnsRsvtStrtMin
				+ ", cnsRsvtEndHour=" + cnsRsvtEndHour + ", cnsRsvtEndMin=" + cnsRsvtEndMin + ", cnsRsvtTotMin="
				+ cnsRsvtTotMin + ", cnsleRel=" + cnsleRel + ", cnsMethd=" + cnsMethd + ", killsOptn=" + killsOptn
				+ ", ahydSuptYn=" + ahydSuptYn + ", ahydAcptDt=" + ahydAcptDt + ", ahydEndDt=" + ahydEndDt
				+ ", abusOptn=" + abusOptn + ", livgForm=" + livgForm + ", houseForm=" + houseForm + ", houseChng="
				+ houseChng + ", merrStat=" + merrStat + ", liveForm=" + liveForm + ", sujtHelcyStat=" + sujtHelcyStat
				+ ", dignMhist=" + dignMhist + ", mnds=" + mnds + ", econoStat=" + econoStat + ", recntFmlyDeth="
				+ recntFmlyDeth + ", recntMmanDeth=" + recntMmanDeth + ", olderWorkPtptYn=" + olderWorkPtptYn
				+ ", killsRskn=" + killsRskn + ", psycQust=" + psycQust + ", psycQustArr=" + psycQustArr
				+ ", perRelQust=" + perRelQust + ", psng=" + psng + ", dmta=" + dmta + ", dsm=" + dsm + ", helthQust="
				+ helthQust + ", econoQust=" + econoQust + ", lifeQust=" + lifeQust + ", cnsItvtLink=" + cnsItvtLink
				+ ", cnsCntEvatCntn=" + cnsCntEvatCntn + ", daftMng=" + daftMng + ", cnsCntn=" + cnsCntn
				+ ", emotCptvDegr=" + emotCptvDegr + ", helpDegr=" + helpDegr + ", cnsChngDegr=" + cnsChngDegr
				+ ", file=" + file + ", file1=" + file1 + ", file2=" + file2 + "]";
	}
}
