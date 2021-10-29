package ggsc.adstv.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import ggsc.adstv.service.AdministrativeService;
import ggsc.adstv.service.InspectionVO;


@Controller

public class AdministrativeController {
	
	@Resource(name = "AdministrativeService")
	private AdministrativeService administrativeService;
	
	@RequestMapping(value = "/inspection_mng_list.do", method = RequestMethod.GET )
	public String inspection_mng_list(HttpServletRequest request, ModelMap model) {
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd", mnuCd);
		
		return "adstv/inspection_mng_list.main";
	}
	
	@RequestMapping(value = "/inspection_mng_list_ajax.do", method = RequestMethod.POST )
	public String inspection_mng_list_ajax(HttpServletRequest request, ModelMap model, InspectionVO vo) {
		
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(vo.getCurrentPageNo()); // 현재 페이지 번호
		paginationInfo.setRecordCountPerPage(10); // 한 페이지에 게시되는 게시물 건수
		paginationInfo.setPageSize(10); // 페이징 리스트의 사이즈
		vo.setFirstIndex((vo.getCurrentPageNo() - 1) * 10);
		vo.setLastIndex((vo.getCurrentPageNo()) * 10);
		
		// 검사지관리 목록
		List<EgovMap> list = administrativeService.getInspectionList(vo);
		model.addAttribute("list", list);
		// 검사지관리 목록 갯수
		int totalPageCnt = administrativeService.getInspectionTotalCnt(vo);
		
		model.addAttribute("totalPageCnt", totalPageCnt);
		paginationInfo.setTotalRecordCount(totalPageCnt); // 전체 게시물 건 수
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("vo", vo);
		return "jsonView";
	}
	
}