package ggsc.com.util.web;

import java.io.IOException;
import java.util.Properties;

import com.jcraft.jsch.Channel;
import com.jcraft.jsch.ChannelExec;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.JSchException;
import com.jcraft.jsch.Session;

import egovframework.com.cmm.service.EgovProperties;

public class SSHConnection {

	private final static String HOST = EgovProperties.getProperty("SSH.Host");
	private final static Integer PORT = Integer.parseInt(EgovProperties.getProperty("SSH.Port")); 
	private final static String SSH_USER = EgovProperties.getProperty("SSH.UserName");
	private final static String SSH_PW = EgovProperties.getProperty("SSH.Password"); 
	
	private Session session;
	
	public void closeSSH() {
		session.disconnect();
	}
	
	public SSHConnection() {
		
		try {
			Properties config = new Properties();
			config.put("StrictHostKeyChecking", "no");
			JSch jsch = new JSch();
			session = jsch.getSession(SSH_USER, HOST, PORT);
			session.setPassword(SSH_PW);
			session.setConfig(config);
			session.connect();
			System.out.println("SSH CONNECT");
			
			Channel channel = session.openChannel("exec");
			ChannelExec channelExec = (ChannelExec) channel;
			channelExec.setPty(true);
			channelExec.setCommand("su ggsc");
			channel.connect();
			
			System.out.println("GGSC LOGIN");
			session.setPortForwardingL(Integer.parseInt(EgovProperties.getProperty("SSH.PortForwarding")), "127.0.0.1", Integer.parseInt(EgovProperties.getProperty("SSH.ServerPort"))); 
			//127.0.0.1/3316으로 접근한 포트를 연결HOST/3306으로 포트포워딩
		} catch (JSchException e) {
			System.out.println("SSH error");
			utility.func.Logging(this.getClass().getName(), e);
		}
	}
	
}
