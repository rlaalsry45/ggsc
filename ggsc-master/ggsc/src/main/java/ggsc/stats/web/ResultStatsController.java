package ggsc.stats.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import egovframework.rte.psl.dataaccess.util.EgovMap;
import ggsc.cnsmng.service.CounselMngService;
import ggsc.cnsmng.service.PsyCnsVO;
import ggsc.cnsr.service.AdminManageService;
import ggsc.cnsr.service.CenterVO;
import ggsc.cnsr.service.GroupVO;
import ggsc.com.util.service.ComCodeService;
import ggsc.stats.service.ResultReportVO;
import ggsc.stats.service.ResultStatsService;


@Controller

public class ResultStatsController {

	@Resource(name = "ResultStatsService")
	private ResultStatsService resultStatsService;

	@Resource(name = "counselMngService")
	private CounselMngService counselMngService;

	@Resource(name = "AdminManageService")
	private AdminManageService adminManageService;

	@Resource(name = "comCodeService")
	private ComCodeService comCodeService;

	@RequestMapping(value = "/resultReportList.do", method = RequestMethod.GET)
	public String resultReportList(ResultReportVO vo, HttpServletRequest request, ModelMap model) {
		// 권한 관리 시작
		EgovMap loginVo = (EgovMap) request.getSession().getAttribute("LoginVO");

		int userAuth, userCenterGb;
		try {
			userAuth = Integer.parseInt(loginVo.get("authCd").toString());
			userCenterGb = Integer.parseInt(loginVo.get("centerGb").toString());
			if (userAuth == 0)
				userAuth = 10;
		} catch (NumberFormatException err) {
			userAuth = 10;
			userCenterGb = 0;
		} catch (NullPointerException err) {
			userAuth = 10;
			userCenterGb = 0;
		}

		if (userAuth > 1) { // 센터 검색 권한이 없으면
			vo.setschCenterGb(Integer.toString(userCenterGb));
		}
		model.addAttribute("authCd", userAuth);
		model.addAttribute("vo", vo);

		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");

		GroupVO groupVo = new GroupVO();
		groupVo.setHclassCd("G15");
		CenterVO centerVO = new CenterVO();

		List<EgovMap> cnsGbList = adminManageService.getGroupMngDtlMList(groupVo);
		List<EgovMap> cnsCenterList = adminManageService.getCenterManageList(centerVO);
		groupVo.setHclassCd("G19");
		List<EgovMap> cnsrGbList = adminManageService.getGroupMngDtlMList(groupVo);

		model.addAttribute("mnuCd", mnuCd);
		model.addAttribute("cnsGbList", cnsGbList);
		model.addAttribute("cnsCenterList", cnsCenterList);
		model.addAttribute("cnsrGbList", cnsrGbList);

		return "stats/resultReport_list.main";
	}

	@RequestMapping(value = "/resultReportList_ajax.do", method = RequestMethod.POST)
	public String resultReportList_ajax(HttpServletRequest request, ModelMap model, ResultReportVO vo) {
		// 권한 관리 시작
		EgovMap loginVo = (EgovMap) request.getSession().getAttribute("LoginVO");

		int userAuth, userCenterGb;
		try {
			userAuth = Integer.parseInt(loginVo.get("authCd").toString());
			userCenterGb = Integer.parseInt(loginVo.get("centerGb").toString());
			if (userAuth == 0)
				userAuth = 10;
		} catch (NumberFormatException err) {
			userAuth = 10;
			userCenterGb = 0;
		} catch (NullPointerException err) {
			userAuth = 10;
			userCenterGb = 0;
		}
		// getResultReportListExcel
		List<EgovMap> list = null;
		List<EgovMap> list2 = null;
		// Map<String,Object> map = new HashMap<String, Object>();
		Map<String,List<EgovMap>> map = new HashMap<String, List<EgovMap>>();
		if (userAuth > 1) { // 센터 검색 권한이 없으면
			vo.setschCenterGb(Integer.toString(userCenterGb));
		} else {
			/*for(int i=1; i<60; i++) {
				vo.setCenterGb(String.valueOf(i));
				list2 = resultStatsService.getResultReportCenterList(vo);
				// map.put("centerList", (EgovMap)list2);
				map.put("centerList"+i, (List<EgovMap>)list2);
			}		
				
			// System.out.println("centerList 값 : "+map2.get("centerList5"));
			model.addAttribute("map", map);*/
		}
		list = resultStatsService.getResultReportList(vo);
		// List<EgovMap> list = resultStatsService.getResultReportList(vo);
		model.addAttribute("list", list);
		return "jsonView";
	}
	
