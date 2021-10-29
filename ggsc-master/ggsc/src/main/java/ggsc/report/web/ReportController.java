package ggsc.report.web;

import java.io.IOException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.List;

import javax.annotation.Resource;
import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ams.cmm.AES256Crypto;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import ggsc.cnsmng.service.CounselMngService;
import ggsc.cnsr.service.AdminManageService;
import ggsc.cnsr.service.CenterVO;
import ggsc.cnsr.service.GroupVO;
import ggsc.report.service.CnsBookVO;
import ggsc.report.service.CnsEndVO;
import ggsc.report.service.EduAtvyRptVO;
import ggsc.report.service.LinkOrgRptVO;
import ggsc.report.service.NtwkMeetRptVO;
import ggsc.report.service.PrAtvyRptVO;
import ggsc.report.service.ReportService;
import ggsc.report.service.mindSharingVO;
import ggsc.rorgmng.service.RelatedOrganMngService;


@Controller

public class ReportController {
	@Resource(name = "counselMngService")
	private CounselMngService counselMngService;

	@Resource(name = "ReportService")
	private ReportService reportService;

	@Resource(name = "AdminManageService")
	private AdminManageService adminManageService;

	@Resource(name = "RelatedOrganMngService")
	private RelatedOrganMngService relatedOrganMngService;

	// 상담사례종결서 목록
	@RequestMapping(value = "/cnsEndList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String cnsEndList(HttpServletRequest request, ModelMap model, CnsEndVO vo) {
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
		// 권한 관리 끝

		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd", mnuCd);

		// 상담구분 코드
		GroupVO param = new GroupVO();
		param.setHclassCd("G15");
		List<EgovMap> cnsGbList = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("cnsGbList", cnsGbList);

		CenterVO centerVO = new CenterVO();
		List<EgovMap> cnsCenterList = adminManageService.getCenterManageList(centerVO);
		model.addAttribute("cnsCenterList", cnsCenterList);

		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(vo.getCurrentPageNo()); // 현재 페이지 번호
		paginationInfo.setRecordCountPerPage(10); // 한 페이지에 게시되는 게시물 건수
		paginationInfo.setPageSize(10); // 페이징 리스트의 사이즈

		vo.setFirstIndex((vo.getCurrentPageNo() - 1) * 10);
		vo.setLastIndex((vo.getCurrentPageNo()) * 10);

		List<EgovMap> cnsEndList = reportService.getCnsEndList(vo);
		int totalPageCnt = reportService.getCnsEndListTotCnt(vo);
		model.addAttribute("totalPageCnt", totalPageCnt);
		paginationInfo.setTotalRecordCount(totalPageCnt); // 전체 게시물 건 수
		model.addAttribute("paginationInfo", paginationInfo);

		model.addAttribute("cnsEndList", cnsEndList);
		model.addAttribute("vo", vo);

		return "report/cnsEnd_list.main";
	}

	// 상담사례종결서 상세
	@RequestMapping(value = "/cnsEndDtl.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String cnsEndDtl(CnsEndVO vo, HttpServletRequest request, ModelMap model) {
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd", mnuCd);

		// 종결 사유
		GroupVO param = new GroupVO();
		param.setHclassCd("G23");
		List<EgovMap> cnsEndList = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("cnsEndList", cnsEndList);

		EgovMap map = (EgovMap) request.getSession().getAttribute("LoginVO");
		model.addAttribute("map", map);
		EgovMap result = reportService.getCnsEndDtl(vo);
		model.addAttribute("result", result);

		return "report/cnsEnd_dtl.main";
	}

	// 상담사례종결서 수정
	@RequestMapping(value = "/cnsEndUpd.do", method = RequestMethod.POST)
	public String cnsEndUpd(CnsEndVO vo, HttpServletRequest request, ModelMap model) {
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd", mnuCd);

		EgovMap map = (EgovMap) request.getSession().getAttribute("LoginVO");
		vo.setZoneGb((String) map.get("zoneGb"));
		vo.setCenterGb((String) map.get("centerGb"));

		reportService.updateCnsEnd(vo);

		return "redirect:/gnoincoundb/cnsEndList.do?mnuCd=" + mnuCd;
	}

