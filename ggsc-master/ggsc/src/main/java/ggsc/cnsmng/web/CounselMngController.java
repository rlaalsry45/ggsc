package ggsc.cnsmng.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ams.cmm.AES256Crypto;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import ggsc.cnsmng.service.CnsAcptVO;
import ggsc.cnsmng.service.CounselMngService;
import ggsc.cnsmng.service.EalyCnsDocVO;
import ggsc.cnsmng.service.GcnsVO;
import ggsc.cnsmng.service.LinkReqVO;
import ggsc.cnsmng.service.PerCnsVO;
import ggsc.cnsmng.service.PreExamVO;
import ggsc.cnsmng.service.PsyCnsDocVO;
import ggsc.cnsmng.service.PsyCnsVO;
import ggsc.cnsmng.service.SupperVisionVO;
import ggsc.cnsmng.service.UserInfoVO;
import ggsc.cnsr.service.AdminManageService;
import ggsc.cnsr.service.CenterVO;
import ggsc.cnsr.service.GroupVO;
import ggsc.com.util.service.ComCodeService;
import ggsc.report.service.CnsEndVO;

@Controller

public class CounselMngController {

	@Resource(name = "counselMngService")
	private CounselMngService counselMngService;

	@Resource(name = "AdminManageService")
	private AdminManageService adminManageService;

	@Resource(name = "comCodeService")
	private ComCodeService comCodeService;

	@RequestMapping(value = "/cnsAcceptList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String cnsAcceptList(CnsAcptVO vo, HttpServletRequest request, ModelMap model) {
		// ?????? ?????? ??????
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

		if (userAuth > 1) { // ?????? ?????? ????????? ?????????
			vo.setSchCenterGb(Integer.toString(userCenterGb));
		}
		
		String regId = loginVo.get("userId").toString();
		vo.setRegId(regId);
		
		switch (userAuth) {
			case 1: vo.setAuthCd("1"); break; 
			case 2: vo.setAuthCd("2"); break; 
			case 3: vo.setAuthCd("3"); break; 
				default: vo.setAuthCd("4"); break; 
		}
		
		// ?????? ?????? ???
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd", mnuCd);

		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(vo.getCurrentPageNo()); // ?????? ????????? ??????
		paginationInfo.setRecordCountPerPage(10); // ??? ???????????? ???????????? ????????? ??????
		paginationInfo.setPageSize(10); // ????????? ???????????? ?????????

		vo.setFirstIndex((vo.getCurrentPageNo() - 1) * 10);
		vo.setLastIndex((vo.getCurrentPageNo()) * 10);

		List<EgovMap> acceptList = counselMngService.getCnsAcceptList(vo);
		GroupVO param = new GroupVO();
		param.setHclassCd("G15");
		List<EgovMap> cnsGbList = adminManageService.getGroupMngDtlMList(param);

		CenterVO centerVO = new CenterVO();
		List<EgovMap> cnsCenterList = adminManageService.getCenterManageList(centerVO);

		int totalPageCnt = counselMngService.getCnsAcptListTotCnt(vo);
		model.addAttribute("totalPageCnt", totalPageCnt);
		paginationInfo.setTotalRecordCount(totalPageCnt); // ?????? ????????? ??? ???
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("acceptList", acceptList);
		model.addAttribute("cnsGbList", cnsGbList);
		model.addAttribute("cnsCenterList", cnsCenterList);
		model.addAttribute("vo", vo);
		model.addAttribute("authCd", userAuth);
		return "cnsmng/cnsAccept_list.main";
	}
	
	@RequestMapping(value = "/exiCnsAcceptList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String exiCnsAcceptList(CnsAcptVO vo, HttpServletRequest request, ModelMap model) {
		// ?????? ?????? ??????
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

		if (userAuth > 1) { // ?????? ?????? ????????? ?????????
			vo.setSchCenterGb(Integer.toString(userCenterGb));
		}
		
		String regId = loginVo.get("userId").toString();
		vo.setRegId(regId);
		
		switch (userAuth) {
			case 1: vo.setAuthCd("1"); break; 
			case 2: vo.setAuthCd("2"); break; 
			case 3: vo.setAuthCd("3"); break; 
				default: vo.setAuthCd("4"); break; 
		}
		
		// ?????? ?????? ???
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd", mnuCd);

		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(vo.getCurrentPageNo()); // ?????? ????????? ??????
		paginationInfo.setRecordCountPerPage(10); // ??? ???????????? ???????????? ????????? ??????
		paginationInfo.setPageSize(10); // ????????? ???????????? ?????????

		vo.setFirstIndex((vo.getCurrentPageNo() - 1) * 10);
		vo.setLastIndex((vo.getCurrentPageNo()) * 10);

		List<EgovMap> exiAcceptList = counselMngService.getExiCnsAcceptList(vo);
		GroupVO param = new GroupVO();
		param.setHclassCd("G15");
		List<EgovMap> cnsGbList = adminManageService.getGroupMngDtlMList(param);

		CenterVO centerVO = new CenterVO();
		List<EgovMap> cnsCenterList = adminManageService.getCenterManageList(centerVO);

		int totalPageCnt = counselMngService.getExiCnsAcptListTotCnt(vo);
		model.addAttribute("totalPageCnt", totalPageCnt);
		paginationInfo.setTotalRecordCount(totalPageCnt); // ?????? ????????? ??? ???
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("exiAcceptList", exiAcceptList);
		model.addAttribute("cnsGbList", cnsGbList);
		model.addAttribute("cnsCenterList", cnsCenterList);
		model.addAttribute("vo", vo);
		model.addAttribute("authCd", userAuth);
		return "cnsmng/exiCnsAccept_list.main";
	}
	
	
	@RequestMapping(value = "/cnsInfoList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String cnsInfoList(CnsAcptVO vo, HttpServletRequest request, ModelMap model) {
		// ?????? ?????? ??????
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

		if (userAuth > 1) { // ?????? ?????? ????????? ?????????
			vo.setSchCenterGb(Integer.toString(userCenterGb));
		}
		
		String regId = loginVo.get("userId").toString();
		vo.setRegId(regId);
		
		switch (userAuth) {
			case 1: vo.setAuthCd("1"); break; 
			case 2: vo.setAuthCd("2"); break; 
			case 3: vo.setAuthCd("3"); break; 
				default: vo.setAuthCd("4"); break; 
		}
		
		// ?????? ?????? ???
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd", mnuCd);

		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(vo.getCurrentPageNo()); // ?????? ????????? ??????
		paginationInfo.setRecordCountPerPage(10); // ??? ???????????? ???????????? ????????? ??????
		paginationInfo.setPageSize(10); // ????????? ???????????? ?????????

		vo.setFirstIndex((vo.getCurrentPageNo() - 1) * 10);
		vo.setLastIndex((vo.getCurrentPageNo()) * 10);

		List<EgovMap> infoList = counselMngService.getCnsInfoList(vo);
		GroupVO param = new GroupVO();
		param.setHclassCd("G15");
		List<EgovMap> cnsGbList = adminManageService.getGroupMngDtlMList(param);

		CenterVO centerVO = new CenterVO();
		List<EgovMap> cnsCenterList = adminManageService.getCenterManageList(centerVO);

		int totalPageCnt = counselMngService.getCnsInfoListTotCnt(vo);
		model.addAttribute("totalPageCnt", totalPageCnt);
		paginationInfo.setTotalRecordCount(totalPageCnt); // ?????? ????????? ??? ???
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("infoList", infoList);
		model.addAttribute("cnsGbList", cnsGbList);
		model.addAttribute("cnsCenterList", cnsCenterList);
		model.addAttribute("vo", vo);
		model.addAttribute("authCd", userAuth);
		return "cnsmng/cnsInfo_list.main";
	}
	

	@RequestMapping(value = "/cnsAcceptDtl.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String cnsAcceptDtl(CnsAcptVO vo, HttpServletRequest request, ModelMap model) {
		
		// ?????? ?????? ??????
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

		if (userAuth > 1) { // ?????? ?????? ????????? ?????????
			vo.setSchCenterGb(Integer.toString(userCenterGb));
		}
		// ?????? ?????? ???
		
		String type = request.getParameter("type") == null ? "" : request.getParameter("type");
		EgovMap result = null;
		// ???????????? ??????
		GroupVO param = new GroupVO();
		
		param.setHclassCd("G15");
		List<EgovMap> cnsGbList = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("cnsGbList", cnsGbList);

		CenterVO centerVO = new CenterVO();
		List<EgovMap> cnsCenterList = adminManageService.getCenterManageList(centerVO);
		model.addAttribute("cnsCenterList", cnsCenterList);

		param.setHclassCd("G71");
		List<EgovMap> zoneGbList = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("zoneGbList", zoneGbList);

		param.setHclassCd("G58");
		List<EgovMap> mApplCdList = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("mApplCdList", mApplCdList);

		param.setHclassCd("G72");
		List<EgovMap> localGbList = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("localGbList", localGbList);
		
		param.setHclassCd("G089");
		List<EgovMap> sigunList = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("sigunList", sigunList);
		
		if (type.equals("D")) {
			String caseNo = request.getParameter("caseNo") == null ? "" : request.getParameter("caseNo");
			result = counselMngService.getCnsAcceptDtl(caseNo);
		}
		
		model.addAttribute("result", result);
		model.addAttribute("type", type);
		model.addAttribute("vo", vo);
		model.addAttribute("authCd", userAuth);
		model.addAttribute("loginVo", loginVo);
				
		return "cnsmng/cnsAccept_dtl";
	}
	