	// main 화면 상담현황 값
	@RequestMapping(value = "/mianCnsResult_ajax.do", method = RequestMethod.POST)
	public String mianCnsResult_ajax(HttpServletRequest request, ModelMap model, ResultReportVO vo) {
		// 권한 관리 시작
		EgovMap loginVo = (EgovMap) request.getSession().getAttribute("LoginVO");

		int userAuth, userCenterGb;
		try {
			userAuth = Integer.parseInt(loginVo.get("authCd").toString());
			userCenterGb = Integer.parseInt(loginVo.get("centerGb").toString());
			if (userAuth == 0)
				userAuth = 10;
		} catch (NumberFormatException err) {
			userAuth = 10;
			userCenterGb = 0;
		} catch (NullPointerException err) {
			userAuth = 10;
			userCenterGb = 0;
		}
		// getResultReportListExcel
		List<EgovMap> list = null;
		if (userAuth > 1) { // 센터 검색 권한이 없으면
			vo.setschCenterGb(Integer.toString(userCenterGb));
		} 
		vo.setSchCnsrId(loginVo.get("userId").toString());
		list = resultStatsService.getMianCnsResult(vo);
		model.addAttribute("list", list);
		return "jsonView";
	}

	@RequestMapping(value = "/counselorResultList.do", method = RequestMethod.GET)
	public String counselorResultList(ResultReportVO vo, HttpServletRequest request, ModelMap model) {
		// 권한 관리 시작
		EgovMap loginVo = (EgovMap) request.getSession().getAttribute("LoginVO");

		int userAuth, userCenterGb;
		try {
			userAuth = Integer.parseInt(loginVo.get("authCd").toString());
			userCenterGb = Integer.parseInt(loginVo.get("centerGb").toString());
			if (userAuth == 0)
				userAuth = 10;
		} catch (NumberFormatException err) {
			userAuth = 10;
			userCenterGb = 0;
		} catch (NullPointerException err) {
			userAuth = 10;
			userCenterGb = 0;
		}

		if (userAuth > 1) { // 센터 검색 권한이 없으면
			vo.setschCenterGb(Integer.toString(userCenterGb));
		}
		model.addAttribute("authCd", userAuth);
		model.addAttribute("vo", vo);

		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");

		GroupVO groupVo = new GroupVO();
		groupVo.setHclassCd("G15");
		CenterVO centerVO = new CenterVO();

		List<EgovMap> cnsGbList = adminManageService.getGroupMngDtlMList(groupVo);
		List<EgovMap> cnsCenterList = adminManageService.getCenterManageList(centerVO);
		groupVo.setHclassCd("G19");
		List<EgovMap> cnsrGbList = adminManageService.getGroupMngDtlMList(groupVo);

		model.addAttribute("mnuCd", mnuCd);
		model.addAttribute("cnsGbList", cnsGbList);
		model.addAttribute("cnsCenterList", cnsCenterList);
		model.addAttribute("cnsrGbList", cnsrGbList);

		return "stats/counselorResult_list.main";
	}

	@RequestMapping(value = "/counselorResultList_ajax.do", method = RequestMethod.POST)
	public String counselorResultList_ajax(HttpServletRequest request, ModelMap model, ResultReportVO vo) {
		// 권한 관리 시작
		EgovMap loginVo = (EgovMap) request.getSession().getAttribute("LoginVO");

		int userAuth, userCenterGb;
		try {
			userAuth = Integer.parseInt(loginVo.get("authCd").toString());
			userCenterGb = Integer.parseInt(loginVo.get("centerGb").toString());
			if (userAuth == 0)
				userAuth = 10;
		} catch (NumberFormatException err) {
			userAuth = 10;
			userCenterGb = 0;
		} catch (NullPointerException err) {
			userAuth = 10;
			userCenterGb = 0;
		}

		if (userAuth > 1) { // 센터 검색 권한이 없으면
			vo.setschCenterGb(Integer.toString(userCenterGb));
		}

		List<EgovMap> list = resultStatsService.getCounselorResultList(vo);
		model.addAttribute("list", list);
		return "jsonView";
	}

	@RequestMapping(value = "/educationResultList.do", method = RequestMethod.GET)
	public String educationResultList(ResultReportVO vo, HttpServletRequest request, ModelMap model) {
		// 권한 관리 시작
		EgovMap loginVo = (EgovMap) request.getSession().getAttribute("LoginVO");

		int userAuth, userCenterGb;
		try {
			userAuth = Integer.parseInt(loginVo.get("authCd").toString());
			userCenterGb = Integer.parseInt(loginVo.get("centerGb").toString());
			if (userAuth == 0)
				userAuth = 10;
		} catch (NumberFormatException err) {
			userAuth = 10;
			userCenterGb = 0;
		} catch (NullPointerException err) {
			userAuth = 10;
			userCenterGb = 0;
		}

		if (userAuth > 1) { // 센터 검색 권한이 없으면
			vo.setschCenterGb(Integer.toString(userCenterGb));
		}
		model.addAttribute("authCd", userAuth);
		model.addAttribute("vo", vo);

		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");

		GroupVO groupVo = new GroupVO();
		groupVo.setHclassCd("G15");
		CenterVO centerVO = new CenterVO();

		List<EgovMap> cnsGbList = adminManageService.getGroupMngDtlMList(groupVo);
		List<EgovMap> cnsCenterList = adminManageService.getCenterManageList(centerVO);
		groupVo.setHclassCd("G19");
		List<EgovMap> cnsrGbList = adminManageService.getGroupMngDtlMList(groupVo);

		model.addAttribute("mnuCd", mnuCd);
		model.addAttribute("cnsGbList", cnsGbList);
		model.addAttribute("cnsCenterList", cnsCenterList);
		model.addAttribute("cnsrGbList", cnsrGbList);

		return "stats/educationResult_list.main";
	}

