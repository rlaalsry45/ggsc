package egovframework.homepage.main.web;

import java.security.Key;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.homepage.cmSpace.service.CmSpaceVO;
import egovframework.homepage.cmSpace.service.HomepageCmSpaceService;
import egovframework.homepage.main.service.HomepageMainService;
import egovframework.homepage.main.service.LoginVO;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.user.main.service.MainDefaultVO;

@Controller
public class HomepageMainController {

	/** homepageMainService */
	@Resource(name = "homepageMainService")
	private HomepageMainService homepageMainService;

	/** homepageMainService */
	@Resource(name = "homepageCmSpaceService")
	private HomepageCmSpaceService homepageCmSpaceService;
	
	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;
	
	private Key keySpec;
	private String iv;
	private String key = "aes256-key-apf";
	
	private static final String IS_MOBILE = "MOBI";
	private static final String IS_PC = "PC";
	

	/**
	 * 글 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 SampleDefaultVO
	 * @param model
	 * @return "egovSampleList"
	 * @exception Exception
	 */
	
	@RequestMapping(value = "/homepageMainList.do")
	public String homepageMainList(CmSpaceVO cmSpaceVO, ModelMap model, HttpServletRequest request) throws Exception {
		
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		if(map == null) {
			model.addAttribute("loginYn", "N");
		} else {
			model.addAttribute("loginYn", "Y");
		}
		
		// 자유게시판 목록
		List<EgovMap> freeBoardList = homepageCmSpaceService.getFreeBoardListM(cmSpaceVO);
		model.addAttribute("freeBoardList", freeBoardList);
		
		// 문서자료실 목록
		List<EgovMap> docLibraryList = homepageCmSpaceService.getDocLibraryListM(cmSpaceVO);
		model.addAttribute("docLibraryList", docLibraryList);
		
		// 센터 목록
		List<EgovMap> centerNewsList = homepageCmSpaceService.getCenterNewsListM(cmSpaceVO);
		if(centerNewsList.size() > 0) {
			model.addAttribute("centerNewsList1", centerNewsList.get(0));
			model.addAttribute("centerNewsList2", centerNewsList.get(1));
			model.addAttribute("centerNewsList3", centerNewsList.get(2));
		}
		model.addAttribute("map",map);
		
		String userAgent = request.getHeader("User-Agent").toUpperCase();
		if (userAgent.indexOf(IS_MOBILE) > -1) {
			return "redirect:https://www.gg.go.kr/mgnoincoun/mobileMainList.do";
		} else {
			return "/main/main.main";
		}
		/*return "/main/main.page";*/
		/*return "/main/main.main";*/
	}
	
	@RequestMapping(value = "/actionLogin.do")
	public String actionLogin(@ModelAttribute("LoginVO") LoginVO vo,HttpServletRequest req, HttpServletResponse response,  ModelMap model) throws Exception {
		
		EgovMap resultVO = homepageMainService.actionLogin(vo);

	    boolean loginPolicyYn = true;
	    if (null != resultVO  && null != resultVO.get("userId") && loginPolicyYn) {
	    	/*if(resultVO.get("useYn").equals("N")) {
	    		model.addAttribute("message", "아직 승인처리가 되지 않았습니다.");
	    		return "redirect:/gnoincoun/login.do";
	    	}*/
	    	HttpSession session = req.getSession();
	    	session.setAttribute("LoginVO", resultVO);
	    	
	    	req.getSession().setAttribute("LoginVO", resultVO);
	    	model.addAttribute("userVO",resultVO);
	    	
	    	return "redirect:/gnoincoun/homepageMainList.do?loginYn=Y";

	    } else {
	    	model.addAttribute("message", "일치하는 정보가 없습니다.");
	    	return "redirect:/gnoincoun/login.do";
	    }
	    
		/*System.out.println("login 컨틀롤 start @@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		
	    HttpSession session = req.getSession();
		CommonUtils commonUtils = new CommonUtils();
		
		vo.setUserId((String)req.getParameter("userId"));
		
		//입력받은 비밀번호
		String inputPwd = (String)req.getParameter("pw");
		String inputId = (String)req.getParameter("userId");
		
		// 로그인 정보를 조회 admlogin==null
		LoginVO admlogin = homepageMainService.actionLogin(vo);
		System.out.println("vo값 확인 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"+vo);
		System.out.println("admlogin값 확인 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"+admlogin);
		if(admlogin==null){
			model.addAttribute("onSucess", "fail");
			vo.setUserId(null);
			vo.setPw(null);
			model.addAttribute("message", "일치하는 정보가 없습니다.");
			return "redirect:/login.do";
		}else{
			model.addAttribute("loginYn", "Y");
			req.setAttribute("id", admlogin.getUserId());
			req.setAttribute("password", admlogin.getPw());
			req.setAttribute("loginYn", "Y");
			//DB에 저장된 암호화값
			String newpwd = admlogin.getNew_pwd();
			System.out.println("db 저장된 압호화값 newpwd ===============  "+ newpwd);
			
			System.out.println("입력받은 id ===============  "+ inputId);
			//로그인페이지에서 입력 받은 PWD에 대한 암호화값
			byte[] encrypted = commonUtils.encrypted(inputPwd, inputId);
			String en_newPwd = new String(Base64.encodeBase64(encrypted));
			System.out.println("입력받은 비밀번호 변환값 en_newPwd ===== "+en_newPwd);
			
			if(newpwd.equals(en_newPwd)){
				session.setAttribute("userId", admlogin.getUserId());
				session.setAttribute("pw", admlogin.getPw());
				session.setAttribute("UserName", admlogin.getUserNm());
				
				req.getSession().setAttribute("admlogin", admlogin);
				
				return "redirect:/homepageMainList.do";
			}else{
				return "redirect:/login.do";
			}
			
		}*/
	    
	}

