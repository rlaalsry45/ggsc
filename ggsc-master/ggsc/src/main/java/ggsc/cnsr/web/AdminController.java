package ggsc.cnsr.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import ggsc.cnsr.service.AdminManageService;
import ggsc.cnsr.service.AdminVO;
import ggsc.cnsr.service.CenterVO;
import ggsc.cnsr.service.GroupVO;
import ggsc.cnsr.service.SecurityVO;
import ggsc.com.util.service.ComCodeService;
import ggsc.join.service.CnsrVO;
import ggsc.join.service.UsermVO;


@Controller

public class AdminController {
	
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;	
	 
	 
	@Resource(name = "AdminManageService")
	private AdminManageService adminManageService;
	
	@Resource(name = "comCodeService")
	private ComCodeService comCodeService;
	
	@RequestMapping(value = "/counsellor_mng_list.do", method = RequestMethod.GET )
	public String counsellor_mngList(HttpServletRequest request, ModelMap model, AdminVO vo) {		
		
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
		
		// 상담구분 코드
		GroupVO param = new GroupVO();
		param.setHclassCd("G15");
		List<EgovMap> cnsGbList = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("cnsGbList", cnsGbList);
		
		// 상담사구분 코드
		param.setHclassCd("G19");
		List<EgovMap> cnsrGbList = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("cnsrGbList", cnsrGbList);
		
		// 센터구분 코드
		CenterVO centerVO = new CenterVO();
		List<EgovMap> cnsCenterList = adminManageService.getCenterManageList(centerVO);
		model.addAttribute("cnsCenterList", cnsCenterList);
		
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd", mnuCd);
		model.addAttribute("vo",vo);
		model.addAttribute("authCd", userAuth);
		return "opr/counsellor_mng_list.main";
	}
	
	@RequestMapping(value = "/counsellor_mng_list_ajax.do", method = RequestMethod.POST )
	public String counsellor_mngList_ajax(HttpServletRequest request, ModelMap model, AdminVO vo) {
		
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
		
		switch (userAuth) {
		case 1: vo.setAuthCd(1); break; 
		case 2: vo.setAuthCd(2); break; 
			default: vo.setAuthCd(3); break; 
		}
		vo.setUserId((String)loginVo.get("userId"));
		
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(vo.getCurrentPageNo()); // 현재 페이지 번호
		paginationInfo.setRecordCountPerPage(10); // 한 페이지에 게시되는 게시물 건수
		paginationInfo.setPageSize(10); // 페이징 리스트의 사이즈
		vo.setFirstIndex((vo.getCurrentPageNo() - 1) * 10);
		vo.setLastIndex((vo.getCurrentPageNo()) * 10);
		
		List<EgovMap> list = adminManageService.getAdminManageList(vo);
		model.addAttribute("list", list);
		int totalPageCnt = adminManageService.getAdminMngTotalCnt(vo);
		
		model.addAttribute("totalPageCnt", totalPageCnt);
		paginationInfo.setTotalRecordCount(totalPageCnt); // 전체 게시물 건 수
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("vo", vo);
		return "jsonView";
	}
	
	@RequestMapping(value = "/counsellor_mngWrite.do", method = RequestMethod.GET )
	public String counsellor_mngWrite(HttpServletRequest request, @ModelAttribute("adminVO") AdminVO adminVO) {
		String cnsrCd = request.getParameter("cnsrCd") == null ? "" : request.getParameter("cnsrCd");
		if(cnsrCd == "") {
			String CNSR_CD = adminManageService.getCnsrMngCnsrCd();
			adminVO.setCnsrCd(CNSR_CD);
		}
		adminManageService.insertCnsrMng(adminVO);
		return "redirect:/gnoincoundb/counsellor_mng_list.do";
	}
	
	@RequestMapping(value = "/counsellor_mng_dtl.do", method = {RequestMethod.GET, RequestMethod.POST} )
	public String counsellor_mng_dtl(HttpServletRequest request, ModelMap model, CnsrVO cnsrVO , UsermVO usermVO,SecurityVO securityVO) {
		
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
			cnsrVO.setSchCenterGb(Integer.toString(userCenterGb));
		}
		// 권한 관리 끝
		
		String userId = request.getParameter("userId") == null ? "" : request.getParameter("userId");
		model.addAttribute("userId", userId);
		
		String cnsleId = request.getParameter("cnsleId") == null ? "" : request.getParameter("cnsleId");
		model.addAttribute("cnsleId", cnsleId);
		
