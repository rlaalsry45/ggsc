package egovframework.homepage.com.util.web;

import java.util.Properties;

import com.jcraft.jsch.Channel;
import com.jcraft.jsch.ChannelExec;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.Session;

public class SSHConnection {

	private final static String HOST = "10.30.1.30";
	private final static Integer PORT = 2102; //기본포트는 22
	private final static String SSH_USER = "root"; //ex) root
	private final static String SSH_PW = "ggscnoin#!123"; //ex) 1234
	
	private Session session;
	
	public void closeSSH() {
		session.disconnect();
	}
	
	public SSHConnection() {
		try {
			System.out.println("SSH START");
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
			session.setPortForwardingL(3316, "127.0.0.1", 3308); //127.0.0.1/3316으로 접근한 포트를 연결HOST/3306으로 포트포워딩
			
		}catch(Exception e) {
			utility.func.Logging(this.getClass().getName(), e);
		}
	}
	
}
