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
package egovframework.user.notice.web;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;





import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import egovframework.user.notice.service.NotService;
import egovframework.user.notice.service.NotDefaultVO;
import egovframework.user.notice.service.NotVO;

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
public class NotController {

	/** EgovSampleService */
	@Resource(name = "notService")
	private NotService notService;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;

	
	
	
	
	/**
	 * 소통하기 공지사항 목록 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 SampleDefaultVO
	 * @param model
	 * @return "egovSampleList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/notList.do")
	public String notList(@ModelAttribute("searchVO") NotDefaultVO searchVO, ModelMap model, HttpServletRequest req) throws Exception {
		
//		System.out.println("소통하기 ---->  공지사항");
//		/** EgovPropertyService.sample */
//		searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
//		searchVO.setPageSize(propertiesService.getInt("pageSize"));
//
//		/** pageing setting */
//		PaginationInfo paginationInfo = new PaginationInfo();
//		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
//		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
//		paginationInfo.setPageSize(searchVO.getPageSize());
//
//		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
//		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
//		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
//
//		//searchVO.setSch(searchVO.getSch());
//		
//		List<?> notList = notService.notList(searchVO);
//		model.addAttribute("notList", notList);
//		
//		
//		System.out.println("bd_id =======   " + notList.get(0).toString());
//		//System.out.println("bd_title =======   " + notList.get(1).toString());
//
//		int totCnt = notService.notListTotCnt(searchVO);
//		paginationInfo.setTotalRecordCount(totCnt);
//		model.addAttribute("paginationInfo", paginationInfo);
//
//		return "user/not/notlist";
		return null;
	}
	
	
	/**
	 * 공지사항 상세 정보를 조회한다.
	 * @param id - 수정할 글 id
	 * @param searchVO - 목록 조회조건 정보가 담긴 VO
	 * @param model
	 * @return "egovSampleRegister"
	 * @exception Exception
	 */
	@RequestMapping("/notice_view.do")
	public String notice_view(@RequestParam("selectedId") String id, @ModelAttribute("searchVO") NotDefaultVO searchVO, Model model) throws Exception {
		
		return null;
	}
	
	/**
	 * 공지사항 상세정보를 조회한다.
	 * @param sampleVO - 조회할 정보가 담긴 VO
	 * @param searchVO - 목록 조회조건 정보가 담긴 VO
	 * @param status
	 * @return @ModelAttribute("sampleVO") - 조회한 정보
	 * @exception Exception
	 */
	public NotVO selectNot(NotVO notVO, @ModelAttribute("searchVO") NotDefaultVO searchVO) throws Exception {
		return null;
	}
	
	
	/**
	 * 공지사항 파일 다운로드.
	 * @param id - 수정할 글 id
	 * @param searchVO - 목록 조회조건 정보가 담긴 VO
	 * @param model
	 * @return "egovSampleRegister"
	 * @exception Exception
	 */
	@RequestMapping(value = "/notDownloadFile.do")
	public void notDownloadFile(Map<String, Object> model, HttpServletRequest req, HttpServletResponse res) throws Exception {
		
//		Map<String, Object> fileInfo = (Map<String, Object>) model.get("downloadFile");
//
//		
//
//		
//		String org_file_nm = (String)req.getParameter("org_file_nm");
//		String sys_file_nm = (String)req.getParameter("sys_file_nm");
//		String file_path = (String)req.getParameter("file_path");
//		//String file_size = (String)req.getParameter("file_size");
//		int file_size = Integer.parseInt(req.getParameter("file_size"));
//		
//		
//		System.out.println("org_file_nm =============    "+org_file_nm);
//		System.out.println("sys_file_nm =============    "+sys_file_nm);
//		
//		
//		
//		//String uploadPath = "D:/project/kga_2/eGovFrameDev-3.2.0-64bit/workspace/upload/";
//		String uploadPath = "/www/futureplan_or_kr/www/upload/";
// 
//		File uFile = new File(uploadPath, sys_file_nm);
//		//int fSize = (int) uFile.length();
//		int fSize = file_size;
//		
//		System.out.println("fSize =============    "+fSize);
//		System.out.println("uFile =============    "+uFile);
// 
//		if (fSize > 0) {
// 
// 			BufferedInputStream in = new BufferedInputStream(new FileInputStream(uFile));
//		
//			String mimetype = "application/x-msdownload;charset=utf-8";
//
//			// String mimetype = servletContext.getMimeType(requestedFile);
//			//String mimetype = "text/html";
//
//			res.setBufferSize(fSize);
//			res.setContentType(mimetype);
//
//			//res.setHeader("Content-Disposition", "attachment; filename=\"" + org_file_nm + "\"");
//			res.setHeader("Content-Disposition", "attachment; filename=" + URLEncoder.encode(org_file_nm, "utf-8") + ";");
//			res.setContentLength(fSize);
//
//			FileCopyUtils.copy(in, res.getOutputStream());
//	
//			in.close();
//			res.getOutputStream().flush();
//			res.getOutputStream().close();
//		} else {
//			//setContentType을 프로젝트 환경에 맞추어 변경
//			res.setContentType("application/x-msdownload;charset=utf-8");
//			PrintWriter printwriter = res.getWriter();
//			printwriter.println("<html>");
//			printwriter.println("<br><br><br><h2>Could not get file name:<br>" + org_file_nm + "</h2>");
//			printwriter.println("<br><br><br><center><h3><a href='javascript: history.go(-1)'>Back</a></h3></center>");
//			printwriter.println("<br><br><br>&copy; webAccess");
//			printwriter.println("</html>");
//			printwriter.flush();
//			printwriter.close();
			System.out.println("Unused");
//		}
		
	}
	
	
	
	
	
	
	/**
	 * 소통하기 faq 목록 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 SampleDefaultVO
	 * @param model
	 * @return "egovSampleList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/faqView.do")
	public String faqView(@ModelAttribute("searchVO") NotDefaultVO searchVO, ModelMap model) throws Exception {
		System.out.println("소통하기 ---->  faq");
		

		return "user/not/faqView";
	}

	/**
	 * 글 등록 화면을 조회한다.
	 * @param searchVO - 목록 조회조건 정보가 담긴 VO
	 * @param model
	 * @return "egovSampleRegister"
	 * @exception Exception
	 */
	@RequestMapping(value = "/addNot.do", method = RequestMethod.GET)
	public String addSampleView(@ModelAttribute("searchVO") NotDefaultVO searchVO, Model model) throws Exception {
		model.addAttribute("notVO", new NotVO());
		return "sample/egovSampleRegister";
	}

	/**
	 * 글을 등록한다.
	 * @param sampleVO - 등록할 정보가 담긴 VO
	 * @param searchVO - 목록 조회조건 정보가 담긴 VO
	 * @param status
	 * @return "forward:/egovSampleList.do"
	 * @exception Exception
	 */
	@RequestMapping(value = "/addNot.do", method = RequestMethod.POST)
	public String addSample(@ModelAttribute("searchVO") NotDefaultVO searchVO, NotVO notVO, BindingResult bindingResult, Model model, SessionStatus status)
			throws Exception {

		// Server-Side Validation
		beanValidator.validate(notVO, bindingResult);

		if (bindingResult.hasErrors()) {
			model.addAttribute("notVO", notVO);
			return "sample/egovSampleRegister";
		}

		notService.insertSample(notVO);
		status.setComplete();
		return "forward:/egovSampleList.do";
	}

	

	

	/**
	 * 글을 수정한다.
	 * @param sampleVO - 수정할 정보가 담긴 VO
	 * @param searchVO - 목록 조회조건 정보가 담긴 VO
	 * @param status
	 * @return "forward:/egovSampleList.do"
	 * @exception Exception
	 */
	@RequestMapping("/updateNot.do")
	public String updateSample(@ModelAttribute("searchVO") NotDefaultVO searchVO, NotVO notVO, BindingResult bindingResult, Model model, SessionStatus status)
			throws Exception {

		beanValidator.validate(notVO, bindingResult);

		if (bindingResult.hasErrors()) {
			model.addAttribute("sampleVO", notVO);
			return "sample/egovSampleRegister";
		}

		notService.updateSample(notVO);
		status.setComplete();
		return "forward:/egovSampleList.do";
	}

	/**
	 * 글을 삭제한다.
	 * @param sampleVO - 삭제할 정보가 담긴 VO
	 * @param searchVO - 목록 조회조건 정보가 담긴 VO
	 * @param status
	 * @return "forward:/egovSampleList.do"
	 * @exception Exception
	 */
	@RequestMapping("/deleteNot.do")
	public String deleteSample(NotVO notVO, @ModelAttribute("searchVO") NotDefaultVO searchVO, SessionStatus status) throws Exception {
		notService.deleteSample(notVO);
		status.setComplete();
		return "forward:/egovSampleList.do";
	}
	
	
	/**
	 * 소통하기 공지사항 목록 조회한다. (pageing)
	 */
	@RequestMapping(value = "/goinsertNotList.do")
	public String goinsertNotList(@ModelAttribute("searchVO") NotDefaultVO searchVO, ModelMap model, HttpServletRequest req) throws Exception {
		
		System.out.println("소통하기 ---->  공지사항");
		
		
		List<?> notList = notService.notList(searchVO);
		model.addAttribute("notList", notList);
		
		
		System.out.println("bd_id =======   " + notList.get(0).toString());
		//System.out.println("bd_title =======   " + notList.get(1).toString());

		int totCnt = notService.notListTotCnt(searchVO);
		
		return "user/not/notlist";
	}

}
