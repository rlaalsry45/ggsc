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
package egovframework.user.busi.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import egovframework.user.busi.service.BusiService;
import egovframework.user.busi.service.BusiDefaultVO;
import egovframework.user.busi.service.BusiVO;

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
public class BusiController {

	/** EgovSampleService */
	@Resource(name = "busiService")
	private BusiService busiService;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;

	/**
	 * 센터소개
	 * @param searchVO - 조회할 정보가 담긴 SampleDefaultVO
	 * @param model
	 * @return "egovSampleList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/busi01.do")
	public String busi01(@ModelAttribute("searchVO") BusiDefaultVO searchVO, ModelMap model) throws Exception {
		System.out.println("사업소개  ---->  01");
		/** EgovPropertyService.sample */
		

		//List<?> sampleList = busiService.selectSampleList(searchVO);
		//model.addAttribute("resultList", sampleList);

		//int totCnt = busiService.selectSampleListTotCnt(searchVO);
		//paginationInfo.setTotalRecordCount(totCnt);
		//model.addAttribute("paginationInfo", paginationInfo);

		return "user/busi/busi01";
	}

	/**
	 * 오시는길
	 * @param searchVO - 조회할 정보가 담긴 SampleDefaultVO
	 * @param model
	 * @return "egovSampleList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/busi02.do")
	public String busi02(@ModelAttribute("searchVO") BusiDefaultVO searchVO, ModelMap model) throws Exception {
		System.out.println("사업소개  ---->  02");
		/** EgovPropertyService.sample */
		

		//List<?> sampleList = busiService.selectSampleList(searchVO);
		//model.addAttribute("resultList", sampleList);

		//int totCnt = busiService.selectSampleListTotCnt(searchVO);
		//paginationInfo.setTotalRecordCount(totCnt);
		//model.addAttribute("paginationInfo", paginationInfo);

		return "user/busi/busi02";
	}
	
	/**
	 * 오시는길
	 * @param searchVO - 조회할 정보가 담긴 SampleDefaultVO
	 * @param model
	 * @return "egovSampleList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/busi03.do")
	public String busi03(@ModelAttribute("searchVO") BusiDefaultVO searchVO, ModelMap model) throws Exception {
		System.out.println("사업소개  ---->  03");
		/** EgovPropertyService.sample */
		

		//List<?> sampleList = busiService.selectSampleList(searchVO);
		//model.addAttribute("resultList", sampleList);

		//int totCnt = busiService.selectSampleListTotCnt(searchVO);
		//paginationInfo.setTotalRecordCount(totCnt);
		//model.addAttribute("paginationInfo", paginationInfo);

		return "user/busi/busi03";
	}
	
	
	/**
	 * 오시는길
	 * @param searchVO - 조회할 정보가 담긴 SampleDefaultVO
	 * @param model
	 * @return "egovSampleList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/busi04.do")
	public String busi04(@ModelAttribute("searchVO") BusiDefaultVO searchVO, ModelMap model) throws Exception {
		System.out.println("사업소개  ---->  04");
		/** EgovPropertyService.sample */
		

		//List<?> sampleList = busiService.selectSampleList(searchVO);
		//model.addAttribute("resultList", sampleList);

		//int totCnt = busiService.selectSampleListTotCnt(searchVO);
		//paginationInfo.setTotalRecordCount(totCnt);
		//model.addAttribute("paginationInfo", paginationInfo);

		return "user/busi/busi04";
	}


}
