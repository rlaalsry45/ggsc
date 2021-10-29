package ams.cmm;

public class BaseVO {
	private String mnuCd;

	/** 아이디 검색 */
	private String schUserId;

	/** 이름 검색 */
	private String schUserName;

	/** 부서 검색 */
	private String schDeptId;

	/** 부서명 검색 */
	private String schDeptName;

	/** 권한그룹명 */
	private String authGrpCd;

	/** 등록자 */
	private String regId;

	/** 검색 종류 */
	private String schType;

	/** 검색 텍스트 */
	private String schText;

	public String getMnuCd() {
		return mnuCd;
	}

	public void setMnuCd(String mnuCd) {
		this.mnuCd = mnuCd;
	}

	public String getSchUserId() {
		return schUserId;
	}

	public void setSchUserId(String schUserId) {
		this.schUserId = schUserId;
	}

	public String getSchUserName() {
		return schUserName;
	}

	public void setSchUserName(String schUserName) {
		this.schUserName = schUserName;
	}

	public String getSchDeptId() {
		return schDeptId;
	}

	public void setSchDeptId(String schDeptId) {
		this.schDeptId = schDeptId;
	}

	public String getAuthGrpCd() {
		return authGrpCd;
	}

	public void setAuthGrpCd(String authGrpCd) {
		this.authGrpCd = authGrpCd;
	}

	public String getRegId() {
		return regId;
	}

	public void setRegId(String regId) {
		this.regId = regId;
	}

	public String getSchDeptName() {
		return schDeptName;
	}

	public void setSchDeptName(String schDeptName) {
		this.schDeptName = schDeptName;
	}

	public String getSchType() {
		return schType;
	}

	public void setSchType(String schType) {
		this.schType = schType;
	}

	public String getSchText() {
		return schText;
	}

	public void setSchText(String schText) {
		this.schText = schText;
	}


}
