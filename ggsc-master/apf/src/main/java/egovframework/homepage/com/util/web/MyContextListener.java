package egovframework.homepage.com.util.web;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class MyContextListener implements ServletContextListener {
	
	private SSHConnection sshConnection;

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		System.out.println("init start!");
		
		/*if(func.useSSH) {
		}*/
			try {
				sshConnection = new SSHConnection();
			}catch(Exception e) {
				utility.func.Logging(this.getClass().getName(), e);
				
	
			}
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		System.out.println("init destory!");
		sshConnection.closeSSH();
	}

}
