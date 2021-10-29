package ggsc.cmmmng.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import ggsc.cmmmng.service.AuthMngVO;
import ggsc.cmmmng.service.AuthorityMngVO;
import ggsc.cmmmng.service.CommonMngService;
import ggsc.cmmmng.service.MemberMngVO;
import ggsc.cnsr.service.AdminManageService;
import ggsc.cnsr.service.GroupVO;


@Controller

public class CommonMngController {

	@Resource(name = "commonMngService")
	private CommonMngService commonMngService;
	
	@Resource(name = "AdminManageService")
	private AdminManageService adminManageService;
	
	@RequestMapping(value = "/memberMngList.do", method = {RequestMethod.POST,RequestMethod.GET})
	public String memberMngList(MemberMngVO vo, HttpServletRequest request, ModelMap model){	
		/*
		if(request.getParameter("page") != null){
			model.addAttribute("page", request.getParameter("page"));
		}
		*/
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd", mnuCd);
		
		/*PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(vo.getCurrentPageNo()); // 현재 페이지 번호
		paginationInfo.setRecordCountPerPage(10); // 한 페이지에 게시되는 게시물 건수
		paginationInfo.setPageSize(10); // 페이징 리스트의 사이즈

		vo.setFirstIndex((vo.getCurrentPageNo() - 1) * 10);
		vo.setLastIndex((vo.getCurrentPageNo()) * 10);
		
		List<EgovMap> memberList = commonMngService.getMemberMngList(vo);
		
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@ firstIndex 값 : "+vo.getFirstIndex()+"lastIndex 값 : "+vo.getLastIndex());

		int totalPageCnt = commonMngService.getMemberMngListTotCnt(vo);
		model.addAttribute("totalPageCnt", totalPageCnt);
		paginationInfo.setTotalRecordCount(totalPageCnt); // 전체 게시물 건 수
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("memberList", memberList);
		model.addAttribute("vo", vo);*/
		
		return "cmmmng/memberMng_list.main";
	}
	
	@RequestMapping(value = "/memberMngListAjax.do", method = {RequestMethod.POST,RequestMethod.GET})
	public String memberMngListAjax(MemberMngVO vo, HttpServletRequest request, ModelMap model){	
		/*
		if(request.getParameter("page") != null){
			model.addAttribute("page", request.getParameter("page"));
		}
		*/
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd", mnuCd);
		
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(vo.getCurrentPageNo()); // 현재 페이지 번호
		paginationInfo.setRecordCountPerPage(10); // 한 페이지에 게시되는 게시물 건수
		paginationInfo.setPageSize(10); // 페이징 리스트의 사이즈

		vo.setFirstIndex((vo.getCurrentPageNo() - 1) * 10);
		vo.setLastIndex((vo.getCurrentPageNo()) * 10);
		
		List<EgovMap> memberList = commonMngService.getMemberMngList(vo);

		int totalPageCnt = commonMngService.getMemberMngListTotCnt(vo);
		model.addAttribute("totalPageCnt", totalPageCnt);
		paginationInfo.setTotalRecordCount(totalPageCnt); // 전체 게시물 건 수
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("list", memberList);
		model.addAttribute("vo", vo);
		
		return "jsonView";
	}
	
	@RequestMapping(value = "/memberMngDtl.do", method = {RequestMethod.POST,RequestMethod.GET})
	public String memberMngDtl(MemberMngVO vo, HttpServletRequest request, ModelMap model){
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd", mnuCd);
		String userId = request.getParameter("userId") == null ? "" : request.getParameter("userId");
		if(userId != null) {
			vo.setUserId(userId);
		}
		
		GroupVO param = new GroupVO();
		param.setHclassCd("G81");
		List<EgovMap> authorityGbList = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("authorityGbList", authorityGbList);
		
		EgovMap	memberDtl = commonMngService.getMemberMngDtl(vo.getUserId());
		
		model.addAttribute("currentPageNo", vo.getCurrentPageNo());
		model.addAttribute("detail", memberDtl);
		
		return "cmmmng/memberMng_dtl.main";
	}
	