	@RequestMapping(value = "/exiCnsAcceptDtl.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String exiCnsAcceptDtl(CnsAcptVO vo, HttpServletRequest request, ModelMap model) {
		
		// ?????? ?????? ??????
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

		if (userAuth > 1) { // ?????? ?????? ????????? ?????????
			vo.setSchCenterGb(Integer.toString(userCenterGb));
		}
		// ?????? ?????? ???
		
		String type = request.getParameter("type") == null ? "" : request.getParameter("type");
		EgovMap result = null;
		// ???????????? ??????
		GroupVO param = new GroupVO();
		param.setHclassCd("G15");
		List<EgovMap> cnsGbList = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("cnsGbList", cnsGbList);

		CenterVO centerVO = new CenterVO();
		List<EgovMap> cnsCenterList = adminManageService.getCenterManageList(centerVO);
		model.addAttribute("cnsCenterList", cnsCenterList);

		param.setHclassCd("G71");
		List<EgovMap> zoneGbList = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("zoneGbList", zoneGbList);

		param.setHclassCd("G58");
		List<EgovMap> mApplCdList = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("mApplCdList", mApplCdList);

		param.setHclassCd("G72");
		List<EgovMap> localGbList = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("localGbList", localGbList);
		
		param.setHclassCd("G089");
		List<EgovMap> sigunList = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("sigunList", sigunList);
		
		if (type.equals("D")) {
			String caseNo = request.getParameter("caseNo") == null ? "" : request.getParameter("caseNo");
			result = counselMngService.getCnsAcceptDtl(caseNo);
		}
		
		model.addAttribute("result", result);
		model.addAttribute("type", type);
		model.addAttribute("vo", vo);
		model.addAttribute("authCd", userAuth);
		model.addAttribute("loginVo", loginVo);
				
		return "cnsmng/exiCnsAccept_dtl";
	}
	
	
	@RequestMapping(value = "/cnsInfoDtl.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String cnsInfoDtl(CnsAcptVO vo, HttpServletRequest request, ModelMap model) {
		
		int num = vo.getNum();
		
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd", mnuCd);
		
		// ?????? ?????? ??????
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

		if (userAuth > 1) { // ?????? ?????? ????????? ?????????
			vo.setSchCenterGb(Integer.toString(userCenterGb));
		}
		// ?????? ?????? ???
		
		// ???????????? ??????
		GroupVO param = new GroupVO();
		
		param.setHclassCd("G14");
		List<EgovMap> cnsMethdList = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("cnsMethdList", cnsMethdList);
		
		param.setHclassCd("G15");
		List<EgovMap> cnsGbList = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("cnsGbList", cnsGbList);

		CenterVO centerVO = new CenterVO();
		List<EgovMap> cnsCenterList = adminManageService.getCenterManageList(centerVO);
		model.addAttribute("cnsCenterList", cnsCenterList);
		
		param.setHclassCd("G21");
		List<EgovMap> cnsDtlList = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("cnsDtlList", cnsDtlList);

		param.setHclassCd("G71");
		List<EgovMap> zoneGbList = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("zoneGbList", zoneGbList);

		param.setHclassCd("G58");
		List<EgovMap> mApplCdList = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("mApplCdList", mApplCdList);

		param.setHclassCd("G72");
		List<EgovMap> localGbList = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("localGbList", localGbList);
		
		param.setHclassCd("G089");
		List<EgovMap> sigunList = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("sigunList", sigunList);
		
		if ( num != 0) {
			EgovMap result = counselMngService.getCnsInfoDtl(num);
			model.addAttribute("result", result);
		}
		
		model.addAttribute("vo", vo);
		model.addAttribute("authCd", userAuth);
		model.addAttribute("loginVo", loginVo);
				
		return "cnsmng/cnsInfo_dtl.main";
	}
	
	
	@RequestMapping(value = "/cnsInfoDel.do", method = RequestMethod.POST)
	public String cnsInfoDel(HttpServletRequest request, ModelMap model) {

		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd", mnuCd);
		
		String userId =  request.getParameter("userId") == null ? "" : request.getParameter("userId");

		counselMngService.deleteCnsInfo(userId);
		

		return "redirect:/gnoincoundb/cnsInfoList.do?mnuCd=" + mnuCd;
	}

	
	@RequestMapping(value = "/idCheck_ajax.do", method = RequestMethod.POST)
	public String idCheckAjax(HttpServletRequest request, ModelMap model) {

		String userId = request.getParameter("userId") == null ? "" : request.getParameter("userId");
		int idYn = counselMngService.idCheck(userId);
		String idCheck = "";
		String msg = "";
		if (idYn > 0) {
			idCheck = "N";
			msg = "?????? ????????? ID ?????????.";
		} else {
			idCheck = "Y";
			msg = "?????? ????????? ID ?????????.";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("idCheck", idCheck);
		return "jsonView";
	}

	
	@RequestMapping(value = "/cnsAcptReg_ajax.do", method = RequestMethod.POST)
	public String cnsAcptRegAjax(CnsAcptVO vo, HttpServletRequest request, ModelMap model) {
		/*
		 * if(func.OnlyNumber(vo.getBirthDt(), 0) == 0) {
		 * model.addAttribute("msg","[????????????]??? ??????????????????"); }else
		 * if(func.OnlyNumber(vo.getMobile(),0) == 0){
		 * model.addAttribute("msg","[?????????]??? ??????????????????"); }else
		 * if(func.OnlyNumber(vo.getmajorApplCd(), 0) == 0) {
		 * model.addAttribute("msg","[????????? ??????]??? ??????????????????"); }else
		 * if(func.OnlyNumber(vo.getGender(), 0) == 0) {
		 * model.addAttribute("msg","[??????]??? ??????????????????"); }else
		 * if(func.OnlyNumber(vo.getCnsHistYn(), 0) == 0) {
		 * model.addAttribute("msg","[?????? ??????]??? ??????????????????"); }else {
		 */
		
		EgovMap login = (EgovMap) request.getSession().getAttribute("LoginVO");
		vo.setRegId(login.get("userId").toString());
		
		counselMngService.insertUser(vo);
		counselMngService.insertCnsAccept(vo);
		// }
		return "jsonView";
	}
	
	@RequestMapping(value = "/cnsInfoReg_ajax.do", method = RequestMethod.POST)
	public String cnsInfoRegAjax(CnsAcptVO vo, HttpServletRequest request, ModelMap model) {

		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd", mnuCd);
		
		EgovMap login = (EgovMap) request.getSession().getAttribute("LoginVO");
		vo.setRegId(login.get("userId").toString());
		
		counselMngService.insertUser(vo);
		counselMngService.insertCnsInfo(vo);
		// }
		return "jsonView";
	}
	
	
	@RequestMapping(value = "/exiCnsAcptDel_ajax.do", method = RequestMethod.POST)
	public String exiCnsAcptRegAjax(HttpServletRequest request, ModelMap model) {
		
		String caseNo = request.getParameter("caseNo") == null ? "" : request.getParameter("caseNo");
		
		counselMngService.deleteExiCnsAcpt(caseNo);
		
		
		// 
		return "jsonView";
	}
	

	@RequestMapping(value = "/cnsAcptUpd_ajax.do", method = RequestMethod.POST)
	public String cnsAcptUpdAjax(CnsAcptVO vo, HttpServletRequest request, ModelMap model) {
		/*
		 * if(func.OnlyNumber(vo.getBirthDt(), 0) == 0) {
		 * model.addAttribute("msg","[????????????]??? ??????????????????"); }else
		 * if(func.OnlyNumber(vo.getMobile(),0) == 0){
		 * model.addAttribute("msg","[?????????]??? ??????????????????"); }else
		 * if(func.OnlyNumber(vo.getmajorApplCd(), 0) == 0) {
		 * model.addAttribute("msg","[????????? ??????]??? ??????????????????"); }else
		 * if(func.OnlyNumber(vo.getGender(), 0) == 0) {
		 * model.addAttribute("msg","[??????]??? ??????????????????"); }else
		 * if(func.OnlyNumber(vo.getCnsHistYn(), 0) == 0) {
		 * model.addAttribute("msg","[?????? ??????]??? ??????????????????"); }else {
		 */
		counselMngService.updateUser(vo);
		counselMngService.updateCnsAccept(vo);
		// }
		return "jsonView";
	}
	
	@RequestMapping(value = "/exiCnsAcptUpd_ajax.do", method = RequestMethod.POST)
	public String exiCnsAcptUpdAjax(HttpServletRequest request, ModelMap model) {

		String caseNo = request.getParameter("caseNo") == null ? "" : request.getParameter("caseNo");
		
		counselMngService.updateExiCnsAcpt(caseNo);
		
		return "jsonView";
	}
	
	@RequestMapping(value = "/cnsInfoUpd_ajax.do", method = RequestMethod.POST)
	public String cnsInfoUpdAjax(CnsAcptVO vo, HttpServletRequest request, ModelMap model) {
		/*
		 * if(func.OnlyNumber(vo.getBirthDt(), 0) == 0) {
		 * model.addAttribute("msg","[????????????]??? ??????????????????"); }else
		 * if(func.OnlyNumber(vo.getMobile(),0) == 0){
		 * model.addAttribute("msg","[?????????]??? ??????????????????"); }else
		 * if(func.OnlyNumber(vo.getmajorApplCd(), 0) == 0) {
		 * model.addAttribute("msg","[????????? ??????]??? ??????????????????"); }else
		 * if(func.OnlyNumber(vo.getGender(), 0) == 0) {
		 * model.addAttribute("msg","[??????]??? ??????????????????"); }else
		 * if(func.OnlyNumber(vo.getCnsHistYn(), 0) == 0) {
		 * model.addAttribute("msg","[?????? ??????]??? ??????????????????"); }else {
		 */
		counselMngService.updateUserInfo(vo);
		counselMngService.updateCnsInfo(vo);
		// }
		return "jsonView";
	}

	@RequestMapping(value = "/confirm_ajax.do", method = RequestMethod.POST)
	public String confirmAjax(CnsAcptVO vo, HttpServletRequest request, ModelMap model) {

		EgovMap login = (EgovMap) request.getSession().getAttribute("LoginVO");

		String cnsrId = (String) login.get("userId");
		EgovMap Details = counselMngService.getCnsAcceptDtl(String.format("%s", vo.getCaseNo()));
		vo.setZoneGb(Details.get("zoneGb").toString());
		vo.setLocalGb(Details.get("localGb").toString());
		vo.setCenterGb(Details.get("centerGb").toString());
		vo.setSigunCd(Details.get("sigunCd").toString());
		vo.setRegId(login.get("userId").toString());
		if(vo.getCaseNo() == 0) {
			System.out.println("caseNO ?????? 0????????? ???????????? ?????? @@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
			counselMngService.updateCnsAcceptCaseNo(vo);
		}
		counselMngService.updateConfirm(vo, cnsrId);
		String msg = "???????????? ????????? ?????? ???????????????.";

		model.addAttribute("msg", msg);
		return "jsonView";
	}

	@RequestMapping(value = "/cnsAcceptDtl_ajax.do", method = RequestMethod.POST)
	public String cnsAcceptDtl_ajax(CnsAcptVO vo, HttpServletRequest request, ModelMap model) {

		String caseNo = null;
		if (request.getAttribute("caseNo") != null)
			caseNo = (String) request.getAttribute("caseNo");
		if (caseNo == null)
			caseNo = String.format("%s", vo.getCaseNo());
		EgovMap Details = counselMngService.getCnsAcceptDtl(caseNo);
		model.addAttribute("Detail", Details);
		return "jsonView";
	}

	// ???????????? ??????
	@RequestMapping(value = "/pretestList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String pretestList(PreExamVO vo, HttpServletRequest request, ModelMap model) {
		
		// ?????? ?????? ??????
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

		if (userAuth > 1) { // ?????? ?????? ????????? ?????????
			vo.setSchCenterGb(Integer.toString(userCenterGb));
		}
		
		String regId = loginVo.get("userId").toString();
		vo.setRegId(regId);
		
		switch (userAuth) {
			case 1: vo.setAuthCd("1"); break; 
			case 2: vo.setAuthCd("2"); break; 
			case 3: vo.setAuthCd("3"); break; 
				default: vo.setAuthCd("4"); break; 
		}
		// ?????? ?????? ???

		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd", mnuCd);

		GroupVO groupVo = new GroupVO();
		groupVo.setHclassCd("G15");
		CenterVO centerVO = new CenterVO();
		List<EgovMap> cnsGbList = adminManageService.getGroupMngDtlMList(groupVo);
		List<EgovMap> cnsCenterList = adminManageService.getCenterManageList(centerVO);
		model.addAttribute("cnsGbList", cnsGbList);
		model.addAttribute("cnsCenterList", cnsCenterList);

		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(vo.getCurrentPageNo()); // ?????? ????????? ??????
		paginationInfo.setRecordCountPerPage(10); // ??? ???????????? ???????????? ????????? ??????
		paginationInfo.setPageSize(10); // ????????? ???????????? ?????????

		vo.setFirstIndex((vo.getCurrentPageNo() - 1) * 10);
		vo.setLastIndex((vo.getCurrentPageNo()) * 10);

		List<EgovMap> preList = counselMngService.getPreList(vo);
		int totalPageCnt = counselMngService.getPreListTotCnt(vo);
		model.addAttribute("totalPageCnt", totalPageCnt);
		paginationInfo.setTotalRecordCount(totalPageCnt); // ?????? ????????? ??? ???
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("preList", preList);
		model.addAttribute("vo", vo);
		model.addAttribute("authCd", userAuth);

		return "cnsmng/pretest_list.main";
	}

	@RequestMapping(value = "/cnsApplicationList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String cnsApplicationList(HttpServletRequest request, ModelMap model) {

		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd", mnuCd);
		return "cnsmng/cnsApplication_list.main";
	}

	@RequestMapping(value = "/securityPledge.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String securityPledge(HttpServletRequest request, ModelMap model) {
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd", mnuCd);

		// ???????????? ??????
		GroupVO param = new GroupVO();
		param.setHclassCd("G15");
		List<EgovMap> cnsGbList = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("cnsGbList", cnsGbList);

		param.setHclassCd("G71");
		List<EgovMap> zoneGbList = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("zoneGbList", zoneGbList);

		return "cnsmng/securityPledge.main";
	}

	@RequestMapping(value = "/preExamReg.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String preExamReg(PreExamVO vo, HttpServletRequest request, ModelMap model) {

		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		String caseNo = request.getParameter("caseNo") == null ? "" : request.getParameter("caseNo");
		String save = request.getParameter("save") == null ? "" : request.getParameter("save");
		EgovMap loginVo = (EgovMap) request.getSession().getAttribute("LoginVO");
		EgovMap Details = counselMngService.getCnsAcceptDtl(String.format("%s", vo.getCaseNo()));
		vo.setZoneGb((String) Details.get("zoneGb"));
		vo.setLocalGb((String) Details.get("localGb"));
		vo.setCnsGb((String) Details.get("cnsGb"));
		vo.setCenterGb((String) Details.get("centerGb"));
		vo.setSigunCd((String) Details.get("sigunCd"));
		vo.setCnsrNm((String) loginVo.get("userNm"));
		// ???????????? m ??????
		String url = "";
		if(save.equals("I")) {
			// ????????????
			counselMngService.insertPreExamM(vo);			
		} else if(save.equals("S")) {
			// ????????????
			counselMngService.updatePreExamD(vo);
		}
		model.addAttribute("mnuCd", mnuCd);
		
		if (vo.getExamDocCd().equals("1")) {
			// ??????????????? ??????
			url = "redirect:/gnoincoundb/cnsAgreement.do?mnuCd=" + mnuCd +"&caseNo=" + caseNo;
		} else if (vo.getExamDocCd().equals("2")) {
			// ??????????????? ??????
			url = "redirect:/gnoincoundb/privacyAgreement.do?mnuCd=" + mnuCd +"&caseNo=" + caseNo;
		} else if (vo.getExamDocCd().equals("3")) {
			url = "redirect:/gnoincoundb/scScreeningScale.do?mnuCd=" + mnuCd +"&caseNo=" + caseNo;
		} else if (vo.getExamDocCd().equals("4")) {
			url = "redirect:/gnoincoundb/pretestList.do?mnuCd=" + mnuCd +"&caseNo=" + caseNo;
		}
		return url;
	}

	@RequestMapping(value = "/cnsAgreement.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String cnsAgreement(HttpServletRequest request, ModelMap model) {
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd", mnuCd);

		String caseNo = request.getParameter("caseNo") == null ? "" : request.getParameter("caseNo");
		model.addAttribute("caseNo", caseNo);
		
		// ?????? ?????? ??????
		EgovMap loginVo = (EgovMap) request.getSession().getAttribute("LoginVO");
		
		// ???????????? ??????
		GroupVO param = new GroupVO();
		param.setHclassCd("G15");
		List<EgovMap> cnsGbList = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("cnsGbList", cnsGbList);

		param.setHclassCd("G71");
		List<EgovMap> zoneGbList = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("zoneGbList", zoneGbList);
		
		EgovMap cnsAgreDoc = null;
		if(caseNo !=""){
			int caseNum = Integer.parseInt(caseNo);
			cnsAgreDoc = counselMngService.getCnsAgreDocDtl(caseNum);
		}
		model.addAttribute("detail", cnsAgreDoc);

		return "cnsmng/cnsAgreement.main";
	}

	@RequestMapping(value = "/privacyAgreement.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String privacyAgreement(HttpServletRequest request, ModelMap model) {
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd", mnuCd);
		String caseNo = request.getParameter("caseNo") == null ? "" : request.getParameter("caseNo");
		model.addAttribute("caseNo", caseNo);

		// session ?????? ????????????
		EgovMap loginVo = (EgovMap) request.getSession().getAttribute("LoginVO");
		model.addAttribute("loginVo", loginVo);
		
		// ???????????? ??????
		GroupVO param = new GroupVO();
		param.setHclassCd("G15");
		List<EgovMap> cnsGbList = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("cnsGbList", cnsGbList);

		param.setHclassCd("G71");
		List<EgovMap> zoneGbList = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("zoneGbList", zoneGbList);

		EgovMap privacyDtl = null;
		if(caseNo !=""){
			int caseNum = Integer.parseInt(caseNo);
			privacyDtl = counselMngService.getPrivacyDtl(caseNum);
		}
		model.addAttribute("detail",privacyDtl);
		
		return "cnsmng/privacyAgreement.main";
	}

	@RequestMapping(value = "/scScreeningScale.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String scScreeningScale(HttpServletRequest request, ModelMap model) {
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd", mnuCd);
		String caseNo = request.getParameter("caseNo") == null ? "" : request.getParameter("caseNo");
		model.addAttribute("caseNo", caseNo);

		// ?????? ?????? ??????
		EgovMap loginVo = (EgovMap) request.getSession().getAttribute("LoginVO");
		model.addAttribute("userNm",(String)loginVo.get("userNm"));
		
		// ???????????? ??????
		GroupVO param = new GroupVO();
		param.setHclassCd("G15");
		List<EgovMap> cnsGbList = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("cnsGbList", cnsGbList);

		param.setHclassCd("G71");
		List<EgovMap> zoneGbList = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("zoneGbList", zoneGbList);

		int num = counselMngService.getScsreenCnt();
		model.addAttribute("dccNum",num);
		
		EgovMap scScreen = null;
		if(caseNo !=""){
			int caseNum = Integer.parseInt(caseNo);
			scScreen = counselMngService.getScScreenDtl(caseNum);
		}
		model.addAttribute("detail",scScreen);
		
		return "cnsmng/scScreeningScale.main";
	}


	@RequestMapping(value = "/findUserPopup.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String finUserPopup(HttpServletRequest request, ModelMap model, UserInfoVO vo) {
		String userNm = request.getParameter("userNm") == null ? "" : request.getParameter("userNm");
		String schCaseNo = request.getParameter("schCaseNo") == null ? "" : request.getParameter("schCaseNo");
		if (userNm.length() > 0) {
			try {
				userNm = URLDecoder.decode(userNm, "UTF-8");
			} catch (UnsupportedEncodingException  e) {
				
			}
		}
		
		if (schCaseNo.length() > 0) {
			vo.setSchCaseNo(schCaseNo);
		}
		
		// ?????? ?????? ??????
		EgovMap loginVo = (EgovMap) request.getSession().getAttribute("LoginVO");
		int userAuth = Integer.parseInt(loginVo.get("authCd").toString());
		String centerGb = loginVo.get("centerGb").toString();
		String cnsGb = loginVo.get("cnsGb").toString();
		String regId = loginVo.get("userId").toString();
		vo.setSchCenterGb(centerGb);
		vo.setRegId(regId);
		vo.setSchCnsGb(cnsGb);
		
		switch (userAuth) {
			case 1: vo.setAuthCd("1"); break; 
			case 2: vo.setAuthCd("2"); break; 
			case 3: vo.setAuthCd("3"); break; 
				default: vo.setAuthCd("4"); break; 
		}

		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(vo.getCurrentPageNo()); // ?????? ????????? ??????
		paginationInfo.setRecordCountPerPage(10); // ??? ???????????? ???????????? ????????? ??????
		paginationInfo.setPageSize(10); // ????????? ???????????? ?????????

		vo.setFirstIndex((vo.getCurrentPageNo() - 1) * 10);
		vo.setLastIndex((vo.getCurrentPageNo()) * 10);

		List<EgovMap> list = counselMngService.findUserPopup(vo);
		int totalPageCnt = counselMngService.getFindUserTotCnt(vo);
		model.addAttribute("totalPageCnt", totalPageCnt);
		paginationInfo.setTotalRecordCount(totalPageCnt); // ?????? ????????? ??? ???
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("cnsTargetGb", vo.getCnsTargetGb());
		model.addAttribute("cnsPerTargetGb", vo.getCnsPerTargetGb());
		model.addAttribute("list", list);
		model.addAttribute("vo", vo);

		return "common/findUserPopup";
	}
	
	@RequestMapping(value = "/findCnsrPopup.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String findCnsrPopup(HttpServletRequest request, ModelMap model, UserInfoVO vo) {
		String userNm = request.getParameter("userNm") == null ? "" : request.getParameter("userNm");
		String schCaseNo = request.getParameter("schCaseNo") == null ? "" : request.getParameter("schCaseNo");
		if (userNm.length() > 0) {
			try {
				userNm = URLDecoder.decode(userNm, "UTF-8");
			} catch (UnsupportedEncodingException  e) {
				
			}
		}
		
		if (schCaseNo.length() > 0) {
			// vo.setSchCaseNo(schCaseNo);
		}
		
		// ?????? ?????? ??????
		EgovMap loginVo = (EgovMap) request.getSession().getAttribute("LoginVO");
		int userAuth = Integer.parseInt(loginVo.get("authCd").toString());
		String centerGb = loginVo.get("centerGb").toString();
		String regId = loginVo.get("userId").toString();
		vo.setSchCenterGb(centerGb);
		vo.setRegId(regId);
		
		switch (userAuth) {
			case 1: vo.setAuthCd("1"); break; 
			case 2: vo.setAuthCd("2"); break; 
			case 3: vo.setAuthCd("3"); break; 
				default: vo.setAuthCd("4"); break; 
		}

		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(vo.getCurrentPageNo()); // ?????? ????????? ??????
		paginationInfo.setRecordCountPerPage(10); // ??? ???????????? ???????????? ????????? ??????
		paginationInfo.setPageSize(10); // ????????? ???????????? ?????????

		vo.setFirstIndex((vo.getCurrentPageNo() - 1) * 10);
		vo.setLastIndex((vo.getCurrentPageNo()) * 10);

		List<EgovMap> list = counselMngService.findCnsrPopup(vo);
		int totalPageCnt = counselMngService.getFindCnsrTotCnt(vo);
		model.addAttribute("totalPageCnt", totalPageCnt);
		paginationInfo.setTotalRecordCount(totalPageCnt); // ?????? ????????? ??? ???
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("cnsTargetGb", vo.getCnsTargetGb());
		model.addAttribute("list", list);
		model.addAttribute("vo", vo);

		return "common/findCnsrPopup";
	}

	// ???????????? ????????? ?????? popup
	@RequestMapping(value = "/userSelPopup.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String finUserPopup2(HttpServletRequest request, ModelMap model, UserInfoVO vo) {
		
		return "common/userSelPopup.main";
	}
	
	// ???????????? ?????? ?????? ??????
	@RequestMapping(value = "/userSelPopupAjax.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String userSelPopupAjax(HttpServletRequest request, ModelMap model, UserInfoVO vo) {

		String userNm = request.getParameter("userNm") == null ? "" : request.getParameter("userNm");
		if (userNm.length() > 0) {
			try {
				userNm = URLDecoder.decode(userNm, "UTF-8");
			} catch (UnsupportedEncodingException  e) {
				
			}
		}
		
		// ?????? ?????? ??????
		EgovMap loginVo = (EgovMap) request.getSession().getAttribute("LoginVO");
		int userAuth = Integer.parseInt(loginVo.get("authCd").toString());
		String centerGb = loginVo.get("centerGb").toString();
		String regId = loginVo.get("userId").toString();
		vo.setSchCenterGb(centerGb);
		vo.setRegId(regId);
		
		switch (userAuth) {
			case 1: vo.setAuthCd("1"); break; 
			case 2: vo.setAuthCd("2"); break; 
			case 3: vo.setAuthCd("3"); break; 
				default: vo.setAuthCd("4"); break; 
		}

		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(vo.getCurrentPageNo()); // ?????? ????????? ??????
		paginationInfo.setRecordCountPerPage(10); // ??? ???????????? ???????????? ????????? ??????
		paginationInfo.setPageSize(10); // ????????? ???????????? ?????????

		vo.setFirstIndex((vo.getCurrentPageNo() - 1) * 10);
		vo.setLastIndex((vo.getCurrentPageNo()) * 10);

		vo.setCnsTargetGb("Y");
		vo.setCnsPerTargetGb("Y");
		List<EgovMap> list = counselMngService.findUserPopup(vo);
		int totalPageCnt = counselMngService.getFindUserTotCnt(vo);
		model.addAttribute("totalPageCnt", totalPageCnt);
		paginationInfo.setTotalRecordCount(totalPageCnt); // ?????? ????????? ??? ???
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("cnsTargetGb", vo.getCnsTargetGb());
		model.addAttribute("cnsPerTargetGb", vo.getCnsPerTargetGb());
		model.addAttribute("list", list);
		model.addAttribute("vo", vo);

		model.addAttribute("list", list);
		return "jsonView";
	}
	
	// ?????????????????? ?????? ???????????? ??????
	@RequestMapping(value = "/perCnsRegCheckAjax.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String perCnsRegCheckAjax(HttpServletRequest request, ModelMap model) {

		String caseNoStr = request.getParameter("caseNo");
		int caseNo = Integer.parseInt(caseNoStr);
		int result = counselMngService.getPerCnsRegCheck(caseNo);

		model.addAttribute("result", result);
		return "jsonView";
	}
	
	// ???????????? ?????? ?????? ??????
	@RequestMapping(value = "/ealyCnsleCheck.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String ealyCnsleCheck(HttpServletRequest request, ModelMap model) {

		String caseNoStr = request.getParameter("caseNo");
		int caseNo = Integer.parseInt(caseNoStr);
		int result = counselMngService.getEalyCnsleCheck(caseNo);

		model.addAttribute("result", result);
		return "jsonView";
	}

	@RequestMapping(value = "/ealyCnsDocList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String ealyCnsDocList(EalyCnsDocVO vo, HttpServletRequest request, ModelMap model) {
		
		// ?????? ?????? ??????
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

		if (userAuth > 1) { // ?????? ?????? ????????? ?????????
			vo.setSchCenterGb(Integer.toString(userCenterGb));
		}
		// ?????? ?????? ???
		
		String regId = loginVo.get("userId").toString();
		vo.setRegId(regId);
		
		switch (userAuth) {
			case 1: vo.setAuthCd("1"); break; 
			case 2: vo.setAuthCd("2"); break; 
			case 3: vo.setAuthCd("3"); break; 
				default: vo.setAuthCd("4"); break; 
		}
		
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd", mnuCd);

		// ???????????? ??????
		GroupVO param = new GroupVO();
		param.setHclassCd("G15");
		List<EgovMap> cnsGbList = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("cnsGbList", cnsGbList);

		CenterVO centerVO = new CenterVO();
		List<EgovMap> cnsCenterList = adminManageService.getCenterManageList(centerVO);
		model.addAttribute("cnsCenterList", cnsCenterList);
		/*
		 * EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		 * 
		 * String localGb = (String)map.get("localGb"); String centerGb =
		 * (String)map.get("centerGb"); String zoneGb = (String)map.get("zoneGb");
		 * 
		 * vo.setLocalGb(localGb); vo.setCenterGb(centerGb); vo.setZoneGb(zoneGb);
		 */

		PaginationInfo paginationInfo = new PaginationInfo();

		paginationInfo.setCurrentPageNo(vo.getCurrentPageNo()); // ?????? ????????? ??????
		paginationInfo.setRecordCountPerPage(10); // ??? ???????????? ???????????? ????????? ??????
		paginationInfo.setPageSize(10); // ????????? ???????????? ?????????

		vo.setFirstIndex((vo.getCurrentPageNo() - 1) * 10);
		vo.setLastIndex((vo.getCurrentPageNo()) * 10);

		List<EgovMap> ealyList = counselMngService.getEalyCnsDocList(vo);
		int totalPageCnt = counselMngService.getEalyCnsDocListTotCnt(vo);
		model.addAttribute("totalPageCnt", totalPageCnt);
		paginationInfo.setTotalRecordCount(totalPageCnt); // ?????? ????????? ??? ???

		model.addAttribute("paginationInfo", paginationInfo);

		model.addAttribute("ealyList", ealyList);
		model.addAttribute("vo", vo);
		model.addAttribute("authCd", userAuth);
		return "cnsmng/ealyCnsDoc_list.main";
	}

	@RequestMapping(value = "/ealyCnsDocDtl.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String ealyCnsDocDtl(HttpServletRequest request, ModelMap model) {
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd", mnuCd);

		EgovMap map = (EgovMap) request.getSession().getAttribute("LoginVO");
		model.addAttribute("map", map);
		EgovMap result = null;
		String caseNoStr = request.getParameter("caseNo");
		if (caseNoStr != null) {
			int caseNo = Integer.parseInt(caseNoStr);
			result = counselMngService.getEalyCnsDoc(caseNo);
		}
		model.addAttribute("result", result);

		// ???????????? ??????
		GroupVO param = new GroupVO();
		param.setHclassCd("G14");
		List<EgovMap> cnsMethdList = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("cnsMethdList", cnsMethdList);

		param.setHclassCd("G21");
		List<EgovMap> cnsDtlList = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("cnsDtlList", cnsDtlList);

		return "cnsmng/ealyCnsDoc_dtl.main";
	}

	@RequestMapping(value = "/ealyCnsDocReg.do", method = RequestMethod.POST)
	public String ealyCnsDocReg(EalyCnsDocVO vo, HttpServletRequest request, ModelMap model) {

		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		String save = request.getParameter("save") == null ? "" : request.getParameter("save");

		EgovMap Details = counselMngService.getCnsAcceptDtl(String.format("%s", vo.getCaseNo()));

		model.addAttribute("mnuCd", mnuCd);

		/*EalyCnsDocVO tmpVo = vo;
		tmpVo.setCaseNo(Integer.parseInt(Details.get("caseNo").toString()));

		int totalCnt = counselMngService.getEalyCnsDocListTotCnt(tmpVo);*/
		if (save.equals("S")) {
			vo.setZoneGb((String) Details.get("zoneGb"));
			vo.setLocalGb((String) Details.get("localGb"));
			vo.setCenterGb((String) Details.get("centerGb"));
			vo.setCnsGb((String) Details.get("cnsGb"));
			counselMngService.insertEalyCnsDoc(vo);
		} else if (save.equals("U")) {
			// update query ????????? ???
			counselMngService.updateEalyCnsDoc(vo);
		}
		// System.out.println(String.format("[ealyCnsDocReg] caseNo : %s / totalCnt :
		// %d",Details.get("caseNo"), totalCnt));

		return "redirect:/gnoincoundb/ealyCnsDocList.do?mnuCd=" + mnuCd;
	}
	
	
	@RequestMapping(value = "/ealyCnsDocDel.do", method = RequestMethod.POST)
	public String ealyCnsDocDel(HttpServletRequest request, ModelMap model) {

		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		String caseNo = request.getParameter("caseNo1") == null ? "" : request.getParameter("caseNo1");
		model.addAttribute("mnuCd", mnuCd);

		counselMngService.deleteExiEalyCnsDoc(caseNo);
		

		return "redirect:/gnoincoundb/ealyCnsDocList.do?mnuCd=" + mnuCd;
	}

	@RequestMapping(value = "/perCnsList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String perCnsList(EalyCnsDocVO vo, HttpServletRequest request, ModelMap model) {
		
		// ?????? ?????? ??????
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

		if (userAuth > 1) { // ?????? ?????? ????????? ?????????
			vo.setSchCenterGb(Integer.toString(userCenterGb));
		}
		// ?????? ?????? ???
		
		String regId = loginVo.get("userId").toString();
		vo.setRegId(regId);
		
		switch (userAuth) {
			case 1: vo.setAuthCd("1"); break; 
			case 2: vo.setAuthCd("2"); break; 
			case 3: vo.setAuthCd("3"); break; 
				default: vo.setAuthCd("4"); break; 
		}
		
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd", mnuCd);

		// ???????????? ??????
		GroupVO param = new GroupVO();
		param.setHclassCd("G15");
		List<EgovMap> cnsGbList = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("cnsGbList", cnsGbList);

		CenterVO centerVO = new CenterVO();
		List<EgovMap> cnsCenterList = adminManageService.getCenterManageList(centerVO);
		model.addAttribute("cnsCenterList", cnsCenterList);

		PaginationInfo paginationInfo = new PaginationInfo();

		paginationInfo.setCurrentPageNo(vo.getCurrentPageNo()); // ?????? ????????? ??????
		paginationInfo.setRecordCountPerPage(10); // ??? ???????????? ???????????? ????????? ??????
		paginationInfo.setPageSize(10); // ????????? ???????????? ?????????

		vo.setFirstIndex((vo.getCurrentPageNo() - 1) * 10);
		vo.setLastIndex((vo.getCurrentPageNo()) * 10);

		// ????????????????????? ??????
		List<EgovMap> ealyList = counselMngService.getEalyCnsDocList(vo);
		int totalPageCnt = counselMngService.getEalyCnsDocListTotCnt(vo);

		model.addAttribute("ealyList", ealyList);
		model.addAttribute("vo", vo);

		// ???????????? ????????????
		List<EgovMap> cnsList = counselMngService.getCnsDiaHysList(vo);
		int totalPageCnt2 = counselMngService.getCnsDiaHysListTotCnt(vo);
		model.addAttribute("totalPageCnt2", totalPageCnt2);
		paginationInfo.setTotalRecordCount(totalPageCnt2); // ?????? ????????? ??? ???

		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("cnsList", cnsList);
		// ???????????? ?????????
		//List<EgovMap> cnsCntReList = counselMngService.getCnsCntReList(vo);
		// int totalPageCnt3 = counselMngService.getCnsCntReListTotCnt(vo);
		//model.addAttribute("cnsCntReList", cnsCntReList);
		
		// ???????????? ??????
		List<EgovMap> cnsCntEndList = counselMngService.getCnsCntEndList(vo);
		//int totalPageCnt4 = counselMngService.getCnsCntEndListTotCnt(vo);
		model.addAttribute("cnsCntEndList", cnsCntEndList);
		
		model.addAttribute("authCd", userAuth);
		return "cnsmng/perCns_list.main";
	}

	@RequestMapping(value = "/perCnsRegView.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String perCnsRegView(HttpServletRequest request, ModelMap model) {
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd", mnuCd);

		EgovMap map = (EgovMap) request.getSession().getAttribute("LoginVO");
		model.addAttribute("map", map);

		GroupVO param = new GroupVO();
		param.setHclassCd("G14");
		List<EgovMap> cnsMethdList = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("cnsMethdList", cnsMethdList);

		param.setHclassCd("G15");
		List<EgovMap> cnsGbList = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("cnsGbList", cnsGbList);

		param.setHclassCd("G23");
		List<EgovMap> cnsEndCdList = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("cnsEndCdList", cnsEndCdList);

		param.setHclassCd("G9");
		List<EgovMap> livgFormList = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("livgFormList", livgFormList);

		param.setHclassCd("G10");
		List<EgovMap> houseFormList = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("houseFormList", houseFormList);

		param.setHclassCd("G18");
		List<EgovMap> cnsStatList = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("cnsStatList", cnsStatList);

		param.setHclassCd("G19");
		List<EgovMap> cnsrGbList = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("cnsrGbList", cnsrGbList);

		return "cnsmng/perCns_reg.main";
	}

	@RequestMapping(value = "/perCnsDtl.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String perCnsDtl(PerCnsVO vo, HttpServletRequest request, ModelMap model) {
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd", mnuCd);

		EgovMap map = (EgovMap) request.getSession().getAttribute("LoginVO");
		model.addAttribute("map", map);

		GroupVO param = new GroupVO();
		param.setHclassCd("G14");
		List<EgovMap> cnsMethdList = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("cnsMethdList", cnsMethdList);

		param.setHclassCd("G15");
		List<EgovMap> cnsGbList = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("cnsGbList", cnsGbList);

		param.setHclassCd("G23");
		List<EgovMap> cnsEndCdList = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("cnsEndCdList", cnsEndCdList);

		param.setHclassCd("G9");
		List<EgovMap> livgFormList = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("livgFormList", livgFormList);

		param.setHclassCd("G10");
		List<EgovMap> houseFormList = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("houseFormList", houseFormList);

		param.setHclassCd("G18");
		List<EgovMap> cnsStatList = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("cnsStatList", cnsStatList);

		param.setHclassCd("G19");
		List<EgovMap> cnsrGbList = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("cnsrGbList", cnsrGbList);

		EgovMap result = counselMngService.getPerCns(vo);
		model.addAttribute("result", result);
		return "cnsmng/perCns_dtl.main";
	}

	@RequestMapping(value = "/perCnsReg.do", method = RequestMethod.POST)
	public String perCnsReg(PerCnsVO vo, HttpServletRequest request, ModelMap model) {

		EgovMap loginVO = (EgovMap) request.getSession().getAttribute("LoginVO");
		vo.setCnsrId(loginVO.get("userId").toString());
		
		EgovMap Details = counselMngService.getCnsAcceptDtl(String.format("%s", vo.getCaseNo()));
		vo.setCnsGb(Details.get("cnsGb").toString());
		vo.setZoneGb(Details.get("zoneGb").toString());
		vo.setLocalGb(Details.get("localGb").toString());
		vo.setCenterGb(Details.get("centerGb").toString());
		vo.setBirthDt(Details.get("birthDt").toString());
		vo.setGender(Details.get("gender").toString());
		vo.setMobile(Details.get("mobile").toString());
		/*vo.setEmgcyTel(Details.get("tel").toString());*/
		vo.setAddr(Details.get("addr").toString());

		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd", mnuCd);

		GroupVO param = new GroupVO();
		param.setHclassCd("G14");
		List<EgovMap> cnsMethdList = adminManageService.getGroupMngDtlMList(param);
		vo.setCnsMethdNm((String) cnsMethdList.get(Integer.parseInt(vo.getCnsMethd()) - 1).get("mclassNm"));
		
		counselMngService.insertPerCns(vo);

		return "redirect:/gnoincoundb/perCnsList.do?mnuCd=" + mnuCd;
	}

	@RequestMapping(value = "/perCnsUpd.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String perCnsUpd(PerCnsVO vo, HttpServletRequest request, ModelMap model) {
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd", mnuCd);

		EgovMap map = (EgovMap) request.getSession().getAttribute("LoginVO");
		// ?????? ???????????? ?????? ???????????? ????????? ??????
		//vo.setZoneGb((String) map.get("zoneGb"));
		//vo.setCenterGb((String) map.get("centerGb"));
		//vo.setLocalGb((String) map.get("localGb"));
		//vo.setCnsrGb((String) map.get("cnsrGb"));
		counselMngService.updatePerCns(vo);

		return "redirect:/gnoincoundb/perCnsList.do?mnuCd=" + mnuCd;
	}
	
	/*@RequestMapping(value = "/perCnsDel.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String perCnsDel(PerCnsVO vo, HttpServletRequest request, ModelMap model) {
		
		Map <String,Object> map = new HashMap<String,Object>();
		
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd", mnuCd);
		
		
		String caseNo = request.getParameter("caseNo") == null ? "" : request.getParameter("caseNo");
		String num = request.getParameter("num") == null ? "" : request.getParameter("num");
		
		map.put("caseNo" , caseNo);
		map.put("num" , num);
		
		counselMngService.deleteExiPerCnsDoc(map);

		return "redirect:/gnoincoundb/perCnsList.do?mnuCd=" + mnuCd;
	}*/

	@RequestMapping(value = "/gCnsList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String gCnsList(GcnsVO vo, HttpServletRequest request, ModelMap model) {

		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd", mnuCd);

		// ?????? ?????? ??????
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

		if (userAuth > 1) { // ?????? ?????? ????????? ?????????
			vo.setSchCenterGb(Integer.toString(userCenterGb));
		}
		// ?????? ?????? ???
		
		String regId = loginVo.get("userId").toString();
		vo.setRegId(regId);
		
		switch (userAuth) {
			case 1: vo.setAuthCd("1"); break; 
			case 2: vo.setAuthCd("2"); break; 
			case 3: vo.setAuthCd("3"); break; 
				default: vo.setAuthCd("4"); break; 
		}
		
		// ???????????? ??????
		GroupVO param = new GroupVO();
		param.setHclassCd("G15");
		List<EgovMap> cnsGbList = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("cnsGbList", cnsGbList);

		CenterVO centerVO = new CenterVO();
		List<EgovMap> cnsCenterList = adminManageService.getCenterManageList(centerVO);
		model.addAttribute("cnsCenterList", cnsCenterList);

		EgovMap map = (EgovMap) request.getSession().getAttribute("LoginVO");

		String localGb = (String) map.get("localGb");
		String centerGb = (String) map.get("centerGb");
		String zoneGb = (String) map.get("zoneGb");
		String schCnsGb = vo.getSchCnsGb();
		String schCenterGb = vo.getSchCenterGb();

		vo.setLocalGb(localGb);
		vo.setCenterGb(centerGb);
		vo.setZoneGb(zoneGb);

		PaginationInfo paginationInfo = new PaginationInfo();

		paginationInfo.setCurrentPageNo(vo.getCurrentPageNo()); // ?????? ????????? ??????
		paginationInfo.setRecordCountPerPage(10); // ??? ???????????? ???????????? ????????? ??????
		paginationInfo.setPageSize(10); // ????????? ???????????? ?????????

		vo.setFirstIndex((vo.getCurrentPageNo() - 1) * 10);
		vo.setLastIndex((vo.getCurrentPageNo()) * 10);

		EalyCnsDocVO eVo = new EalyCnsDocVO();
		eVo.setLocalGb(localGb);
		eVo.setCenterGb(centerGb);
		eVo.setZoneGb(zoneGb);
		eVo.setSchCenterGb(schCenterGb);
		eVo.setSchCnsGb(schCnsGb);
		eVo.setFirstIndex((vo.getCurrentPageNo() - 1) * 10);
		eVo.setLastIndex((vo.getCurrentPageNo()) * 10);
		eVo.setSchStartDate(vo.getSchStartDate());
		eVo.setSchEndDate(vo.getSchEndDate());
		
		// ????????????????????? ??????
		List<EgovMap> ealyList = counselMngService.getEalyCnsDocList(eVo);
		int totalPageCnt = counselMngService.getEalyCnsDocListTotCnt(eVo);

		model.addAttribute("ealyList", ealyList);
		model.addAttribute("vo", vo);

		// ?????????????????? ????????????
		List<EgovMap> gCnsList = counselMngService.getGcnsList(vo);
		int totalPageCnt2 = counselMngService.getGcnsListTotCnt(vo);
		model.addAttribute("totalPageCnt2", totalPageCnt2);
		paginationInfo.setTotalRecordCount(totalPageCnt2); // ?????? ????????? ??? ???

		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("gCnsList", gCnsList);
		// ???????????? ?????????
		List<EgovMap> cnsCntReList = counselMngService.getCnsCntReList(eVo);
		// int totalPageCnt3 = counselMngService.getCnsCntReListTotCnt(vo);
		model.addAttribute("cnsCntReList", cnsCntReList);
		// ???????????? ??????
		List<EgovMap> cnsCntEndList = counselMngService.getCnsCntEndList(eVo);
		// int totalPageCnt4 = counselMngService.getCnsCntEndListTotCnt(vo);
		model.addAttribute("cnsCntEndList", cnsCntEndList);

		model.addAttribute("authCd", userAuth);
		
		return "cnsmng/gCns_list.main";
	}

	@RequestMapping(value = "/gCnsRegView.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String gCnsRegView(GcnsVO vo, HttpServletRequest request, ModelMap model) {
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd", mnuCd);
		
		// ?????? ?????? ??????
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

		if (userAuth > 1) { // ?????? ?????? ????????? ?????????
			vo.setSchCenterGb(Integer.toString(userCenterGb));
		}
		// ?????? ?????? ???

		EgovMap map = (EgovMap) request.getSession().getAttribute("LoginVO");
		model.addAttribute("map", map);

		// ???????????? ??????
		GroupVO param = new GroupVO();
		param.setHclassCd("G15");
		List<EgovMap> cnsGbList = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("cnsGbList", cnsGbList);

		param.setHclassCd("G71");
		List<EgovMap> zoneGbList = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("zoneGbList", zoneGbList);
		
		param.setHclassCd("G90");
		List<EgovMap> leaderGbList = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("leaderGbList", leaderGbList);
		
		// ???????????? ??????
		CenterVO centerVO = new CenterVO();
		List<EgovMap> cnsCenterList = adminManageService.getCenterManageList(centerVO);
		model.addAttribute("cnsCenterList", cnsCenterList);
		model.addAttribute("vo", vo);
		model.addAttribute("authCd", userAuth);
		model.addAttribute("loginVo", loginVo);
		
		return "cnsmng/gCns_reg.main";
	}

	@RequestMapping(value = "/gCnsReg.do", method = RequestMethod.POST)
	public String gCnsReg(GcnsVO vo, HttpServletRequest request, ModelMap model) throws Exception {
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd", mnuCd);

		EgovMap map = (EgovMap) request.getSession().getAttribute("LoginVO");
		vo.setRegId((String) map.get("userId"));
		vo.setCnsrId((String) map.get("userId"));
		counselMngService.insertGcns(vo);

		return "redirect:/gnoincoundb/gCnsList.do?mnuCd=" + mnuCd;
	}

	@RequestMapping(value = "/gCnsDtl.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String gCnsDtl(GcnsVO vo, HttpServletRequest request, ModelMap model) {
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd", mnuCd);

		// ?????? ?????? ??????
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

		if (userAuth > 1) { // ?????? ?????? ????????? ?????????
			vo.setSchCenterGb(Integer.toString(userCenterGb));
		}
		// ?????? ?????? ???
		
		EgovMap map = (EgovMap) request.getSession().getAttribute("LoginVO");
		model.addAttribute("map", map);

		// ???????????? ??????
		GroupVO param = new GroupVO();
		param.setHclassCd("G15");
		List<EgovMap> cnsGbList = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("cnsGbList", cnsGbList);

		param.setHclassCd("G71");
		List<EgovMap> zoneGbList = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("zoneGbList", zoneGbList);
		
		param.setHclassCd("G90");
		List<EgovMap> leaderGbList = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("leaderGbList", leaderGbList);
		
		// ???????????? ??????
		CenterVO centerVO = new CenterVO();
		List<EgovMap> cnsCenterList = adminManageService.getCenterManageList(centerVO);
		model.addAttribute("cnsCenterList", cnsCenterList);

		EgovMap result = counselMngService.getGcns(vo);
		model.addAttribute("result", result);
		model.addAttribute("vo", vo);
		model.addAttribute("authCd", userAuth);
		model.addAttribute("loginVo", loginVo);
		
		return "cnsmng/gCns_dtl.main";
	}

	@RequestMapping(value = "/gCnsUpd.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String gCnsUpd(GcnsVO vo, HttpServletRequest request, ModelMap model) throws Exception {
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd", mnuCd);

		EgovMap map = (EgovMap) request.getSession().getAttribute("LoginVO");
		counselMngService.updateGcns(vo);
		if(vo.getClearYn().equals("Y")) {
			counselMngService.insertUpdGcns(vo);
		}

		return "redirect:/gnoincoundb/gCnsList.do?mnuCd=" + mnuCd;
	}
	
	@RequestMapping(value = "/gCnsDel.do", method = RequestMethod.POST)
	public String gcnsDel(HttpServletRequest request, ModelMap model) {

		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd", mnuCd);
		
		int num =  Integer.parseInt(request.getParameter("num") == null ? "" : request.getParameter("num"));

		counselMngService.deleteGcns(num);
		

		return "redirect:/gnoincoundb/gCnsList.do?mnuCd=" + mnuCd;
	}
	

	@RequestMapping(value = "/psyCnsList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String psyCnsList(PsyCnsVO vo, HttpServletRequest request, ModelMap model) {

		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd", mnuCd);
		
		// ?????? ?????? ??????
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

		if (userAuth > 1) { // ?????? ?????? ????????? ?????????
			vo.setSchCenterGb(Integer.toString(userCenterGb));
		}
		// ?????? ?????? ???

		String regId = loginVo.get("userId").toString();
		vo.setRegId(regId);
		
		switch (userAuth) {
			case 1: vo.setAuthCd("1"); break; 
			case 2: vo.setAuthCd("2"); break; 
			case 3: vo.setAuthCd("3"); break; 
				default: vo.setAuthCd("4"); break; 
		}
		
		// ???????????? ??????
		CenterVO centerVO = new CenterVO();
		List<EgovMap> cnsCenterList = adminManageService.getCenterManageList(centerVO);
		model.addAttribute("cnsCenterList", cnsCenterList);
		
		// ???????????? ??????
		GroupVO param = new GroupVO();
		param.setHclassCd("G15");
		List<EgovMap> cnsGbList = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("cnsGbList", cnsGbList);
		
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(vo.getCurrentPageNo()); // ?????? ????????? ??????
		paginationInfo.setRecordCountPerPage(10); // ??? ???????????? ???????????? ????????? ??????
		paginationInfo.setPageSize(10); // ????????? ???????????? ?????????

		vo.setFirstIndex((vo.getCurrentPageNo() - 1) * 10);
		vo.setLastIndex((vo.getCurrentPageNo()) * 10);		

		// ???????????? ??????(??????)
		List<EgovMap> psyList = counselMngService.getPsyCnsList(vo);
		int totalPageCnt = counselMngService.getPsyCnsListTotCnt(vo);
		model.addAttribute("psyList", psyList);
		model.addAttribute("totalPageCnt", totalPageCnt);
		paginationInfo.setTotalRecordCount(totalPageCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("vo", vo);

		model.addAttribute("authCd", userAuth);
		
		return "cnsmng/psyCns_list.main";
	}

	@RequestMapping(value = "/psyCnsList_ajax.do", method = RequestMethod.POST)
	public String psyCnsList_ajax(HttpServletRequest request, ModelMap model) {

		int g_idx = 0;
		try {
			g_idx = Integer.parseInt(request.getParameter("g_idx"));
		} catch (NumberFormatException err) {
			g_idx = 0;
		}

		List<EgovMap> psyCnsList = counselMngService.getPsyCnsListUser(g_idx);

		model.addAttribute("psyCnsList", psyCnsList);

		return "jsonView";
	}

	@RequestMapping(value = "/linkageReqList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String linkageReqList(LinkReqVO vo, HttpServletRequest request, ModelMap model) {

		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd", mnuCd);

		// ?????? ?????? ??????
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

		if (userAuth > 1) { // ?????? ?????? ????????? ?????????
			vo.setSchCenterGb(Integer.toString(userCenterGb));
		}
		// ?????? ?????? ???
		
		String regId = loginVo.get("userId").toString();
		vo.setRegId(regId);
		
		switch (userAuth) {
			case 1: vo.setAuthCd("1"); break; 
			case 2: vo.setAuthCd("2"); break; 
			case 3: vo.setAuthCd("3"); break; 
				default: vo.setAuthCd("4"); break; 
		}
		
		// ???????????? ??????
		GroupVO param = new GroupVO();
		param.setHclassCd("G15");
		List<EgovMap> cnsGbList = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("cnsGbList", cnsGbList);

		CenterVO centerVO = new CenterVO();
		List<EgovMap> cnsCenterList = adminManageService.getCenterManageList(centerVO);
		model.addAttribute("cnsCenterList", cnsCenterList);
		
		PaginationInfo paginationInfo = new PaginationInfo();

		paginationInfo.setCurrentPageNo(vo.getCurrentPageNo()); // ?????? ????????? ??????
		paginationInfo.setRecordCountPerPage(10); // ??? ???????????? ???????????? ????????? ??????
		paginationInfo.setPageSize(10); // ????????? ???????????? ?????????

		vo.setFirstIndex((vo.getCurrentPageNo() - 1) * 10);
		vo.setLastIndex((vo.getCurrentPageNo()) * 10);

		// ??????????????? ??????
		List<EgovMap> linkList = counselMngService.getLinkageReqList(vo);
		int totalPageCnt = counselMngService.getLinkageReqListTotCnt(vo);
		model.addAttribute("totalPageCnt", totalPageCnt);
		paginationInfo.setTotalRecordCount(totalPageCnt); // ?????? ????????? ??? ???

		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("linkList", linkList);

		// ???????????? ??????(??????)
		List<EgovMap> list = counselMngService.getLinkCnsList(vo);
		model.addAttribute("list", list);
		model.addAttribute("vo", vo);
		
		model.addAttribute("authCd", userAuth);

		return "cnsmng/linkageReq_list.main";
	}

	@RequestMapping(value = "/linkageReqDtl.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String linkageReqDtl(LinkReqVO vo, HttpServletRequest request, ModelMap model) {

		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd", mnuCd);
		String num = request.getParameter("num") == null ? "" : request.getParameter("num");
		model.addAttribute("num", num);

		EgovMap map = (EgovMap) request.getSession().getAttribute("LoginVO");
		model.addAttribute("map", map);
		
		// ????????????
		model.addAttribute("areaCode", comCodeService.selectAreaList());
		// ????????????
		model.addAttribute("centerGbCode", comCodeService.selectCenterGbList());
		// ????????????
		model.addAttribute("zoneGbCode", comCodeService.selectZoneGbList());
		// ????????????
		model.addAttribute("cnsGbCode", comCodeService.selectCnsGbList());

		// ??????????????????
		GroupVO param = new GroupVO();
		param.setHclassCd("G35");
		List<EgovMap> internalGbList = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("internalGbList", internalGbList);
		param.setHclassCd("G36");
		List<EgovMap> outernalGbList = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("outernalGbList", outernalGbList);
		
		// ??????????????? ????????????
		EgovMap reqDtl = null;
		if (num != "") {
			int intNum = Integer.parseInt(num);
			reqDtl = counselMngService.getLinkageReqDetail(intNum);
		}
		model.addAttribute("detail", reqDtl);

		return "cnsmng/linkageReq_dtl.main";
	}

	@RequestMapping(value = "/linkageReqReg.do", method = RequestMethod.POST)
	public String linkageReqReg(LinkReqVO vo, HttpServletRequest request, ModelMap model) {
		EgovMap login = (EgovMap) request.getSession().getAttribute("LoginVO");
		if (request.getParameter("page") != null) {
			model.addAttribute("page", request.getParameter("page"));
		}
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd", mnuCd);
		// ????????????????????? ?????????
		String save = request.getParameter("save") == null ? "" : request.getParameter("save");

		String linkReqGb = vo.getLinkReqGb();

		// System.out.println(String.format("[linkageReqReg] caseNo :
		// %s",vo.getCaseNo()));

		String cnsrId = (String) login.get("userId");
		vo.setCnsrId(cnsrId);
		EgovMap Details = counselMngService.getCnsAcceptDtl(String.format("%s", vo.getCaseNo()));
		vo.setCnsGb(Details.get("cnsGb").toString());
		vo.setZoneGb(Details.get("zoneGb").toString());
		vo.setLocalGb(Details.get("localGb").toString());
		vo.setCenterGb(Details.get("centerGb").toString());
		vo.setBirthDt(Details.get("birthDt").toString());
		vo.setGender(Details.get("gender").toString());
		vo.setTelNo(Details.get("tel").toString());
		vo.setAddr(Details.get("addr").toString());

		// System.out.println("@@@@@@@@@@@@@@@@@@@@@@@ linkReqGb ??? ?????? : "+linkReqGb);
		if (save.equals("S")) {
			if (linkReqGb.equals("1")) {
				vo.setTelNo(Details.get("mobile").toString());
				// ?????? ??????????????? ??????
				// ut.println("@@@@@@@@@@@@@@@@@@@@ "+vo.getPsycRstMmseds());
				counselMngService.insertLinkageInReq(vo);
			} else {
				// ?????? ??????????????? ??????
				counselMngService.insertLinkageOutReq(vo);
			}

		} else {
			if (linkReqGb.equals("1")) {
				// ?????? ??????????????? ??????
				vo.setNum(Integer.parseInt(save));
				vo.setTelNo(Details.get("mobile").toString());
				counselMngService.updateLinkageInReq(vo);
			} else {
				// System.out.println("@@@@@@@@@@@@@@@@@@@@@@@ age ??? ?????? : "+vo.getAge());
				// ?????? ??????????????? ??????
				vo.setNum(Integer.parseInt(save));
				counselMngService.updateLinkageOutReq(vo);
			}
		}

		return "redirect:/gnoincoundb/linkageReqList.do?mnuCd=" + mnuCd;
	}

	@RequestMapping(value = "/linkageReq_popup.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String linkageReqPopup(LinkReqVO vo, HttpServletRequest request, ModelMap model) {

		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");

		return "cnsmng/linkageReq_popup";
	}

	@RequestMapping(value = "/linkageReqPopupReg.do", method = RequestMethod.POST)
	public String linkageReqPopupReg(LinkReqVO vo, HttpServletRequest request, ModelMap model) {
		if (request.getParameter("page") != null) {
			model.addAttribute("page", request.getParameter("page"));
		}
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");

		EgovMap map = (EgovMap) request.getSession().getAttribute("LoginVO");
		String regId = (String) map.get("userId");
		vo.setRegId(regId);

		// ??????????????? ?????????
		counselMngService.insertLinkageReqUpload(vo);

		return "redirect:/gnoincoundb/linkageReqList.do?mnuCd=" + mnuCd;
	}

	@RequestMapping(value = "/superVisionList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String superVisionList(LinkReqVO vo, SupperVisionVO svo, HttpServletRequest request, ModelMap model) {

		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd", mnuCd);

		// ?????? ?????? ??????
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

		if (userAuth > 1) { // ?????? ?????? ????????? ?????????
			vo.setSchCenterGb(Integer.toString(userCenterGb));
		}
		
		String regId = loginVo.get("userId").toString();
		vo.setRegId(regId);
		
		switch (userAuth) {
			case 1: vo.setAuthCd("1"); break; 
			case 2: vo.setAuthCd("2"); break; 
			case 3: vo.setAuthCd("3"); break; 
				default: vo.setAuthCd("4"); break; 
		}
		
		// ?????? ?????? ???
		
		// ???????????? ??????
		GroupVO param = new GroupVO();
		param.setHclassCd("G15");
		List<EgovMap> cnsGbList = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("cnsGbList", cnsGbList);

		param.setHclassCd("G72");
		List<EgovMap> localGbList = adminManageService.getGroupMngDtlMList(param);
		model.addAttribute("localGbList", localGbList);

		CenterVO centerVO = new CenterVO();
		List<EgovMap> cnsCenterList = adminManageService.getCenterManageList(centerVO);
		model.addAttribute("cnsCenterList", cnsCenterList);

		PaginationInfo paginationInfo = new PaginationInfo();

		paginationInfo.setCurrentPageNo(svo.getCurrentPageNo()); // ?????? ????????? ??????
		paginationInfo.setRecordCountPerPage(10); // ??? ???????????? ???????????? ????????? ??????
		paginationInfo.setPageSize(10); // ????????? ???????????? ?????????

		svo.setFirstIndex((svo.getCurrentPageNo() - 1) * 10);
		svo.setLastIndex((svo.getCurrentPageNo()) * 10);

		// ???????????? ??????
		List<EgovMap> sList = counselMngService.getSuperVisionList(svo);
		
		int totalPageCnt = counselMngService.getSuperVisionListTotCnt(svo);
		model.addAttribute("totalPageCnt", totalPageCnt);
		paginationInfo.setTotalRecordCount(totalPageCnt); // ?????? ????????? ??? ???
		  
		model.addAttribute("paginationInfo", paginationInfo);
		
		model.addAttribute("sList", sList);

		// ???????????? ??????(??????)
		List<EgovMap> list = counselMngService.getLinkCnsList(vo);
		model.addAttribute("list", list);
		model.addAttribute("vo", vo);
		return "cnsmng/superVision_list.main";
	}

	@RequestMapping(value = "/superVisionDtl.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String superVisionDtl(LinkReqVO vo, SupperVisionVO svo, HttpServletRequest request, ModelMap model) {

		// ?????? ?????? ??????
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

		if (userAuth > 1) { // ?????? ?????? ????????? ?????????
			vo.setSchCenterGb(Integer.toString(userCenterGb));
		}
		
		String regId = loginVo.get("userId").toString();
		vo.setRegId(regId);
		
		switch (userAuth) {
			case 1: vo.setAuthCd("1"); break; 
			case 2: vo.setAuthCd("2"); break; 
			case 3: vo.setAuthCd("3"); break; 
				default: vo.setAuthCd("4"); break; 
		}
		
		// ?????? ?????? ???
		
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd", mnuCd);
		String num = request.getParameter("num") == null ? "" : request.getParameter("num");

		// ????????????
		EgovMap svDtl = null;
		// ????????????
		EgovMap replyDtl = null;
		if (num != "") {
			int intNum = Integer.parseInt(num);
			svDtl = counselMngService.getSuperVisionDtl(intNum);
			if (svDtl != null) {
				String answerYn = (String) svDtl.get("answerYn");

				if (answerYn.equals("Y")) {
					replyDtl = counselMngService.getSuperVisionReplyDtl(intNum);
				}
			}
		}

		// ????????????
		List<EgovMap> list = counselMngService.getLinkCnsList(vo);
		model.addAttribute("list", list);
		model.addAttribute("detail", svDtl);
		model.addAttribute("replyDtl", replyDtl);
		model.addAttribute("vo", vo);
		model.addAttribute("authCd", userAuth);
		model.addAttribute("loginVo", loginVo);
		/*model.addAttribute("userId", (String)loginVo.get("userId"));
		model.addAttribute("centerNm", (String)loginVo.get("centerNm"));
		model.addAttribute("userNm", (String)loginVo.get("userNm"));*/
		return "cnsmng/superVision_dtl.main";
	}

	@RequestMapping(value = "/superVisionReg.do", method = RequestMethod.POST)
	public String superVisionReg(SupperVisionVO vo, HttpServletRequest request, ModelMap model) {
		EgovMap login = (EgovMap) request.getSession().getAttribute("LoginVO");

		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		String save = request.getParameter("save") == null ? "" : request.getParameter("save");

		// System.out.println(String.format("[superVisionReg]1 caseNo :
		// %s",vo.getCaseNo()));

		/*
		 * EgovMap Details =
		 * counselMngService.getCnsAcceptDtl(String.format("%s",vo.getCaseNo()));
		 * 
		 * System.out.println(String.format("[superVisionReg]2 caseNo : %s",Details.get(
		 * "caseNo")));
		 */

		vo.setCnsGb(login.get("cnsGb").toString());
		vo.setZoneGb(login.get("zoneGb").toString());
		// vo.setLocalGb(login.get("localGb").toString());
		vo.setCenterGb(login.get("centerGb").toString());

		vo.setCnsrGb(login.get("cnsrGb").toString());
		vo.setCnsrId(login.get("userId").toString());
		vo.setCaseNo(0);

		// System.out.println(String.format("[superVisionReg]3 vo : %s",vo.toString()));

		if (save.equals("S")) {
			// ???????????? ???????????? ??????
			counselMngService.insertSuperVisionReg(vo);
		} else if (save.equals("U")) {
			// ???????????? ???????????? ??????
			counselMngService.updateSuperVisionReg(vo);
		} else if (save.equals("R")) {
			// ???????????? ???????????? ??????
			counselMngService.insertSuperVisionReplyReg(vo);
		} else if (save.equals("RU")) {
			// ???????????? ???????????? ??????
			counselMngService.updateSuperVisionReplyReg(vo);
		}

		return "redirect:/gnoincoundb/superVisionList.do?mnuCd=" + mnuCd;

	}

	private String getBrowser(HttpServletRequest request) {
		String header = request.getHeader("User-Agent");
		if (header.indexOf("MSIE") > -1 || header.indexOf("Trident") > -1)
			return "MSIE";
		else if (header.indexOf("Chrome") > -1)
			return "Chrome";
		else if (header.indexOf("Opera") > -1)
			return "Opera";
		return "Firefox";
	}

	private String getDisposition(String filename, String browser) throws UnsupportedEncodingException {
		String dispositionPrefix = "attachment;filename=";
		String encodedFilename = null;
		if (browser.equals("MSIE")) {
			encodedFilename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "%20");
		} else if (browser.equals("Firefox")) {
			encodedFilename = "\"" + new String(filename.getBytes("UTF-8"), "8859_1") + "\"";
		} else if (browser.equals("Opera")) {
			encodedFilename = "\"" + new String(filename.getBytes("UTF-8"), "8859_1") + "\"";
		} else if (browser.equals("Chrome")) {
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < filename.length(); i++) {
				char c = filename.charAt(i);
				if (c > '~') {
					sb.append(URLEncoder.encode("" + c, "UTF-8"));
				} else {
					sb.append(c);
				}
			}
			encodedFilename = sb.toString();
		}
		return dispositionPrefix + encodedFilename;
	}

	@RequestMapping(value = "/fileDown.do", method = RequestMethod.POST)
	public void fileDown(PreExamVO vo, HttpServletRequest request, HttpServletResponse response) throws IOException {

		String FileName = "";

		try {
			FileName = AES256Crypto.getInstance().AESDecode(vo.getSysFileNm());
		} catch (InvalidKeyException e) {
			FileName = vo.getSysFileNm();
			utility.func.Logging(this.getClass().getName(), "DECODE_ERROR : Invalid Key Exception");
		} catch (NoSuchAlgorithmException e) {
			FileName = vo.getSysFileNm();
			utility.func.Logging(this.getClass().getName(), "DECODE_ERROR : No Such AlgorithmException");
		} catch (NoSuchPaddingException e) {
			FileName = vo.getSysFileNm();
			utility.func.Logging(this.getClass().getName(), "DECODE_ERROR : No Such Padding Exception");
		} catch (InvalidAlgorithmParameterException e) {
			FileName = vo.getSysFileNm();
			utility.func.Logging(this.getClass().getName(), "DECODE_ERROR : Invaild Algorithm Parameter Exception");
		} catch (IllegalBlockSizeException e) {
			FileName = vo.getSysFileNm();
			utility.func.Logging(this.getClass().getName(), "DECODE_ERROR : Illegal Block Size Exception");
		} catch (BadPaddingException e) {
			FileName = vo.getSysFileNm();
			utility.func.Logging(this.getClass().getName(), "DECODE_ERROR : Bad Padding Exception");
		}

		String FilePathName2 = utility.func.filePath + FilenameUtils.getName(vo.getFilePath()) + "\\";
		String FilePathName = utility.func.filePath;
		System.out.println("FilePathName : " + FilePathName);
		System.out.println("FilePathName2 : " + FilePathName2);
		File file = new File(FilenameUtils.getFullPath(FilePathName), FilenameUtils.getName(FileName));
		if (!file.exists()) {
			file = new File(FilenameUtils.getFullPath(FilePathName2), FilenameUtils.getName(FileName));
			System.out.println("?????? ??????2??? ??? : " + file);
		}
		System.out.println("?????? ????????? ??? : " + file);

		if (file.exists() && file.isFile()) {
			System.out.println("File Exists : " + utility.func.filePath + vo.getFilePath() + "/" + FileName);
			response.setContentType("application/octet-stream; charset=utf-8");
			response.setContentLength((int) file.length());
			String browser = getBrowser(request);
			String disposition = getDisposition(vo.getFileNm(), browser);
			response.setHeader("Content-Disposition", disposition);
			response.setHeader("Content-Transfer-Encoding", "binary");
			OutputStream out = response.getOutputStream();
			FileInputStream fis = null;
			fis = new FileInputStream(file);
			FileCopyUtils.copy(fis, out);
			if (fis != null)
				fis.close();
			out.flush();
			out.close();
			System.out.println("File Donwload Complete");
		}

	}

	@RequestMapping(value = "/cnsEndPopup.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String cnsEndPopup(HttpServletRequest request, ModelMap model) {
		
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd", mnuCd);
		String cnsleId = request.getParameter("cnsleId") == null ? "" : request.getParameter("cnsleId");
		model.addAttribute("cnsleId", cnsleId);
		
		String cnsEndCd = request.getParameter("cnsEndCd") == null ? "" : request.getParameter("cnsEndCd");
		model.addAttribute("cnsEndCd", cnsEndCd);
		String cnsEndDt = request.getParameter("cnsEndDt") == null ? "" : request.getParameter("cnsEndDt");
		model.addAttribute("cnsEndDt", cnsEndDt);
		String num = request.getParameter("num");
		model.addAttribute("num", num);
		
		EgovMap map = (EgovMap) request.getSession().getAttribute("LoginVO");
		model.addAttribute("map", map);
		

		return "cnsmng/cnsEndPopup.main";
	}

	@RequestMapping(value = "/cnsEndReg.do", method = RequestMethod.POST)
	public String cnsEndReg(CnsEndVO vo, HttpServletRequest request, ModelMap model) {

		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		
		EgovMap map = (EgovMap) request.getSession().getAttribute("LoginVO");
		vo.setZoneGb((String) map.get("zoneGb"));
		vo.setCenterGb((String) map.get("centerGb"));
		vo.setLocalGb((String) map.get("localGb"));

		counselMngService.insertCnsEnd(vo);
		return "redirect:/gnoincoundb/perCnsList.do?mnuCd=" + mnuCd;
	}

	// ?????? ????????? ????????????
	@RequestMapping(value = "/psyCnsDoc.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String psyCnsDoc(PsyCnsDocVO vo, HttpServletRequest request, ModelMap model) {

		return "psycnsdoc/psyCnsDoc" + request.getParameter("rnum");
	}

	// ?????? ?????? SELECT
	@RequestMapping(value = "/getPsyCnsDocValue.do", method = RequestMethod.POST)
	public String getPsyCnsDocValue(HttpServletRequest request, ModelMap model, PsyCnsDocVO vo) {

		vo.setpsyIdx(Integer.parseInt(request.getParameter("psyIdx")));
		vo.setExamDocCd(request.getParameter("psyIdx"));

		EgovMap list = counselMngService.selectPsyCnsDoc(vo);
		model.addAttribute("list", list);
		return "jsonView";
	}

	// ?????? ?????? PROCESS
	@RequestMapping(value = "/psyCnsDocReg.do", method = RequestMethod.POST)
	public String psyCnsDocReg(PsyCnsDocVO vo, HttpServletRequest request, ModelMap model) {
		EgovMap login = (EgovMap) request.getSession().getAttribute("LoginVO");

		vo.setLocalGb((String) login.get("localGb"));
		vo.setCenterGb((String) login.get("centerGb"));
		vo.setZoneGb((String) login.get("zoneGb"));
		vo.setCnsrNm((String) login.get("userNm"));

		vo.setgIdx(Integer.parseInt(request.getParameter("g_idx")));
		vo.setpsyIdx(Integer.parseInt(request.getParameter("psy_idx")));
		vo.setExamDocCd(request.getParameter("psy_idx"));
		vo.setdtlIdx(Integer.parseInt(request.getParameter("dtl_idx")));
		vo.setCaseNo(Integer.parseInt(request.getParameter("caseNo")));
		vo.setCnsrId((String)login.get("userId"));
		String msg = "";

		switch (vo.getpsyIdx()) {
		case 101:
			vo.setwriteDt(String.format("20%s.%s.%s", vo.getno1(), vo.getno2(), vo.getno3()));
			vo.setendDt(String.format("20%s.%s.%s", vo.getno4(), vo.getno5(), vo.getno6()));
			break;
		}

		if (vo.getdtlIdx() == 0) {
			counselMngService.insertPsyCnsDoc(vo);
			msg = "????????? ?????? ????????????.";
		} else {
			counselMngService.updatePsyCnsDoc(vo);
			msg = "????????? ?????? ????????????.";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("mnuCd", "M0204");
		model.addAttribute("vo", vo);
		// return "jsonView";
		return "psycnsdoc/psyCnsDoc1";
	}

}