	@RequestMapping(value = "/educationResultList_ajax.do", method = RequestMethod.POST)
	public String educationResultList_ajax(HttpServletRequest request, ModelMap model, ResultReportVO vo) {
		// 권한 관리 시작
		EgovMap loginVo = (EgovMap) request.getSession().getAttribute("LoginVO");

		int userAuth, userCenterGb;
		try {
			userAuth = Integer.parseInt(loginVo.get("authCd").toString());
			userCenterGb = Integer.parseInt(loginVo.get("centerGb").toString());
			if (userAuth == 0)
				userAuth = 10;
		} catch (NumberFormatException err) {
			userAuth = 10;
			userCenterGb = 0;
		} catch (NullPointerException err) {
			userAuth = 10;
			userCenterGb = 0;
		}

		if (userAuth > 1) { // 센터 검색 권한이 없으면
			vo.setschCenterGb(Integer.toString(userCenterGb));
		}

		List<EgovMap> list = resultStatsService.getEducationResultList(vo);
		model.addAttribute("list", list);
		return "jsonView";
	}

	@RequestMapping(value = "/promotionResultList.do", method = RequestMethod.GET)
	public String promotionResultList(PsyCnsVO vo, HttpServletRequest request, ModelMap model) {
		// 권한 관리 시작
		EgovMap loginVo = (EgovMap) request.getSession().getAttribute("LoginVO");

		int userAuth, userCenterGb;
		try {
			userAuth = Integer.parseInt(loginVo.get("authCd").toString());
			userCenterGb = Integer.parseInt(loginVo.get("centerGb").toString());
			if (userAuth == 0)
				userAuth = 10;
		} catch (NumberFormatException err) {
			userAuth = 10;
			userCenterGb = 0;
		} catch (NullPointerException err) {
			userAuth = 10;
			userCenterGb = 0;
		}

		if (userAuth > 1) { // 센터 검색 권한이 없으면
			vo.setSchCenterGb(Integer.toString(userCenterGb));
		}
		model.addAttribute("authCd", userAuth);
		model.addAttribute("vo", vo);

		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");

		GroupVO groupVo = new GroupVO();
		groupVo.setHclassCd("G15");
		CenterVO centerVO = new CenterVO();

		List<EgovMap> cnsGbList = adminManageService.getGroupMngDtlMList(groupVo);
		List<EgovMap> cnsCenterList = adminManageService.getCenterManageList(centerVO);
		groupVo.setHclassCd("G19");
		List<EgovMap> cnsrGbList = adminManageService.getGroupMngDtlMList(groupVo);

		model.addAttribute("mnuCd", mnuCd);
		model.addAttribute("cnsGbList", cnsGbList);
		model.addAttribute("cnsCenterList", cnsCenterList);
		model.addAttribute("cnsrGbList", cnsrGbList);

		return "stats/promotionResult_list.main";
	}

	@RequestMapping(value = "/promotionResultList_ajax.do", method = RequestMethod.POST)
	public String promotionResultList_ajax(HttpServletRequest request, ModelMap model, ResultReportVO vo) {
		// 권한 관리 시작
		EgovMap loginVo = (EgovMap) request.getSession().getAttribute("LoginVO");

		int userAuth, userCenterGb;
		try {
			userAuth = Integer.parseInt(loginVo.get("authCd").toString());
			userCenterGb = Integer.parseInt(loginVo.get("centerGb").toString());
			if (userAuth == 0)
				userAuth = 10;
		} catch (NumberFormatException err) {
			userAuth = 10;
			userCenterGb = 0;
		} catch (NullPointerException err) {
			userAuth = 10;
			userCenterGb = 0;
		}

		if (userAuth > 1) { // 센터 검색 권한이 없으면
			vo.setschCenterGb(Integer.toString(userCenterGb));
		}

		List<EgovMap> list = resultStatsService.getPromotionResultList(vo);
		model.addAttribute("list", list);
		return "jsonView";
	}