		String save = request.getParameter("save") == null ? "" : request.getParameter("save");
		String apprvYn = request.getParameter("apprvYn") == null ? "" : request.getParameter("apprvYn");
		String delete = request.getParameter("delete") == null? "" : request.getParameter("delete");
		// 상담사 정보 수정
		if(save !="") {
			adminManageService.updateCnsrMng(cnsrVO);
			adminManageService.updateUserM(usermVO);
		}
		// 상담사  승인,승인취소
		if(apprvYn !="") {
			adminManageService.updateCnsrApprv(cnsrVO);
			adminManageService.updateUserApprv(usermVO);
		}
		
		if(delete != "") {
			adminManageService.deleteCnsrMng(cnsrVO);
			adminManageService.deleteUserM(usermVO);
			adminManageService.deleteSecurity(securityVO);
		}
		
		EgovMap cnsr = null;
		if(userId !=""){
			cnsr = adminManageService.getAdminManageDetail(userId);
		}
		
		GroupVO groupVo = new GroupVO();
		groupVo.setHclassCd("G15");
		CenterVO centerVO = new CenterVO();
		List<EgovMap> cnsGbList = adminManageService.getGroupMngDtlMList(groupVo);
		List<EgovMap> cnsCenterList = adminManageService.getCenterManageList(centerVO);
		
		// groupVo.setHclassCd("G7");
		groupVo.setHclassCd("G88");
		List<EgovMap> eduGbList = adminManageService.getGroupMngDtlMList(groupVo);
		
		
		/*EgovMap cnsr = adminManageService.getAdminManageDetail(userId);*/
		model.addAttribute("detail", cnsr);
		model.addAttribute("cnsGbList", cnsGbList);
		model.addAttribute("eduGbList", eduGbList);
		model.addAttribute("cnsCenterList", cnsCenterList);
		model.addAttribute("page", request.getParameter("page"));
		model.addAttribute("vo", cnsrVO);
		model.addAttribute("authCd", userAuth);
		
