package ams.adm.sms;

import ams.cmm.NormalVO;

public class SmsVO extends NormalVO  {
	
	private String name;
	
	private String smsNo;
	private String subject;
	private String cntn;
	private String sendList;
	private String sendDt;
	private String sendResult;
	
	public String getSendList() {
		return sendList;
	}
	public void setSendList(String sendList) {
		this.sendList = sendList;
	}
	public String getSendDt() {
		return sendDt;
	}
	public void setSendDt(String sendDt) {
		this.sendDt = sendDt;
	}
	public String getSendResult() {
		return sendResult;
	}
	public void setSendResult(String sendResult) {
		this.sendResult = sendResult;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSmsNo() {
		return smsNo;
	}
	public void setSmsNo(String smsNo) {
		this.smsNo = smsNo;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getCntn() {
		return cntn;
	}
	public void setCntn(String cntn) {
		this.cntn = cntn;
	}
	
	
	
	
	
}