	@RequestMapping(value = "/acadmbCnsStateList.do", method = RequestMethod.GET)
	public String acadmbCnsStateList(PsyCnsVO vo, HttpServletRequest request, ModelMap model) {
		// 권한 관리 시작
		EgovMap loginVo = (EgovMap) request.getSession().getAttribute("LoginVO");

		int userAuth, userCenterGb;
		try {
			userAuth = Integer.parseInt(loginVo.get("authCd").toString());
			userCenterGb = Integer.parseInt(loginVo.get("centerGb").toString());
			if (userAuth == 0)
				userAuth = 10;
		} catch (NumberFormatException err) {
			userAuth = 10;
			userCenterGb = 0;
		} catch (NullPointerException err) {
			userAuth = 10;
			userCenterGb = 0;
		}

		if (userAuth > 1) { // 센터 검색 권한이 없으면
			vo.setSchCenterGb(Integer.toString(userCenterGb));
		}
		model.addAttribute("authCd", userAuth);
		model.addAttribute("vo", vo);

		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");

		GroupVO groupVo = new GroupVO();
		groupVo.setHclassCd("G15");
		CenterVO centerVO = new CenterVO();

		List<EgovMap> cnsGbList = adminManageService.getGroupMngDtlMList(groupVo);
		List<EgovMap> cnsCenterList = adminManageService.getCenterManageList(centerVO);
		groupVo.setHclassCd("G19");
		List<EgovMap> cnsrGbList = adminManageService.getGroupMngDtlMList(groupVo);

		model.addAttribute("mnuCd", mnuCd);
		model.addAttribute("cnsGbList", cnsGbList);
		model.addAttribute("cnsCenterList", cnsCenterList);
		model.addAttribute("cnsrGbList", cnsrGbList);

		return "stats/acadmbCnsState_list.main";
	}

	@RequestMapping(value = "/acadmbCnsStateList_ajax.do", method = RequestMethod.POST)
	public String acadmbCnsStateList_ajax(HttpServletRequest request, ModelMap model, ResultReportVO vo) {
		// 권한 관리 시작
		EgovMap loginVo = (EgovMap) request.getSession().getAttribute("LoginVO");

		int userAuth, userCenterGb;
		try {
			userAuth = Integer.parseInt(loginVo.get("authCd").toString());
			userCenterGb = Integer.parseInt(loginVo.get("centerGb").toString());
			if (userAuth == 0)
				userAuth = 10;
		} catch (NumberFormatException err) {
			userAuth = 10;
			userCenterGb = 0;
		} catch (NullPointerException err) {
			userAuth = 10;
			userCenterGb = 0;
		}

		if (userAuth > 1) { // 센터 검색 권한이 없으면
			vo.setschCenterGb(Integer.toString(userCenterGb));
		}

		List<EgovMap> list = resultStatsService.getAcadmbCnsStateList(vo);
		model.addAttribute("list", list);
		return "jsonView";
	}

	@RequestMapping(value = "/ageCnsStateList.do", method = RequestMethod.GET)
	public String ageCnsStateList(PsyCnsVO vo, HttpServletRequest request, ModelMap model) {
		// 권한 관리 시작
		EgovMap loginVo = (EgovMap) request.getSession().getAttribute("LoginVO");

		int userAuth, userCenterGb;
		try {
			userAuth = Integer.parseInt(loginVo.get("authCd").toString());
			userCenterGb = Integer.parseInt(loginVo.get("centerGb").toString());
			if (userAuth == 0)
				userAuth = 10;
		} catch (NumberFormatException err) {
			userAuth = 10;
			userCenterGb = 0;
		} catch (NullPointerException err) {
			userAuth = 10;
			userCenterGb = 0;
		}

		if (userAuth > 1) { // 센터 검색 권한이 없으면
			vo.setSchCenterGb(Integer.toString(userCenterGb));
		}
		model.addAttribute("authCd", userAuth);
		model.addAttribute("vo", vo);

		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");

		GroupVO groupVo = new GroupVO();
		groupVo.setHclassCd("G15");
		CenterVO centerVO = new CenterVO();

		List<EgovMap> cnsGbList = adminManageService.getGroupMngDtlMList(groupVo);
		List<EgovMap> cnsCenterList = adminManageService.getCenterManageList(centerVO);
		groupVo.setHclassCd("G19");
		List<EgovMap> cnsrGbList = adminManageService.getGroupMngDtlMList(groupVo);

		model.addAttribute("mnuCd", mnuCd);
		model.addAttribute("cnsGbList", cnsGbList);
		model.addAttribute("cnsCenterList", cnsCenterList);
		model.addAttribute("cnsrGbList", cnsrGbList);

		return "stats/ageCnsState_list.main";
	}

