package com.daou.ppurio;

import ams.cmm.PageVO;
import egovframework.com.cmm.service.EgovProperties;

public class mmsVO extends PageVO {
	private final String userId = EgovProperties.getProperty("Globals.mmsID");
	
	String schSdate;
	String schEdate;
	String schText;
	
	int num;
	int sendCount;
	
	String msgId;
	String callback;
	String phone;
	String msg;
	String names;
	String appdate;
	String subject;
	String filePath;
	String adminID;
	String adminName;
	String result;
	String resultMessage;
	String messageType;


	public String getSchSdate() {
		return schSdate;
	}

	public void setSchSdate(String schSdate) {
		this.schSdate = schSdate;
	}

	public String getSchEdate() {
		return schEdate;
	}

	public void setSchEdate(String schEdate) {
		this.schEdate = schEdate;
	}

	public String getSchText() {
		return schText;
	}

	public void setSchText(String schText) {
		this.schText = schText;
	}

	public int getSendCount() {
		return sendCount;
	}

	public void setSendCount(int sendCount) {
		this.sendCount = sendCount;
	}

	public String getMessageType() {
		return messageType;
	}

	public void setMessageType(String messageType) {
		this.messageType = messageType;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String getResultMessage() {
		return resultMessage;
	}

	public void setResultMessage(String resultMessage) {
		this.resultMessage = resultMessage;
	}

	public String getAdminID() {
		return adminID;
	}

	public void setAdminID(String adminID) {
		this.adminID = adminID;
	}

	public String getAdminName() {
		return adminName;
	}

	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}

	public String getUserid() {
		return userId;
	}

	public String getMsgId() {
		return msgId;
	}

	public void setMsgId(String msgId) {
		this.msgId = msgId;
	}

	public String getCallback() {
		return callback;
	}

	public void setCallback(String callback) {
		this.callback = callback;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public String getNames() {
		return names;
	}

	public void setNames(String names) {
		this.names = names;
	}

	public String getAppdate() {
		return appdate;
	}

	public void setAppdate(String appdate) {
		this.appdate = appdate;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

}