	// 상담대상자관리대장 목록
	@RequestMapping(value = "/cnsBookList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String cnsBookList(HttpServletRequest request, ModelMap model, CnsBookVO vo) {

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
		// 권한 관리 끝

		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd", mnuCd);

		// 상담구분 코드
		GroupVO param = new GroupVO();
		param.setHclassCd("G15");
		List<EgovMap> cnsGbList = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("cnsGbList", cnsGbList);

		CenterVO centerVO = new CenterVO();
		List<EgovMap> cnsCenterList = adminManageService.getCenterManageList(centerVO);
		model.addAttribute("cnsCenterList", cnsCenterList);

		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(vo.getCurrentPageNo()); // 현재 페이지 번호
		paginationInfo.setRecordCountPerPage(10); // 한 페이지에 게시되는 게시물 건수
		paginationInfo.setPageSize(10); // 페이징 리스트의 사이즈

		vo.setFirstIndex((vo.getCurrentPageNo() - 1) * 10);
		vo.setLastIndex((vo.getCurrentPageNo()) * 10);

		List<EgovMap> cnsBookList = reportService.getCnsBookList(vo);
		int totalPageCnt = reportService.getCnsBookListTotCnt(vo);

		model.addAttribute("totalPageCnt", totalPageCnt);
		paginationInfo.setTotalRecordCount(totalPageCnt); // 전체 게시물 건 수
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("cnsBookList", cnsBookList);
		model.addAttribute("vo", vo);
		return "report/cnsBook_list.main";
	}

	// 상담종결관리대장 목록
	@RequestMapping(value = "/cnsEndBookList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String cnsEndBookList(HttpServletRequest request, ModelMap model, CnsEndVO vo) {

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
		// 권한 관리 끝

		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd", mnuCd);

		// 상담구분 코드
		GroupVO param = new GroupVO();
		param.setHclassCd("G15");
		List<EgovMap> cnsGbList = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("cnsGbList", cnsGbList);

		CenterVO centerVO = new CenterVO();
		List<EgovMap> cnsCenterList = adminManageService.getCenterManageList(centerVO);
		model.addAttribute("cnsCenterList", cnsCenterList);

		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(vo.getCurrentPageNo()); // 현재 페이지 번호
		paginationInfo.setRecordCountPerPage(10); // 한 페이지에 게시되는 게시물 건수
		paginationInfo.setPageSize(10); // 페이징 리스트의 사이즈

		vo.setFirstIndex((vo.getCurrentPageNo() - 1) * 10);
		vo.setLastIndex((vo.getCurrentPageNo()) * 10);

		List<EgovMap> cnsEndBookList = reportService.getCnsEndBookList(vo);
		int totalPageCnt = reportService.getCnsEndBookListTotCnt(vo);
		model.addAttribute("totalPageCnt", totalPageCnt);
		paginationInfo.setTotalRecordCount(totalPageCnt); // 전체 게시물 건 수
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("cnsEndBookList", cnsEndBookList);
		model.addAttribute("vo", vo);
		System.out.println("cnsEndBook 값 확인 : "+vo);
		return "report/cnsEndBook_list.main";
	}

	// 연계기관방문보고서 목록
	@RequestMapping(value = "/linkOrgRptList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String linkOrgRptList(HttpServletRequest request, ModelMap model, LinkOrgRptVO vo) {

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
		// 권한 관리 끝

		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd", mnuCd);

		// 상담구분 코드
		GroupVO param = new GroupVO();
		param.setHclassCd("G15");
		List<EgovMap> cnsGbList = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("cnsGbList", cnsGbList);

		// 센터구분 코드
		CenterVO centerVO = new CenterVO();
		List<EgovMap> cnsCenterList = adminManageService.getCenterManageList(centerVO);
		model.addAttribute("cnsCenterList", cnsCenterList);
		
		// 방문기관 코드
		param.setHclassCd("G74");
		List<EgovMap> cnsVisitCenterList = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("cnsVisitCenterList", cnsVisitCenterList);
		
		param.setHclassCd("G089");
		List<EgovMap> sigunGbList = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("sigunGbList", sigunGbList);

		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(vo.getCurrentPageNo()); // 현재 페이지 번호
		paginationInfo.setRecordCountPerPage(10); // 한 페이지에 게시되는 게시물 건수
		paginationInfo.setPageSize(10); // 페이징 리스트의 사이즈

		vo.setFirstIndex((vo.getCurrentPageNo() - 1) * 10);
		vo.setLastIndex((vo.getCurrentPageNo()) * 10);

		List<EgovMap> linkOrgRptList = reportService.getLinkOrgRptList(vo);
		int totalPageCnt = reportService.getLinkOrgRptListTotCnt(vo);
		model.addAttribute("totalPageCnt", totalPageCnt);
		paginationInfo.setTotalRecordCount(totalPageCnt); // 전체 게시물 건 수
		model.addAttribute("paginationInfo", paginationInfo);
		
		model.addAttribute("linkOrgRptList", linkOrgRptList);
		model.addAttribute("vo", vo);
		return "report/linkOrgRpt_list.main";
	}

