package ams.adm.auth;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ams.adm.auth.AuthServiceImpl;
import ams.adm.auth.AuthVO;

@Controller
public class AuthController {
 
	@Resource(name = "authService")
	private AuthServiceImpl authService;
	




	
	

	
	@RequestMapping(value = "/authListComboAjax.do", method = RequestMethod.POST)
	public String authListComboAjax(AuthVO vo, HttpServletRequest request, ModelMap model){
		model.addAttribute("list", authService.authListCombo(vo));
		return "jsonView";
	}
	
	@RequestMapping(value = "/authGrpListComboAjax.do", method = RequestMethod.POST)
	public String authGrpListComboAjax(AuthVO vo, HttpServletRequest request, ModelMap model){
		model.addAttribute("list", authService.authGrpListCombo(vo));
		return "jsonView";
	}
	
	
	
	

	
	
	
	
	@RequestMapping(value = "/authList.do", method = RequestMethod.GET)
	public String authList(AuthVO vo, HttpServletRequest request, ModelMap model){	
		model.addAttribute("vo", vo);
		return "adm/auth/authList.main";
	}

	@RequestMapping(value = "/authDtl.do", method = RequestMethod.GET)
	public String authDtl(AuthVO vo, HttpServletRequest request, ModelMap model){	
		model.addAttribute("vo", vo);
		return "adm/auth/authDtl.main";
	}

	@RequestMapping(value = "/authListAjax.do", method = RequestMethod.POST )
	public String authListAjax( AuthVO vo , HttpServletRequest request , ModelMap model ) {
		model.addAttribute("list", authService.authList(vo) );
		vo.setRowsCnt( authService.authListCnt(vo) ) ;
		model.addAttribute("vo", vo);
		return "jsonView";
	}
	
	@RequestMapping(value = "/authDtlAjax.do", method = RequestMethod.POST)
	public String authDtlAjax(AuthVO vo, HttpServletRequest request, ModelMap model){
		model.addAttribute("list", authService.authDtl(vo) );
		return "jsonView";
	}

	@RequestMapping(value = "/authDelAjax.do", method = RequestMethod.POST)
	public String authDelAjax(HttpServletRequest request, ModelMap model, @ModelAttribute("authVO") AuthVO vo){
		authService.delAuth(vo);
		return "jsonView";
	}

	@RequestMapping(value = "/authInsAjax.do", method = RequestMethod.POST)
	public String authInsAjax(HttpServletRequest request, ModelMap model, @ModelAttribute("authVO") AuthVO vo ){
		authService.insAuth(vo);
		return "jsonView";
	}
	
	@RequestMapping(value = "/authUpdAjax.do", method = RequestMethod.POST)
	public String authUpdAjax(HttpServletRequest request, ModelMap model, @ModelAttribute("authVO") AuthVO vo ){
		authService.updAuth(vo);
		return "jsonView";
	}
	
	
	

	
	
	
	
	

	@RequestMapping(value = "/authGrpList.do", method = RequestMethod.GET)
	public String authGrpList(AuthVO vo, HttpServletRequest request, ModelMap model){	
		model.addAttribute("vo", vo);
		return "adm/auth/authGrpList.main";
	}

	@RequestMapping(value = "/authGrpDtl.do", method = RequestMethod.GET)
	public String authGrpDtl(AuthVO vo, HttpServletRequest request, ModelMap model){	
		model.addAttribute("vo", vo);
		return "adm/auth/authGrpDtl.main";
	}

	@RequestMapping(value = "/authGrpListAjax.do", method = RequestMethod.POST)
	public String authGrpListAjax( AuthVO vo , HttpServletRequest request , ModelMap model ) {
		model.addAttribute("list", authService.authGrpList(vo) );
		vo.setRowsCnt( authService.authGrpListCnt(vo) ) ;
		model.addAttribute("vo", vo);
		return "jsonView";
	}
	
	@RequestMapping(value = "/authGrpDtlAjax.do", method = RequestMethod.POST)
	public String authGrpDtlAjax(AuthVO vo, HttpServletRequest request, ModelMap model){
		model.addAttribute("list", authService.authGrpDtl(vo) );
		return "jsonView";
	}

	@RequestMapping(value = "/authGrpDelAjax.do", method = RequestMethod.POST)
	public String authGrpDelAjax(HttpServletRequest request, ModelMap model, @ModelAttribute("authVO") AuthVO vo){
		authService.delAuthGrp(vo);
		return "jsonView";
	}

	@RequestMapping(value = "/authGrpInsAjax.do", method = RequestMethod.POST)
	public String authGrpInsAjax(HttpServletRequest request, ModelMap model, @ModelAttribute("authVO") AuthVO vo ){
		authService.insAuthGrp(vo);
		return "jsonView";
	}
	
	@RequestMapping(value = "/authGrpUpdAjax.do", method = RequestMethod.POST)
	public String authGrpUpdAjax(HttpServletRequest request, ModelMap model, @ModelAttribute("authVO") AuthVO vo ){
		System.out.println( "ZZZZZZZZ"+vo.getAuthGrpNo() );
		authService.updAuthGrp(vo);
		return "jsonView";
	}
	
	
	

	
	
	
	


}