	@RequestMapping(value = "/ageCnsStateList_ajax.do", method = RequestMethod.POST)
	public String ageCnsStateList_ajax(HttpServletRequest request, ModelMap model, ResultReportVO vo) {
		// 권한 관리 시작
		EgovMap loginVo = (EgovMap) request.getSession().getAttribute("LoginVO");

		int userAuth, userCenterGb;
		try {
			userAuth = Integer.parseInt(loginVo.get("authCd").toString());
			userCenterGb = Integer.parseInt(loginVo.get("centerGb").toString());
			if (userAuth == 0)
				userAuth = 10;
		} catch (NumberFormatException err) {
			userAuth = 10;
			userCenterGb = 0;
		} catch (NullPointerException err) {
			userAuth = 10;
			userCenterGb = 0;
		}

		if (userAuth > 1) { // 센터 검색 권한이 없으면
			vo.setschCenterGb(Integer.toString(userCenterGb));
		}

		List<EgovMap> list = resultStatsService.getAgeCnsStateList(vo);
		model.addAttribute("list", list);
		return "jsonView";
	}

	@RequestMapping(value = "/ageCnsStateList2_ajax.do", method = RequestMethod.POST)
	public String ageCnsStateList2_ajax(HttpServletRequest request, ModelMap model, ResultReportVO vo) {
		// 권한 관리 시작
		EgovMap loginVo = (EgovMap) request.getSession().getAttribute("LoginVO");

		int userAuth, userCenterGb;
		try {
			userAuth = Integer.parseInt(loginVo.get("authCd").toString());
			userCenterGb = Integer.parseInt(loginVo.get("centerGb").toString());
			if (userAuth == 0)
				userAuth = 10;
		} catch (NumberFormatException err) {
			userAuth = 10;
			userCenterGb = 0;
		} catch (NullPointerException err) {
			userAuth = 10;
			userCenterGb = 0;
		}

		if (userAuth > 1) { // 센터 검색 권한이 없으면
			vo.setschCenterGb(Integer.toString(userCenterGb));
		}

		List<EgovMap> list = resultStatsService.getAgeCnsStateList2(vo);
		model.addAttribute("list", list);
		return "jsonView";
	}

	@RequestMapping(value = "/mainApplPbCnsStateList.do", method = RequestMethod.GET)
	public String mainApplPbCnsStateList(PsyCnsVO vo, HttpServletRequest request, ModelMap model) {
		// 권한 관리 시작
		EgovMap loginVo = (EgovMap) request.getSession().getAttribute("LoginVO");

		int userAuth, userCenterGb;
		try {
			userAuth = Integer.parseInt(loginVo.get("authCd").toString());
			userCenterGb = Integer.parseInt(loginVo.get("centerGb").toString());
			if (userAuth == 0)
				userAuth = 10;
		} catch (NumberFormatException err) {
			userAuth = 10;
			userCenterGb = 0;
		} catch (NullPointerException err) {
			userAuth = 10;
			userCenterGb = 0;
		}

		if (userAuth > 1) { // 센터 검색 권한이 없으면
			vo.setSchCenterGb(Integer.toString(userCenterGb));
		}
		model.addAttribute("authCd", userAuth);
		model.addAttribute("vo", vo);

		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");

		GroupVO groupVo = new GroupVO();
		groupVo.setHclassCd("G15");
		CenterVO centerVO = new CenterVO();

		List<EgovMap> cnsGbList = adminManageService.getGroupMngDtlMList(groupVo);
		List<EgovMap> cnsCenterList = adminManageService.getCenterManageList(centerVO);
		groupVo.setHclassCd("G19");
		List<EgovMap> cnsrGbList = adminManageService.getGroupMngDtlMList(groupVo);
		groupVo.setHclassCd("G72");
		List<EgovMap> addrGbList = adminManageService.getGroupMngDtlMList(groupVo);

		model.addAttribute("mnuCd", mnuCd);
		model.addAttribute("cnsGbList", cnsGbList);
		model.addAttribute("cnsCenterList", cnsCenterList);
		model.addAttribute("cnsrGbList", cnsrGbList);
		model.addAttribute("addrGbList", addrGbList);

		return "stats/mainApplPbCnsState_list.main";
	}

	@RequestMapping(value = "/mainApplPbCnsStateList_ajax.do", method = RequestMethod.POST)
	public String mainApplPbCnsStateList_ajax(HttpServletRequest request, ModelMap model, ResultReportVO vo) {
		// 권한 관리 시작
		EgovMap loginVo = (EgovMap) request.getSession().getAttribute("LoginVO");

		int userAuth, userCenterGb;
		try {
			userAuth = Integer.parseInt(loginVo.get("authCd").toString());
			userCenterGb = Integer.parseInt(loginVo.get("centerGb").toString());
			if (userAuth == 0)
				userAuth = 10;
		} catch (NumberFormatException err) {
			userAuth = 10;
			userCenterGb = 0;
		} catch (NullPointerException err) {
			userAuth = 10;
			userCenterGb = 0;
		}

		if (userAuth > 1) { // 센터 검색 권한이 없으면
			vo.setschCenterGb(Integer.toString(userCenterGb));
		}

		List<EgovMap> list = resultStatsService.getMainApplPbCnsStateList(vo);
		model.addAttribute("list", list);
		return "jsonView";
	}