	// 연계기관방문보고서 상세
	@RequestMapping(value = "/linkOrgRptDtl.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String linkOrgRptDtl(LinkOrgRptVO vo, HttpServletRequest request, ModelMap model) {
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
		model.addAttribute("userId", loginVo.get("userId").toString());

		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd", mnuCd);

		// 지역구분 코드
		GroupVO param = new GroupVO();
		param.setHclassCd("G72");
		List<EgovMap> cnsLocalList = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("cnsLocalList", cnsLocalList);

		// 방문기관 코드
		param.setHclassCd("G74");
		List<EgovMap> cnsVisitCenterList = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("cnsVisitCenterList", cnsVisitCenterList);
		
		param.setHclassCd("G089");
		List<EgovMap> sigunGbList = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("sigunGbList", sigunGbList);

		EgovMap map = (EgovMap) request.getSession().getAttribute("LoginVO");
		model.addAttribute("map", map);
		
		int orgNo = Integer.parseInt(vo.getLinkOrgNo());
		
		if (orgNo != 0) {
			EgovMap result = reportService.getLinkOrgRptDtl(vo);
			model.addAttribute("result", result);
		}

		return "report/linkOrgRpt_dtl.main";
	}

	// 연계기관방문보고서 등록, 수정
	@RequestMapping(value = "/linkOrgRptSave.do", method = RequestMethod.POST)
	public String linkOrgRptSave(LinkOrgRptVO vo, HttpServletRequest request, ModelMap model) {
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		String save = request.getParameter("save");
		model.addAttribute("mnuCd", mnuCd);

		EgovMap map = (EgovMap) request.getSession().getAttribute("LoginVO");
		vo.setInputNm(map.get("userNm").toString());
		vo.setCnsrId(map.get("userId").toString());
		if (save.equals("I")) {
			reportService.insertLinkOrgRpt(vo);
		} else if(save.equals("U")) {
			reportService.updateLinkOrgRpt(vo);
		} else if(save.equals("D")) {
			reportService.deleteLinkOrgRpt(vo);
		}

		return "redirect:/gnoincoundb/linkOrgRptList.do?mnuCd=" + mnuCd;
	}
	
	// 연계기관방문보고서 파일 삭제
	@RequestMapping(value = "/linkOrgRptFileDel.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String linkOrgRptFileDel(HttpServletRequest request, ModelMap model, LinkOrgRptVO vo) {

		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		String save = request.getParameter("save");
		model.addAttribute("mnuCd", mnuCd);
		reportService.updateLinkOrgRpt(vo);
		return "jsonView";
	}

	// 네트워크구축회의보고서 목록
	@RequestMapping(value = "/ntwkMeetRptList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String ntwkMeetRptList(HttpServletRequest request, ModelMap model, NtwkMeetRptVO vo) {
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
		// 권한 관리 끝

		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd", mnuCd);

		// 상담구분 코드
		GroupVO param = new GroupVO();
		param.setHclassCd("G15");
		List<EgovMap> cnsGbList = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("cnsGbList", cnsGbList);

		// 지역구분 코드
		param.setHclassCd("G72");
		List<EgovMap> cnsLocalList = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("cnsLocalList", cnsLocalList);
		
		// 회의구분 코드
		param.setHclassCd("G39");
		List<EgovMap> partiInstList = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("partiInstList", partiInstList);

		// 센터구분
		CenterVO centerVO = new CenterVO();
		List<EgovMap> cnsCenterList = adminManageService.getCenterManageList(centerVO);
		model.addAttribute("cnsCenterList", cnsCenterList);

		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(vo.getCurrentPageNo()); // 현재 페이지 번호
		paginationInfo.setRecordCountPerPage(10); // 한 페이지에 게시되는 게시물 건수
		paginationInfo.setPageSize(10); // 페이징 리스트의 사이즈

		vo.setFirstIndex((vo.getCurrentPageNo() - 1) * 10);
		vo.setLastIndex((vo.getCurrentPageNo()) * 10);

		List<EgovMap> ntwkMeetRptList = reportService.getNtwkMeetRptList(vo);
		int totalPageCnt = reportService.getNtwkMeetRptListTotCnt(vo);
		model.addAttribute("totalPageCnt", totalPageCnt);
		paginationInfo.setTotalRecordCount(totalPageCnt); // 전체 게시물 건 수
		model.addAttribute("paginationInfo", paginationInfo);

		model.addAttribute("ntwkMeetRptList", ntwkMeetRptList);
		model.addAttribute("vo", vo);
		return "report/ntwkMeetRpt_list.main";
	}

