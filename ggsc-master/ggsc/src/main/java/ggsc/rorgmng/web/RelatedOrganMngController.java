package ggsc.rorgmng.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import ggsc.cnsr.service.AdminManageService;
import ggsc.cnsr.service.CenterVO;
import ggsc.cnsr.service.GroupVO;
import ggsc.rorgmng.service.RelatedOrganMngService;
import ggsc.rorgmng.service.RorgMngVO;


@Controller

public class RelatedOrganMngController {
	
	@Resource(name = "RelatedOrganMngService")
	private RelatedOrganMngService relatedOrganMngService;
	
	@Resource(name = "AdminManageService")
	private AdminManageService adminManageService;
	
	@RequestMapping(value = "/relatedOrgan_mng_list.do", method = { RequestMethod.POST , RequestMethod.GET } )
	public String inspection_mng_list(HttpServletRequest request, ModelMap model) {
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd", mnuCd);
		
		// 상담구분 코드
	      GroupVO groupVo = new GroupVO();
	      groupVo.setHclassCd("G15");
	      List<EgovMap> cnsGbList = adminManageService.getGroupMngDtlMList(groupVo);
	      model.addAttribute("cnsGbList", cnsGbList);
	      
	      // 센터구분
	      CenterVO centerVO = new CenterVO();
	      List<EgovMap> cnsCenterList = adminManageService.getCenterManageList(centerVO);
	      model.addAttribute("cnsCenterList", cnsCenterList);
	      
	      // 지역 구분
	      groupVo.setHclassCd("G72");
	      List<EgovMap> localGbList = adminManageService.getGroupMngDtlMList(groupVo);
	      model.addAttribute("localGbList", localGbList);
	      
	      groupVo.setHclassCd("G80");
	      List<EgovMap> organGbList = adminManageService.getGroupMngDtlMList(groupVo);
	      model.addAttribute("organGbList", organGbList);
	      
	      // 권역구분
	      groupVo.setHclassCd("G71");
	      List<EgovMap> zoneGbList = adminManageService.getGroupMngDtlMList(groupVo);
	      model.addAttribute("zoneGbList", zoneGbList);
	      
	      
	      
		return "orgmng/relatedOrgan_mng_list.main";
	}
	
	@RequestMapping(value = "/relatedOrgan_mng_list_ajax.do", method = { RequestMethod.POST , RequestMethod.GET })
	public String relatedOrgan_mng_list_ajax(HttpServletRequest request, ModelMap model, RorgMngVO vo) {
		String num = request.getParameter("num") == null ? "" : request.getParameter("num");
		model.addAttribute("num", num);
		
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(vo.getCurrentPageNo()); // 현재 페이지 번호
		paginationInfo.setRecordCountPerPage(10); // 한 페이지에 게시되는 게시물 건수
		paginationInfo.setPageSize(10); // 페이징 리스트의 사이즈
		vo.setFirstIndex((vo.getCurrentPageNo() - 1) * 10);
		vo.setLastIndex((vo.getCurrentPageNo()) * 10);
		
		List<EgovMap> list = relatedOrganMngService.getRelatedOrganMngList(vo);
		model.addAttribute("list", list);
		int totalPageCnt = relatedOrganMngService.getRelatedOrganMngTotalCnt(vo);
		
		model.addAttribute("totalPageCnt", totalPageCnt);
		paginationInfo.setTotalRecordCount(totalPageCnt); // 전체 게시물 건 수
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("vo", vo);
		return "jsonView";
	}
	
	@RequestMapping(value = "/relatedOrgan_info_list.do", method = RequestMethod.GET )
	public String relatedOrgan_info_list(HttpServletRequest request, ModelMap model) {
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd", mnuCd);
		
		return "orgmng/relatedOrgan_info_list";
	}
	
