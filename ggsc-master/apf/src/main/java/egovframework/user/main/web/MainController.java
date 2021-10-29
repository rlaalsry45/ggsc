/*
 * Copyright 2008-2009 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package egovframework.user.main.web;

import java.io.UnsupportedEncodingException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.Key;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import java.util.Map;

import egovframework.user.main.service.EgovMainService;
import egovframework.user.main.service.LoginVO;
import egovframework.user.main.service.MainDefaultVO;
import egovframework.cmm.util.CommonUtils;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

import javax.annotation.Resource;
import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import org.jasypt.contrib.org.apache.commons.codec_1_3.binary.Base64;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springmodules.validation.commons.DefaultBeanValidator;



/**
 * @Class Name : EgovSampleController.java
 * @Description : EgovSample Controller Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2009.03.16           최초생성
 *
 * @author 개발프레임웍크 실행환경 개발팀
 * @since 2009. 03.16
 * @version 1.0
 * @see
 *
 *  Copyright (C) by MOPAS All right reserved.
 */

@Controller
public class MainController {

	/** EgovSampleService */
	@Resource(name = "mainService")
	private EgovMainService mainService;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;
	
	private Key keySpec;
	private String iv;
	private String key = "aes256-key-apf";
	

	/**
	 * 글 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 SampleDefaultVO
	 * @param model
	 * @return "egovSampleList"
	 * @exception Exception
	 */
	/*@RequestMapping(value = "/egovMainList.do")
	public String selectSampleList(@ModelAttribute("searchVO") MainDefaultVO searchVO, ModelMap model) throws Exception {
		
        
		//메인페이지에 노출될 공지사항 리스트 조회
		//List<?> mainList = mainService.selectMainList(searchVO);
		//model.addAttribute("resultList", mainList);

		return "user/main/egovMain";
	}*/
	
	/*@RequestMapping(value = "/egovMainList.do")
	public String selectSampleList(@ModelAttribute("searchVO") MainDefaultVO searchVO, ModelMap model) throws Exception {
		
        
		//메인페이지에 노출될 공지사항 리스트 조회
		//List<?> mainList = mainService.selectMainList(searchVO);
		//model.addAttribute("resultList", mainList);

		return "mobile/main/main";
	}*/

	
	/*@RequestMapping(value = "/login.do")
	public String login(@ModelAttribute("searchVO") MainDefaultVO searchVO, ModelMap model) throws Exception {
		

		

		return "user/main/login";
	}*/
	
	/*@RequestMapping(value = "/joinAction.do")
	public String joinAction(@ModelAttribute("searchVO") Map<String,Object> param, ModelMap model) throws Exception {
		
        int ret = mainService.insertJoin(param);
		
         model.addAttribute("ret", ret);
		return "user/main/login";
	}*/
	
