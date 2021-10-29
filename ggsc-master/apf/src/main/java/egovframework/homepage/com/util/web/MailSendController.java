package egovframework.homepage.com.util.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.homepage.com.util.service.MailSendService;
import egovframework.homepage.com.util.service.MailSendVO;

@Controller
public class MailSendController {

	@Resource(name = "mailSendService")
	private MailSendService mailSendService;
	
	@RequestMapping(value = "/mailSend.do")
	public String mailSend(MailSendVO vo, ModelMap model, HttpServletRequest request){
		try {
			// 메일 전송 등록
			mailSendService.insertMailSend(vo);
			return "redirect:/gnoincoun/login.do";
		} catch (Exception e) {
			utility.func.Logging(this.getClass().getName(), e);
			return null;

		}
	}
}
