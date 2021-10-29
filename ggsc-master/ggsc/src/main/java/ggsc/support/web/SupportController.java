package ggsc.support.web;

import java.io.IOException;
import java.io.InputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.daou.ppurio.SendMmsMessage;
import com.daou.ppurio.mmsVO;

import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import ggsc.cnsr.service.AdminManageService;
import ggsc.cnsr.service.GroupVO;
import ggsc.support.service.ChtrVO;
import ggsc.support.service.FaqVO;
import ggsc.support.service.MailVO;
import ggsc.support.service.NoticeVO;
import ggsc.support.service.RescRoomVO;
import ggsc.support.service.SignVO;
import ggsc.support.service.SupportService;
import ggsc.support.service.SurveyMngVO;
import ggsc.support.service.UserManualVO;
 

@Controller

public class SupportController {
	@Resource(name = "supportService")
	private SupportService supportService;
	
	@Resource(name = "AdminManageService")
	private AdminManageService adminManageService;
	
	
	@SuppressWarnings("unused")
	@RequestMapping(value = "/contactSample.do", method = { RequestMethod.GET })
	public void smsExcelSample(HttpServletRequest request, HttpServletResponse response) {
		try {
			XSSFWorkbook workbook = new XSSFWorkbook();
			XSSFSheet sheet = workbook.createSheet();
			XSSFRow row;
			XSSFCell cell;

			row = sheet.createRow(0);
			cell = row.createCell(0);
			cell.setCellValue("성명");
			cell = row.createCell(1);
			cell.setCellValue("연락처");

			row = sheet.createRow(1);
			cell = row.createCell(0);
			cell.setCellValue("홍길동");
			cell = row.createCell(1);
			cell.setCellValue("010-1234-1234");

			sheet.autoSizeColumn(0);
			sheet.autoSizeColumn(1);
			sheet.setColumnWidth(0, sheet.getColumnWidth(0) + 2000);
			sheet.setColumnWidth(1, sheet.getColumnWidth(1) + 1000);

			response.reset();
			response.setHeader("Content-Disposition", "attachment;filename=SMS_SAMPLE.xlsx");
			response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");

			workbook.write(response.getOutputStream());
			response.getOutputStream().flush();
			response.getOutputStream().close();
		} catch (IOException e) {
			utility.func.Logging(this.getClass().getName(), e);

		}
	}
	
	
	@SuppressWarnings("unused")
	@RequestMapping(value = "/contactUpload.do", method = { RequestMethod.POST })
	public String smsExcelUpload(HttpServletRequest request, ModelMap model, @RequestParam("file") MultipartFile file) {
		String values = "";
		try {
			InputStream fileStream = file.getInputStream();
			XSSFWorkbook workbook = new XSSFWorkbook(fileStream);
			int rowindex = 0, columnindex = 0;
			//시트 수 (첫번째에만 존재하므로 0을 준다)
            //만약 각 시트를 읽기위해서는 FOR문을 한번더 돌려준다
            XSSFSheet sheet=workbook.getSheetAt(0);
            //행의 수
            int rows=sheet.getPhysicalNumberOfRows();
            for(rowindex=1;rowindex<rows;rowindex++){
                //행을읽는다
                XSSFRow row=sheet.getRow(rowindex);
                if(row !=null){
                    //셀의 수
                    int cells=row.getPhysicalNumberOfCells();
                    XSSFCell cell=row.getCell(1);
                    String value="";
                    
                    switch (cell.getCellType()){
                    case XSSFCell.CELL_TYPE_FORMULA:
                        value=cell.getCellFormula();
                        break;
                    case XSSFCell.CELL_TYPE_NUMERIC:
                    	cell.setCellType(XSSFCell.CELL_TYPE_STRING);
                    	value=cell.getStringCellValue()+"";
                        //value=cell.getNumericCellValue()+"";
                        break;
                    case XSSFCell.CELL_TYPE_STRING:
                        value=cell.getStringCellValue()+"";
                        break;
                    case XSSFCell.CELL_TYPE_BLANK:
                        value=cell.getBooleanCellValue()+"";
                        break;
                    case XSSFCell.CELL_TYPE_ERROR:
                        value=cell.getErrorCellValue()+"";
                        break;
                    }
                    
                    value = value.replaceAll("-", "").replaceAll(" ", "");
                    if(value.substring(0, 2).equals("10")) { value = "0" + value; }
                    values += value + ",";
                    
                    //System.out.println(value);
                }
            }
			
		}catch(IOException err) {
			utility.func.Logging(this.getClass().getName(), err);
		}
		
		
		if(values.length() > 0 ) {
			if(values.substring(values.length()-1,values.length()).equals(",")) {
				values = values.substring(0, values.length()-1);
			}
		}
		
		model.addAttribute("numbers", values);
		return "jsonView";
	}
	
