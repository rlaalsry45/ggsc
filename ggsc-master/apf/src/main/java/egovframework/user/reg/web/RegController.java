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
package egovframework.user.reg.web;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springmodules.validation.commons.DefaultBeanValidator;

//import egovframework.admin.admRd.service.AdmRdVO;
//import egovframework.admin.usrMng.service.UsrMngVO;
import egovframework.cmm.util.DateTimeUtil;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import egovframework.user.notice.service.NotDefaultVO;
import egovframework.user.notice.service.NotVO;
import egovframework.user.reg.service.RegService;
import egovframework.user.reg.service.RegDefaultVO;
import egovframework.user.reg.service.RegVO;

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
public class RegController {

	/** EgovSampleService */
	@Resource(name = "regService")
	private RegService regService;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;
	
	
	
	//로컬
	private static final String FILE_PATH = "D:/upload";
	
	//서버
	//private static final String FILE_PATH = "/www/futureplan_or_kr/www/upload";
	
	
		
		

	/**
	 * 센터소개
	 * @param searchVO - 조회할 정보가 담긴 SampleDefaultVO
	 * @param model
	 * @return "egovSampleList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/regView.do")
	public String regView(@ModelAttribute("searchVO") RegDefaultVO searchVO, ModelMap model) throws Exception {
		System.out.println("등록안내 ---->  등록안내");
		/** EgovPropertyService.sample */
		

		NotVO notVO = new NotVO();
		
		notVO = regService.selectRegView(notVO);
		model.addAttribute(notVO);

		System.out.println("등록안내 End ---->  등록안내 End");
		
		return "user/reg/regView";
	}
	
	
	

	
	
	/**
	 * 등록안내 고령자사전의료요양지시서 파일 다운로드.
	 * @param id - 수정할 글 id
	 * @param searchVO - 목록 조회조건 정보가 담긴 VO
	 * @param model
	 * @return "egovSampleRegister"
	 * @exception Exception
	 */
	@RequestMapping(value = "/regDownloadFile.do")
	public void regDownloadFile(Map<String, Object> model, HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		Map<String, Object> fileInfo = (Map<String, Object>) model.get("downloadFile");

		

		
//		String org_file_nm = (String)req.getParameter("org_file_nm");
//		//String org_file_nm = "고령자사전의료요양지시서.pdf";
//		String sys_file_nm = (String)req.getParameter("sys_file_nm");
//		String file_path = (String)req.getParameter("file_path");
//		String file_size = (String)req.getParameter("file_size");
		
		
		//System.out.println("org_file_nm =============    "+org_file_nm);
		//System.out.println("sys_file_nm =============    "+sys_file_nm);
		
		
		// 로컬
		//String uploadPath = "D:/project/kga_2/eGovFrameDev-3.2.0-64bit/workspace/apf/";
		//String uploadPath = "/www/futureplan_or_kr/www/upload/";
		
		//가비아 서버
		//String uploadPath = "/upload/";
 
		//File uFile = new File(uploadPath, org_file_nm);
		//int fSize = (int) uFile.length();
		//int fSize = Integer.parseInt(file_size);
		
		//System.out.println("uFile =============    "+uFile);
		//System.out.println("fSize =============    "+fSize);
 
//		if (fSize > 0) {
// 
//			try{
//				//BufferedInputStream in = new BufferedInputStream(new FileInputStream(uFile));
//				String mimetype = "application/x-msdownload;charset=utf-8";
//	
//				// String mimetype = servletContext.getMimeType(requestedFile);
//				//String mimetype = "text/html";
//	
//				//res.setBufferSize(fSize);
//				res.setContentType(mimetype);
//			
//				//res.setHeader("Content-Disposition", "attachment; filename=\"" + org_file_nm + "\"");
//				res.setHeader("Content-Disposition", "attachment; filename=" + URLEncoder.encode(org_file_nm, "utf-8") + ";");
//				//res.setContentLength(fSize);
//	
//				FileCopyUtils.copy(in, res.getOutputStream());
//	
//				in.close();
//				res.getOutputStream().flush();
//				res.getOutputStream().close();
//			}catch(Exception e){
//				utility.func.Logging(this.getClass().getName(), e);
//			

//			}
//		} else {
			//setContentType을 프로젝트 환경에 맞추어 변경
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
		}
		