		return "opr/counsellor_mng_dtl";
	}
	
	@RequestMapping(value = "/counsellor_mng_dtl_ajax.do", method = RequestMethod.POST )
	public String counsellor_mng_dtl_ajax(HttpServletRequest request, ModelMap model) {
		
		String userId = request.getParameter("userId") == null ? "" : request.getParameter("userId");
		model.addAttribute("userId", userId);
		String useYn = request.getParameter("useYn") == null ? "" : request.getParameter("useYn");
		
		if(useYn.equals("N")) {
			adminManageService.updateAdminCnsrWithdrawal(userId);
		} else if(useYn.equals("R")) {
			adminManageService.updateAdminCnsrReturn(userId);
		}
		
		EgovMap cnsr = null;
		if(userId !=""){
			cnsr = adminManageService.getAdminManageDetail(userId);
		}
		model.addAttribute("list", cnsr);
		model.addAttribute("page", request.getParameter("page"));
		return "jsonView";
	}

	
	// 삭제 예정인 상세보기
	@RequestMapping(value = "/counsellor_mngDetail.do", method = RequestMethod.GET )
	public String counsellor_mngDetail(HttpServletRequest request, ModelMap model) {
		String cnsrCd = request.getParameter("cnsrCd") == null ? "" : request.getParameter("cnsrCd");
		model.addAttribute("cnsrCd", cnsrCd);
		EgovMap cnsr = null;
		if(cnsrCd !=""){
			cnsr = adminManageService.getAdminManageDetail(cnsrCd);
		}
		model.addAttribute("detail", cnsr);
		model.addAttribute("page", request.getParameter("page"));
		return "opr/counsellor_mngDetail.main";
	}
	
	
	@RequestMapping(value = "/center_mng_list.do", method = RequestMethod.GET )
	public String center_mngList(HttpServletRequest request, ModelMap model) throws Exception {
		
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
		
		model.addAttribute("authCd", userAuth);
		
		// 왼쪽 메뉴바
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd", mnuCd);
		
		GroupVO param = new GroupVO();
		param.setHclassCd("G71");
		List<EgovMap> zoneGbList = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("zoneGbList", zoneGbList);
		
		param.setHclassCd("G72");
		List<EgovMap> localGbList = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("localGbList", localGbList);
		
		// 권역구분
		model.addAttribute("zoneGbCode", comCodeService.selectZoneGbList());
		
		return "opr/center_mng_list.main";
	}
	
	@RequestMapping(value = "/center_mng_list_ajax.do" , method = RequestMethod.POST )
	public String center_mng_list_ajax(HttpServletRequest request, ModelMap model, CenterVO vo) {
		
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
			vo.setSchCenterGb((String)loginVo.get("centerNm"));
		}
		
		vo.setAuthCd(userAuth);
		// vo.setSchCenterGb((String)loginVo.get("centerNm"));
		
		String num = request.getParameter("num") == null ? "" : request.getParameter("num");
		model.addAttribute("num", num);
		
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(vo.getCurrentPageNo()); // 현재 페이지 번호
		paginationInfo.setRecordCountPerPage(10); // 한 페이지에 게시되는 게시물 건수
		paginationInfo.setPageSize(10); // 페이징 리스트의 사이즈
		vo.setFirstIndex((vo.getCurrentPageNo() - 1) * 10);
		vo.setLastIndex((vo.getCurrentPageNo()) * 10);
		
		List<EgovMap> list = adminManageService.getCenterMngList(vo);
		model.addAttribute("list", list);
		int totalPageCnt = adminManageService.getCenterMngTotalCnt(vo);
		
		model.addAttribute("totalPageCnt", totalPageCnt);
		paginationInfo.setTotalRecordCount(totalPageCnt); // 전체 게시물 건 수
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("vo", vo);
		return "jsonView";
	}
	
	@RequestMapping(value = "/center_mng_dtl_ajax.do", method = RequestMethod.POST )
	public String center_mng_dtl_ajax(HttpServletRequest request, ModelMap model, CenterVO vo) {
		String num = request.getParameter("num") == null ? "" : request.getParameter("num");
		model.addAttribute("num", num);
	
		List<EgovMap> list = adminManageService.getZoneGbList(vo);
		model.addAttribute("list", list);		
		model.addAttribute("vo", vo);
		return "jsonView";
	}
	
	@RequestMapping(value = "/center_mng_dtl.do", method = RequestMethod.GET)
	public String center_mng_dtl(HttpServletRequest request, ModelMap model) {
		
		// 왼쪽 메뉴바
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd", mnuCd);
		int num = request.getParameter("num") != null ? Integer.parseInt(request.getParameter("num")) : 0;
		model.addAttribute("num", num);
		
		GroupVO param = new GroupVO();
		param.setHclassCd("G71");
		List<EgovMap> zoneGbList = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("zoneGbList", zoneGbList);
		
		param.setHclassCd("G72");
		List<EgovMap> localGbList = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("localGbList", localGbList);
		
		
		if(num != 0) {
			EgovMap centerDtl = null;
			centerDtl = adminManageService.getCenterManageDetail(num);
			model.addAttribute("detail", centerDtl);
		}
		model.addAttribute("page", request.getParameter("page"));
		
		return "opr/center_mng_dtl.main";
	}
	
	@RequestMapping(value = "/centerCheck_ajax.do", method = RequestMethod.POST)
	public String idCheckAjax(HttpServletRequest request, ModelMap model){
		
		String centerNm = request.getParameter("centerNm") == null ? "" : request.getParameter("centerNm");
		
		int ctYn = adminManageService.centerCheck(centerNm);
		String centerCheck = "";
		String msg = "";
		if(ctYn > 0){
			centerCheck = "N";
			msg = "이미 등록된 센터명입니다.";
		}else{
			centerCheck = "Y";
			msg = "등록 가능한 센터명입니다.";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("centerCheck", centerCheck);
		return "jsonView";
	}
	
	@RequestMapping(value = "/center_mng_write.do", method = RequestMethod.POST )
	public String center_mng_write(HttpServletRequest request, @ModelAttribute("centerVO") CenterVO centerVO, BindingResult bindingResult, ModelMap model) {
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		int num = request.getParameter("num") != null ? Integer.parseInt(request.getParameter("num")) : 0;
		
		beanValidator.validate(centerVO, bindingResult);
		if(bindingResult.hasErrors()) {
			return "redirect:/gnoincoundb/center_mng_dtl.do?mnuCd=" + mnuCd + "&num=" + num;
		}
		
		if(num == 0) {
			// 센터관리 등록
			adminManageService.insertCenterMng(centerVO);
		} else {
			// 센터관리 수정
			adminManageService.updateCenterMng(centerVO);			
		}
		return "redirect:/gnoincoundb/center_mng_list.do?mnuCd=" + mnuCd;
	}
	
	// 
	
	@RequestMapping(value = "/grouping_mng_list.do", method = RequestMethod.GET )
	public String grouping_mng_list(HttpServletRequest request, ModelMap model) {
		
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
		
		model.addAttribute("authCd", userAuth);
		
		// 왼쪽 메뉴바
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd", mnuCd);
		return "opr/grouping_mng_list.main";
	}
	
	@RequestMapping(value = "/grouping_mng_list_ajax.do", method = RequestMethod.POST)
	public String grouping_mng_list_ajax(HttpServletRequest request, ModelMap model, GroupVO vo) {
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(vo.getCurrentPageNo()); // 현재 페이지 번호
		paginationInfo.setRecordCountPerPage(10); // 한 페이지에 게시되는 게시물 건수
		paginationInfo.setPageSize(10); // 페이징 리스트의 사이즈
		vo.setFirstIndex((vo.getCurrentPageNo() - 1) * 10);
		vo.setLastIndex((vo.getCurrentPageNo()) * 10);
		
		List<EgovMap> list = adminManageService.getGroupManageList(vo);
		model.addAttribute("list", list);
		int totalPageCnt = adminManageService.getGroupMngTotalCnt(vo);
		
		model.addAttribute("totalPageCnt", totalPageCnt);
		paginationInfo.setTotalRecordCount(totalPageCnt); // 전체 게시물 건 수
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("vo", vo);
		
		return "jsonView";
	}
	
	@RequestMapping(value = "/grouping_mng_dtl.do", method =  RequestMethod.GET )
	public String grouping_mng_dtl(HttpServletRequest request, ModelMap model) {
		
		String schHclassNm = request.getParameter("schHclassNm") == null ? "" : request.getParameter("schHclassNm");
		model.addAttribute("schHclassNm", schHclassNm);
		
		String mclassCd = request.getParameter("mclassCd") == null ? "" : request.getParameter("mclassCd");
		model.addAttribute("mclassCd", mclassCd);

		// 왼쪽 메뉴바
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd", mnuCd);
		
		model.addAttribute("page", request.getParameter("page"));
		return "opr/grouping_mng_dtl.main";
	}
	
	@RequestMapping(value = "/grouping_mng_dtl_ajax.do", method = RequestMethod.POST )
	public String grouping_mng_dtl_ajax(HttpServletRequest request, ModelMap model, GroupVO vo) {
		String hclList = request.getParameter("hclList") == null ? "" : request.getParameter("hclList");
		String addHclassNm = request.getParameter("addHclassNm") == null ? "" : request.getParameter("addHclassNm");
		String mclList = request.getParameter("mclList") == null ? "" : request.getParameter("mclList");
		String addHclassCd = request.getParameter("addHclassCd") == null ? "" : request.getParameter("addHclassCd");
		String addMclassNm = request.getParameter("addMclassNm") == null ? "" : request.getParameter("addMclassNm");
		String sclList = request.getParameter("sclList") == null ? "" : request.getParameter("sclList");
		String addMclassCd = request.getParameter("addMclassCd") == null ? "" : request.getParameter("addMclassCd");
		String addSclassNm = request.getParameter("addSclassNm") == null ? "" : request.getParameter("addSclassNm");
		
		EgovMap loginVo =  (EgovMap) request.getSession().getAttribute("LoginVO");
		vo.setRegId((String)loginVo.get("userId"));
		/*String schHclassNm = request.getParameter("schHclassNm");*/
		
		// 대분류 등록
		if(addHclassNm != "") {
			GroupVO tempVO = new GroupVO();
			tempVO.setFirstIndex(1);
			tempVO.setSchHclassNm(addHclassNm);
			int tempCnt = adminManageService.getGroupMngInsertTest(tempVO);
			System.out.println("대분류 COUNT : " + tempCnt);
			if(tempCnt>0) {
				model.addAttribute("error", "동일한 대분류명이 존재하여 생성할 수 없습니다.");
				return "jsonView";
			}else {
				vo.setHclassNm(addHclassNm);
				adminManageService.insertGroupMngHcd(vo);
			}
		}
		// 중분류 등록
		if(addMclassNm != "") {
			GroupVO tempVO = new GroupVO();
			tempVO.setFirstIndex(2);
			tempVO.setSchHclassNm(addHclassCd);
			tempVO.setSchMclassNm(addMclassNm);
			int tempCnt = adminManageService.getGroupMngInsertTest(tempVO);
			System.out.println("중분류 COUNT : " + tempCnt);
			if(tempCnt>0) {
				model.addAttribute("error", "동일한 중분류명이 존재하여 생성할 수 없습니다.");
				return "jsonView";
			}else {
				vo.setHclassCd(addHclassCd);
				vo.setMclassNm(addMclassNm);
				adminManageService.insertGroupMngMcd(vo);	
			}
			
			
		}
		// 소분류 등록
		if(addSclassNm != "") {
			GroupVO tempVO = new GroupVO();
			tempVO.setFirstIndex(3);
			tempVO.setSchMclassNm(addMclassCd);
			tempVO.setschSclassNm(addSclassNm);
			int tempCnt = adminManageService.getGroupMngInsertTest(tempVO);
			System.out.println("소분류 COUNT : " + tempCnt);
			if(tempCnt>0) {
				model.addAttribute("error", "동일한 소분류명이 존재하여 생성할 수 없습니다.");
				return "jsonView";
			}else {
				vo.setMclassCd(addMclassCd);
				vo.setSclassNm(addSclassNm);
				adminManageService.insertGroupMngScd(vo);	
			}
			
			
		}
		// 대분류 클릭시 중분류 list 출력 
		if(mclList != "") {
			vo.setHclassCd(mclList);
			List<EgovMap> listM = adminManageService.getGroupMngDtlMList(vo);
			model.addAttribute("listM", listM);			
		}
		
		// 중분류 클릭시 소분류 list 출력 
		if(sclList != "") {
			vo.setMclassCd(sclList);
			vo.setHclassCd(hclList);
			List<EgovMap> listS = adminManageService.getGroupMngDtlSList(vo);
			model.addAttribute("listS", listS);			
		}
		
		// 대분류 list 출력
		List<EgovMap> listH = adminManageService.getGroupMngDtlHList(vo);
		model.addAttribute("listH", listH);
		model.addAttribute("vo", vo);
		
		return "jsonView";
	}
	
	// ajax으로 등록처리해서 사용하지않음
	@RequestMapping(value = "/grouping_mng_write.do", method = RequestMethod.POST )
	public String grouping_mng_write(HttpServletRequest request, @ModelAttribute("GroupVO") GroupVO vo) {
		String hclassNm = request.getParameter("hclassNm") == null ? "" : request.getParameter("hclassNm");
		String mclassNm = request.getParameter("mclassNm") == null ? "" : request.getParameter("mclassNm");
		if(hclassNm != "") {
			adminManageService.insertGroupMngHcd(vo);
		} else if(mclassNm != "") {
			adminManageService.insertGroupMngMcd(vo);
		}
		return "redirect:/gnoincoundb/grouping_mng_dtl.do";
	}
	
	@RequestMapping(value = "/securityPledge_popup.do", method = { RequestMethod.GET, RequestMethod.POST } )
	public String securityPledge_popup(HttpServletRequest request, ModelMap model, AdminVO vo) {
		// 왼쪽 메뉴바
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd", mnuCd);
		String userId = request.getParameter("userId") == null ? "" : request.getParameter("userId");
		model.addAttribute("userId", userId);
		
		// 관리자 정보
		EgovMap detail = adminManageService.getAdminUserInfo(vo);
		model.addAttribute("detail",detail);
		return "opr/securityPledge_popup";
	}
	
	@RequestMapping(value = "/securityPledge_dtl_popup.do", method = { RequestMethod.GET, RequestMethod.POST } )
	public String securityPledge_dtl_popup(HttpServletRequest request, ModelMap model, SecurityVO vo) {
		// 왼쪽 메뉴바
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd", mnuCd);
		String userId = request.getParameter("userId") == null ? "" : request.getParameter("userId");
		model.addAttribute("userId", userId);
		
		// 관리자 정보
		EgovMap detail = adminManageService.getSecurityInfo(vo);
		model.addAttribute("detail",detail);
		return "opr/securityPledge_dtl_popup";
	}
	
	
	@RequestMapping(value = "/securityPledge_reg_ajax.do", method = RequestMethod.POST )
	public String securityPledge_reg_ajax(HttpServletRequest request, ModelMap model, SecurityVO vo) {
		// 보안서약서 등록
		adminManageService.insertSecurity(vo);
		
		return "jsonView";
	}
	
	
	@RequestMapping(value = "/securityPledge_upd_ajax.do", method = RequestMethod.POST )
	public String securityPledge_upd_ajax(HttpServletRequest request, ModelMap model, SecurityVO vo) {
		
		
		// 보안서약서 수정
		adminManageService.updateSecurity(vo);
		
		return "jsonView";
	}
	
	@RequestMapping(value = "/securityPledge_del.do", method = RequestMethod.POST )
	public String securityPledge_del(HttpServletRequest request, ModelMap model, SecurityVO vo) {
		
		
		// 보안서약서 삭제
		adminManageService.deleteSecurity(vo);
		
		return "jsonView";
	}
	
}