	@RequestMapping(value = "/noticeList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String noticeList(NoticeVO vo, HttpServletRequest request, ModelMap model){	
		
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd", mnuCd);
		
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(vo.getCurrentPageNo()); // 현재 페이지 번호
		paginationInfo.setRecordCountPerPage(10); // 한 페이지에 게시되는 게시물 건수
		paginationInfo.setPageSize(10); // 페이징 리스트의 사이즈

		vo.setFirstIndex((vo.getCurrentPageNo() - 1) * 10);
		vo.setLastIndex((vo.getCurrentPageNo()) * 10);
		
		List<EgovMap> noticeList = supportService.getNoticeList(vo);
		model.addAttribute("noticeList", noticeList);
		int totalPageCnt = supportService.getNoticeListTotCnt(vo);
		model.addAttribute("totalPageCnt", totalPageCnt);
		paginationInfo.setTotalRecordCount(totalPageCnt); // 전체 게시물 건 수
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("vo", vo);
		
		return "support/notice_list.main";
	}
	
	@RequestMapping(value = "/noticeDtl.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String noticeDtl(NoticeVO vo, HttpServletRequest request, ModelMap model){
		
		EgovMap loginVO = (EgovMap)request.getSession().getAttribute("LoginVO");
		
		// 권한 관리 시작
		int userAuth;
		try {
			userAuth = Integer.parseInt(loginVO.get("authCd").toString());
			if (userAuth == 0)
				userAuth = 10;
		} catch (NumberFormatException err) {
			userAuth = 10;
		} catch (NullPointerException err) {
			userAuth = 10;
		}
	
		/*if (userAuth > 1) { // 센터 검색 권한이 없으면
			vo.setSchCenterGb(Integer.toString(userCenterGb));
		}*/
		
		switch (userAuth) {
			case 1: vo.setAuthCd(1); break; 
			case 2: vo.setAuthCd(2); break; 
			case 3: vo.setAuthCd(3); break; 
				default: vo.setAuthCd(4); break; 
		}
		// 권한 관리 끝
		
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		String num = request.getParameter("num") == null ? "" : request.getParameter("num");
		model.addAttribute("mnuCd", mnuCd);
		
		EgovMap noticeDtl = null;
		if(num !=""){
			int intNum = Integer.parseInt(num);
			noticeDtl = supportService.getNoticeDtl(intNum);
		}
		
		model.addAttribute("currentPageNo", vo.getCurrentPageNo());
		model.addAttribute("detail", noticeDtl);
		model.addAttribute("vo", vo);
		model.addAttribute("userId", loginVO.get("userId").toString());
		
		return "support/notice_dtl.main";
	}
	
	@RequestMapping(value = "/noticeReg.do", method = RequestMethod.POST)
	public String noticeReg(HttpServletRequest request, ModelMap model, NoticeVO vo){
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		String save = request.getParameter("save") == null ? "" : request.getParameter("save");
		
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		String regId = (String)map.get("userId");
		String writer = (String)map.get("userNm");
		vo.setWriter(writer);
		vo.setRegId(regId);
		
		if(save.equals("S")) {
			supportService.insertNotice(vo);	
		} else if(save.equals("U")) {
			supportService.updateNotice(vo);
		}
		
		return "redirect:/gnoincoundb/noticeList.do?mnuCd=" + mnuCd;
	}
	
	@RequestMapping(value = "/faqList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String faqList(FaqVO vo, HttpServletRequest request, ModelMap model){	

		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd", mnuCd);
		
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(vo.getCurrentPageNo()); // 현재 페이지 번호
		paginationInfo.setRecordCountPerPage(10); // 한 페이지에 게시되는 게시물 건수
		paginationInfo.setPageSize(10); // 페이징 리스트의 사이즈

		vo.setFirstIndex((vo.getCurrentPageNo() - 1) * 10);
		vo.setLastIndex((vo.getCurrentPageNo()) * 10);
		
		List<EgovMap> faqList = supportService.getFaqList(vo);
		model.addAttribute("faqList", faqList);
		int totalPageCnt = supportService.getFaqListTotCnt(vo);
		model.addAttribute("totalPageCnt", totalPageCnt);
		paginationInfo.setTotalRecordCount(totalPageCnt); // 전체 게시물 건 수
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("vo", vo);
		
		return "support/faq_list.main";
	}
	
