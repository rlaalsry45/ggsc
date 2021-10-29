package egovframework.homepage.psyCns.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.homepage.psyCns.service.HomepagePsyCnsService;
import egovframework.homepage.psyCns.service.PsyCnsDocVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
public class HomepagePsyCnsController {
	
	/** homepageJoinService */
	@Resource(name = "homepagePsyCnsService")
	private HomepagePsyCnsService homepagePsyCnsService;
	
	@RequestMapping(value = "/psyCnsList.do")
	public String psyCnsList(HttpServletRequest request, ModelMap model) {
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		if(map == null) {
			model.addAttribute("loginYn", "N");
		} else {
			model.addAttribute("loginYn", "Y");
		}
		
		return "/psyCns/psyCnsList.page";
	}
	
	// DUKE-AD
	@RequestMapping(value = "/psyDukeDoc.do")
	public String psyDukeDoc(PsyCnsDocVO vo, HttpServletRequest request, ModelMap model) {
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		if(map == null) {
			model.addAttribute("loginYn", "N");
		} else {
			model.addAttribute("loginYn", "Y");
		}
		
		/*vo.setCnsleId((String)map.get("userId"));
		vo.setCnsleNm((String)map.get("userNm"));
		vo.setGender((String)map.get("gender"));
		vo.setTelNo((String)map.get("tel"));
		model.addAttribute("vo", vo);*/
		model.addAttribute("map",map);
		return "/psyCns/psyDukeDoc.page";
	}
	
	// DUKE-AD 등록 ajax
	@RequestMapping(value = "/psyDukeDocRegAjax.do")
	public String psyDukeDocAjax(PsyCnsDocVO vo, HttpServletRequest request, ModelMap model){	
		
		// DUKE-AD 등록 ajax
		// homepagePsyCnsService.insertPsyDukeDoc(vo);
		return "jsonView";
	}
	
	// GDS-SI
	@RequestMapping(value = "/psyGdsDoc.do")
	public String psyGdsDoc(PsyCnsDocVO vo, HttpServletRequest request, ModelMap model) {
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		if(map == null) {
			model.addAttribute("loginYn", "N");
		} else {
			model.addAttribute("loginYn", "Y");
		}
		
		/*vo.setCnsleId((String)map.get("userId"));
		vo.setCnsleNm((String)map.get("userNm"));
		vo.setGender((String)map.get("gender"));
		vo.setTelNo((String)map.get("tel"));
		model.addAttribute("vo", vo);*/
		model.addAttribute("map",map);
		
		return "/psyCns/psyGdsDoc.page";
	}
	
	// GDS-SI 등록 ajax
	@RequestMapping(value = "/psyGdsDocRegAjax.do")
	public String psyGdsDocRegAjax(PsyCnsDocVO vo, HttpServletRequest request, ModelMap model){	
		
		// GDS-SI 등록 ajax
		// homepagePsyCnsService.insertPsyGdsDoc(vo);
		return "jsonView";
	}
	
	// 불안척도
	@RequestMapping(value = "/psyAnxiDoc.do")
	public String psyAnxiDoc(PsyCnsDocVO vo, HttpServletRequest request, ModelMap model) {
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		if(map == null) {
			model.addAttribute("loginYn", "N");
		} else {
			model.addAttribute("loginYn", "Y");
		}
		
		/*vo.setCnsleId((String)map.get("userId"));
		vo.setCnsleNm((String)map.get("userNm"));
		vo.setGender((String)map.get("gender"));
		vo.setTelNo((String)map.get("tel"));
		model.addAttribute("vo", vo);*/
		model.addAttribute("map",map);
		
		return "/psyCns/psyAnxiDoc.page";
	}
	
	// 불안척도 등록 ajax
	@RequestMapping(value = "/psyAnxiDocRegAjax.do")
	public String psyAnxiDocRegAjax(PsyCnsDocVO vo, HttpServletRequest request, ModelMap model){	
		
		// 불안척도 등록 ajax
		// homepagePsyCnsService.insertPsyAnxiDoc(vo);
		return "jsonView";
	}
	
