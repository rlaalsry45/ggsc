package egovframework.homepage.mypage.web;

import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.homepage.com.util.service.ComCodeService;
import egovframework.homepage.mypage.service.HomepageMypageService;
import egovframework.homepage.mypage.service.MypageVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
public class HomepageMypageController {
	
	/** homepageMypageService */
	@Resource(name = "homepageMypageService")
	private HomepageMypageService homepageMypageService;
	
	/** ComCodeService */
	@Resource(name = "comCodeService")
	private ComCodeService comCodeService;
	
	@RequestMapping(value = "/mypageView.do")
	public String mypageView(MypageVO vo, HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		if(map == null) {
			model.addAttribute("loginYn", "N");	
			response.setContentType("text/html; charset=UTF-8");		 
			PrintWriter out = response.getWriter();		 
			out.println("<script>alert('로그인 후에 마이페이지를 열람할 수 있습니다.');</script>");
			out.flush();
			return "/main/login.page";
		} else {
			model.addAttribute("loginYn", "Y");
		}
		
		vo.setCnsleId((String)map.get("userId"));
		// 마이페이지 최근상담내역
		EgovMap recCns = homepageMypageService.getMypageRecCns(vo);
		model.addAttribute("recCns",recCns);
		// 상담이력 목록
		List<EgovMap> cnsHisList = homepageMypageService.getMypageCnsHisList(vo);
		model.addAttribute("cnsHisList",cnsHisList);
		// 상담구분
		model.addAttribute("cnsGbCode", comCodeService.selectCnsGbList());
		// 상담진행상태
		model.addAttribute("cnsStatCode", comCodeService.selectCnsStatList());
		/*return "homepage/mypage/mypageView";*/
		return "/mypage/mypageView.page";
	}
	
	@RequestMapping(value = "/mypageDtl.do")
	public String mypageDtl(MypageVO vo, HttpServletRequest request, ModelMap model){
		
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		if(map == null) {
			model.addAttribute("loginYn", "N");
		} else {
			model.addAttribute("loginYn", "Y");
		}
		
		try {
			vo.setCnsleId((String)map.get("userId"));
			
			String caseNo = request.getParameter("caseNo") == null ? "" : request.getParameter("caseNo");
			vo.setCaseNo(Integer.parseInt(caseNo));
			
			// 마이페이지 상세보기
			EgovMap mypageDtl = homepageMypageService.getMypageRecCnsDtl(vo);
			model.addAttribute("detail",mypageDtl);
			
			// 상담구분
			model.addAttribute("cnsGbCode", comCodeService.selectCnsGbList());
			// 상담진행상태
			model.addAttribute("cnsStatCode", comCodeService.selectCnsStatList());
			
			return "/mypage/mypageDtl.page";
		} catch (Exception e) {
			utility.func.Logging(this.getClass().getName(), e);
			return null;

		}
	}
	
}