	@RequestMapping(value = "/memberMngUpd.do", method = RequestMethod.POST)
	public String memberMngUpd(HttpServletRequest request, ModelMap model, MemberMngVO vo){
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		
		//EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		
		commonMngService.updateMemberMng(vo);
		return "redirect:/gnoincoundb/memberMngList.do?mnuCd=" + mnuCd;
	}
	
	/*@RequestMapping(value = "/authMngList.do", method = RequestMethod.GET)
	public String authMngList(AuthMngVO vo, HttpServletRequest request, ModelMap model){	
		EgovMap login = (EgovMap)request.getSession().getAttribute("LoginVO");
		if(login==null || login.get("userId") == null || !login.get("apprvYn").equals("Y") ) return "login/login";
		
		if(request.getParameter("page") != null){
			model.addAttribute("page", request.getParameter("page"));
		}
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd", mnuCd);
		
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(vo.getCurrentPageNo()); // 현재 페이지 번호
		paginationInfo.setRecordCountPerPage(10); // 한 페이지에 게시되는 게시물 건수
		paginationInfo.setPageSize(10); // 페이징 리스트의 사이즈

		vo.setFirstIndex((vo.getCurrentPageNo() - 1) * 10);
		vo.setLastIndex((vo.getCurrentPageNo()) * 10);
		
		List<EgovMap> authList = commonMngService.getAuthMngList(vo);

		int totalPageCnt = commonMngService.getAuthMngListTotCnt(vo);
		model.addAttribute("totalPageCnt", totalPageCnt);
		paginationInfo.setTotalRecordCount(totalPageCnt); // 전체 게시물 건 수
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("authList", authList);
	
		return "cmmmng/authMng_list.main";
	}*/
	
	@RequestMapping(value = "/authMngCodeCheck_ajax.do", method = RequestMethod.POST)
	public String authMngCodeCheckAjax(HttpServletRequest request, ModelMap model){
		
		String authCd = request.getParameter("authCd") == null ? "" : request.getParameter("authCd");
		int codeYn = commonMngService.authMngCodeCheck(authCd);
		String codeCheck = "";
		String msg = "";
		if(codeYn > 0){
			codeCheck = "N";
			msg = "중복되는 개별권한코드 입니다.\n다시 입력해주세요.";
		}else{
			codeCheck = "Y";
			msg = "사용 가능한 개별권한코드 입니다.";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("codeCheck", codeCheck);
		return "jsonView";
	}
	
	/*@RequestMapping(value = "/authMngDtl.do", method = RequestMethod.GET)
	public String authMngDtl(AuthMngVO vo, HttpServletRequest request, ModelMap model){

		if(request.getParameter("page") != null){
			model.addAttribute("page", request.getParameter("page"));
		}
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd", mnuCd);
		
		EgovMap	authDtl = commonMngService.getAuthMngDtl(vo.getAuthNo());
		
		GroupVO param = new GroupVO();
		param.setHclassCd("G81");
		List<EgovMap> authorityGbList = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("authorityGbList", authorityGbList);
		
		model.addAttribute("currentPageNo", vo.getCurrentPageNo());
		model.addAttribute("detail", authDtl);
		
		//return "jsonView";
		return "cmmmng/authMng_dtl.main";
	}*/
	
	@RequestMapping(value = "/authMngSave.do", method = RequestMethod.POST)
	public String authMngSave(HttpServletRequest request, ModelMap model, AuthMngVO vo){
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		String save = request.getParameter("save") == null ? "" : request.getParameter("save");
		
		//EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		if(save.equals("I")){
			commonMngService.insertAuthMng(vo);
		}else{
			commonMngService.updateAuthMng(vo);
		}
		
		return "redirect:/gnoincoundb/authMngList.do?mnuCd=" + mnuCd;
	}
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping(value = "/authMngList.do", method = RequestMethod.GET )
	public String center_mngList(HttpServletRequest request, ModelMap model) throws Exception {
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
		
		
		return "cmmmng/authMng_list.main";
	}
	
