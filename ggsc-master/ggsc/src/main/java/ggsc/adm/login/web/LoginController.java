package ggsc.adm.login.web;

import java.io.IOException;
import java.io.OutputStream;
import java.net.SocketException;
import java.sql.SQLNonTransientConnectionException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ams.cmm.AMSComm;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.utl.slm.EgovHttpSessionBindingListener;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import ggsc.adm.login.service.LoginService;
import ggsc.adm.login.service.LoginVO;



@Controller
/*@RequestMapping(value = "/gnoincoundb" )*/
public class LoginController {

	@Resource(name = "admLoginService")
	private LoginService loginService;

	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;
	
	@RequestMapping(value = "/login/login.do", method = {RequestMethod.GET , RequestMethod.POST})
	public String loginUsrView(@ModelAttribute("loginVO") EgovMap loginVO, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) {
		/*session.invalidate();*/
		return "login/login";
	}

	@RequestMapping(value = "/login/actionLogin.do", method = {RequestMethod.GET , RequestMethod.POST})
	public String actionLogin(@ModelAttribute("AdmLoginVO") LoginVO loginVO, HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		
		try {
			EgovMap resultVO = loginService.actionLogin(loginVO);
			boolean loginPolicyYn = true;

			if (null != resultVO && null != resultVO.get("userId") && loginPolicyYn) {
				if (resultVO.get("apprvYn").equals("N")) {
					model.addAttribute("message", "아직 승인처리가 되지 않았습니다.");
					return "redirect:/gnoincoundb/login/login.do";
				}

				request.getSession().setAttribute("LoginVO", resultVO);
				EgovHttpSessionBindingListener listener = new EgovHttpSessionBindingListener();
				request.getSession().setAttribute((String) resultVO.get("userId"), listener);
				
				model.addAttribute("userVO", resultVO);
				return "redirect:/gnoincoundb/main.do";
				// return "forward:/main.do";

			} else {
				model.addAttribute("message", "로그인에 실패하였습니다.");
				return "redirect:/gnoincoundb/login/login.do";
			}
		} catch (SocketException err) {
			model.addAttribute("message", "인터넷 연결상태를 확인해주세요.");
			return "redirect:/gnoincoundb/login/login.do";
		} catch ( SQLNonTransientConnectionException err) {
			model.addAttribute("message", "인터넷 연결상태를 확인해주세요.");
			return "redirect:/gnoincoundb/login/login.do";
		}
	}

	@RequestMapping(value = "/login/logout.do", method = {RequestMethod.GET , RequestMethod.POST})
	public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
		return AMSComm.logoutProcBySvNm(request);
	}

	@RequestMapping(value = "/login/actionLogout.do", method = {RequestMethod.GET , RequestMethod.POST})
	public String actionLogout(HttpServletRequest request, HttpServletResponse response, ModelMap model) {

		// request.getSession().setAttribute("LoginVO", null);

		String rtnStr = "<script>";
		rtnStr += "alert('로그아웃 되었습니다.');";
		// rtnStr += "window.open('about:blank','_self').close();";
		rtnStr += "</script>";
		response.setContentType("text/html; charset=UTF-8");
		
		try {
			OutputStream out;
			out = response.getOutputStream();
			out.write(rtnStr.getBytes());
			out.flush();
			out.close();
		} catch (IOException e) {
			utility.func.Logging(this.getClass().getName(), e);
		}
		
		return "redirect:/gnoincoundb/login/login.do";
		
	}

}