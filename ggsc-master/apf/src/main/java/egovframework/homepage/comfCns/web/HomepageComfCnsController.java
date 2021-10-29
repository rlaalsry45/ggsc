package egovframework.homepage.comfCns.web;

import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.homepage.com.util.service.ComCodeService;
import egovframework.homepage.comfCns.service.AddComfCnsVO;
import egovframework.homepage.comfCns.service.ComfCnsVO;
import egovframework.homepage.comfCns.service.HomepageComfCnsService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller

public class HomepageComfCnsController {
	
	/** homepageComfCnsService */
	@Resource(name = "homepageComfCnsService")
	private HomepageComfCnsService homepageComfCnsService;
	
	/** ComCodeService */
	@Resource(name = "comCodeService")
	private ComCodeService comCodeService;
	
	@RequestMapping(value = "/comfCnsWrite.do")
	public String comfCnsWrite(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		if(map == null) {
			model.addAttribute("loginYn", "N");	
			response.setContentType("text/html; charset=UTF-8");		 
			PrintWriter out = response.getWriter();		 
			out.println("<script>alert('로그인 후에 상담신청을 할 수 있습니다.');</script>");
			out.flush();
			return "/main/login.page";
		} else {
			model.addAttribute("loginYn", "Y");
		}
		
		// 상담신청구분
		model.addAttribute("cnsReqCode", comCodeService.selectCnsReqList());
		// 센터구분
		model.addAttribute("centerGbCode", comCodeService.selectCenterGbList());
		// 권역구분
		model.addAttribute("zoneGbCode", comCodeService.selectZoneGbList());
		// 권역구분
		model.addAttribute("cnsGbCode", comCodeService.selectCnsGbList());
		// 학력
		model.addAttribute("eduCode", comCodeService.selectEduList());
		// 주거형태
		model.addAttribute("livgCode", comCodeService.selectLivgList());
		// 주택형태
		model.addAttribute("houseCode", comCodeService.selectHouseList());
		// 동거형태
		model.addAttribute("liveCode", comCodeService.selectLiveList());
		// 상담경위
		model.addAttribute("cnsDtlCode", comCodeService.selectCnsDtlList());
		// 노인과의 관계
		model.addAttribute("olderRelCode", comCodeService.selectOlderRelList());
		// 결혼상태
		model.addAttribute("merrStatCode", comCodeService.selectMerrStatList());
		// 주요문제
		model.addAttribute("majorProbCode", comCodeService.selectMajorProbList());
		// 지역구분
		model.addAttribute("localGbCode", comCodeService.selectLocalGbList());	
		// 주호소문제
		model.addAttribute("majorApplCode", comCodeService.selectMajorApplList());
		
		model.addAttribute("map",map);
		
		return "/comfCns/comfCnsWrite.page";
	}
	
	@RequestMapping(value = "/cnsReserve.do")
	public String cnsReserve2(HttpServletRequest request, ModelMap model) {
		
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		if(map == null) {
			model.addAttribute("loginYn", "N");
		} else {
			model.addAttribute("loginYn", "Y");
		}
		
		return "/comfCns/cnsReserve.page";
	}
	
	// 맘편한 상담 신청 등록
	@RequestMapping(value = "/comfCnsReg.do")
	public String comfCnsReg(ComfCnsVO vo, HttpServletRequest request, ModelMap model) throws Exception {
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		vo.setUserId((String)map.get("userId"));
		
		// 맘편한 상담 신청 등록
		homepageComfCnsService.insertComfCnsReg(vo);
		
		return "redirect:/gnoincoun/homepageMainList.do";
	}
	
	@RequestMapping(value = "/addComfCnsInsert.do")
	public String addComfCnsInsert(HttpServletRequest request, ModelMap model) throws Exception {
		
		// 학력
		model.addAttribute("eduCode", comCodeService.selectEduList());
		// 주거형태
		model.addAttribute("livgCode", comCodeService.selectLivgList());
		// 주택형태
		model.addAttribute("houseCode", comCodeService.selectHouseList());
		// 동거형태
		model.addAttribute("liveCode", comCodeService.selectLiveList());
		// 상담자구분
		model.addAttribute("cnsrGbCode", comCodeService.selectCnsrGbList());
		// 상담경위
		model.addAttribute("cnsDtlCode", comCodeService.selectCnsDtlList());
		// 노인과의 관계
		model.addAttribute("olderRelCode", comCodeService.selectOlderRelList());
		// 결혼상태
		model.addAttribute("merrStatCode", comCodeService.selectMerrStatList());
		// 주요문제
		model.addAttribute("majorProbCode", comCodeService.selectMajorProbList());
				
		return "homepage/comfCns/addComfCnsInsert";
	}
	
	@RequestMapping(value = "/addComfCnsReg.do")
	public String addComfCnsReg(AddComfCnsVO vo, HttpServletRequest request, ModelMap model) throws Exception {
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		vo.setCnsleId((String)map.get("userId"));
		
		// 상담신청 등록(추가자료입력)
		homepageComfCnsService.insertAddComfCnsReg(vo);
		
		return "redirect:/gnoincoun/homepageMainList.do";
	}
	
}