package ams.adm.sms;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ams.adm.sms.SmsServiceImpl;
import ams.adm.sms.SmsVO;

import ams.cmm.FileController;



@Controller

public class SmsController {
	
	
	@Resource(name = "smsService")
	private SmsServiceImpl smsService;


	
	
	
	@RequestMapping(value = "/smsList.do", method = RequestMethod.GET)
	public String smsList(SmsVO vo, HttpServletRequest request, ModelMap model){	
		model.addAttribute("vo", vo);
		return "adm/sms/smsList.main";
	}

	@RequestMapping(value = "/smsDtl.do", method = RequestMethod.GET)
	public String smsDtl(SmsVO vo, HttpServletRequest request, ModelMap model){
		model.addAttribute("vo", vo);
		return "adm/sms/smsDtl.main";
	}

	@RequestMapping(value = "/smsListAjax.do", method = RequestMethod.POST)
	public String smsListAjax( SmsVO vo , HttpServletRequest request , ModelMap model ) {
		model.addAttribute("list", smsService.smsList(vo) );
		vo.setRowsCnt( smsService.smsListCnt(vo) ) ;
		model.addAttribute("vo", vo);
		return "jsonView";
	}
	
	@RequestMapping(value = "/smsDtlAjax.do", method = RequestMethod.POST)
	public String smsDtlAjax(SmsVO vo, HttpServletRequest request, ModelMap model){
		model.addAttribute("list", smsService.smsDtl(vo) );
		return "jsonView";
	}

	@RequestMapping(value = "/smsIns.do", method = RequestMethod.POST)
	public String smsIns(HttpServletRequest request, ModelMap model, @ModelAttribute("smsVO") SmsVO vo ){

		smsService.insSms(vo);
		model.addAttribute("vo", vo);
		model.addAttribute("beforeProcess", "save");
		return "adm/sms/smsList.main" ;
	}
	
	@RequestMapping(value = "/smsUpd.do", method = RequestMethod.POST)
	public String smsUpd(HttpServletRequest request, ModelMap model, @ModelAttribute("smsVO") SmsVO vo ){
	
		smsService.updSms(vo);
		model.addAttribute("vo", vo);
		model.addAttribute("beforeProcess", "save");
		return "adm/sms/smsList.main" ;
	}
	
	@RequestMapping(value = "/smsDel.do", method = RequestMethod.POST)
	public String smsDel(HttpServletRequest request, ModelMap model, @ModelAttribute("smsVO") SmsVO vo ){
		smsService.delSms(vo);
		model.addAttribute("vo", vo);
		model.addAttribute("beforeProcess", "del");
		return "adm/sms/smsList.main" ;
	}
	
	
	
	
	
	



//			EgovMap loginVO = null;
//			if (request.getSession().getAttribute("LoginVO") != null) {
//				loginVO = (EgovMap) request.getSession()
//						.getAttribute("LoginVO");
//				model.addAttribute("smsVO", loginVO);
//			} else {
//				return AMSComm.logoutProcBySvNm(request);
//			}



}