	@RequestMapping(value = "/personalCnsStateList.do", method = RequestMethod.GET)
	public String personalCnsStateList(PsyCnsVO vo, HttpServletRequest request, ModelMap model) {
		// 권한 관리 시작
		EgovMap loginVo = (EgovMap) request.getSession().getAttribute("LoginVO");

		int userAuth, userCenterGb;
		try {
			userAuth = Integer.parseInt(loginVo.get("authCd").toString());
			userCenterGb = Integer.parseInt(loginVo.get("centerGb").toString());
			if (userAuth == 0)
				userAuth = 10;
		} catch (NumberFormatException err) {
			userAuth = 10;
			userCenterGb = 0;
		} catch (NullPointerException err) {
			userAuth = 10;
			userCenterGb = 0;
		}

		if (userAuth > 1) { // 센터 검색 권한이 없으면
			vo.setSchCenterGb(Integer.toString(userCenterGb));
		}
		model.addAttribute("authCd", userAuth);
		model.addAttribute("vo", vo);

		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");

		GroupVO groupVo = new GroupVO();
		groupVo.setHclassCd("G15");
		CenterVO centerVO = new CenterVO();

		List<EgovMap> cnsGbList = adminManageService.getGroupMngDtlMList(groupVo);
		List<EgovMap> cnsCenterList = adminManageService.getCenterManageList(centerVO);
		groupVo.setHclassCd("G19");
		List<EgovMap> cnsrGbList = adminManageService.getGroupMngDtlMList(groupVo);
		groupVo.setHclassCd("G72");
		List<EgovMap> addrGbList = adminManageService.getGroupMngDtlMList(groupVo);

		model.addAttribute("mnuCd", mnuCd);
		model.addAttribute("cnsGbList", cnsGbList);
		model.addAttribute("cnsCenterList", cnsCenterList);
		model.addAttribute("cnsrGbList", cnsrGbList);
		model.addAttribute("addrGbList", addrGbList);

		return "stats/personalCnsState_list.main";
	}

	@RequestMapping(value = "/personalCnsStateList_ajax.do", method = RequestMethod.POST)
	public String personalCnsStateList_ajax(HttpServletRequest request, ModelMap model, ResultReportVO vo) {
		// 권한 관리 시작
		EgovMap loginVo = (EgovMap) request.getSession().getAttribute("LoginVO");

		int userAuth, userCenterGb;
		try {
			userAuth = Integer.parseInt(loginVo.get("authCd").toString());
			userCenterGb = Integer.parseInt(loginVo.get("centerGb").toString());
			if (userAuth == 0)
				userAuth = 10;
		} catch (NumberFormatException err) {
			userAuth = 10;
			userCenterGb = 0;
		} catch (NullPointerException err) {
			userAuth = 10;
			userCenterGb = 0;
		}

		if (userAuth > 1) { // 센터 검색 권한이 없으면
			vo.setschCenterGb(Integer.toString(userCenterGb));
		}

		List<EgovMap> list = resultStatsService.getPersonalCnsStateList(vo);
		model.addAttribute("list", list);
		return "jsonView";
	}

	@RequestMapping(value = "/groupCnsStateList.do", method = RequestMethod.GET)
	public String groupCnsStateList(PsyCnsVO vo, HttpServletRequest request, ModelMap model) {
		// 권한 관리 시작
		EgovMap loginVo = (EgovMap) request.getSession().getAttribute("LoginVO");

		int userAuth, userCenterGb;
		try {
			userAuth = Integer.parseInt(loginVo.get("authCd").toString());
			userCenterGb = Integer.parseInt(loginVo.get("centerGb").toString());
			if (userAuth == 0)
				userAuth = 10;
		} catch (NumberFormatException err) {
			userAuth = 10;
			userCenterGb = 0;
		} catch (NullPointerException err) {
			userAuth = 10;
			userCenterGb = 0;
		}

		if (userAuth > 1) { // 센터 검색 권한이 없으면
			vo.setSchCenterGb(Integer.toString(userCenterGb));
		}
		model.addAttribute("authCd", userAuth);
		model.addAttribute("vo", vo);

		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");

		GroupVO groupVo = new GroupVO();
		groupVo.setHclassCd("G15");
		CenterVO centerVO = new CenterVO();

		List<EgovMap> cnsGbList = adminManageService.getGroupMngDtlMList(groupVo);
		List<EgovMap> cnsCenterList = adminManageService.getCenterManageList(centerVO);
		groupVo.setHclassCd("G19");
		List<EgovMap> cnsrGbList = adminManageService.getGroupMngDtlMList(groupVo);
		groupVo.setHclassCd("G72");
		List<EgovMap> addrGbList = adminManageService.getGroupMngDtlMList(groupVo);

		model.addAttribute("mnuCd", mnuCd);
		model.addAttribute("cnsGbList", cnsGbList);
		model.addAttribute("cnsCenterList", cnsCenterList);
		model.addAttribute("cnsrGbList", cnsrGbList);
		model.addAttribute("addrGbList", addrGbList);

		return "stats/groupCnsState_list.main";
	}