	@RequestMapping(value = "/authMngListAjax.do" , method = RequestMethod.POST )
	public String center_mng_list_ajax(HttpServletRequest request, ModelMap model, AuthorityMngVO vo) {
		String num = request.getParameter("num") == null ? "" : request.getParameter("num");
		model.addAttribute("num", num);
		
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(vo.getCurrentPageNo()); // 현재 페이지 번호
		paginationInfo.setRecordCountPerPage(10); // 한 페이지에 게시되는 게시물 건수
		paginationInfo.setPageSize(10); // 페이징 리스트의 사이즈

		vo.setFirstIndex((vo.getCurrentPageNo() - 1) * 10);
		vo.setLastIndex((vo.getCurrentPageNo()) * 10);
		
		List<EgovMap> list = commonMngService.getAuthorityMngList(vo);

		int totalPageCnt = commonMngService.getAuthorityMngListTotCnt(vo);
		model.addAttribute("totalPageCnt", totalPageCnt);
		paginationInfo.setTotalRecordCount(totalPageCnt); // 전체 게시물 건 수
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("list", list);
		
		return "jsonView";
	}
	
	@RequestMapping(value = "/authMngDtl.do", method = RequestMethod.GET)
	public String authMngDtl(HttpServletRequest request, ModelMap model) {
		
		// 왼쪽 메뉴바
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd", mnuCd);
		int num = request.getParameter("num") != null ? Integer.parseInt(request.getParameter("num")) : 0;
		model.addAttribute("num", num);
		
		GroupVO param = new GroupVO();
		param.setHclassCd("G81");
		List<EgovMap> authorityGbList = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("authorityGbList", authorityGbList);
		
		if(num != 0) {
			EgovMap authorityDtl = null;
			authorityDtl = commonMngService.getAuthorityMngDtl(num);
			model.addAttribute("detail", authorityDtl);
		}
		model.addAttribute("page", request.getParameter("page"));
		
		return "cmmmng/authMng_dtl.main";
	}
	
	@RequestMapping(value = "/authMngCheckAjax.do" , method = RequestMethod.POST )
	public String authMngCheckAjax(HttpServletRequest request, ModelMap model, AuthorityMngVO vo) {
		String authNm = request.getParameter("authNm") == null ? "" : request.getParameter("authNm");
		model.addAttribute("authNm", authNm);
		
		int authYn = commonMngService.authMngCheck(authNm);
		String authCheck = "";
		String msg = "";
		if(authYn > 0){
			authCheck = "N";
			msg = "이미 사용중인 권한명입니다. \n다른 권한명을 입력해주세요.";
		}else{
			authCheck = "Y";
			msg = "사용 가능한 권한명입니다.";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("authCheck", authCheck);
		
		return "jsonView";
	}
	
	@RequestMapping(value = "/authMngReg.do", method = RequestMethod.POST)
	public String authMngReg(HttpServletRequest request, ModelMap model, AuthorityMngVO vo){
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		String save = request.getParameter("save") == null ? "" : request.getParameter("save");
		
		EgovMap login = (EgovMap)request.getSession().getAttribute("LoginVO");
		vo.setRegId(login.get("userId").toString());
		if(save.equals("S")) {
			commonMngService.insertAuthMngReg(vo);
		}else{
			commonMngService.updateAuthMngReg(vo);
		}
		
		return "redirect:/gnoincoundb/authMngList.do?mnuCd=" + mnuCd;
	}
	
	@RequestMapping(value = "/memberPwClearAjax.do" , method = {RequestMethod.GET,RequestMethod.POST} )
	public String memberPwClearAjax(HttpServletRequest request, ModelMap model, MemberMngVO vo) {
		
		// 회원 비밀번호 초기화
		commonMngService.memberPwClear(vo);
		
		model.addAttribute("userId", vo.getUserId());
		
		return "jsonView";
	}
	
}