	@RequestMapping(value = "/faqDtl.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String faqDtl(FaqVO vo, HttpServletRequest request, ModelMap model){	
		
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd", mnuCd);
		String num = request.getParameter("num") == null ? "" : request.getParameter("num");
		model.addAttribute("num", num);
		
		// faq 상세보기
		EgovMap faqDtl = null;
		
		int intNum = Integer.parseInt(num);
		faqDtl = supportService.getFaqDetail(intNum);
		
		if(faqDtl == null){
			faqDtl = new EgovMap();
			faqDtl.put("num", intNum);
		}
		
		model.addAttribute("detail", faqDtl);
		model.addAttribute("page", request.getParameter("page"));
		
		return "support/faq_dtl.main";
	}
	
	@RequestMapping(value = "/faqReg.do", method = RequestMethod.POST)
	public String faqReg(HttpServletRequest request, ModelMap model, FaqVO vo){
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		String num = request.getParameter("num") == null ? "" : request.getParameter("num");
		
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		String regId = (String)map.get("userId");
		String writer = (String)map.get("userNm");
		vo.setWriter(writer);
		vo.setRegId(regId);
		
		int intNum = Integer.parseInt(num);
		if(intNum > 0) {
			supportService.updateFaq(vo);
		} else {
			supportService.insertFaq(vo);			
		}
		return "redirect:/gnoincoundb/faqList.do?mnuCd=" + mnuCd;
	}
	
	@RequestMapping(value = "/rescRoomList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String rescRoomList(RescRoomVO vo, HttpServletRequest request, ModelMap model){	

		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd", mnuCd);

		vo.setSchStartDate(request.getParameter("schStartDate"));
		vo.setSchEndDate(request.getParameter("schEndDate"));
		vo.setSchText(request.getParameter("schText"));
		
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(vo.getCurrentPageNo()); // 현재 페이지 번호
		paginationInfo.setRecordCountPerPage(10); // 한 페이지에 게시되는 게시물 건수
		paginationInfo.setPageSize(10); // 페이징 리스트의 사이즈

		vo.setFirstIndex((vo.getCurrentPageNo() - 1) * 10);
		vo.setLastIndex((vo.getCurrentPageNo()) * 10);
		
		List<EgovMap> rescList = supportService.getRescRoomList(vo);
		model.addAttribute("rescList", rescList);
		int totalPageCnt = supportService.getRescRoomListTotCnt(vo);
		model.addAttribute("totalPageCnt", totalPageCnt);
		paginationInfo.setTotalRecordCount(totalPageCnt); // 전체 게시물 건 수
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("vo", vo);
		
		return "support/rescRoom_list.main";
	}
	
	@RequestMapping(value = "/rescRoomDtl.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String rescRoomDtl(RescRoomVO vo, HttpServletRequest request, ModelMap model){	

		EgovMap loginVO = (EgovMap)request.getSession().getAttribute("LoginVO");
		
		// 권한 관리 시작
		int userAuth;
		try {
			userAuth = Integer.parseInt(loginVO.get("authCd").toString());
			if (userAuth == 0)
				userAuth = 10;
		} catch (NumberFormatException err) {
			userAuth = 10;
		} catch (NullPointerException err) {
			userAuth = 10;
		}
	
		/*if (userAuth > 1) { // 센터 검색 권한이 없으면
			vo.setSchCenterGb(Integer.toString(userCenterGb));
		}*/
		
		switch (userAuth) {
			case 1: vo.setAuthCd(1); break; 
			case 2: vo.setAuthCd(2); break; 
			case 3: vo.setAuthCd(3); break; 
				default: vo.setAuthCd(4); break; 
		}
		// 권한 관리 끝
		
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		String num = request.getParameter("num") == null ? "" : request.getParameter("num");
		model.addAttribute("mnuCd", mnuCd);
		
		EgovMap rescDtl = null;
		if(num !=""){
			int intNum = Integer.parseInt(num);
			rescDtl = supportService.getRescRoomDetail(intNum);
		}
		
		model.addAttribute("detail", rescDtl);
		model.addAttribute("vo", vo);
		model.addAttribute("userId", loginVO.get("userId").toString());
		
		return "support/rescRoom_dtl.main";
	}
	
