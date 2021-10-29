package ggsc.cmmmng.service;

import ams.cmm.PageVO;

public class AuthMngVO extends PageVO  {

	private int authNo;
	private String authCd;
	private String authGrpCd;
	private String authNm;
	private String cntn;
	private int odr;
	private String useYn;
	private String regId;
	public int getAuthNo() {
		return authNo;
	}
	public void setAuthNo(int authNo) {
		this.authNo = authNo;
	}
	public String getAuthCd() {
		return authCd;
	}
	public void setAuthCd(String authCd) {
		this.authCd = authCd;
	}
	public String getAuthGrpCd() {
		return authGrpCd;
	}
	public void setAuthGrpCd(String authGrpCd) {
		this.authGrpCd = authGrpCd;
	}
	public String getAuthNm() {
		return authNm;
	}
	public void setAuthNm(String authNm) {
		this.authNm = authNm;
	}
	public String getCntn() {
		return cntn;
	}
	public void setCntn(String cntn) {
		this.cntn = cntn;
	}
	public int getOdr() {
		return odr;
	}
	public void setOdr(int odr) {
		this.odr = odr;
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
}
