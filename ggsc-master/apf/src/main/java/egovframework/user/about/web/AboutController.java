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
package egovframework.user.about.web;

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
import egovframework.user.about.service.AboutService;
import egovframework.user.about.service.AboutDefaultVO;
import egovframework.user.about.service.AboutVO;

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
public class AboutController {

	/** EgovSampleService */
	@Resource(name = "aboutService")
	private AboutService aboutService;

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
	@RequestMapping(value = "/aboutIntro.do")
	public String aboutIntro(@ModelAttribute("searchVO") AboutDefaultVO searchVO, ModelMap model) throws Exception {
		System.out.println("센터소개  ---->  센터소개");
		/** EgovPropertyService.sample */
		

		//List<?> sampleList = aboutService.selectSampleList(searchVO);
		//model.addAttribute("resultList", sampleList);

		//int totCnt = aboutService.selectSampleListTotCnt(searchVO);
		//paginationInfo.setTotalRecordCount(totCnt);
		//model.addAttribute("paginationInfo", paginationInfo);

		return "user/about/aboutIntro";
	}

	/**
	 * 오시는길
	 * @param searchVO - 조회할 정보가 담긴 SampleDefaultVO
	 * @param model
	 * @return "egovSampleList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/aboutMap.do")
	public String aboutMap(@ModelAttribute("searchVO") AboutDefaultVO searchVO, ModelMap model) throws Exception {
		System.out.println("센터소개  ---->  오시는길");
		/** EgovPropertyService.sample */
		

		//List<?> sampleList = aboutService.selectSampleList(searchVO);
		//model.addAttribute("resultList", sampleList);

		//int totCnt = aboutService.selectSampleListTotCnt(searchVO);
		//paginationInfo.setTotalRecordCount(totCnt);
		//model.addAttribute("paginationInfo", paginationInfo);

		return "user/about/aboutMap";
	}

}