	@RequestMapping(value = "/joinAction.do")
	public String joinAction(@ModelAttribute("searchVO") Map<String,Object> param, ModelMap model) throws Exception {
		
        int ret = mainService.insertJoin(param);
		
         model.addAttribute("ret", ret);
		return "user/main/login";
	}
	
	
	/**
	 * 로그인 처리를 한다.
	 * @param searchVO - 목록 조회조건 정보가 담긴 VO
	 * @param model
	 * @return "egovSampleRegister"
	 * @exception Exception
	 */
	@RequestMapping(value = "/loginProc.do")
	public String addSampleView(@ModelAttribute("searchVO") LoginVO vo, Model model,HttpServletRequest req) throws Exception {
		
		HttpSession session = req.getSession();
		
		CommonUtils commonUtils = new CommonUtils();
		
		String pwd = vo.getPassword();
		String inputId = vo.getId();
		
		System.out.println("pwd ===============  "+ pwd);
		
		
		LoginVO login = mainService.selectLoginInfo(vo);
		
		
		
		if(login==null){
			model.addAttribute("onSucess", "fail");
			return "user/main/login";
		}else{
			
			
			//DB에 저장된 암호화값
			String newpwd = login.getNew_pwd();
			System.out.println("newpwd ===============  "+ newpwd);
			
			
			//로그인페이지에서 입력 받은 PWD에 대한 암호화값
			byte[] encrypted = commonUtils.encrypted(pwd, inputId);
			String en_newPwd = new String(Base64.encodeBase64(encrypted));
			System.out.println("en_newPwd ===== "+en_newPwd);
			
			// 임시 설정
			req.setAttribute("id", login.getId());
			req.setAttribute("name", login.getName());
			session.setAttribute("id", login.getId());
			session.setAttribute("name", login.getName());
			req.getSession().setAttribute("loginInfo", login);
			
			return "user/main/egovMain";
			
			/*if(newpwd.equals(en_newPwd)){
				req.setAttribute("id", login.getId());
				req.setAttribute("name", login.getName());
				
				session.setAttribute("id", login.getId());
				session.setAttribute("name", login.getName());
				
				req.getSession().setAttribute("loginInfo", login);
				
			
				return "user/main/egovMain";
			}else{
				
				return "user/main/loginFail";
			}*/
		}
	}
	
	
	/**
	 * 로그아웃 처리를 한다.
	 * @param searchVO - 목록 조회조건 정보가 담긴 VO
	 * @param model
	 * @return "egovSampleRegister"
	 * @exception Exception
	 */
	@RequestMapping(value = "/aloginOut.do")
	public String loginOut(@ModelAttribute("loginVO") LoginVO vo, Model model,HttpServletRequest req) throws Exception {
		
		HttpSession session = req.getSession();
		
		session.setAttribute("id", null);
		session.setAttribute("name", null);
		
		req.getSession().removeAttribute("loginInfo");
		
		
		
		
		return "user/main/egovMain";
	}
	
	/*@RequestMapping(value = "/gnoinSub01a.do")
	public String gnoinSub01a(Model model) throws Exception {
		
		return "/gnoin/sub01";
	}
	
	@RequestMapping(value = "/gnoinIndex.do")
	public String gnoinIndex(Model model) throws Exception {
		
		return "user/main/index";
	}
	
	@RequestMapping(value = "/gnoinSub01.do")
	public String gnoinSub01(Model model) throws Exception {
		
		return "user/main/sub01";
	}
	
	@RequestMapping(value = "/gnoinSub02.do")
	public String gnoinSub02(Model model) throws Exception {
		
		return "user/main/sub02";
	}
	
	@RequestMapping(value = "/gnoinSub03.do")
	public String gnoinSub03(Model model) throws Exception {
		
		return "user/main/sub03";
	}
	
	@RequestMapping(value = "/gnoinSub04.do")
	public String gnoinSub04(Model model) throws Exception {
		
		return "user/main/sub03_1";
	}*/
	
	
	
	/*@RequestMapping(value = "/sub01.do")
	public String gnoinSub01(Model model) throws Exception {
		System.out.println("gnoinSub01@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		return "user/subM/sub01";
		return "user/main/sub01";
	}
	
	@RequestMapping(value = "/sub02.do")
	public String gnoinSub02(Model model) throws Exception {
		
		return "user/subM/sub02";
	}
	
	@RequestMapping(value = "/sub03.do")
	public String gnoinSub03(Model model) throws Exception {
		
		return "user/subM/sub03";
	}
	
	@RequestMapping(value = "/sub04.do")
	public String gnoinSub04(Model model) throws Exception {
		
		return "user/subM/sub04";
	}
	
	@RequestMapping(value = "/sub04_1.do")
	public String gnoinSub04_1(Model model) throws Exception {
		
		return "user/subM/sub04_1";
	}
	
	@RequestMapping(value = "/sub04_2.do")
	public String gnoinSub04_2(Model model) throws Exception {
		
		return "user/subM/sub04_2";
	}
	
	@RequestMapping(value = "/sub05.do")
	public String gnoinSub05(Model model) throws Exception {
		
		return "user/subM/sub05";
	}
	
	@RequestMapping(value = "/sub06.do")
	public String gnoinSub06(Model model) throws Exception {
		
		return "user/subM/sub06";
	}*/

	
}