	@RequestMapping(value = "/groupCnsStateList_ajax.do", method = RequestMethod.POST)
	public String groupCnsStateList_ajax(HttpServletRequest request, ModelMap model, ResultReportVO vo) {
		// 권한 관리 시작
		EgovMap loginVo = (EgovMap) request.getSession().getAttribute("LoginVO");

		int userAuth, userCenterGb;
		try {
			userAuth = Integer.parseInt(loginVo.get("authCd").toString());
			userCenterGb = Integer.parseInt(loginVo.get("centerGb").toString());
			if (userAuth == 0)
				userAuth = 10;
		} catch (NumberFormatException err) {
			userAuth = 10;
			userCenterGb = 0;
		} catch (NullPointerException err) {
			userAuth = 10;
			userCenterGb = 0;
		}

		if (userAuth > 1) { // 센터 검색 권한이 없으면
			vo.setschCenterGb(Integer.toString(userCenterGb));
		}

		List<EgovMap> list = resultStatsService.getGroupCnsStateList(vo);
		model.addAttribute("list", list);
		return "jsonView";
	}

	@RequestMapping(value = "/dmyStateList.do", method = RequestMethod.GET)
	public String dmyStateList(PsyCnsVO vo, HttpServletRequest request, ModelMap model) {
		// 권한 관리 시작
		EgovMap loginVo = (EgovMap) request.getSession().getAttribute("LoginVO");

		int userAuth, userCenterGb;
		try {
			userAuth = Integer.parseInt(loginVo.get("authCd").toString());
			userCenterGb = Integer.parseInt(loginVo.get("centerGb").toString());
			if (userAuth == 0)
				userAuth = 10;
		} catch (NumberFormatException err) {
			userAuth = 10;
			userCenterGb = 0;
		} catch (NullPointerException err) {
			userAuth = 10;
			userCenterGb = 0;
		}

		if (userAuth > 1) { // 센터 검색 권한이 없으면
			vo.setSchCenterGb(Integer.toString(userCenterGb));
		}
		model.addAttribute("authCd", userAuth);
		model.addAttribute("vo", vo);

		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");

		GroupVO groupVo = new GroupVO();
		groupVo.setHclassCd("G15");
		CenterVO centerVO = new CenterVO();

		List<EgovMap> cnsGbList = adminManageService.getGroupMngDtlMList(groupVo);
		List<EgovMap> cnsCenterList = adminManageService.getCenterManageList(centerVO);

		model.addAttribute("mnuCd", mnuCd);
		model.addAttribute("cnsGbList", cnsGbList);
		model.addAttribute("cnsCenterList", cnsCenterList);

		return "stats/dmyState_list.main";
	}

	@RequestMapping(value = "/dmyStateList_ajax.do", method = RequestMethod.POST)
	public String dmyStateList_ajax(HttpServletRequest request, ModelMap model, ResultReportVO vo) {
		// 권한 관리 시작
		EgovMap loginVo = (EgovMap) request.getSession().getAttribute("LoginVO");

		int userAuth, userCenterGb;
		try {
			userAuth = Integer.parseInt(loginVo.get("authCd").toString());
			userCenterGb = Integer.parseInt(loginVo.get("centerGb").toString());
			if (userAuth == 0)
				userAuth = 10;
		} catch (NumberFormatException err) {
			userAuth = 10;
			userCenterGb = 0;
		} catch (NullPointerException err) {
			userAuth = 10;
			userCenterGb = 0;
		}

		if (userAuth > 1) { // 센터 검색 권한이 없으면
			vo.setschCenterGb(Integer.toString(userCenterGb));
		}

		List<EgovMap> list = resultStatsService.getDmyStateList(vo);
		model.addAttribute("list", list);
		return "jsonView";
	}

	@RequestMapping(value = "/centerStateList.do", method = RequestMethod.GET)
	public String centerStateList(ResultReportVO vo, HttpServletRequest request, ModelMap model) {
		// 권한 관리 시작
		EgovMap loginVo = (EgovMap) request.getSession().getAttribute("LoginVO");

		int userAuth, userCenterGb;
		try {
			userAuth = Integer.parseInt(loginVo.get("authCd").toString());
			userCenterGb = Integer.parseInt(loginVo.get("centerGb").toString());
			if (userAuth == 0)
				userAuth = 10;
		} catch (NumberFormatException err) {
			userAuth = 10;
			userCenterGb = 0;
		} catch (NullPointerException err) {
			userAuth = 10;
			userCenterGb = 0;
		}

		if (userAuth > 1) { // 센터 검색 권한이 없으면
			vo.setschCenterGb(Integer.toString(userCenterGb));
		}
		model.addAttribute("authCd", userAuth);
		model.addAttribute("vo", vo);

		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");

		GroupVO groupVo = new GroupVO();
		groupVo.setHclassCd("G15");
		CenterVO centerVO = new CenterVO();

		List<EgovMap> cnsGbList = adminManageService.getGroupMngDtlMList(groupVo);
		List<EgovMap> cnsCenterList = adminManageService.getCenterManageList(centerVO);
		groupVo.setHclassCd("G19");
		List<EgovMap> cnsrGbList = adminManageService.getGroupMngDtlMList(groupVo);

		model.addAttribute("mnuCd", mnuCd);
		model.addAttribute("cnsGbList", cnsGbList);
		model.addAttribute("cnsCenterList", cnsCenterList);
		model.addAttribute("cnsrGbList", cnsrGbList);

		return "stats/centerState_list.main";
	}

