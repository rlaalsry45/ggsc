package egovframework.homepage.join.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.homepage.join.service.HomepageJoinService;
import egovframework.homepage.join.service.JoinVO;
import egovframework.homepage.main.service.CenterVO;
import egovframework.homepage.main.service.CommonVO;
import egovframework.homepage.main.service.HomepageMainService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
public class HomepageJoinController {
	
	/** homepageMainService */
	@Resource(name = "homepageJoinService")
	private HomepageJoinService homepageJoinService;
	
	@Resource(name = "homepageMainService")
	private HomepageMainService homepageMainService;
	
	@RequestMapping(value = "/agree.do")
	public String agree(HttpServletRequest request, ModelMap model) {
		
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		if(map == null) {
			model.addAttribute("loginYn", "N");
		} else {
			model.addAttribute("loginYn", "Y");
		}
		
		return "/join/agree.page";
	}
	
	@RequestMapping(value = "/join.do")
	public String join(HttpServletRequest request, ModelMap model) {
		
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		if(map == null) {
			model.addAttribute("loginYn", "N");
		} else {
			model.addAttribute("loginYn", "Y");
		}
		
		// 상담구분 코드
		CommonVO param = new CommonVO();
		param.setHclassCd("G089");
		List<EgovMap> sigunCdList = homepageMainService.getGroupMngDtlMList(param);
		model.addAttribute("sigunCdList", sigunCdList);
		
		param.setHclassCd("G71");
		List<EgovMap> zoneList = homepageMainService.getGroupMngDtlMList(param);
		model.addAttribute("zoneList", zoneList);

		CenterVO centerVO = new CenterVO();
		List<EgovMap> cnsCenterList = homepageMainService.getCenterManageList(centerVO);
		model.addAttribute("cnsCenterList", cnsCenterList);
		
		return "/join/join.page";
	}
	
	@RequestMapping(value = "/joinReg.do")
	public String joinReg(JoinVO vo, HttpServletRequest request, ModelMap model) {
		// 회원가입 등록
		homepageJoinService.insertJoinReg(vo);
		return "redirect:/gnoincoun/login.do";
	}
	
	@RequestMapping(value = "/userIdCheck.do")
	public String userIdCheck(HttpServletRequest request, ModelMap model){
		
		String userId = request.getParameter("userId") == null ? "" : request.getParameter("userId");
		
		// 아이디 중복확인
		int idYn = homepageJoinService.getIdCheck(userId);
		String idCheck = "";
		String msg = "";
		if(idYn > 0){
			idCheck = "N";
			msg = "이미 가입된 ID 입니다.";
		}else{
			idCheck = "Y";
			msg = "사용 가능한 ID 입니다.";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("idCheck", idCheck);
		return "jsonView";
	}
	
	@RequestMapping(value = "/testjsp.do")
	public String testjsp(HttpServletRequest request, ModelMap model) {
		
		
		return "/join/testjsp.page";
	}
	
	
}