	// 네트워크구축회의보고서 상세
	@RequestMapping(value = "/ntwkMeetRptDtl.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String ntwkMeetRptDtl(NtwkMeetRptVO vo, HttpServletRequest request, ModelMap model) {
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
		model.addAttribute("userId", loginVo.get("userId").toString());
		model.addAttribute("centerGb", userCenterGb);

		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd", mnuCd);

		// 지역구분 코드
		GroupVO param = new GroupVO();
		param.setHclassCd("G72");
		List<EgovMap> cnsLocalList = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("cnsLocalList", cnsLocalList);
		
		// 참여기관 코드
		param.setHclassCd("G39");
		List<EgovMap> partiInstList = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("partiInstList", partiInstList);

		EgovMap map = (EgovMap) request.getSession().getAttribute("LoginVO");
		model.addAttribute("map", map);
		
		int ntwNo = Integer.parseInt(vo.getNtwkMeetNo());
		
		if (ntwNo != 0) {
			EgovMap result = reportService.getNtwkMeetRptDtl(vo);
			model.addAttribute("result", result);
		}
		return "report/ntwkMeetRpt_dtl.main";
	}

	// 네트워크구축회의보고서 등록, 수정
	@RequestMapping(value = "/ntwkMeetRptSave.do", method = RequestMethod.POST)
	public String ntwkMeetRptSave(NtwkMeetRptVO vo, HttpServletRequest request, ModelMap model) {
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		String save = request.getParameter("save");
		model.addAttribute("mnuCd", mnuCd);

		EgovMap map = (EgovMap) request.getSession().getAttribute("LoginVO");
		
		vo.setInputNm(map.get("userNm").toString());
		if (save.equals("I")) {
			reportService.insertNtwkMeetRpt(vo);
		} else if(save.equals("U")) {
			reportService.updateNtwkMeetRpt(vo);
		} else if (save.equals("D")) {
			reportService.deleteNtwkMeetRpt(vo);
		}

		return "redirect:/gnoincoundb/ntwkMeetRptList.do?mnuCd=" + mnuCd;

	}
	

	// 네트워크구축회의보고서 파일 삭제
	@RequestMapping(value = "/ntwkMeetRptFileDel.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String ntwkMeetRptFileDel(HttpServletRequest request, ModelMap model, NtwkMeetRptVO vo) {

		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		String save = request.getParameter("save");
		model.addAttribute("mnuCd", mnuCd);
		reportService.updateNtwkMeetRpt(vo);
		return "jsonView";
	}
	
	// 교육활동보고서 목록
	@RequestMapping(value = "/eduAtvyRptList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String eduAtvyRptList(HttpServletRequest request, ModelMap model, EduAtvyRptVO vo) {

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
		// 권한 관리 끝

		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd", mnuCd);

		// 상담구분 코드
		GroupVO param = new GroupVO();
		param.setHclassCd("G15");
		List<EgovMap> cnsGbList = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("cnsGbList", cnsGbList);

		// 교육대상자 코드
		param.setHclassCd("G78");
		List<EgovMap> EduManList = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("EduManList", EduManList);
		
		// 센터구분
		CenterVO centerVO = new CenterVO();
		List<EgovMap> cnsCenterList = adminManageService.getCenterManageList(centerVO);
		model.addAttribute("cnsCenterList", cnsCenterList);

		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(vo.getCurrentPageNo()); // 현재 페이지 번호
		paginationInfo.setRecordCountPerPage(10); // 한 페이지에 게시되는 게시물 건수
		paginationInfo.setPageSize(10); // 페이징 리스트의 사이즈

		vo.setFirstIndex((vo.getCurrentPageNo() - 1) * 10);
		vo.setLastIndex((vo.getCurrentPageNo()) * 10);

		List<EgovMap> eduAtvyRptList = reportService.getEduAtvyRptList(vo);
		int totalPageCnt = reportService.getEduAtvyRptListTotCnt(vo);
		model.addAttribute("totalPageCnt", totalPageCnt);
		paginationInfo.setTotalRecordCount(totalPageCnt); // 전체 게시물 건 수
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("eduAtvyRptList", eduAtvyRptList);
		model.addAttribute("vo", vo);
		return "report/eduAtvyRpt_list.main";
	}