	@RequestMapping(value = "/centerStateList_ajax.do", method = RequestMethod.POST)
	public String centerStateList_ajax(HttpServletRequest request, ModelMap model, ResultReportVO vo) {
		// 권한 관리 시작
		EgovMap loginVo = (EgovMap) request.getSession().getAttribute("LoginVO");

		int userAuth, userCenterGb;
		try {
			userAuth = Integer.parseInt(loginVo.get("authCd").toString());
			userCenterGb = Integer.parseInt(loginVo.get("centerGb").toString());
			if (userAuth == 0)
				userAuth = 10;
		} catch (NumberFormatException err) {
			userAuth = 10;
			userCenterGb = 0;
		} catch (NullPointerException err) {
			userAuth = 10;
			userCenterGb = 0;
		}

		if (userAuth > 1) { // 센터 검색 권한이 없으면
			vo.setschCenterGb(Integer.toString(userCenterGb));
		}

		List<EgovMap> list = resultStatsService.getCenterStateList(vo);
		model.addAttribute("list", list);
		return "jsonView";
	}

	@RequestMapping(value = "/psyCnsStateList.do", method = RequestMethod.GET)
	public String psyCnsStateList(PsyCnsVO vo, HttpServletRequest request, ModelMap model) {
		// 권한 관리 시작
		EgovMap loginVo = (EgovMap) request.getSession().getAttribute("LoginVO");

		int userAuth, userCenterGb;
		try {
			userAuth = Integer.parseInt(loginVo.get("authCd").toString());
			userCenterGb = Integer.parseInt(loginVo.get("centerGb").toString());
			if (userAuth == 0)
				userAuth = 10;
		} catch (NumberFormatException err) {
			userAuth = 10;
			userCenterGb = 0;
		} catch (NullPointerException err) {
			userAuth = 10;
			userCenterGb = 0;
		}

		if (userAuth > 1) { // 센터 검색 권한이 없으면
			vo.setSchCenterGb(Integer.toString(userCenterGb));
		}
		model.addAttribute("authCd", userAuth);

		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");

		GroupVO groupVo = new GroupVO();
		groupVo.setHclassCd("G15");
		CenterVO centerVO = new CenterVO();

		List<EgovMap> cnsGbList = adminManageService.getGroupMngDtlMList(groupVo);
		List<EgovMap> cnsCenterList = adminManageService.getCenterManageList(centerVO);

		List<EgovMap> cnsPsyList = counselMngService.getExamDocList(vo);

		// groupVo.setHclassCd("G37");
		// List<EgovMap> cnsPsyList = adminManageService.getGroupMngDtlMList(groupVo);

		model.addAttribute("mnuCd", mnuCd);
		model.addAttribute("cnsGbList", cnsGbList);
		model.addAttribute("cnsCenterList", cnsCenterList);
		model.addAttribute("cnsPsyList", cnsPsyList);
		model.addAttribute("vo", vo);

		return "stats/psyCnsState_list.main";
	}

	@RequestMapping(value = "/psyCnsStateList_ajax.do", method = RequestMethod.POST)
	public String psyCnsStateList_ajax(HttpServletRequest request, ModelMap model, ResultReportVO vo) {
		// 권한 관리 시작
		EgovMap loginVo = (EgovMap) request.getSession().getAttribute("LoginVO");

		int userAuth, userCenterGb;
		try {
			userAuth = Integer.parseInt(loginVo.get("authCd").toString());
			userCenterGb = Integer.parseInt(loginVo.get("centerGb").toString());
			if (userAuth == 0)
				userAuth = 10;
		} catch (NumberFormatException err) {
			userAuth = 10;
			userCenterGb = 0;
		} catch (NullPointerException err) {
			userAuth = 10;
			userCenterGb = 0;
		}

		if (userAuth > 1) { // 센터 검색 권한이 없으면
			vo.setschCenterGb(Integer.toString(userCenterGb));
		}

		List<EgovMap> list = resultStatsService.getPsyCnsStateList(vo);
		model.addAttribute("list", list);
		return "jsonView";
	}
}