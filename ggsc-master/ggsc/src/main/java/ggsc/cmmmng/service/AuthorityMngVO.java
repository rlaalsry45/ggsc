package ggsc.cmmmng.service;

import ams.cmm.PageVO;

public class AuthorityMngVO extends PageVO{

	private int num;
	private int odr;
	private String authNm;
	private String authGrpGb;
	private String cntn;
	private String useYn;
	private String regId;
	private String dbUpdDt;
	private String dbInsDt;
	private String schAuthNm;
	
	public String getSchAuthNm() {
		return schAuthNm;
	}
	public void setSchAuthNm(String schAuthNm) {
		this.schAuthNm = schAuthNm;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getOdr() {
		return odr;
	}
	public void setOdr(int odr) {
		this.odr = odr;
	}
	public String getAuthNm() {
		return authNm;
	}
	public void setAuthNm(String authNm) {
		this.authNm = authNm;
	}
	public String getAuthGrpGb() {
		return authGrpGb;
	}
	public void setAuthGrpGb(String authGrpGb) {
		this.authGrpGb = authGrpGb;
	}
	public String getCntn() {
		return cntn;
	}
	public void setCntn(String cntn) {
		this.cntn = cntn;
	}
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}
	public String getRegId() {
		return regId;
	}
	public void setRegId(String regId) {
		this.regId = regId;
	}
	public String getDbUpdDt() {
		return dbUpdDt;
	}
	public void setDbUpdDt(String dbUpdDt) {
		this.dbUpdDt = dbUpdDt;
	}
	public String getDbInsDt() {
		return dbInsDt;
	}
	public void setDbInsDt(String dbInsDt) {
		this.dbInsDt = dbInsDt;
	}
	
	
	
}