	@RequestMapping(value = "/rescRoomReg.do", method = RequestMethod.POST)
	public String rescRoomReg(HttpServletRequest request, ModelMap model, RescRoomVO vo){
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		String save = request.getParameter("save") == null ? "" : request.getParameter("save");
		
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		String regId = (String)map.get("userId");
		String writer = (String)map.get("userNm");
		vo.setWriter(writer);
		vo.setRegId(regId);
		
		if(save.equals("S")) {
			supportService.insertRescRoom(vo);		
		} else if(save.equals("U")) {
			supportService.updateRescRoom(vo);
		}
		return "redirect:/gnoincoundb/rescRoomList.do?mnuCd=" + mnuCd;
	}
	
	@RequestMapping(value = "/userManualList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String userManualList(UserManualVO vo, HttpServletRequest request, ModelMap model){	

		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd", mnuCd);
		
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(vo.getCurrentPageNo()); // 현재 페이지 번호
		paginationInfo.setRecordCountPerPage(10); // 한 페이지에 게시되는 게시물 건수
		paginationInfo.setPageSize(10); // 페이징 리스트의 사이즈

		vo.setFirstIndex((vo.getCurrentPageNo() - 1) * 10);
		vo.setLastIndex((vo.getCurrentPageNo()) * 10);
		
		List<EgovMap> usermList = supportService.getUserManualList(vo);
		model.addAttribute("usermList", usermList);
		int totalPageCnt = supportService.getUserManualListTotCnt(vo);
		model.addAttribute("totalPageCnt", totalPageCnt);
		paginationInfo.setTotalRecordCount(totalPageCnt); // 전체 게시물 건 수
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("vo", vo);
		
		return "support/userManual_list.main";
	}
	
	@RequestMapping(value = "/userManualDtl.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String userManualDtl(UserManualVO vo, HttpServletRequest request, ModelMap model){	
		
		EgovMap loginVO = (EgovMap)request.getSession().getAttribute("LoginVO");
		
		// 권한 관리 시작
		int userAuth;
		try {
			userAuth = Integer.parseInt(loginVO.get("authCd").toString());
			if (userAuth == 0)
				userAuth = 10;
		} catch (NumberFormatException err) {
			userAuth = 10;
		} catch (NullPointerException err) {
			userAuth = 10;
		}
	
		/*if (userAuth > 1) { // 센터 검색 권한이 없으면
			vo.setSchCenterGb(Integer.toString(userCenterGb));
		}*/
		
		switch (userAuth) {
			case 1: vo.setAuthCd(1); break; 
			case 2: vo.setAuthCd(2); break; 
			case 3: vo.setAuthCd(3); break; 
				default: vo.setAuthCd(4); break; 
		}
		// 권한 관리 끝
		
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		String num = request.getParameter("num") == null ? "" : request.getParameter("num");
		model.addAttribute("mnuCd", mnuCd);
		
		EgovMap usermDtl = null;
		if(num !=""){
			int intNum = Integer.parseInt(num);
			usermDtl = supportService.getUserManualDetail(intNum);
		}
		
		model.addAttribute("detail", usermDtl);
		model.addAttribute("vo", vo);
		model.addAttribute("userId", loginVO.get("userId").toString());
		
		return "support/userManual_dtl.main";
	}
	
	@RequestMapping(value = "/userManualReg.do", method = RequestMethod.POST)
	public String userManualReg(HttpServletRequest request, ModelMap model, UserManualVO vo){
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		String save = request.getParameter("save") == null ? "" : request.getParameter("save");
		
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		String regId = (String)map.get("userId");
		String writer = (String)map.get("userNm");
		vo.setWriter(writer);
		vo.setRegId(regId);
		
		if(save.equals("S")) {
			supportService.insertUserManual(vo);		
		} else if(save.equals("U")) {
			supportService.updateUserManual(vo);
		}
		return "redirect:/gnoincoundb/userManualList.do?mnuCd=" + mnuCd;
	}
	
