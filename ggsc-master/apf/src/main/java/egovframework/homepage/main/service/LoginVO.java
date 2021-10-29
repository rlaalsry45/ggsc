package egovframework.homepage.main.service;

import egovframework.user.domain.PageVO;

public class LoginVO extends PageVO {

	@SuppressWarnings("unused")
	private static final long serialVersionUID = 1L;

	/** 아이디 */
	private String userId;

	/** 이름 */
	private String userNm;

	/** 내용 */
	private String pw;
	
	/** 내용 */
	private String age;
	
	/** 내용 */
	private String gender;
	
	/** 전화번호 */
	private String tel;
	
	/** 사용여부 */
	private String useYn;
	
	/** 승인여부 */
	private String apprvYn;
	
	private String new_pwd;
	
	private String findGb;
	
	private String email;
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFindGb() {
		return findGb;
	}

	public void setFindGb(String findGb) {
		this.findGb = findGb;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserNm() {
		return userNm;
	}

	public void setUserNm(String userNm) {
		this.userNm = userNm;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getUseYn() {
		return useYn;
	}

	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}

	public String getApprvYn() {
		return apprvYn;
	}

	public void setApprvYn(String apprvYn) {
		this.apprvYn = apprvYn;
	}

	public String getNew_pwd() {
		return new_pwd;
	}

	public void setNew_pwd(String new_pwd) {
		this.new_pwd = new_pwd;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}
	
	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	@Override
	public String toString() {
		return "LoginVO [userId=" + userId + ", userNm=" + userNm + ", pw=" + pw + ", age=" + age + ", gender=" + gender
				+ ", tel=" + tel + ", useYn=" + useYn + ", apprvYn=" + apprvYn + ", new_pwd=" + new_pwd + "]";
	}

}
