package ggsc.com.util.web;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import com.jcraft.jsch.JSchException;

import utility.func;

@WebListener
public class MyContextListener implements ServletContextListener {
	
	private SSHConnection sshConnection;
	@Override
	public void contextInitialized(ServletContextEvent sce) {
		if(func.useSSH) {
			System.out.println("init start!");
			sshConnection = new SSHConnection();
		}
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		System.out.println("init destory!");
		sshConnection.closeSSH();
	}

}