	@RequestMapping(value = "/login.do")
	public String login(@ModelAttribute("searchVO") MainDefaultVO searchVO, ModelMap model, HttpServletRequest request) throws Exception {
		
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		if(map == null) {
			model.addAttribute("loginYn", "N");
		} else {
			model.addAttribute("loginYn", "Y");
		}
		//메인페이지에 노출될 공지사항 리스트 조회
		//List<?> mainList = mainService.selectMainList(searchVO);
		//model.addAttribute("resultList", mainList);

		return "/main/login.page";
		// return "/login";
	}
	
	@RequestMapping(value = "/logout.do")
	public String logout(@ModelAttribute("loginVO") LoginVO vo, Model model,HttpServletRequest req) {
		
		HttpSession session = req.getSession();
		
		session.setAttribute("userId", null);
		session.setAttribute("userNm", null);
		
		req.getSession().removeAttribute("LoginVO");
		
		model.addAttribute("loginYn", "N");
		
		return "redirect:/gnoincoun/login.do";
	}
	
	@RequestMapping(value = "/oldCnsCenter.do")
	public String oldCnsCenter(HttpServletRequest request, Model model) throws Exception {
		
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		if(map == null) {
			model.addAttribute("loginYn", "N");
		} else {
			model.addAttribute("loginYn", "Y");
		}
		
		return "homepage/main/oldCnsCenter";
	}
	
	// ID,PW 찾기
	@RequestMapping(value = "/findIdPw.do")
	public String findIdPw(@ModelAttribute("searchVO") MainDefaultVO searchVO, ModelMap model, HttpServletRequest request) throws Exception {
		
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		if(map == null) {
			model.addAttribute("loginYn", "N");
		} else {
			model.addAttribute("loginYn", "Y");
		}

		return "/main/findIdPw.page";
	}
	
	// ID,PW 찾기 ajax
	@RequestMapping(value = "/findIdPwAjax.do")
	public String findIdPwAjax(LoginVO vo, HttpServletRequest request, ModelMap model) throws Exception{	
		
		String findGb = vo.getFindGb();
		EgovMap userId = null;
		if(findGb.equals("I")) {
			// 회원 ID 찾기
			userId = homepageMainService.findUserId(vo);
		} else if(findGb.equals("P")) {
			// 회원 PW 찾기
			int findPwChk = homepageMainService.findPw(vo);
			model.addAttribute("findPwChk", findPwChk);
		}
		model.addAttribute("result", userId);
		model.addAttribute("findGb", findGb);
		return "jsonView";
	}
	
	// PW 재설정 ajax
	@RequestMapping(value = "/pwResetAjax.do")
	public String pwResetAjax(LoginVO vo, HttpServletRequest request, ModelMap model) throws Exception{	
		
		// PW 재설정
		homepageMainService.userPwReset(vo);
		model.addAttribute("msg","비밀번호 재설정 완료됐습니다. \n변경된 비밀번호로 로그인 하시기 바랍니다.");
		return "jsonView";
	}
	
	// ID,PW 찾기
	@RequestMapping(value = "/headerMenu.do")
	public String headerMenu(@ModelAttribute("searchVO") MainDefaultVO searchVO, ModelMap model, HttpServletRequest request) throws Exception {
		
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		/*if(map == null) {
			model.addAttribute("loginVo", map);
		} else {
			model.addAttribute("loginVo", map);
		}*/
		model.addAttribute("loginVo",map);

		return "/layout/headerMenu.page";
	}
	
	@RequestMapping(value = "/siteMap.do")
	public String siteMap(@ModelAttribute("searchVO") MainDefaultVO searchVO, ModelMap model, HttpServletRequest request) throws Exception {
		
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		/*if(map == null) {
			model.addAttribute("loginVo", map);
		} else {
			model.addAttribute("loginVo", map);
		}*/
		model.addAttribute("loginVo",map);

		return "/layout/siteMap.page";
	}
}
