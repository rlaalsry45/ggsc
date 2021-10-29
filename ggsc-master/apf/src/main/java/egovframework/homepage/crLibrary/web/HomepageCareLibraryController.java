package egovframework.homepage.crLibrary.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.homepage.crLibrary.service.CrLibraryVO;
import egovframework.homepage.crLibrary.service.HomepageCareLibraryService;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class HomepageCareLibraryController {
	
	/** homepageFreeBbsService */
	@Resource(name = "homepageCareLibraryService")
	private HomepageCareLibraryService homepageCareLibraryService;
	
	@RequestMapping(value = "careLibraryList.do")
	public String careLibraryList(CrLibraryVO vo, HttpServletRequest request, ModelMap model) {
		
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		if(map == null) {
			model.addAttribute("loginYn", "N");
		} else {
			model.addAttribute("loginYn", "Y");
		}
		
		/** pageing setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(vo.getPageIndex());
		paginationInfo.setRecordCountPerPage(vo.getPageUnit());
		paginationInfo.setPageSize(vo.getPageSize());

		vo.setFirstIndex(paginationInfo.getFirstRecordIndex());
		vo.setLastIndex(paginationInfo.getLastRecordIndex());
		vo.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		// 센터 목록 갯수
		int totalPageCnt = homepageCareLibraryService.getCareLibraryTotal(vo);
		paginationInfo.setTotalRecordCount(totalPageCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("vo", vo);
		
		// 마음돌봄 자료실  목록
		List<EgovMap> crLibraryList = homepageCareLibraryService.getCrLibraryList(vo);
		model.addAttribute("crLibraryList", crLibraryList);
		
		return "homepage/careLibrary/careLibraryList";
	}
	
	@RequestMapping(value = "careLibraryInsert.do")
	public String careLibraryInsert(CrLibraryVO vo, HttpServletRequest request, ModelMap model) {
		
		return "homepage/careLibrary/careLibraryInsert";
	}
	
	@RequestMapping(value = "careLibraryView.do")
	public String careLibraryView(CrLibraryVO vo, HttpServletRequest request, ModelMap model) {
		
		String num = request.getParameter("num") == null ? "" : request.getParameter("num");
		
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(vo.getPageIndex()); // 현재 페이지 번호
		paginationInfo.setRecordCountPerPage(10); // 한 페이지에 게시되는 게시물 건수
		paginationInfo.setPageSize(10); // 페이징 리스트의 사이즈

		vo.setFirstIndex((paginationInfo.getFirstRecordIndex() - 1) * 10);
		vo.setLastIndex(paginationInfo.getLastRecordIndex() * 10);
		
		int totalPageCnt = homepageCareLibraryService.getCareLibraryTotal(vo);
		model.addAttribute("totalPageCnt", totalPageCnt);
		paginationInfo.setTotalRecordCount(totalPageCnt); // 전체 게시물 건 수
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("vo", vo);
		
		// 마음돌봄 자료실 상세보기
		EgovMap CrlibDtl = null;
		if(num !="") {
			// 마음돌봄 자료실 상세보기
			CrlibDtl = homepageCareLibraryService.getCareLibraryDtl(vo);
		}
		model.addAttribute("detail", CrlibDtl);
		
		return "homepage/careLibrary/careLibraryView";
	}
	
}