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
package egovframework.user.join.web;



import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.jasypt.contrib.org.apache.commons.codec_1_3.binary.Base64;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.user.join.service.JoinService;
import egovframework.user.join.service.JoinDefaultVO;
import egovframework.user.join.service.JoinVO;
import egovframework.cmm.util.CommonUtils;



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
public class JoinController {

	/** EgovSampleService */
	@Resource(name = "joinService")
	private JoinService joinService;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;
	
	
	
	
	/**
	 * 센터소개
	 */
	@RequestMapping(value = "/phoneresult.do")
	public String phoneresult(@ModelAttribute("searchVO") JoinDefaultVO searchVO, ModelMap model) throws Exception {
		System.out.println("사업소개  ---->  01");
		/** EgovPropertyService.sample */
		

		return "user/join/phoneresult";
	}

	
	/**
	 * 회원가입페이지로 이동
	 */
	@RequestMapping(value = "/gojoin.do")
	public String gojoin(@ModelAttribute("searchVO") JoinDefaultVO searchVO, ModelMap model) throws Exception {
		
		System.out.println("회원가입페이지로 이동");
		/** EgovPropertyService.sample */
		
		return "user/join/join";
		
	}
	
	
	/**
	 * 회원가입페이지로 이동
	 */
	@RequestMapping(value = "/joinerror.do")
	public String joinerror(@ModelAttribute("searchVO") JoinDefaultVO searchVO, ModelMap model) throws Exception {
		
		System.out.println("회원가입페이지로 이동");
		/** EgovPropertyService.sample */
		
		return "user/join/joinerror";
	}
	
	
	/**
	 * 아이디 중복 체크
	 * @param vo - 로그인후 이동할 URL이 담긴 LoginVO
	 * @return 로그인 페이지
	 * @exception Exception
	 */
	@RequestMapping(value="/joinIdCheck.do")
	public String joinIdCheck(JoinVO joinVO, Model model, HttpServletRequest req){
    		
//		System.out.println("11111111111111111111111111111");
//		
//		AES256Util util = new AES256Util();
//		
//		System.out.println("222222222222222222222222222");
//		String tmp22 = "fH9JGDOGCj2Yd4ev6wTusA==";
//		String tmpPw = util.aesDecode(tmp22);
//		
//		System.out.println("tmpPw ====================  " +tmpPw);
		
		try{
			
			System.out.println("id ====================  " +req.getParameter("id"));
			
			joinVO.setId(req.getParameter("id"));
			int idCk = joinService.checkId(joinVO);
			
			System.out.println("idCk ====================  " +idCk);
	       
			if(idCk <= 0) {
				model.addAttribute("success","true");
			}else{
				model.addAttribute("success","fail");
			}
			
			
			
			
	        
	        
		}catch(Exception e){
			utility.func.Logging(this.getClass().getName(), e);
			return null;

		}
		return "jsonView";
		
	}
	
	
	
	/**
	 * 회원정보 등록
	 */
	@RequestMapping(value="/goinsert.do", method=RequestMethod.POST)
	public String goinsert(JoinVO joinVO, Model model, HttpServletRequest req ){
		
		System.out.println("111111111111111111111111111");
		CommonUtils commonUtils = new CommonUtils();
		try{
//			joinVO.setId(req.getParameter("id"));
//			joinVO.setName(req.getParameter("name"));
//			joinVO.setPwd(req.getParameter("pwd"));
//			joinVO.setBirth_dt(req.getParameter("birth_dt"));
//			joinVO.setBasic_addr(req.getParameter("basic_addr"));
//			joinVO.setDtl_addr(req.getParameter("dtl_addr"));
//			joinVO.setTel(req.getParameter("tel"));
//			joinVO.setEmail(req.getParameter("email"));
			
			
			System.out.println("req.getParameter(pwd) ============  " + req.getParameter("pwd"));
			System.out.println("req.getParameter(id) ============  " + req.getParameter("id"));
			
			if(req.getParameter("pwd").toString() != null && !req.getParameter("pwd").toString().equals("") ){
				
				byte[] encrypted = commonUtils.encrypted(req.getParameter("pwd"), req.getParameter("id"));
				
				joinVO.setNew_pwd(new String(Base64.encodeBase64(encrypted)));
				
				System.out.println("============> new password ===== "+joinVO.getNew_pwd());
				
				joinService.selectJoinView(joinVO);
			}
			
			//joinService.selectJoinView(joinVO);
			
		}catch(Exception e){
			utility.func.Logging(this.getClass().getName(), e);
			return null;

		}
			
		
		
		return "user/join/joinresult";
		
		
		
		
	}
	
	


}
