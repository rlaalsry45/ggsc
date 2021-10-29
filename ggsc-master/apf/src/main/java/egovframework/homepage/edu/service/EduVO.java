package egovframework.homepage.edu.service;

import org.springframework.web.multipart.MultipartFile;

public class EduVO {

	private int num;
	private String cnsGb;
	private String userNm;
	private String zoneGb;
	private String eduName;
	private String regDate;
	private String cnsReqGb;
	private String centerGb;
	private String cnsleId;
	private String cnsleNm;
	private String centerNm;
	private String userId;
	private String gender;
	private String depart;
	private String birth;
	private String email;
	private String tel;
	private String phone;
	private String address;
	private String cnsHistYn;
	private String cnsCntn;
	private String dbInsTm;
	private MultipartFile file;
	private String fileNm;
	private String sysFileNm;
	private String filePath;
	private int fileSize;
	private String fileDesc;
	
	private String sigunCd;
	private String cnsrGb;
	private String cnsDt;
	private int cnsDtStdHour;
	private int cnsDtStdMin;
	private int cnsDtEndHour;
	private int cnsDtEndMin;
	private int cnsDtTotMin;
	private String cnsDtl;
	private String olderRel;
	private String edu;
	private String relg;
	private String livgForm;
	private String houseForm;
	private String merrStat;
	private String liveForm;
	private String majorProb;
	private String psyExam;
	private String localGb;
	private String majorApplCd;
	
	public String getSigunCd() {
		return sigunCd;
	}
	public void setSigunCd(String sigunCd) {
		this.sigunCd = sigunCd;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getLocalGb() {
		return localGb;
	}
	public void setLocalGb(String localGb) {
		this.localGb = localGb;
	}
	public String getEduName() {
		return eduName;
	}
	public void setEduName(String eduName) {
		this.eduName = eduName;
	}
	public String getMajorApplCd() {
		return majorApplCd;
	}
	public void setMajorApplCd(String majorApplCd) {
		this.majorApplCd = majorApplCd;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
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
	public String getCnsReqGb() {
		return cnsReqGb;
	}
	public void setCnsReqGb(String cnsReqGb) {
		this.cnsReqGb = cnsReqGb;
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
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCnsHistYn() {
		return cnsHistYn;
	}
	public void setCnsHistYn(String cnsHistYn) {
		this.cnsHistYn = cnsHistYn;
	}
	public String getCnsCntn() {
		return cnsCntn;
	}
	public void setCnsCntn(String cnsCntn) {
		this.cnsCntn = cnsCntn;
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
	public String getFileDesc() {
		return fileDesc;
	}
	public void setFileDesc(String fileDesc) {
		this.fileDesc = fileDesc;
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
	public int getCnsDtTotMin() {
		return cnsDtTotMin;
	}
	public void setCnsDtTotMin(int cnsDtTotMin) {
		this.cnsDtTotMin = cnsDtTotMin;
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
	public String getMajorProb() {
		return majorProb;
	}
	public void setMajorProb(String majorProb) {
		this.majorProb = majorProb;
	}
	public String getPsyExam() {
		return psyExam;
	}
	public void setPsyExam(String psyExam) {
		this.psyExam = psyExam;
	}
	public String getUserNm() {
		return userNm;
	}
	public void setUserNm(String userNm) {
		this.userNm = userNm;
	}
	public String getCenterNm() {
		return centerNm;
	}
	public void setCenterNm(String centerNm) {
		this.centerNm = centerNm;
	}
	public String getDepart() {
		return depart;
	}
	public void setDepart(String depart) {
		this.depart = depart;
	}
	

}