//	}
	
	
	
	/**
	 * 사전의료요양지서 등록페이지로 이동
	 * @param searchVO - 조회할 정보가 담긴 SampleDefaultVO
	 * @param model
	 * @return "egovSampleList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/regCd.do")
	public String regCd(@ModelAttribute("searchVO") RegVO regVO, ModelMap model, HttpServletRequest req) throws Exception {
		System.out.println(" <------------   사전의료요양지서 등록페이지로 이동 ------------>");
		/** EgovPropertyService.sample */
		
		System.out.println("loginId =============   "+req.getSession().getAttribute("id"));
		System.out.println("loginName =============   "+req.getSession().getAttribute("name"));
		
		if(req.getSession().getAttribute("id")==null || req.getSession().getAttribute("id").equals("")){
			return "user/main/login";
		}else{
			
			regVO.setId((String)req.getSession().getAttribute("id"));
			regVO.setName((String)req.getSession().getAttribute("name"));
			
			//요양지시서 등록정보 중복체크
			//int tmpDupId = regService.schIdDupCheck(regVO);	
			
			//if(tmpDupId > 0) {
			//	return "user/reg/regDupResult";
			//}else{
			//	return "user/reg/regCd";
			//}
			
			//삭제 할것
			return "user/reg/regCd";
		}
		
	}
	
	
	
	/**
	 * 사전의료요양지서 - 필수사항 정보 등록하기
	 */
	@RequestMapping("/fn_witr_Reg.do")
	public String fn_witr_Reg(@ModelAttribute("searchVO") RegVO regVO, Model model, HttpServletRequest req) throws Exception {
		
		
		
		//제2대리인정보
		//regVO.setRpt2_id((String)req.getParameter("rpt2_id"));
		//regVO.setRpt2_name((String)req.getParameter("rpt2_name"));
		//regVO.setRpt2_birth_dt((String)req.getParameter("rpt2_birth_dt"));
		//regVO.setRpt2_tel((String)req.getParameter("rpt2_tel"));
		//regVO.setRpt2_email((String)req.getParameter("rpt2_email"));
		//regVO.setRpt2_addr((String)req.getParameter("rpt2_addr"));
		
		
		
		
		/*******   제1대리인 정보 등록   ********/
		//요양지시서- 제1대리인 일련번호 가져오기
		//int tmpRpt1_num = regService.selectRpt1_num(regVO);	
		//regVO.setRpt1_num(tmpRpt1_num);
		
		
		
		/*******   제2대리인 정보 등록   ********/
		//요양지시서- 제2대리인 일련번호 가져오기
		//int tmpRpt2_num = regService.selectRpt2_num(regVO);	
		//regVO.setRpt2_num(tmpRpt2_num);
		
		 
		
		
		//model.addAttribute(regVO);
		
		try {
			System.out.println("loginId =============   " + req.getSession().getAttribute("id"));
			System.out.println("loginName =============   " + req.getSession().getAttribute("name"));
			regVO.setId((String) req.getSession().getAttribute("id"));
			regVO.setName((String) req.getSession().getAttribute("name"));
			//작성자 정보
			regVO.setWitr_id(regVO.getId());
			regVO.setWitr_name((String) req.getParameter("witr_name"));
			regVO.setWitr_birth_dt((String) req.getParameter("witr_birth_dt"));
			regVO.setWitr_tel((String) req.getParameter("witr_tel"));
			regVO.setWitr_email((String) req.getParameter("witr_email"));
			regVO.setWitr_addr((String) req.getParameter("witr_addr"));
			regVO.setExe_dt((String) req.getParameter("exe_dt"));
			regVO.setMake_year((String) req.getParameter("make_year"));
			regVO.setMake_month((String) req.getParameter("make_month"));
			regVO.setMake_day((String) req.getParameter("make_day"));
			regVO.setAply_point((String) req.getParameter("aply_point"));
			String aply_etc = (String) req.getParameter("aply_etc");
			if (aply_etc.equals("")) {
				regVO.setAply_etc("");
			} else {
				regVO.setAply_etc((String) req.getParameter("aply_etc"));
			}
			regVO.setRpt1_auth_1((String) req.getParameter("rpt1_auth_1"));
			regVO.setRpt1_auth_2((String) req.getParameter("rpt1_auth_2"));
			regVO.setRpt1_auth_3((String) req.getParameter("rpt1_auth_3"));
			regVO.setRpt1_auth_4((String) req.getParameter("rpt1_auth_4"));
			String rpt1_auth_5 = (String) req.getParameter("rpt1_auth_5");
			if (rpt1_auth_5.equals("")) {
				regVO.setRpt1_auth_5("");
			} else {
				regVO.setRpt1_auth_5((String) req.getParameter("rpt1_auth_5"));
			}
			String rpt1_auth_6 = (String) req.getParameter("rpt1_auth_6");
			if (rpt1_auth_6.equals("")) {
				regVO.setRpt1_auth_6("");
			} else {
				regVO.setRpt1_auth_6((String) req.getParameter("rpt1_auth_6"));
			}
			String rpt1_auth_7 = (String) req.getParameter("rpt1_auth_7");
			if (rpt1_auth_7.equals("")) {
				regVO.setRpt1_auth_7("");
			} else {
				regVO.setRpt1_auth_7((String) req.getParameter("rpt1_auth_7"));
			}
			regVO.setRpt1_auth_8((String) req.getParameter("rpt1_auth_8"));
			regVO.setRpt1_auth_9((String) req.getParameter("rpt1_auth_9"));
			regVO.setRpt1_auth_10((String) req.getParameter("rpt1_auth_10"));
			regVO.setRpt1_auth_11((String) req.getParameter("rpt1_auth_11"));
			regVO.setRpt2_auth_1((String) req.getParameter("rpt2_auth_1"));
			regVO.setRpt2_auth_2((String) req.getParameter("rpt2_auth_2"));
			regVO.setRpt2_auth_3((String) req.getParameter("rpt2_auth_3"));
			regVO.setRpt2_auth_4((String) req.getParameter("rpt2_auth_4"));
			//증인 정보
			regVO.setWit_name((String) req.getParameter("wit_name"));
			regVO.setWit_birth_dt((String) req.getParameter("wit_birth_dt"));
			regVO.setWit_tel((String) req.getParameter("wit_tel"));
			regVO.setWit_email((String) req.getParameter("wit_email"));
			regVO.setWit_addr((String) req.getParameter("wit_addr"));
			//제1대리인정보
			regVO.setRpt1_id((String) req.getParameter("rpt1_id"));
			regVO.setRpt1_name((String) req.getParameter("rpt1_name"));
			regVO.setRpt1_birth_dt((String) req.getParameter("rpt1_birth_dt"));
			regVO.setRpt1_tel((String) req.getParameter("rpt1_tel"));
			regVO.setRpt1_email((String) req.getParameter("rpt1_email"));
			regVO.setRpt1_addr((String) req.getParameter("rpt1_addr"));
			String rpt2_id = (String) req.getParameter("rpt2_id");
			if (rpt2_id.equals("")) {
				regVO.setRpt2_id("");
			} else {
				regVO.setRpt2_id((String) req.getParameter("rpt2_id"));
			}
			String rpt2_name = (String) req.getParameter("rpt2_name");
			if (rpt2_name.equals("")) {
				regVO.setRpt2_name("");
			} else {
				regVO.setRpt2_name((String) req.getParameter("rpt2_name"));
			}
			String rpt2_birth_dt = (String) req.getParameter("rpt2_birth_dt");
			if (rpt2_birth_dt.equals("")) {
				regVO.setRpt2_birth_dt("");
			} else {
				regVO.setRpt2_birth_dt((String) req.getParameter("rpt2_birth_dt"));
			}
			String rpt2_tel = (String) req.getParameter("rpt2_tel");
			if (rpt2_tel.equals("")) {
				regVO.setRpt2_tel("");
			} else {
				regVO.setRpt2_tel((String) req.getParameter("rpt2_tel"));
			}
			String rpt2_email = (String) req.getParameter("rpt2_email");
			if (rpt2_email.equals("")) {
				regVO.setRpt2_email("");
			} else {
				regVO.setRpt2_email((String) req.getParameter("rpt2_email"));
			}
			String rpt2_addr = (String) req.getParameter("rpt2_addr");
			if (rpt2_addr.equals("")) {
				regVO.setRpt2_addr("");
			} else {
				regVO.setRpt2_addr((String) req.getParameter("rpt2_addr"));
			}
			//선택사항 - 입원 및 요양시설 입소에 관한 나의 의사
			String tmpmy_thik_1 = (String) req.getParameter("my_thik_1");
			if (tmpmy_thik_1.equals("")) {
				regVO.setMy_thik_1(null);
			} else {
				regVO.setMy_thik_1((String) req.getParameter("my_thik_1"));
			}
			String tmpmy_thik_1_room = (String) req.getParameter("my_thik_1_room");
			if (tmpmy_thik_1_room.equals("")) {
				regVO.setMy_thik_1_room(null);
			} else {
				regVO.setMy_thik_1_room((String) req.getParameter("my_thik_1_room"));
			}
			String my_thik_2 = (String) req.getParameter("my_thik_2");
			if (my_thik_2.equals("")) {
				regVO.setMy_thik_2(null);
			} else {
				regVO.setMy_thik_2(my_thik_2);
			}
			String my_thik_3 = (String) req.getParameter("my_thik_3");
			if (my_thik_3.equals("")) {
				regVO.setMy_thik_3(null);
			} else {
				regVO.setMy_thik_3(my_thik_3);
			}
			String my_thik_3_area = (String) req.getParameter("my_thik_3_area");
			if (my_thik_3_area.equals("")) {
				regVO.setMy_thik_3_area(null);
			} else {
				regVO.setMy_thik_3_area(my_thik_3_area);
			}
			String my_thik_3_room = (String) req.getParameter("my_thik_3_room");
			if (my_thik_3_room.equals("")) {
				regVO.setMy_thik_3_room(null);
			} else {
				regVO.setMy_thik_3_room(my_thik_3_room);
			}
			String my_thik_4 = (String) req.getParameter("my_thik_4");
			if (my_thik_4.equals("")) {
				regVO.setMy_thik_4(null);
			} else {
				regVO.setMy_thik_4(my_thik_4);
			}
			String my_thik_5 = (String) req.getParameter("my_thik_5");
			if (my_thik_5.equals("")) {
				regVO.setMy_thik_5(null);
			} else {
				regVO.setMy_thik_5(my_thik_5);
			}
			String my_thik_6 = (String) req.getParameter("my_thik_6");
			if (my_thik_6.equals("")) {
				regVO.setMy_thik_6(null);
			} else {
				regVO.setMy_thik_6(my_thik_6);
			}
			String my_thik_6_cntn = (String) req.getParameter("my_thik_6_cntn");
			if (my_thik_6_cntn.equals("")) {
				regVO.setMy_thik_6_cntn(null);
			} else {
				regVO.setMy_thik_6_cntn(my_thik_6_cntn);
			}
			//[선택사항] 입소할 요양시설에 대한 나의 의사
			String no1_buid_cntn = (String) req.getParameter("no1_buid_cntn");
			if (no1_buid_cntn.equals("")) {
				regVO.setNo1_buid_cntn("");
			} else {
				regVO.setNo1_buid_cntn((String) req.getParameter("no1_buid_cntn"));
			}
			String no1_buid_tel = (String) req.getParameter("no1_buid_tel");
			if (no1_buid_tel.equals("")) {
				regVO.setNo1_buid_tel("");
			} else {
				regVO.setNo1_buid_tel((String) req.getParameter("no1_buid_tel"));
			}
			String no1_buid_addr = (String) req.getParameter("no1_buid_addr");
			if (no1_buid_addr.equals("")) {
				regVO.setNo1_buid_addr("");
			} else {
				regVO.setNo1_buid_addr((String) req.getParameter("no1_buid_addr"));
			}
			String no2_buid_cntn = (String) req.getParameter("no2_buid_cntn");
			if (no2_buid_cntn.equals("")) {
				regVO.setNo2_buid_cntn("");
			} else {
				regVO.setNo2_buid_cntn((String) req.getParameter("no2_buid_cntn"));
			}
			String no2_buid_tel = (String) req.getParameter("no2_buid_tel");
			if (no2_buid_tel.equals("")) {
				regVO.setNo2_buid_tel("");
			} else {
				regVO.setNo2_buid_tel((String) req.getParameter("no2_buid_tel"));
			}
			String no2_buid_addr = (String) req.getParameter("no2_buid_addr");
			if (no2_buid_addr.equals("")) {
				regVO.setNo2_buid_addr("");
			} else {
				regVO.setNo2_buid_addr((String) req.getParameter("no2_buid_addr"));
			}
			String no3_buid_cntn = (String) req.getParameter("no3_buid_cntn");
			if (no3_buid_cntn.equals("")) {
				regVO.setNo3_buid_cntn("");
			} else {
				regVO.setNo3_buid_cntn((String) req.getParameter("no3_buid_cntn"));
			}
			//선택사항
			String my_req_1 = (String) req.getParameter("my_req_1");
			if (my_req_1.equals("")) {
				regVO.setMy_req_1(null);
			} else {
				regVO.setMy_req_1(my_req_1);
			}
			String my_req_2 = (String) req.getParameter("my_req_2");
			if (my_req_2.equals("")) {
				regVO.setMy_req_2(null);
			} else {
				regVO.setMy_req_2(my_req_2);
			}
			String my_req_3 = (String) req.getParameter("my_req_3");
			if (my_req_3.equals("")) {
				regVO.setMy_req_3(null);
			} else {
				regVO.setMy_req_3(my_req_3);
			}
			String my_req_4 = (String) req.getParameter("my_req_4");
			if (my_req_4.equals("")) {
				regVO.setMy_req_4(null);
			} else {
				regVO.setMy_req_4(my_req_4);
			}
			String my_req_5 = (String) req.getParameter("my_req_5");
			if (my_req_5.equals("")) {
				regVO.setMy_req_5(null);
			} else {
				regVO.setMy_req_5(my_req_5);
			}
			//[선택사항] 4
			String free_vist_1_name = (String) req.getParameter("free_vist_1_name");
			if (free_vist_1_name.equals("")) {
				regVO.setFree_vist_1_name(null);
			} else {
				regVO.setFree_vist_1_name(free_vist_1_name);
			}
			String free_vist_1_rel = (String) req.getParameter("free_vist_1_rel");
			if (free_vist_1_rel.equals("")) {
				regVO.setFree_vist_1_rel(null);
			} else {
				regVO.setFree_vist_1_rel(free_vist_1_rel);
			}
			String free_vist_1_tel = (String) req.getParameter("free_vist_1_tel");
			if (free_vist_1_tel.equals("")) {
				regVO.setFree_vist_1_tel(null);
			} else {
				regVO.setFree_vist_1_tel(free_vist_1_tel);
			}
			String free_vist_2_name = (String) req.getParameter("free_vist_2_name");
			if (free_vist_2_name.equals("")) {
				regVO.setFree_vist_2_name(null);
			} else {
				regVO.setFree_vist_2_name(free_vist_2_name);
			}
			String free_vist_2_rel = (String) req.getParameter("free_vist_2_rel");
			if (free_vist_2_rel.equals("")) {
				regVO.setFree_vist_2_rel(null);
			} else {
				regVO.setFree_vist_2_rel(free_vist_2_rel);
			}
			String free_vist_2_tel = (String) req.getParameter("free_vist_2_tel");
			if (free_vist_2_tel.equals("")) {
				regVO.setFree_vist_2_tel(null);
			} else {
				regVO.setFree_vist_2_tel(free_vist_2_tel);
			}
			String free_vist_3_name = (String) req.getParameter("free_vist_3_name");
			if (free_vist_3_name.equals("")) {
				regVO.setFree_vist_3_name(null);
			} else {
				regVO.setFree_vist_3_name(free_vist_3_name);
			}
			String free_vist_3_rel = (String) req.getParameter("free_vist_3_rel");
			if (free_vist_3_rel.equals("")) {
				regVO.setFree_vist_3_rel(null);
			} else {
				regVO.setFree_vist_3_rel(free_vist_3_rel);
			}
			String free_vist_3_tel = (String) req.getParameter("free_vist_3_tel");
			if (free_vist_3_tel.equals("")) {
				regVO.setFree_vist_3_tel(null);
			} else {
				regVO.setFree_vist_3_tel(free_vist_3_tel);
			}
			//[선택사항] 5
			String my_indv_1 = (String) req.getParameter("my_indv_1");
			if (my_indv_1.equals("")) {
				regVO.setMy_indv_1(null);
			} else {
				regVO.setMy_indv_1(my_indv_1);
			}
			String my_indv_2 = (String) req.getParameter("my_indv_2");
			if (my_indv_2.equals("")) {
				regVO.setMy_indv_2(null);
			} else {
				regVO.setMy_indv_2(my_indv_2);
			}
			String my_indv_3 = (String) req.getParameter("my_indv_3");
			if (my_indv_3.equals("")) {
				regVO.setMy_indv_3(null);
			} else {
				regVO.setMy_indv_3(my_indv_3);
			}
			String my_indv_4 = (String) req.getParameter("my_indv_4");
			if (my_indv_4.equals("")) {
				regVO.setMy_indv_4(null);
			} else {
				regVO.setMy_indv_4(my_indv_4);
			}
			System.out.println("ssesion id ============ " + regVO.getId());
			System.out.println("ssesion name ============ " + regVO.getName());
			System.out.println("regVO.getWitr_name ============ " + regVO.getWitr_name());
			System.out.println("regVO.getWitr_birth_dt ============ " + regVO.getWitr_birth_dt());
			System.out.println("regVO.getWitr_tel ============ " + regVO.getWitr_tel());
			System.out.println("regVO.getWitr_email ============ " + regVO.getWitr_email());
			System.out.println("regVO.getWitr_addr ============ " + regVO.getWitr_addr());
			/*******   작성자 및 기타 정보 등록   ********/
			String tmpStr = "";
			String tmpStr2 = "";
			int nYear;
			Calendar calendar = new GregorianCalendar(Locale.KOREA);
			nYear = calendar.get(Calendar.YEAR);
			tmpStr = Integer.toString(nYear) + "-사전-";
			System.out.println(" tmpStr ========  " + tmpStr);
			//요양지시서 - 관리번호 MAX+1 정보 가져오기
			String tmpMng_no = regService.selectMaxMngNo(regVO);
			regVO.setOdr(Integer.parseInt(tmpMng_no));
			tmpStr2 = tmpStr + tmpMng_no;
			System.out.println(" tmpStr2 ========  " + tmpStr2);
			regVO.setMng_no(tmpStr2);
			//요양지시서- 작성자 정보 등록 
			regService.witrInfoInsert(regVO);
			//status.setComplete();
			//요양지시서- 제1대리인 정보 등록 
			regService.rpt1InfoInsert(regVO);
			//요양지시서- 제2대리인 정보 등록 
			System.out.println("rpt2_id ====================  " + rpt2_id);
			if (!rpt2_id.equals("")) {
				regService.rpt2InfoInsert(regVO);
			}
			return "jsonView";
		} catch (Exception e) {
			utility.func.Logging(this.getClass().getName(), e);
			return null;

		}
		
	}
	
	
	
	
	/**
	 * 공문 등록페이지로 이동
	 * @param searchVO - 조회할 정보가 담긴 SampleDefaultVO
	 * @param model
	 * @return "egovSampleList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/regGongmun.do")
	public String regGongmun(@ModelAttribute("searchVO") RegVO regVO, ModelMap model, HttpServletRequest req) throws Exception {
		System.out.println(" <------------   사전의료요양지서 등록페이지로 이동 ------------>");
		/** EgovPropertyService.sample */
		
		
			return "user/reg/regGongmun";
		
		
	}
	
	
	
	/**
	 * 신탁계약서 등록페이지로 이동
	 * @param searchVO - 조회할 정보가 담긴 SampleDefaultVO
	 * @param model
	 * @return "egovSampleList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/regTrst.do")
	public String regTrst(@ModelAttribute("searchVO") RegVO regVO, ModelMap model, HttpServletRequest req) throws Exception {
		System.out.println(" <------------   사전의료요양지서 등록페이지로 이동 ------------>");
		/** EgovPropertyService.sample */
		
		System.out.println("loginId =============   "+req.getSession().getAttribute("id"));
		System.out.println("loginName =============   "+req.getSession().getAttribute("name"));
		
		if(req.getSession().getAttribute("id")==null || req.getSession().getAttribute("id").equals("")){
			return "user/main/login";
		}else{
			
			regVO.setId((String)req.getSession().getAttribute("id"));
			regVO.setName((String)req.getSession().getAttribute("name"));
			
			//신탁계약서 등록정보 중복체크
			int tmpDupTrstId = regService.schTrstIdDupCheck(regVO);	
			
			//if(tmpDupTrstId > 0) {
			//	return "user/reg/regDupResult";
			//}else{
			//	return "user/reg/regTrst";
			//}
			
			//삭제 할것
			return "user/reg/regTrst";
		}
		
	}
	
	
	
	/**
	 * 신탁계약서 - 정보 등록하기
	 */
	@RequestMapping("/fn_trst_Reg.do")
	public String fn_trst_Reg(@ModelAttribute("searchVO") RegVO regVO, Model model, HttpServletRequest req) throws Exception {
		
		System.out.println("loginId =============   "+req.getSession().getAttribute("id"));
		System.out.println("loginName =============   "+req.getSession().getAttribute("name"));
		
		
		regVO.setId((String)req.getSession().getAttribute("id"));
		regVO.setName((String)req.getSession().getAttribute("name"));
		
		//작성자 정보
		regVO.setClent_id(regVO.getId());
		
		
		
		//필수정보 - 위탁자정보  
		regVO.setClent_nm((String)req.getParameter("clent_nm"));
		regVO.setClent_birth_dt((String)req.getParameter("clent_birth_dt"));
		regVO.setClent_tel((String)req.getParameter("clent_tel"));
		regVO.setClent_email((String)req.getParameter("clent_email"));
		regVO.setClent_addr((String)req.getParameter("clent_addr"));
		
		//필수정보 - 수탁자정보   
		regVO.setCsmt_nm((String)req.getParameter("csmt_nm"));
		regVO.setCsmt_birth_dt((String)req.getParameter("csmt_birth_dt"));
		regVO.setCsmt_tel((String)req.getParameter("csmt_tel"));
		regVO.setCsmt_email((String)req.getParameter("csmt_email"));
		regVO.setCsmt_addr((String)req.getParameter("csmt_addr"));
		
		//필수정보 - 수익자정보 
		regVO.setBnft_nm((String)req.getParameter("bnft_nm"));
		regVO.setBnft_birth_dt((String)req.getParameter("bnft_birth_dt"));
		regVO.setBnft_tel((String)req.getParameter("bnft_tel"));
		regVO.setBnft_email((String)req.getParameter("bnft_email"));
		regVO.setBnft_addr((String)req.getParameter("bnft_addr"));
		
		//연속수익자
    	String go_bnft_nm = (String)req.getParameter("go_bnft_nm");
		if(go_bnft_nm.equals("")){
			regVO.setGo_bnft_nm("");
		}else{
			regVO.setGo_bnft_nm((String)req.getParameter("go_bnft_nm"));
		}
		
		String go_bnft_birth_dt = (String)req.getParameter("go_bnft_birth_dt");
		if(go_bnft_birth_dt.equals("")){
			regVO.setGo_bnft_birth_dt("");
		}else{
			regVO.setGo_bnft_birth_dt((String)req.getParameter("go_bnft_birth_dt"));
		}
		
		String go_bnft_tel = (String)req.getParameter("go_bnft_tel");
		if(go_bnft_tel.equals("")){
			regVO.setGo_bnft_tel("");
		}else{
			regVO.setGo_bnft_tel((String)req.getParameter("go_bnft_tel"));
		}
		
		String go_bnft_email = (String)req.getParameter("go_bnft_email");
		if(go_bnft_email.equals("")){
			regVO.setGo_bnft_email("");
		}else{
			regVO.setGo_bnft_email((String)req.getParameter("go_bnft_email"));
		}
		
		String go_bnft_addr = (String)req.getParameter("go_bnft_addr");
		if(go_bnft_addr.equals("")){
			regVO.setGo_bnft_addr("");
		}else{
			regVO.setGo_bnft_addr((String)req.getParameter("go_bnft_addr"));
		}
		
		
		//개별지원자
		String per_give_nm = (String)req.getParameter("per_give_nm");
		if(per_give_nm.equals("")){
			regVO.setPer_give_nm("");
		}else{
			regVO.setPer_give_nm((String)req.getParameter("per_give_nm"));
		}
		
		String per_give_birth_dt = (String)req.getParameter("per_give_birth_dt");
		if(per_give_birth_dt.equals("")){
			regVO.setPer_give_birth_dt("");
		}else{
			regVO.setPer_give_birth_dt((String)req.getParameter("per_give_birth_dt"));
		}
		
		String per_give_tel = (String)req.getParameter("per_give_tel");
		if(per_give_tel.equals("")){
			regVO.setPer_give_tel("");
		}else{
			regVO.setPer_give_tel((String)req.getParameter("per_give_tel"));
		}
		
		String per_give_rel = (String)req.getParameter("per_give_rel");
		if(per_give_rel.equals("")){
			regVO.setPer_give_rel("");
		}else{
			regVO.setPer_give_rel((String)req.getParameter("per_give_rel"));
		}
		
		String per_give_email = (String)req.getParameter("per_give_email");
		if(per_give_email.equals("")){
			regVO.setPer_give_email("");
		}else{
			regVO.setPer_give_email((String)req.getParameter("per_give_email"));
		}
		
		String per_give_addr = (String)req.getParameter("per_give_addr");
		if(per_give_addr.equals("")){
			regVO.setPer_give_addr("");
		}else{
			regVO.setPer_give_addr((String)req.getParameter("per_give_addr"));
		}
		
		
    	
    	//금액
    	regVO.setContct_dt((String)req.getParameter("contct_dt"));
		regVO.setOpen_dt((String)req.getParameter("open_dt"));
		
		String tot_amt = (String)req.getParameter("tot_amt");
		if(tot_amt.equals("")){
			regVO.setTot_amt(null);
		}else{
			regVO.setTot_amt(tot_amt);
		}
		String tot_dt = (String)req.getParameter("tot_dt");
		if(tot_dt.equals("")){
			regVO.setTot_dt(null);
		}else{
			regVO.setTot_dt(tot_dt);
		}
		String sevr_amt = (String)req.getParameter("sevr_amt");
		if(sevr_amt.equals("")){
			regVO.setSevr_amt(null);
		}else{
			regVO.setSevr_amt(sevr_amt);
		}
		String sevr_dt = (String)req.getParameter("sevr_dt");
		if(sevr_dt.equals("")){
			regVO.setSevr_dt(null);
		}else{
			regVO.setSevr_dt((String)req.getParameter("sevr_dt"));
		}
		
		//선택사항 1
		String use11 = (String)req.getParameter("use11");
		if(use11.equals("")){
			regVO.setUse11(null);
		}else{
			regVO.setUse11((String)req.getParameter("use11"));
		}
		
		String use12 = (String)req.getParameter("use12");
		if(use12.equals("")){
			regVO.setUse12(null);
		}else{
			regVO.setUse12((String)req.getParameter("use12"));
		}
		
		String use13 = (String)req.getParameter("use13");
		if(use13.equals("")){
			regVO.setUse13(null);
		}else{
			regVO.setUse13((String)req.getParameter("use13"));
		}
		
		String use14 = (String)req.getParameter("use14");
		if(use14.equals("")){
			regVO.setUse14(null);
		}else{
			regVO.setUse14((String)req.getParameter("use14"));
		}
		
		String use15 = (String)req.getParameter("use15");
		if(use15.equals("")){
			regVO.setUse15(null);
		}else{
			regVO.setUse15((String)req.getParameter("use15"));
		}
		
		String use16 = (String)req.getParameter("use16");
		if(use16.equals("")){
			regVO.setUse16(null);
		}else{
			regVO.setUse16((String)req.getParameter("use16"));
		}
		
		String use17 = (String)req.getParameter("use17");
		if(use17.equals("")){
			regVO.setUse17(null);
		}else{
			regVO.setUse17((String)req.getParameter("use17"));
		}
		
		String use18 = (String)req.getParameter("use18");
		if(use18.equals("")){
			regVO.setUse18(null);
		}else{
			regVO.setUse18((String)req.getParameter("use18"));
		}
		
		String use19 = (String)req.getParameter("use19");
		if(use19.equals("")){
			regVO.setUse19(null);
		}else{
			regVO.setUse19((String)req.getParameter("use19"));
		}
		
		String pokt_mony_bank = (String)req.getParameter("pokt_mony_bank");
		if(pokt_mony_bank.equals("")){
			regVO.setPokt_mony_bank("");
		}else{
			regVO.setPokt_mony_bank(pokt_mony_bank);
		}
		
		String pokt_mony_name = (String)req.getParameter("pokt_mony_name");
		if(pokt_mony_name.equals("")){
			regVO.setPokt_mony_name("");
		}else{
			regVO.setPokt_mony_name(pokt_mony_name);
		}
		
		String pokt_mony_acont = (String)req.getParameter("pokt_mony_acont");
		if(pokt_mony_acont.equals("")){
			regVO.setPokt_mony_acont("");
		}else{
			regVO.setPokt_mony_acont(pokt_mony_acont);
		}
		
		//선택사항 2   
		String trst_goal_amt = (String)req.getParameter("trst_goal_amt");
		if(trst_goal_amt.equals("")){
			regVO.setTrst_goal_amt("");
		}else{
			regVO.setTrst_goal_amt((String)req.getParameter("trst_goal_amt"));
		}
		
		String trst_tot_amt = (String)req.getParameter("trst_tot_amt");
		if(trst_tot_amt.equals("")){
			regVO.setTrst_tot_amt("");
		}else{
			regVO.setTrst_tot_amt((String)req.getParameter("trst_tot_amt"));
		}
		
		String trst_sevr_amt = (String)req.getParameter("trst_sevr_amt");
		if(trst_sevr_amt.equals("")){
			regVO.setTrst_sevr_amt("");
		}else{
			regVO.setTrst_sevr_amt((String)req.getParameter("trst_sevr_amt"));
		}
		
		String trst_give_dt = (String)req.getParameter("trst_give_dt");
		if(trst_give_dt.equals("")){
			regVO.setTrst_give_dt("");
		}else{
			regVO.setTrst_give_dt((String)req.getParameter("trst_give_dt"));
		}
		
    	//선택사항 3
		String csmt_bank = (String)req.getParameter("csmt_bank");
		if(csmt_bank.equals("")){
			regVO.setCsmt_bank("");
		}else{
			regVO.setCsmt_bank((String)req.getParameter("csmt_bank"));
		}
		
		String csmt_name = (String)req.getParameter("csmt_name");
		if(csmt_name.equals("")){
			regVO.setCsmt_name("");
		}else{
			regVO.setCsmt_name((String)req.getParameter("csmt_name"));
		}
		
		String csmt_acont = (String)req.getParameter("csmt_acont");
		if(csmt_acont.equals("")){
			regVO.setCsmt_acont("");
		}else{
			regVO.setCsmt_acont((String)req.getParameter("csmt_acont"));
		}
		
    	//선택사항 4
		String csmt_tel2 = (String)req.getParameter("csmt_tel2");
		if(csmt_tel2.equals("")){
			regVO.setCsmt_tel2("");
		}else{
			regVO.setCsmt_tel2((String)req.getParameter("csmt_tel2"));
		}
		
		String csmt_fax2 = (String)req.getParameter("csmt_fax2");
		if(csmt_fax2.equals("")){
			regVO.setCsmt_fax2("");
		}else{
			regVO.setCsmt_fax2((String)req.getParameter("csmt_fax2"));
		}
		
		String csmt_email2 = (String)req.getParameter("csmt_email2");
		if(csmt_email2.equals("")){
			regVO.setCsmt_email2("");
		}else{
			regVO.setCsmt_email2((String)req.getParameter("csmt_email2"));
		}
		
		
		//선택사항 5
		String trst_give_sign1 = (String)req.getParameter("trst_give_sign1");
		if(trst_give_sign1.equals("")){
			regVO.setTrst_give_sign1("");
		}else{
			regVO.setTrst_give_sign1((String)req.getParameter("trst_give_sign1"));
		}
		
		String trst_give_sign2 = (String)req.getParameter("trst_give_sign2");
		if(trst_give_sign2.equals("")){
			regVO.setTrst_give_sign2("");
		}else{
			regVO.setTrst_give_sign2((String)req.getParameter("trst_give_sign2"));
		}
		
		String trst_give_sign3 = (String)req.getParameter("trst_give_sign3");
		if(trst_give_sign3.equals("")){
			regVO.setTrst_give_sign3("");
		}else{
			regVO.setTrst_give_sign3((String)req.getParameter("trst_give_sign3"));
		}
		
		String trst_give_sign4 = (String)req.getParameter("trst_give_sign4");
		if(trst_give_sign4.equals("")){
			regVO.setTrst_give_sign4("");
		}else{
			regVO.setTrst_give_sign4((String)req.getParameter("trst_give_sign4"));
		}
		
		String trst_give_etc1 = (String)req.getParameter("trst_give_etc1");
		if(trst_give_etc1.equals("")){
			regVO.setTrst_give_etc1("");
		}else{
			regVO.setTrst_give_etc1((String)req.getParameter("trst_give_etc1"));
		}
		
		String trst_give_etc2 = (String)req.getParameter("trst_give_etc2");
		if(trst_give_etc2.equals("")){
			regVO.setTrst_give_etc1("");
		}else{
			regVO.setTrst_give_etc2((String)req.getParameter("trst_give_etc2"));
		}
		
		//선택사항 6
		String trst_recv_bank = (String)req.getParameter("trst_recv_bank");
		if(trst_recv_bank.equals("")){
			regVO.setTrst_recv_bank("");
		}else{
			regVO.setTrst_recv_bank((String)req.getParameter("trst_recv_bank"));
		}
		
		String trst_recv_name = (String)req.getParameter("trst_recv_name");
		if(trst_recv_name.equals("")){
			regVO.setTrst_recv_name("");
		}else{
			regVO.setTrst_recv_name((String)req.getParameter("trst_recv_name"));
		}
		
		String trst_recv_acont = (String)req.getParameter("trst_recv_acont");
		if(trst_recv_acont.equals("")){
			regVO.setTrst_recv_acont("");
		}else{
			regVO.setTrst_recv_acont((String)req.getParameter("trst_recv_acont"));
		}
		
		//선택사항 7
		String give_paper_issue = (String)req.getParameter("give_paper_issue");
		if(give_paper_issue.equals("")){
			regVO.setGive_paper_issue("");
		}else{
			regVO.setGive_paper_issue((String)req.getParameter("give_paper_issue"));
		}
		
		String give_paper_issue1 = (String)req.getParameter("give_paper_issue1");
		if(give_paper_issue1.equals("")){
			regVO.setGive_paper_issue1("");
		}else{
			regVO.setGive_paper_issue1((String)req.getParameter("give_paper_issue1"));
		}
		
		String give_paper_issue2 = (String)req.getParameter("give_paper_issue2");
		if(give_paper_issue2.equals("")){
			regVO.setGive_paper_issue2("");
		}else{
			regVO.setGive_paper_issue2((String)req.getParameter("give_paper_issue2"));
		}
		
		String give_paper_issue3 = (String)req.getParameter("give_paper_issue3");
		if(give_paper_issue3.equals("")){
			regVO.setGive_paper_issue3("");
		}else{
			regVO.setGive_paper_issue3((String)req.getParameter("give_paper_issue3"));
		}
		
		String give_paper_issue4 = (String)req.getParameter("give_paper_issue4");
		if(give_paper_issue4.equals("")){
			regVO.setGive_paper_issue4("");
		}else{
			regVO.setGive_paper_issue4((String)req.getParameter("give_paper_issue4"));
		}
		
		String give_paper_issue5 = (String)req.getParameter("give_paper_issue5");
		if(give_paper_issue5.equals("")){
			regVO.setGive_paper_issue5("");
		}else{
			regVO.setGive_paper_issue5((String)req.getParameter("give_paper_issue5"));
		}
		
		String give_paper_amt = (String)req.getParameter("give_paper_amt");
		if(give_paper_amt.equals("")){
			regVO.setGive_paper_amt("");
		}else{
			regVO.setGive_paper_amt((String)req.getParameter("give_paper_amt"));
		}
		
		String give_paper_recv_nm = (String)req.getParameter("give_paper_recv_nm");
		if(give_paper_recv_nm.equals("")){
			regVO.setGive_paper_recv_nm("");
		}else{
			regVO.setGive_paper_recv_nm((String)req.getParameter("give_paper_recv_nm"));
		}
		
		String give_paper_acont = (String)req.getParameter("give_paper_acont");
		if(give_paper_acont.equals("")){
			regVO.setGive_paper_acont("");
		}else{
			regVO.setGive_paper_acont((String)req.getParameter("give_paper_acont"));
		}
		
		String give_paper_req_nm = (String)req.getParameter("give_paper_req_nm");
		if(give_paper_req_nm.equals("")){
			regVO.setGive_paper_req_nm("");
		}else{
			regVO.setGive_paper_req_nm((String)req.getParameter("give_paper_req_nm"));
		}
		
		String give_paper_per_nm = (String)req.getParameter("give_paper_per_nm");
		if(give_paper_per_nm.equals("")){
			regVO.setGive_paper_per_nm("");
		}else{
			regVO.setGive_paper_per_nm((String)req.getParameter("give_paper_per_nm"));
		}
		
		String give_paper_req_dt = (String)req.getParameter("give_paper_req_dt");
		if(give_paper_req_dt.equals("")){
			regVO.setGive_paper_req_dt("");
		}else{
			regVO.setGive_paper_req_dt((String)req.getParameter("give_paper_req_dt"));
		}
		
		//선택사항 8		
		String intval_give_req1 = (String)req.getParameter("intval_give_req1");
		if(intval_give_req1.equals("")){
			regVO.setIntval_give_req1("");
		}else{
			regVO.setIntval_give_req1((String)req.getParameter("intval_give_req1"));
		}
		
		String intval_give_req2 = (String)req.getParameter("intval_give_req2");
		if(intval_give_req2.equals("")){
			regVO.setIntval_give_req2("");
		}else{
			regVO.setIntval_give_req2((String)req.getParameter("intval_give_req2"));
		}
		
		String intval_give_req4 = (String)req.getParameter("intval_give_req4");
		if(intval_give_req4.equals("")){
			regVO.setIntval_give_req4("");
		}else{
			regVO.setIntval_give_req4((String)req.getParameter("intval_give_req4"));
		}
		
		String intval_give_req5 = (String)req.getParameter("intval_give_req5");
		if(intval_give_req5.equals("")){
			regVO.setIntval_give_req5("");
		}else{
			regVO.setIntval_give_req5((String)req.getParameter("intval_give_req5"));
		}
		
		//선택사항 9
		String hope_supt_yn = (String)req.getParameter("hope_supt_yn");
		if(hope_supt_yn.equals("")){
			regVO.setHope_supt_yn("");
		}else{
			regVO.setHope_supt_yn((String)req.getParameter("hope_supt_yn"));
		}
		
		String etc_dcsi_yn = (String)req.getParameter("etc_dcsi_yn");
		if(etc_dcsi_yn.equals("")){
			regVO.setEtc_dcsi_yn("");
		}else{
			regVO.setEtc_dcsi_yn((String)req.getParameter("etc_dcsi_yn"));
		}
		
		String supt1_nm = (String)req.getParameter("supt1_nm");
		if(supt1_nm.equals("")){
			regVO.setSupt1_nm("");
		}else{
			regVO.setSupt1_nm((String)req.getParameter("supt1_nm"));
		}
		
		String supt1_rel = (String)req.getParameter("supt1_rel");
		if(supt1_rel.equals("")){
			regVO.setSupt1_rel("");
		}else{
			regVO.setSupt1_rel((String)req.getParameter("supt1_rel"));
		}
		
		String supt2_nm = (String)req.getParameter("supt2_nm");
		if(supt2_nm.equals("")){
			regVO.setSupt2_nm("");
		}else{
			regVO.setSupt2_nm((String)req.getParameter("supt2_nm"));
		}
		
		String supt2_rel = (String)req.getParameter("supt2_rel");
		if(supt2_rel.equals("")){
			regVO.setSupt2_rel("");
		}else{
			regVO.setSupt2_rel((String)req.getParameter("supt2_rel"));
		}
		
		
		
		
		
		System.out.println("ssesion id ============ "+regVO.getId());
		System.out.println("ssesion name ============ "+regVO.getName());
		
		
		
		/*******   필수 정보 등록   ********/
		String tmpStr11 = "";
		String tmpStr12 = "";
		int nYear;
		Calendar calendar = new GregorianCalendar(Locale.KOREA);
		nYear = calendar.get(Calendar.YEAR);		
		tmpStr11 = Integer.toString(nYear)+"-신탁-";
		System.out.println(" tmpStr11 ========  "+ tmpStr11);		
		
		//신탁계약서 - 관리번호 MAX+1 정보 가져오기
		String tmpMng_no = regService.selectTrstMaxMngNo(regVO);	
		regVO.setOdr(Integer.parseInt(tmpMng_no));
		
		tmpStr12 = tmpStr11 + tmpMng_no;
		System.out.println(" tmpStr12 ========  "+ tmpStr12);		
		regVO.setMng_no(tmpStr12);
		
		//신탁계약서- 정보 등록 
		regService.witrTrstInfoInsert(regVO);
		//status.setComplete();
		
		
		/*******   신탁계약서 지출내역 정보 등록   ********/
		//신탁계약서- 지출내역 일련번호 가져오기
		//int tmpRpt1_num = regService.selectRpt1_num(regVO);	
		//regVO.setRpt1_num(tmpRpt1_num);
		
		//요양지시서- 지출내역 정보 등록 
		//regService.rpt1InfoInsert(regVO);
		
		
		
		
		
		//model.addAttribute(regVO);
		
		return "jsonView";
		
	}
	
	
	
	/**
	 * 사전의료요양지서 - 첨부파일 업로드 
	 */
	@RequestMapping("/cdFileUpload.do")
	public String cdFileUpload(@RequestParam("cdFile") MultipartFile file, RegVO regVO,  Model model, HttpSession session,  MultipartHttpServletRequest req) throws Exception {
//		System.out.println("---------------------  사전의료요양지서 - 첨부파일 업로드 ------------------  ");
//		
//		System.out.println("loginId =============   "+req.getSession().getAttribute("id"));
//		System.out.println("loginName =============   "+req.getSession().getAttribute("name"));
//		
//		
//		regVO.setId((String)req.getSession().getAttribute("id"));
//		regVO.setName((String)req.getSession().getAttribute("name"));
//		
//		MultipartFile rptFile =req.getFile("cdFile"); //첨부 된 파일
//		 
//        Map returnObject = new HashMap(); 
//        
//        String orgfilename = file.getOriginalFilename();
//        String sysfilename = "";
//        String currentDate = DateTimeUtil.currentDate();
//        
//        
//        
//        //String filePath = FILE_PATH+"/"+currentDate;
//        String filePath = FILE_PATH+"/"+currentDate;
//		File dir = new File(filePath);
//        if (!dir.isDirectory()) {
//            dir.mkdirs();
//        }
//        
//        File f = new File(orgfilename);
//        
//        //File file2 = f.getCanonicalFile();
//        //String file_path = f.getPath();
//        
//        File destFile = new File(filePath+"/"+orgfilename); 
//
//        try{
//        	rptFile.transferTo(destFile); //파일 데이터를 지정한 file(destFile)로 저장 
//        }catch(Exception e){
//        	utility.func.Logging(this.getClass().getName(), e);
//			return null;
//
//        }
//        
//        //System.out.println("convFile f.getPath() ======================  "+ f.getPath());
//        //System.out.println("convFile f.getCanonicalFile() ======================  "+ f.getCanonicalFile());
//        //System.out.println("convFile file_path ======================  "+ file_path);
//        
//        int size = 0;
//        
//        try { 
//        	
//        	//sysfilename = orgfilename.substring(orgfilename.lastIndexOf("."), orgfilename.length());
//        	sysfilename = orgfilename.length()+'-'+orgfilename;
//        	
//        	System.out.println("sysfilename  =============  " + sysfilename);
//        	
//			size = (int) file.getSize();
//            
//			regVO.setOrg_file_nm(orgfilename);
//			regVO.setSys_file_nm(sysfilename);
//			regVO.setFile_path(filePath);
//			regVO.setFile_size(size);
//			
//            //Iterator iter = (Iterator) req.getFileNames(); 
//            //MultipartFile mfile = null; 
//            String fieldName = ""; 
//            
//            // 값이 나올때까지
//            //while (iter.hasNext()) { 
//                //fieldName = iter.next().toString(); // 내용을 가져와서 
//                //mfile = req.getFile(fieldName); 
//                //String origName; 
//                //origName = new String(mfile.getOriginalFilename().getBytes("8859_1"), "UTF-8"); //한글꺠짐 방지 // 파일명이 없다면 
//                
//                returnObject.put("params", req.getParameterMap()); 
//                
//                
//                //로컬 소스 : 위치 및 파일
//                //사전의료요양지서 - 첨부파일 업로드 
//                regService.cdFileUpload(regVO);
//                
//                //서버 소스 : 위치 및 파일
//                //admRdService.excelUpload("/www/futureplan_or_kr/www/excel_file/"+orgfilename,admRdVO);
//                
//                
//            //}
//                //txManager.commit(txStatus);
//                //status.setComplete();
//            
//            } catch (Exception e) { // TODO Auto-generated catch block 
//            	utility.func.Logging(this.getClass().getName(), e);
//    			return null;
//
//            }
//		
//		
//		model.addAttribute(regVO);
//		
//		return "forward:/egovMainList.do";  
//		//
		return null;
		
	}
	
	
	
	/**
	 * 신탁계약서 - 첨부파일 업로드 
	 */
	@RequestMapping("/trstFileUpload.do")
	public String trstFileUpload(@RequestParam("trstFile") MultipartFile file, RegVO regVO,  Model model, HttpSession session,  MultipartHttpServletRequest req) throws Exception {
//		System.out.println("---------------------  금전신탁계약서 - 첨부파일 업로드 ------------------  ");
//		
//		System.out.println("loginId =============   "+req.getSession().getAttribute("id"));
//		System.out.println("loginName =============   "+req.getSession().getAttribute("name"));
//		
//		
//		regVO.setId((String)req.getSession().getAttribute("id"));
//		regVO.setName((String)req.getSession().getAttribute("name"));
//		
//		MultipartFile rptFile =req.getFile("trstFile"); //첨부 된 파일
//		 
//        Map returnObject = new HashMap(); 
//        
//        String orgfilename = file.getOriginalFilename();
//        String sysfilename = "";
//        String currentDate = DateTimeUtil.currentDate();
//        
//        
//        
//        //String filePath = FILE_PATH+"/"+currentDate;
//        String filePath = FILE_PATH+"/"+currentDate;
//		File dir = new File(filePath);
//        if (!dir.isDirectory()) {
//            dir.mkdirs();
//        }
//        
//        File f = new File(orgfilename);
//        
//        //File file2 = f.getCanonicalFile();
//        //String file_path = f.getPath();
//        
//        File destFile = new File(filePath+"/"+orgfilename); 
//
//        try{
//        	rptFile.transferTo(destFile); //파일 데이터를 지정한 file(destFile)로 저장 
//        }catch(Exception e){
//        	utility.func.Logging(this.getClass().getName(), e);
//			return null;
//
//        }
//        
//        //System.out.println("convFile f.getPath() ======================  "+ f.getPath());
//        //System.out.println("convFile f.getCanonicalFile() ======================  "+ f.getCanonicalFile());
//        //System.out.println("convFile file_path ======================  "+ file_path);
//        
//        int size = 0;
//        
//        try { 
//        	
//        	//sysfilename = orgfilename.substring(orgfilename.lastIndexOf("."), orgfilename.length());
//        	sysfilename = orgfilename.length()+'-'+orgfilename;
//        	
//        	System.out.println("sysfilename  =============  " + sysfilename);
//        	
//			size = (int) file.getSize();
//            
//			regVO.setOrg_file_nm(orgfilename);
//			regVO.setSys_file_nm(sysfilename);
//			regVO.setFile_path(filePath);
//			regVO.setFile_size(size);
//			
//            //Iterator iter = (Iterator) req.getFileNames(); 
//            //MultipartFile mfile = null; 
//            String fieldName = ""; 
//            
//            // 값이 나올때까지
//            //while (iter.hasNext()) { 
//                //fieldName = iter.next().toString(); // 내용을 가져와서 
//                //mfile = req.getFile(fieldName); 
//                //String origName; 
//                //origName = new String(mfile.getOriginalFilename().getBytes("8859_1"), "UTF-8"); //한글꺠짐 방지 // 파일명이 없다면 
//                
//                returnObject.put("params", req.getParameterMap()); 
//                
//                
//                //로컬 소스 : 위치 및 파일
//                //신탁계약서 - 첨부파일 업로드 
//                regService.trstFileUpload(regVO);
//                
//                //서버 소스 : 위치 및 파일
//                //admRdService.excelUpload("/www/futureplan_or_kr/www/excel_file/"+orgfilename,admRdVO);
//                
//                
//            //}
//                //txManager.commit(txStatus);
//                //status.setComplete();
//            
//            } catch (Exception e) { // TODO Auto-generated catch block 
//            	utility.func.Logging(this.getClass().getName(), e);
//    			return null;
//
//            }
//		
//		
//		model.addAttribute(regVO);
//		
//		return "forward:/egovMainList.do";  
		return null;
		
	}
	

}
