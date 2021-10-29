package egovframework.homepage.com.util.service.impl;

import java.util.Date;
import java.util.Properties;

import javax.annotation.Resource;
import javax.mail.Authenticator;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.homepage.com.util.service.MailSendService;
import egovframework.homepage.com.util.service.MailSendVO;
import egovframework.homepage.com.util.service.impl.MailSendMapper;
import egovframework.homepage.com.util.service.impl.MailSendServiceImpl;
import egovframework.homepage.com.util.web.MyAuthentication;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("mailSendService")
public class MailSendServiceImpl extends EgovAbstractServiceImpl implements MailSendService {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(MailSendServiceImpl.class);

	@Resource(name = "mailSendMapper")
	private MailSendMapper mailSendMapper;

	// 메일 등록
	public void insertMailSend(MailSendVO vo) {
		System.out.println("isertMailSend 영역 start @@@@@@@@@@@@@@@@@@@@@@"+vo);
		mailSend(vo);
	}
	
	public void mailSend(MailSendVO vo) {

//		String title = request.getParameter("mTitle") == null ? "" : request.getParameter("mTitle");
//		String content = request.getParameter("mContent") == null ? "" : request.getParameter("mContent");
//		String filePath = request.getParameter("filePath") == null ? "" : request.getParameter("filePath");
		
		Properties p = System.getProperties();
		p.put("mail.smtp.starttls.enable", "true"); 	// gmail은 무조건 true 고정
		p.put("mail.smtp.host", "smtp.gmail.com");		// smtp 서버 주소
		p.put("mail.smtp.auth","true");    				// gmail은 무조건 true 고정
		p.put("mail.smtp.port", "587"); 				// gmail 포트
		  
		Authenticator auth = new MyAuthentication();
		
		//session 생성 및  MimeMessage생성
		Session session = Session.getDefaultInstance(p, auth);
//		Session session = Session.getInstance(p, new javax.mail.Authenticator() {
//        protected PasswordAuthentication getPasswordAuthentication() {
//            return new PasswordAuthentication("test.test.910514@gmail.com", "dldudfhr!234");
//        }
//
//        });
		MimeMessage msg = new MimeMessage(session);
		
		try{
			//편지보낸시간
			msg.setSentDate(new Date());
			
			InternetAddress from = new InternetAddress() ;
			
			
			from = new InternetAddress("abbgnogergerg@gmail.com");
//			from = new InternetAddress(vo.getEmail());
			
			// 이메일 발신자
			msg.setFrom(from);
			
			
			// 이메일 수신자
			//InternetAddress to = new InternetAddress("gongbba@naver.com");
			InternetAddress to = new InternetAddress(vo.getSendList());
//			InternetAddress to = new InternetAddress(vo.getRcpt());
			msg.setRecipient(Message.RecipientType.TO, to);
			
			// 이메일 제목
			//msg.setSubject(title, "UTF-8");
			msg.setSubject(vo.getTitle(), "UTF-8");
			
			/*
			MimeMultipart multipart=new MimeMultipart();
			

			// part1에 본문을 설정

			MimeBodyPart bodyPart1=new MimeBodyPart();

			bodyPart1.setText("이 메일에는 이미지 파일이 첨부되어 있습니다.", "UTF-8");

			multipart.addBodyPart(bodyPart1); // Multi-part에 part1을 추가


			// part2에 이미지 파일을 설정

			MimeBodyPart bodyPart2=new MimeBodyPart();

			DataSource dataSource=new FileDataSource("D:\\proj\\ggsc\\src\\main\\webapp\\images\\ams_w.png");

			DataHandler dataHandler=new DataHandler(dataSource);

			bodyPart2.setDataHandler(dataHandler);

			multipart.addBodyPart(bodyPart2); // Multi-part에 part2를 추가


			// 메일에 Multi-part를 설정

			msg.setContent(multipart);
			 */		
			
			MimeMultipart multipart = new MimeMultipart("related");
			BodyPart messageBodyPart = new MimeBodyPart();
			String htmlText = vo.getCntn();
			messageBodyPart.setContent(htmlText, "text/html; charset=UTF-8");
			
			multipart.addBodyPart(messageBodyPart);
			
//			messageBodyPart = new MimeBodyPart();
//			//System.out.println(request.getSession().getServletContext().getRealPath("/images/sign/0fd8e1fb-8649-43ef-bb07-6de2e3663d91_img.png"));
//			//DataSource fds = new FileDataSource(request.getSession().getServletContext().getRealPath("/images/down.png"));	
//			DataSource fds = new FileDataSource("C:\\Users\\gong\\Desktop\\test.jpg");	
//			
//			messageBodyPart.setDataHandler(new DataHandler(fds));
//			messageBodyPart.setHeader("Content-ID", "<image>");
//			
//			multipart.addBodyPart(messageBodyPart);
			
			msg.setContent(multipart);
			// 이메일 내용 
			//msg.setContent(multi);
			//msg.setContent(content, "UTF-8");
			//msg.setText("<img src='http://192.168.0.54:8080/sign/0fd8e1fb-8649-43ef-bb07-6de2e3663d91_img.png' />");
			//msg.setContent("<img src='http://192.168.0.54:8080/sign/0fd8e1fb-8649-43ef-bb07-6de2e3663d91_img.png' /><br><p style='font: bold;'>테스트테스트</p>", "text/html; UTF-8");
			// 이메일 헤더 
			//msg.setHeader("content-Type", "text/html");
			
			//메일보내기
			javax.mail.Transport.send(msg);
			
			if(vo.getSendGb().equals("P")) {
				updateUserPassword(vo);
			}
			
		}catch (AddressException addr_e) {
			utility.func.Logging(this.getClass().getName(), addr_e);			
		}catch (MessagingException msg_e) {
			utility.func.Logging(this.getClass().getName(), msg_e);			
		}
	}	
	
	// 회원 임시비밀번호로 변경
	public void updateUserPassword(MailSendVO vo) {
		System.out.println("pw update 구간 : "+vo);
		mailSendMapper.updateUserPassword(vo);
	}
	
}