	// 교육활동보고서 상세
	@RequestMapping(value = "/eduAtvyRptDtl.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String eduAtvyRptDtl(EduAtvyRptVO vo, HttpServletRequest request, ModelMap model) {
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
		model.addAttribute("userId", loginVo.get("userId").toString());
		model.addAttribute("centerGb", userCenterGb);

		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd", mnuCd);

		// 상담구분 코드
		GroupVO param = new GroupVO();
		param.setHclassCd("G15");
		List<EgovMap> cnsGbList = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("cnsGbList", cnsGbList);

		// 권역구분 코드
		param.setHclassCd("G71");
		List<EgovMap> cnsZoneList = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("cnsZoneList", cnsZoneList);

		// 지역구분 코드
		param.setHclassCd("G72");
		List<EgovMap> cnsLocalList = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("cnsLocalList", cnsLocalList);

		// 센터구분
		CenterVO centerVO = new CenterVO();
		List<EgovMap> cnsCenterList = adminManageService.getCenterManageList(centerVO);
		model.addAttribute("cnsCenterList", cnsCenterList);
				
		// 진행자
		param.setHclassCd("G91");
		List<EgovMap> hostList = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("hostList", hostList);

		// 교육구분 코드
		param.setHclassCd("G75");
		List<EgovMap> cnsEduList = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("cnsEduList", cnsEduList);

		// 교육주제 코드
		param.setHclassCd("G76");
		List<EgovMap> cnsEdu2List = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("cnsEdu2List", cnsEdu2List);

		// 교육방법 코드
		param.setHclassCd("G77");
		List<EgovMap> cnsEdu3List = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("cnsEdu3List", cnsEdu3List);

		// 교육대상자 코드
		param.setHclassCd("G78");
		List<EgovMap> cnsEdu4List = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("cnsEdu4List", cnsEdu4List);

		EgovMap map = (EgovMap) request.getSession().getAttribute("LoginVO");
		model.addAttribute("map", map);

		int eduNo = Integer.parseInt(vo.getEduAtvyNo());
		
		if (eduNo != 0) {
			EgovMap result = reportService.getEduAtvyRptDtl(vo);
			model.addAttribute("result", result);
		}

		return "report/eduAtvyRpt_dtl.main";
	}

	// 교육활동보고서 등록, 수정
	@RequestMapping(value = "/eduAtvyRptSave.do", method = RequestMethod.POST)
	public String eduAtvyRptSave(EduAtvyRptVO vo, HttpServletRequest request, ModelMap model) {
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		String save = request.getParameter("save");
		model.addAttribute("mnuCd", mnuCd);

		EgovMap map = (EgovMap) request.getSession().getAttribute("LoginVO");
		vo.setInputNm((String) map.get("userNm"));
		vo.setCnsrId((String) map.get("userId"));
		if (save.equals("I")) {
			reportService.insertEduAtvyRpt(vo);
		} else if (save.equals("U")){
			reportService.updateEduAtvyRpt(vo);
		} else if (save.equals("D")) {
			reportService.deleteEduAtvyRpt(vo);
		}

		return "redirect:/gnoincoundb/eduAtvyRptList.do?mnuCd=" + mnuCd;
	}
	
	// 교육활동보고서 파일 삭제
	@RequestMapping(value = "/eduAtvyRptFileDel.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String eduAtvyRptFileDel(HttpServletRequest request, ModelMap model, EduAtvyRptVO vo) {

		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		String save = request.getParameter("save");
		model.addAttribute("mnuCd", mnuCd);
		reportService.updateEduAtvyRpt(vo);
		return "jsonView";
	}