	@RequestMapping(value = "/surveyMngList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String surveyMngList(SurveyMngVO vo, HttpServletRequest request, ModelMap model){	

		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd", mnuCd);
		
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(vo.getCurrentPageNo()); // 현재 페이지 번호
		paginationInfo.setRecordCountPerPage(10); // 한 페이지에 게시되는 게시물 건수
		paginationInfo.setPageSize(10); // 페이징 리스트의 사이즈

		vo.setFirstIndex((vo.getCurrentPageNo() - 1) * 10);
		vo.setLastIndex((vo.getCurrentPageNo()) * 10);
	
		List<EgovMap> survList = supportService.getSurveyMngList(vo);
		model.addAttribute("survList", survList);
		int totalPageCnt = supportService.getSurveyMngListTotCnt(vo);
		model.addAttribute("totalPageCnt", totalPageCnt);
		paginationInfo.setTotalRecordCount(totalPageCnt); // 전체 게시물 건 수
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("vo", vo);
		
		return "support/survey_mng_list.main";
	}
	
	@RequestMapping(value = "/surveyMngDtl.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String surveyMngDtl(SurveyMngVO vo, HttpServletRequest request, ModelMap model){	

		EgovMap loginVO = (EgovMap)request.getSession().getAttribute("LoginVO");
		
		// 권한 관리 시작
		int userAuth;
		try {
			userAuth = Integer.parseInt(loginVO.get("authCd").toString());
			if (userAuth == 0)
				userAuth = 10;
		} catch (NumberFormatException err) {
			userAuth = 10;
		} catch (NullPointerException err) {
			userAuth = 10;
		}
	
		/*if (userAuth > 1) { // 센터 검색 권한이 없으면
			vo.setSchCenterGb(Integer.toString(userCenterGb));
		}*/
		
		switch (userAuth) {
			case 1: vo.setAuthCd(1); break; 
			case 2: vo.setAuthCd(2); break; 
			case 3: vo.setAuthCd(3); break; 
				default: vo.setAuthCd(4); break; 
		}
		// 권한 관리 끝
		
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		String num = request.getParameter("num") == null ? "" : request.getParameter("num");
		model.addAttribute("mnuCd", mnuCd);
		
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		String writer = (String)map.get("userNm");
		
		model.addAttribute("writer", writer);
		
		EgovMap survDtl = null;
		if(num !=""){
			int intNum = Integer.parseInt(num);
			survDtl = supportService.getSurveyMngDetail(intNum);
		}
		
		model.addAttribute("detail", survDtl);
		model.addAttribute("vo", vo);
		model.addAttribute("userId", loginVO.get("userId").toString());
		
		return "support/survey_mng_dtl.main";
	}
	
	@RequestMapping(value = "/surveyMngReg.do", method = RequestMethod.POST)
	public String surveyMngReg(HttpServletRequest request, ModelMap model, SurveyMngVO vo){
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		String save = request.getParameter("save") == null ? "" : request.getParameter("save");
		
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		String regId = (String)map.get("userId");
		String writer = (String)map.get("userNm");
		vo.setWriter(writer);
		vo.setRegId(regId);
		
		if(save.equals("S")) {
			supportService.insertSurveyMng(vo);		
		} else if(save.equals("U")) {
			supportService.updateSurveyMng(vo);
		}
		return "redirect:/gnoincoundb/surveyMngList.do?mnuCd=" + mnuCd;
	}
	
	@RequestMapping(value = "/signList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String signList(SignVO vo, HttpServletRequest request, ModelMap model){	

		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd", mnuCd);
		
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(vo.getCurrentPageNo()); // 현재 페이지 번호
		paginationInfo.setRecordCountPerPage(10); // 한 페이지에 게시되는 게시물 건수
		paginationInfo.setPageSize(10); // 페이징 리스트의 사이즈

		vo.setFirstIndex((vo.getCurrentPageNo() - 1) * 10);
		vo.setLastIndex((vo.getCurrentPageNo()) * 10);
		
		List<EgovMap> signList = supportService.getSignList(vo);
		model.addAttribute("signList", signList);
		int totalPageCnt = supportService.getSignListTotCnt(vo);
		model.addAttribute("totalPageCnt", totalPageCnt);
		paginationInfo.setTotalRecordCount(totalPageCnt); // 전체 게시물 건 수
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("vo", vo);
		
		return "support/sign_list.main";
	}
	
