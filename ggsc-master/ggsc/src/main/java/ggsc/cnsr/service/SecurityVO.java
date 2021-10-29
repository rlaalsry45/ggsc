package ggsc.cnsr.service;

public class SecurityVO {

	private int num;
	private int year2;
	private String docGb;
	private String cnsGb;
	private String zoneGb;
	private String centerGb;
	private String userId;
	private String cnsleId;
	private String localGb;
	private String writeYn;
	private String cnsleNm;
	private String securityYn;
	private String writeDt;
	private String expirDt;
	private String rank;
	private String year;
	private String month;
	private String day;
	private String jumin1;
	private String jumin2;
	private String seplName;
	private String seplSign;
	private String dbInsTm;
	
	public String getSecurityYn() {
		return securityYn;
	}
	public void setSecurityYn(String securityYn) {
		this.securityYn = securityYn;
	}
	public int getYear2() {
		return year2;
	}
	public void setYear2(int year2) {
		this.year2 = year2;
	}
	public String getExpirDt() {
		return expirDt;
	}
	public void setExpirDt(String expirDt) {
		this.expirDt = expirDt;
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
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
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
	
	@Override
	public String toString() {
		return "SecurityVO [num=" + num + ", docGb=" + docGb + ", cnsGb=" + cnsGb + ", zoneGb=" + zoneGb + ", centerGb="
				+ centerGb + ", cnsleId=" + cnsleId + ", localGb=" + localGb + ", writeYn=" + writeYn + ", cnsleNm="
				+ cnsleNm + ", writeDt=" + writeDt + ", rank=" + rank + ", year=" + year + ", month=" + month + ", day="
				+ day + ", jumin1=" + jumin1 + ", jumin2=" + jumin2 + ", seplName=" + seplName + ", seplSign="
				+ seplSign + ", dbInsTm=" + dbInsTm + "]";
	}

	
}