	// 홍보활동보고서 목록
	@RequestMapping(value = "/prAtvyRptList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String prAtvyRptList(HttpServletRequest request, ModelMap model, PrAtvyRptVO vo) {

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
		// 권한 관리 끝
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd", mnuCd);

		// 상담구분 코드
		GroupVO param = new GroupVO();
		param.setHclassCd("G15");
		List<EgovMap> cnsGbList = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("cnsGbList", cnsGbList);

		// 지역구분 코드
		param.setHclassCd("G42");
		List<EgovMap> promotionList = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("promotionList", promotionList);
		
		// 센터구분
		CenterVO centerVO = new CenterVO();
		List<EgovMap> cnsCenterList = adminManageService.getCenterManageList(centerVO);
		model.addAttribute("cnsCenterList", cnsCenterList);

		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(vo.getCurrentPageNo()); // 현재 페이지 번호
		paginationInfo.setRecordCountPerPage(10); // 한 페이지에 게시되는 게시물 건수
		paginationInfo.setPageSize(10); // 페이징 리스트의 사이즈

		vo.setFirstIndex((vo.getCurrentPageNo() - 1) * 10);
		vo.setLastIndex((vo.getCurrentPageNo()) * 10);

		List<EgovMap> prAtvyRptList = reportService.getPrAtvyRptList(vo);
		int totalPageCnt = reportService.getPrAtvyRptListTotCnt(vo);
		model.addAttribute("totalPageCnt", totalPageCnt);
		paginationInfo.setTotalRecordCount(totalPageCnt); // 전체 게시물 건 수
		model.addAttribute("paginationInfo", paginationInfo);

		model.addAttribute("prAtvyRptList", prAtvyRptList);
		model.addAttribute("vo", vo);
		return "report/prAtvyRpt_list.main";
	}

	// 홍보활동보고서 상세
	@RequestMapping(value = "/prAtvyRptDtl.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String prAtvyRptDtl(PrAtvyRptVO vo, HttpServletRequest request, ModelMap model) {

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
		model.addAttribute("userId", loginVo.get("userId").toString());
		model.addAttribute("centerGb", userCenterGb);

		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd", mnuCd);

		// 상담구분 코드
		GroupVO param = new GroupVO();
		param.setHclassCd("G15");
		List<EgovMap> cnsGbList = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("cnsGbList", cnsGbList);

		// 지역구분 코드
		param.setHclassCd("G72");
		List<EgovMap> cnsLocalList = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("cnsLocalList", cnsLocalList);
		
		// 홍보 코드
		param.setHclassCd("G42");
		List<EgovMap> promotionList = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("promotionList", promotionList);

		// 센터구분
		CenterVO centerVO = new CenterVO();
		List<EgovMap> cnsCenterList = adminManageService.getCenterManageList(centerVO);
		model.addAttribute("cnsCenterList", cnsCenterList);

		// 홍보활동 코드
		param.setHclassCd("G79");
		List<EgovMap> cnsPrAreaList = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("cnsPrAreaList", cnsPrAreaList);

		// 대상자 코드
		param.setHclassCd("G78");
		List<EgovMap> cnsEdu4List = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("cnsEdu4List", cnsEdu4List);
		
		// 홍보참여자구분 코드
		param.setHclassCd("G92");
		List<EgovMap> prAtvyPtctList = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("prAtvyPtctList", prAtvyPtctList);

		
		EgovMap map = (EgovMap) request.getSession().getAttribute("LoginVO");
		model.addAttribute("map", map);

		int atvyNo = Integer.parseInt(vo.getPrAtvyNo());
		
		if (atvyNo != 0) {
			EgovMap result = reportService.getPrAtvyRptDtl(vo);
			model.addAttribute("result", result);
		}

		return "report/prAtvyRpt_dtl.main";
	}

	// 홍보활동보고서 등록, 수정
	@RequestMapping(value = "/prAtvyRptSave.do", method = RequestMethod.POST)
	public String prAtvyRptSave(PrAtvyRptVO vo, HttpServletRequest request, ModelMap model) {
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		String save = request.getParameter("save");
		model.addAttribute("mnuCd", mnuCd);

		EgovMap map = (EgovMap) request.getSession().getAttribute("LoginVO");
		vo.setInputNm((String) map.get("userNm"));
		vo.setSigunCd((String) map.get("sigunCd"));
		vo.setCnsrId((String) map.get("userId"));
		if (save.equals("I")) {
			reportService.insertPrAtvyRpt(vo);
		} else if (save.equals("U")) {
			reportService.updatePrAtvyRpt(vo);
		} else if (save.equals("D")) {
			reportService.deletePrAtvyRpt(vo);
		}

		return "redirect:/gnoincoundb/prAtvyRptList.do?mnuCd=" + mnuCd;
	}
	