	@RequestMapping(value = "/signDtl.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String signDtl(SignVO vo, HttpServletRequest request, ModelMap model){	
		
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		model.addAttribute("loginVo", map);
		
		// 권한 관리 시작
		int userAuth;
		try {
			userAuth = Integer.parseInt(map.get("authCd").toString());
			if (userAuth == 0)
				userAuth = 10;
		} catch (NumberFormatException err) {
			userAuth = 10;
		} catch (NullPointerException err) {
			userAuth = 10;
		}
	
		/*if (userAuth > 1) { // 센터 검색 권한이 없으면
			vo.setSchCenterGb(Integer.toString(userCenterGb));
		}*/
		
		switch (userAuth) {
			case 1: vo.setAuthCd(1); break; 
			case 2: vo.setAuthCd(2); break; 
			case 3: vo.setAuthCd(3); break; 
				default: vo.setAuthCd(4); break; 
		}
		// 권한 관리 끝
		
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		String num = request.getParameter("num") == null ? "" : request.getParameter("num");
		model.addAttribute("mnuCd", mnuCd);
		
		EgovMap signDtl = null;
		
		vo.setNum(Integer.parseInt(num));
		vo.setUserId( (String)map.get("userId"));
		int intNum = Integer.parseInt(num);
		if(intNum != 0) {
			signDtl = supportService.getSignDetail(vo);
		}
		
		
		model.addAttribute("detail", signDtl);
		model.addAttribute("vo", vo);
		model.addAttribute("userId", map.get("userId").toString());
		
		return "support/sign_dtl.main";
	}
	
	@RequestMapping(value = "/signReg.do", method = RequestMethod.POST)
	public String signReg(HttpServletRequest request, ModelMap model, SignVO vo){
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		String save = request.getParameter("save") == null ? "" : request.getParameter("save");
		
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		String regId = (String)map.get("userId");
		
		vo.setRegId(regId);
		vo.setUserId(regId);
		vo.setCnsGb((String)map.get("cnsGb"));
		vo.setZoneGb((String)map.get("zoneGb"));
		vo.setLocalGb((String)map.get("localGb"));
		vo.setCenterGb((String)map.get("centerGb"));
		
		if(save.equals("S")) {
			supportService.insertSign(vo);		
		} else if(save.equals("U")) {
			supportService.updateSign(vo);
		}
		return "redirect:/gnoincoundb/signList.do?mnuCd=" + mnuCd;
	}
	
	@RequestMapping(value = "/mailList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String mailList(MailVO vo, HttpServletRequest request, ModelMap model){	

		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd", mnuCd);
		
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(vo.getCurrentPageNo()); // 현재 페이지 번호
		paginationInfo.setRecordCountPerPage(10); // 한 페이지에 게시되는 게시물 건수
		paginationInfo.setPageSize(10); // 페이징 리스트의 사이즈

		vo.setFirstIndex((vo.getCurrentPageNo() - 1) * 10);
		vo.setLastIndex((vo.getCurrentPageNo()) * 10);

		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("vo", vo);
		
		return "support/mail_list.main";
	}
	
	@RequestMapping(value = "/mailDtl.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String mailDtl(MailVO vo, HttpServletRequest request, ModelMap model){	

		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		String num = request.getParameter("num") == null ? "" : request.getParameter("num");
		model.addAttribute("mnuCd", mnuCd);
		
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		model.addAttribute("loginVo", map);
		
		String curDate = new SimpleDateFormat( "yyyy-MM-dd").format(System.currentTimeMillis());
		model.addAttribute("curDate", curDate);
		
		EgovMap mailDtl = null;
		if(num !=""){
			int intNum = Integer.parseInt(num);
//			mailDtl = supportService.getMailDetail(intNum);
		}
		
		model.addAttribute("detail", mailDtl);
		
		return "support/mail_dtl.main";
	}
	
	@RequestMapping(value = "/mailReg.do", method = RequestMethod.POST)
	public String mailReg(HttpServletRequest request, ModelMap model, MailVO vo){
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		String save = request.getParameter("save") == null ? "" : request.getParameter("save");
		
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		String regId = (String)map.get("userId");
		vo.setRegId(regId);
		
		supportService.insertMail(vo);		

		return "redirect:/gnoincoundb/mailList.do?mnuCd=" + mnuCd;
	}
	