	// 대인관계변화척도
	@RequestMapping(value = "/psyPerRelDoc.do")
	public String psyPerRelDoc(PsyCnsDocVO vo, HttpServletRequest request, ModelMap model) {
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		if(map == null) {
			model.addAttribute("loginYn", "N");
		} else {
			model.addAttribute("loginYn", "Y");
		}
		
		/*vo.setCnsleId((String)map.get("userId"));
		vo.setCnsleNm((String)map.get("userNm"));
		vo.setGender((String)map.get("gender"));
		vo.setTelNo((String)map.get("tel"));
		model.addAttribute("vo", vo);*/
		model.addAttribute("map",map);
		
		return "/psyCns/psyPerRelDoc.page";
	}
	
	// 대인관계변화척도 등록 ajax
	@RequestMapping(value = "/psyPerRelDocRegAjax.do")
	public String psyPerRelDocRegAjax(PsyCnsDocVO vo, HttpServletRequest request, ModelMap model){	
		
		// 대인관계변화척도 등록 ajax
		// homepagePsyCnsService.insertPsyPerRelDoc(vo);
		return "jsonView";
	}
	
	// 사별스트레스척도
	@RequestMapping(value = "/psyBereavDoc.do")
	public String psyBereavDoc(PsyCnsDocVO vo, HttpServletRequest request, ModelMap model) {
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		if(map == null) {
			model.addAttribute("loginYn", "N");
		} else {
			model.addAttribute("loginYn", "Y");
		}
		
		/*vo.setCnsleId((String)map.get("userId"));
		vo.setCnsleNm((String)map.get("userNm"));
		vo.setGender((String)map.get("gender"));
		vo.setTelNo((String)map.get("tel"));
		model.addAttribute("vo", vo);*/
		model.addAttribute("map",map);
		
		return "/psyCns/psyBereavDoc.page";
	}
	
	// 사별스트레스척도 등록 ajax
	@RequestMapping(value = "/psyBereavDocRegAjax.do")
	public String psyBereavDocRegAjax(PsyCnsDocVO vo, HttpServletRequest request, ModelMap model){	
		
		// 사별스트레스척도 등록 ajax
		// homepagePsyCnsService.insertPsyBereavDoc(vo);
		return "jsonView";
	}
	
	// 스트레스척도
	@RequestMapping(value = "/psyStressDoc.do")
	public String psyStressDoc(PsyCnsDocVO vo, HttpServletRequest request, ModelMap model) {
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		if(map == null) {
			model.addAttribute("loginYn", "N");
		} else {
			model.addAttribute("loginYn", "Y");
		}
		
		/*vo.setCnsleId((String)map.get("userId"));
		vo.setCnsleNm((String)map.get("userNm"));
		vo.setGender((String)map.get("gender"));
		vo.setTelNo((String)map.get("tel"));
		model.addAttribute("vo", vo);*/
		model.addAttribute("map",map);
		
		return "/psyCns/psyStressDoc.page";
	}
	
	// 스트레스척도 등록 ajax
	@RequestMapping(value = "/psyStressDocRegAjax.do")
	public String psyStressDocRegAjax(PsyCnsDocVO vo, HttpServletRequest request, ModelMap model){	
		
		// 스트레스척도 등록 ajax
		// homepagePsyCnsService.insertPsyBereavDoc(vo);
		return "jsonView";
	}
	
	// 심리검사 Info
	@RequestMapping(value = "/psyInfo.do")
	public String psyInfo(PsyCnsDocVO vo, HttpServletRequest request, ModelMap model) {
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		if(map == null) {
			model.addAttribute("loginYn", "N");
		} else {
			model.addAttribute("loginYn", "Y");
		}
		
		/*vo.setCnsleId((String)map.get("userId"));
		vo.setCnsleNm((String)map.get("userNm"));
		vo.setGender((String)map.get("gender"));
		vo.setTelNo((String)map.get("tel"));
		model.addAttribute("vo", vo);*/
		model.addAttribute("map",map);
		
		return "/psyCns/psyInfo.page";
	}
}