	// 홍보활동보고서 파일 삭제
	@RequestMapping(value = "/prAtvyRptFileDel.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String prAtvyRptFileDel(HttpServletRequest request, ModelMap model, PrAtvyRptVO vo) {

		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		String save = request.getParameter("save");
		model.addAttribute("mnuCd", mnuCd);
		reportService.updatePrAtvyRpt(vo);
		return "jsonView";
	}

	// 마음 나눔 봉사단
	@RequestMapping(value = "/mindSharing.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String mindSharingList(mindSharingVO vo, HttpServletRequest request, ModelMap model) {

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
		// 권한 관리 끝

		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd", mnuCd);

		// EgovMap resultVO = (EgovMap) request.getSession().getAttribute("LoginVO");

		// 상담구분 코드
		GroupVO param = new GroupVO();
		param.setHclassCd("G15");
		List<EgovMap> cnsGbList = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("cnsGbList", cnsGbList);

		// 센터구분
		CenterVO centerVO = new CenterVO();
		List<EgovMap> cnsCenterList = adminManageService.getCenterManageList(centerVO);
		model.addAttribute("cnsCenterList", cnsCenterList);

		vo.setbGubun(0);

		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(vo.getCurrentPageNo()); // 현재 페이지 번호
		paginationInfo.setRecordCountPerPage(10); // 한 페이지에 게시되는 게시물 건수
		paginationInfo.setPageSize(10); // 페이징 리스트의 사이즈

		vo.setFirstIndex((vo.getCurrentPageNo() - 1) * 10);
		vo.setLastIndex((vo.getCurrentPageNo()) * 10);

		List<EgovMap> mindSharingList = reportService.getMindSharingList(vo);
		int totalPageCnt = reportService.getMindSharingCnt(vo);

		model.addAttribute("totalPageCnt", totalPageCnt);
		paginationInfo.setTotalRecordCount(totalPageCnt); // 전체 게시물 건 수
		model.addAttribute("paginationInfo", paginationInfo);

		model.addAttribute("mindSharingList", mindSharingList);
		model.addAttribute("vo", vo);
		return "report/mindSharing.main";
	}

	// 마음 나눔 봉사단 상세
	@RequestMapping(value = "/mindSharing_dtl.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String mindSharingDetails(mindSharingVO vo, HttpServletRequest request, ModelMap model) {
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
		} else {
			vo.setSchCenterGb(Integer.toString(userCenterGb));
		}
		model.addAttribute("authCd", userAuth);
		model.addAttribute("userId", loginVo.get("userId").toString());
		model.addAttribute("userNm", loginVo.get("userNm").toString());

		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd", mnuCd);

		// EgovMap resultVO = (EgovMap) request.getSession().getAttribute("LoginVO");

		// 상담구분 코드
		GroupVO param = new GroupVO();
		param.setHclassCd("G15");
		List<EgovMap> cnsGbList = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("cnsGbList", cnsGbList);
		
		param.setHclassCd("G38");
		List<EgovMap> cnsVolunList = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("cnsVolunList", cnsVolunList);

		// 센터구분
		CenterVO centerVO = new CenterVO();
		List<EgovMap> cnsCenterList = adminManageService.getCenterManageList(centerVO);
		model.addAttribute("cnsCenterList", cnsCenterList);

		EgovMap mindSharingDetail = reportService.getgetMindSharingDtl(vo);