	@RequestMapping(value = "/chtrList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String chtrList(mmsVO vo, HttpServletRequest request, ModelMap model){	

		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd", mnuCd);
		
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(vo.getCurrentPageNo()); // 현재 페이지 번호
		paginationInfo.setRecordCountPerPage(10); // 한 페이지에 게시되는 게시물 건수
		paginationInfo.setPageSize(10); // 페이징 리스트의 사이즈

		vo.setFirstIndex((vo.getCurrentPageNo() - 1) * 10);
		vo.setLastIndex((vo.getCurrentPageNo()) * 10);
		
		List<EgovMap> mmsList = supportService.listMms(vo);
		model.addAttribute("mmsList", mmsList);
		
		int totalPageCnt = supportService.countMms(vo);
		model.addAttribute("totalPageCnt", totalPageCnt);
		paginationInfo.setTotalRecordCount(totalPageCnt); // 전체 게시물 건 수
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("vo", vo);
		
		return "support/chtr_list.main";
	}
	
	@RequestMapping(value = "/chtrDtl.do", method = RequestMethod.GET )
	public String chtrDtl(mmsVO vo, HttpServletRequest request, ModelMap model){	
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd", mnuCd);
		
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		model.addAttribute("loginVo", map);
		
		if(vo.getNum() == 0) {			
			// 발신번호 코드
			GroupVO param = new GroupVO();
			param.setHclassCd("G83");
			List<EgovMap> senderList = adminManageService.getGroupMngDtlMList(param);
			model.addAttribute("senderList", senderList);
		}else {
			EgovMap chtrDtl  = supportService.selectMms(vo);
			model.addAttribute("detail", chtrDtl);	
		}

		return "support/chtr_dtl.main";
	}
	
	@RequestMapping(value = "/chtrReg.do", method = RequestMethod.POST)
	public String chtrReg(HttpServletRequest request, ModelMap model, mmsVO vo){
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		String regId = (String)map.get("userId");
		String regNm = (String)map.get("userNm");
		
		SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		try {
			Date d1 = f.parse(vo.getAppdate());
			Date d2 = f.parse(f.format(new Date()));
			
			long diff = d1.getTime() - d2.getTime();
			long min = diff / 1000 / 60;
			
			if(min < 10) {
				vo.setAppdate("");
			}
			
		} catch (ParseException e) {
			utility.func.Logging(this.getClass().getName(), "DATE PARSE ERROR - D1");
		}
		
		boolean result;
		
		try {
			System.out.println("SEND SMS");
			System.out.println("SENDER ID : " + vo.getUserid());
			
			SendMmsMessage mms = new SendMmsMessage();
			vo.setCallback(vo.getCallback().replaceAll("-", ""));
			vo.setPhone(vo.getPhone().replaceAll(",", "|"));
			if(vo.getAppdate().length() > 0) {
				vo.setAppdate(vo.getAppdate().replaceAll("[^0-9]","") + "00");
			}
			
			
			String tmp = mms.send(vo.getUserid(), vo.getCallback(), vo.getPhone(), vo.getMsg(), "", vo.getAppdate(), vo.getSubject(), null);

			
			System.out.println("SENDER RESPONSE : " + tmp);
			String tmp2 = tmp;
			tmp = tmp.split(":")[1].replaceAll("[^\uAC00-\uD7A3xfe0-9a-zA-Z-_|\\s]", "");
			System.out.println("SENDER RESPONSE : " + tmp);
				
			if(tmp.equals("invalid_member")) {
				result = false;
				model.addAttribute("resultMessage" , "오류 : 연동서비스 신청이 안 됐거나 없는 아이디");
			}else if(tmp.equals("under_maintenance")) {
				result = false;
				model.addAttribute("resultMessage" , "오류 : 뿌리오 문자 서비스 서버 점검");
			}else if(tmp.equals("allow_https_only")) {
				result = false;
				model.addAttribute("resultMessage" , "오류 : HTTP 요청");
			}else if(tmp.equals("invalid_msg")) {
				result = false;
				model.addAttribute("resultMessage" , "오류 : 문자 내용");
			}else if(tmp.equals("invalid_names")) {
				result = false;
				model.addAttribute("resultMessage" , "오류 : 이름");
			}else if(tmp.equals("invalid_subject")) {
				result = false;
				model.addAttribute("resultMessage" , "오류 : 제목");
			}else if(tmp.equals("invalid_sendtime")) {
				result = false;
				model.addAttribute("resultMessage" , "오류 : 예약발송 시간에 오류가 있는 경우 (10분이후부터 다음해말까지 가능)");
			}else if(tmp.equals("invalid_sendtime_maintenance")) {
				result = false;
				model.addAttribute("resultMessage" , "오류 : 예약발송 시간에 서버점검 예정인 경우");
			}else if(tmp.equals("invalid_phone")) {
				result = false;
				model.addAttribute("resultMessage" , "오류 : 수신번호에 오류가 있는 경우");
			}else if(tmp.equals("invalid_msg_over_max")) {
				result = false;
				model.addAttribute("resultMessage" , "오류 : 문자내용이 너무 긴 경우");
			}else if(tmp.equals("invalid_callback")) {
				result = false;
				model.addAttribute("resultMessage" , "오류 : 발신번호에 오류가 있는 경우");
			}else if(tmp.equals("once_limit_over")) {
				result = false;
				model.addAttribute("resultMessage" , "오류 : 1회 최대 발송건수 초과한 경우");
			}else if(tmp.equals("not_enough_point")) {
				result = false;
				model.addAttribute("resultMessage" , "오류 : 잔액이 부족한 경우");
			}else if(tmp.equals("over_use_limit")) {
				result = false;
				model.addAttribute("resultMessage" , "오류 : 한달 사용금액을 초과한 경우");
			}else if(tmp.equals("server_error")) {
				result = false;
				model.addAttribute("resultMessage" , "오류 : 기타 서버 오류");
			}else {
				result = true;
				String[] tmp3 = tmp2.split("\\,");
				vo.setMessageType(tmp3[1].split("\\:")[1].replaceAll("\"", ""));
				vo.setMsgId(tmp3[2].split("\\:")[1].replaceAll("\"", ""));
				tmp = tmp2;
			}
			
			model.addAttribute("result",result);
			
			vo.setAdminID(regId);
			vo.setAdminName(regNm);
			vo.setResult(Boolean.toString(result));
			vo.setResultMessage(tmp);
			
			supportService.insertMms(vo);
			System.out.println("SEND COMPLETE");
		}catch(IOException err) {
			System.out.println("SEND ERROR");
			utility.func.Logging(this.getClass().getName(), err);
		}
		
		return "jsonView";
	}
	
