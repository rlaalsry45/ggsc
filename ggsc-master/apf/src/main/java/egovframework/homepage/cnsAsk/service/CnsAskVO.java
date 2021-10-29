package egovframework.homepage.cnsAsk.service;

public class CnsAskVO {

	private int num;
	private String pw;
	private String title;
	private String cntn;
	private String ansTitle;
	private String ansCntn;
	private String writer;
	private String cnsleId;
	private String cnsleNm;
	private String cnsrId;
	private String cnsrNm;
	private String viewCnt;
	private String answerYn;
	private String dbInsTm;
	private String ansDbInsTm;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCntn() {
		return cntn;
	}
	public void setCntn(String cntn) {
		this.cntn = cntn;
	}
	public String getAnsTitle() {
		return ansTitle;
	}
	public void setAnsTitle(String ansTitle) {
		this.ansTitle = ansTitle;
	}
	public String getAnsCntn() {
		return ansCntn;
	}
	public void setAnsCntn(String ansCntn) {
		this.ansCntn = ansCntn;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
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
	public String getCnsrId() {
		return cnsrId;
	}
	public void setCnsrId(String cnsrId) {
		this.cnsrId = cnsrId;
	}
	public String getCnsrNm() {
		return cnsrNm;
	}
	public void setCnsrNm(String cnsrNm) {
		this.cnsrNm = cnsrNm;
	}
	public String getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(String viewCnt) {
		this.viewCnt = viewCnt;
	}
	public String getAnswerYn() {
		return answerYn;
	}
	public void setAnswerYn(String answerYn) {
		this.answerYn = answerYn;
	}
	public String getDbInsTm() {
		return dbInsTm;
	}
	public void setDbInsTm(String dbInsTm) {
		this.dbInsTm = dbInsTm;
	}
	public String getAnsDbInsTm() {
		return ansDbInsTm;
	}
	public void setAnsDbInsTm(String ansDbInsTm) {
		this.ansDbInsTm = ansDbInsTm;
	}
	
	@Override
	public String toString() {
		return "CnsAskVO [num=" + num + ", pw=" + pw + ", title=" + title + ", cntn=" + cntn + ", ansTitle=" + ansTitle
				+ ", ansCntn=" + ansCntn + ", writer=" + writer + ", cnsleId=" + cnsleId + ", cnsleNm=" + cnsleNm
				+ ", cnsrId=" + cnsrId + ", cnsrNm=" + cnsrNm + ", viewCnt=" + viewCnt + ", answerYn=" + answerYn
				+ ", dbInsTm=" + dbInsTm + ", ansDbInsTm=" + ansDbInsTm + "]";
	}
	
}