	@RequestMapping(value = "/relatedOrgan_info_list_ajax.do", method = RequestMethod.POST )
	public String relatedOrgan_info_list_ajax(HttpServletRequest request, ModelMap model, RorgMngVO vo) {
		String num = request.getParameter("num") == null ? "" : request.getParameter("num");
		model.addAttribute("num", num);
		
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(vo.getCurrentPageNo()); // 현재 페이지 번호
		paginationInfo.setRecordCountPerPage(10); // 한 페이지에 게시되는 게시물 건수
		paginationInfo.setPageSize(10); // 페이징 리스트의 사이즈
		vo.setFirstIndex((vo.getCurrentPageNo() - 1) * 10);
		vo.setLastIndex((vo.getCurrentPageNo()) * 10);
		
		// 유관기관관리 목록
		List<EgovMap> list = relatedOrganMngService.getRelatedOrganMngList(vo);
		model.addAttribute("list", list);
		int totalPageCnt = relatedOrganMngService.getRelatedOrganMngTotalCnt(vo);
		
		model.addAttribute("totalPageCnt", totalPageCnt);
		paginationInfo.setTotalRecordCount(totalPageCnt); // 전체 게시물 건 수
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("vo", vo);
		return "jsonView";
	}
	
	@RequestMapping(value = "/relatedOrgan_mng_dtl.do", method = { RequestMethod.POST , RequestMethod.GET })
	public String relatedOrgan_mng_dtl(HttpServletRequest request, ModelMap model) {
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd", mnuCd);
		String num = request.getParameter("num") == null ? "" : request.getParameter("num");
		
		/*int integerNum = Integer.parseInt(num);
		EgovMap detail = relatedOrganMngService.getRelatedOrganMngDtl(integerNum);
		model.addAttribute("detail", detail);*/
		
		EgovMap reOrgDtl = null;
		if(num !=""){
			int integerNum = Integer.parseInt(num);
			reOrgDtl = relatedOrganMngService.getRelatedOrganMngDtl(integerNum);
		}
		model.addAttribute("detail", reOrgDtl);
		
		GroupVO groupVo = new GroupVO();
		// 지역 구분
		groupVo.setHclassCd("G72");
		List<EgovMap> localGbList = adminManageService.getGroupMngDtlMList(groupVo);
		model.addAttribute("localGbList", localGbList);
		// 기관 구분
		groupVo.setHclassCd("G80");
		List<EgovMap> organGbList = adminManageService.getGroupMngDtlMList(groupVo);
		model.addAttribute("organGbList", organGbList);
      
		return "orgmng/relatedOrgan_mng_dtl.main";
	}
	
	@RequestMapping(value = "/relatedOrgan_mng_dtl_ajax.do", method = { RequestMethod.POST , RequestMethod.GET } )
	public String relatedOrgan_mng_dtl_ajax(HttpServletRequest request, ModelMap model, RorgMngVO vo) {
		System.out.println("vo 값 확인 : "+vo);
		// 유관기관명 중복체크
		int relOrgNmChk = relatedOrganMngService.getRelatedOrganCdChk(vo);
		model.addAttribute("relOrgNmChk", relOrgNmChk);
		return "jsonView";
	}
	
	@RequestMapping(value = "/relatedOrgan_mng_reg.do", method = RequestMethod.POST )
	public String relatedOrgan_mng_reg(HttpServletRequest request, ModelMap model, RorgMngVO vo) {
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		String regId = (String)map.get("userId");
		vo.setRegId(regId);
		
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd", mnuCd);
		String save = request.getParameter("save") == null ? "" : request.getParameter("save");
		String orgCd = vo.getRelOrgGb();
		orgCd = "gb"+orgCd;
		vo.setRelOrgGb("");
		vo.setRelOrgGb(orgCd);
		System.out.println("유관기관관리 VO 값 : "+vo);
		
		if(save.equals("S")) {
			// 유관기관 등록
			relatedOrganMngService.insertRelatedOrgan(vo);
		} else if(save.equals("U")) {
			// 유관기관 수정
			relatedOrganMngService.updateRelatedOrgan(vo);
		}
		return "redirect:/gnoincoundb/relatedOrgan_mng_list.do?mnuCd=" + mnuCd;
	}
	
}