	@RequestMapping(value = "/galleryList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String galleryList(NoticeVO vo, HttpServletRequest request, ModelMap model){	
				
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd", mnuCd);
		
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(vo.getCurrentPageNo()); // 현재 페이지 번호
		paginationInfo.setRecordCountPerPage(10); // 한 페이지에 게시되는 게시물 건수
		paginationInfo.setPageSize(10); // 페이징 리스트의 사이즈

		vo.setFirstIndex((vo.getCurrentPageNo() - 1) * 10);
		vo.setLastIndex((vo.getCurrentPageNo()) * 10);
		
		List<EgovMap> noticeList = supportService.getNoticeList(vo);
		model.addAttribute("noticeList", noticeList);
		int totalPageCnt = supportService.getNoticeListTotCnt(vo);
		model.addAttribute("totalPageCnt", totalPageCnt);
		paginationInfo.setTotalRecordCount(totalPageCnt); // 전체 게시물 건 수
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("vo", vo);
		
		return "support/gallery_list.main";
	}
	
	@RequestMapping(value = "/galleryDtl.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String galleryDtl(NoticeVO vo, HttpServletRequest request, ModelMap model){

		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		String num = request.getParameter("num") == null ? "" : request.getParameter("num");
		model.addAttribute("mnuCd", mnuCd);
		
		EgovMap noticeDtl = null;
		if(num !=""){
			int intNum = Integer.parseInt(num);
			noticeDtl = supportService.getNoticeDtl(intNum);
		}
		
		model.addAttribute("currentPageNo", vo.getCurrentPageNo());
		model.addAttribute("detail", noticeDtl);
		
		return "support/gallery_dtl.main";
	}
	
	@RequestMapping(value = "/galleryReg.do", method = RequestMethod.POST)
	public String galleryReg(HttpServletRequest request, ModelMap model, NoticeVO vo){
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		String save = request.getParameter("save") == null ? "" : request.getParameter("save");
		
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		String regId = (String)map.get("userId");
		String writer = (String)map.get("userNm");
		vo.setWriter(writer);
		vo.setRegId(regId);
		
		if(save.equals("S")) {
			supportService.insertNotice(vo);	
		} else if(save.equals("U")) {
			supportService.updateNotice(vo);
		}
		
		return "redirect:/gnoincoundb/galleryList.do?mnuCd=" + mnuCd;
	}
	
}