		if (vo.getFileName() != null) {
			try {
				vo.setSysFileName(AES256Crypto.getInstance().AESEncode(vo.getSysFileName()));
				System.out.println("AES ENCODE  : " + vo.getSysFileName());
			} catch (IOException err) {
				System.out.println("AES ENCODE ERROR.IO");
				utility.func.Logging(this.getClass().getName(), err);
			} catch (InvalidKeyException e) {
				System.out.println("AES ENCODE ERROR.KEY");
				utility.func.Logging(this.getClass().getName(), e);
			} catch (NoSuchAlgorithmException e) {
				System.out.println("AES ENCODE ERROR.ALG");
				utility.func.Logging(this.getClass().getName(), e);
			} catch (NoSuchPaddingException e) {
				System.out.println("AES ENCODE ERROR.PAD");
				utility.func.Logging(this.getClass().getName(), e);
			} catch (InvalidAlgorithmParameterException e) {
				System.out.println("AES ENCODE ERROR.PAR");
				utility.func.Logging(this.getClass().getName(), e);
			} catch (IllegalBlockSizeException e) {
				System.out.println("AES ENCODE ERROR.BLO");
				utility.func.Logging(this.getClass().getName(), e);
			} catch (BadPaddingException e) {
				System.out.println("AES ENCODE ERROR.BAD");
				utility.func.Logging(this.getClass().getName(), e);
			}
		}
		model.addAttribute("vo", vo);
		model.addAttribute("detail", mindSharingDetail);
		// return "jsonView";
		return "report/mindSharing_dtl.main";
	}

	// 마음 나눔 봉사단 등록/수정
	@RequestMapping(value = "/mindSharing_proc.do", method = RequestMethod.POST)
	public String mindSharing_proc(mindSharingVO vo, HttpServletRequest request, ModelMap model) {
		EgovMap login = (EgovMap) request.getSession().getAttribute("LoginVO");

		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		String save = request.getParameter("save");
		model.addAttribute("mnuCd", mnuCd);

		if (!vo.getDelYn().equals("Y"))
			vo.setDelYn("N");
		
		String url = null;
		
		if(vo.getbGubun() == 1) {
			url = "gender";
		}

		vo.setUserNum(login.get("userNm").toString());
		vo.setCnsrId(login.get("userId").toString());
		if (save.equals("I")) {
			reportService.insertMindSharing(vo);
		} else if (save.equals("U")) {
			reportService.updateMindSharing(vo);
		} else if (save.equals("D")) {
			reportService.deleteMindSharing(vo);
		}
		
		if (url == "gender") {
			return "redirect:/gnoincoundb/genderAwareness.do?mnuCd=" + mnuCd;
		} else {
			return "redirect:/gnoincoundb/mindSharing.do?mnuCd=" + mnuCd;
		}
	}
	
	// 마음나눔봉사단 파일 삭제
	@RequestMapping(value = "/mindSharingFileDel.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String mindSharingFileDel(HttpServletRequest request, ModelMap model, mindSharingVO vo) {

		EgovMap login = (EgovMap) request.getSession().getAttribute("LoginVO");
		vo.setUserNum(login.get("userNm").toString());
		
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		String save = request.getParameter("save");
		model.addAttribute("mnuCd", mnuCd);
		reportService.updateMindSharing(vo);
		return "jsonView";
	}

	// 성인식개선사업
	@RequestMapping(value = "/genderAwareness.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String genderAwareness(mindSharingVO vo, HttpServletRequest request, ModelMap model) {

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
			System.out.println("Don't Have Auth : user Center Gb : " + Integer.toString(userCenterGb));
		}

		model.addAttribute("authCd", userAuth);
		// 권한 관리 끝

		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd", mnuCd);

		// 상담구분 코드
		GroupVO param = new GroupVO();
		param.setHclassCd("G15");
		List<EgovMap> cnsGbList = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("cnsGbList", cnsGbList);

		// 센터구분
		CenterVO centerVO = new CenterVO();
		List<EgovMap> cnsCenterList = adminManageService.getCenterManageList(centerVO);
		model.addAttribute("cnsCenterList", cnsCenterList);

		vo.setbGubun(1);

		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(vo.getCurrentPageNo()); // 현재 페이지 번호
		paginationInfo.setRecordCountPerPage(10); // 한 페이지에 게시되는 게시물 건수
		paginationInfo.setPageSize(10); // 페이징 리스트의 사이즈

		vo.setFirstIndex((vo.getCurrentPageNo() - 1) * 10);
		vo.setLastIndex((vo.getCurrentPageNo()) * 10);

		List<EgovMap> mindSharingList = reportService.getMindSharingList(vo);
		int totalPageCnt = reportService.getMindSharingCnt(vo);

		model.addAttribute("totalPageCnt", totalPageCnt);
		paginationInfo.setTotalRecordCount(totalPageCnt); // 전체 게시물 건 수
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("vo", vo);
		model.addAttribute("mindSharingList", mindSharingList);
		return "report/genderAwareness.main";

	}

}
