package egovframework.homepage.freeBbs.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.homepage.freeBbs.service.BbsVO;
import egovframework.homepage.freeBbs.service.HomepageFreeBbsService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
public class HomepageFreeBbsController {
	
	/** homepageFreeBbsService */
	@Resource(name = "homepageFreeBbsService")
	private HomepageFreeBbsService homepageFreeBbsService;
	
	@RequestMapping(value = "/freeBbsList.do")
	public String freeBbsList(BbsVO vo, HttpServletRequest request, ModelMap model) {
		
		// 게시판 목록(알려드려요)
		List<EgovMap> freeBbsListA = homepageFreeBbsService.getFreeBbsListA(vo);
		model.addAttribute("freeBbsListA", freeBbsListA);
		// 게시판 목록(자유게시판)
		List<EgovMap> freeBbsListB = homepageFreeBbsService.getFreeBbsListB(vo);
		model.addAttribute("freeBbsListB", freeBbsListB);
		
		return "/bbs/freeBbsList.page";
	}
	
	@RequestMapping(value = "/freeBbsInsert.do")
	public String freeBbsInsert(BbsVO vo, HttpServletRequest request, ModelMap model) {
		String save = request.getParameter("save") == null ? "" : request.getParameter("save");
		model.addAttribute("save", save);
		return "homepage/bbs/freeBbsInsert";
	}
	
	@RequestMapping(value = "freeBbsReg.do")
	public String freeBbsReg(BbsVO vo, HttpServletRequest request, ModelMap model) throws Exception {
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		vo.setRegId((String)map.get("userId"));
		vo.setWriter((String)map.get("userNm"));
		
		String save = request.getParameter("save") == null ? "" : request.getParameter("save");
		if(save.equals("A")) {
			// 게시판 등록(알려드려요)
			homepageFreeBbsService.insertFreeBbsAReg(vo);
		} else if(save.equals("B")) {
			// 게시판 등록(자유게시판)
			homepageFreeBbsService.insertFreeBbsBReg(vo);	
		}
		
		return "redirect:/gnoincoun/freeBbsList.do";
	}
	
	@RequestMapping(value = "/freeBbsView.do")
	public String freeBbsView(HttpServletRequest request, ModelMap model) {
		
		String num = request.getParameter("num") == null ? "" : request.getParameter("num");
		String save = request.getParameter("save") == null ? "" : request.getParameter("save");
		
		// 게시판 상세보기(알려드려요)
		EgovMap BbsADtl = null;
		// 게시판 상세보기(자유게시판)
		EgovMap BbsBDtl = null;
		if(save.equals("A")) {
			if(num !=""){
				int intNum = Integer.parseInt(num);
				// 게시판 상세보기(알려드려요)
				BbsADtl = homepageFreeBbsService.getFreeBbsADtl(intNum);
				model.addAttribute("detail", BbsADtl);
				
				/*String answerYn = (String)noticeA.get("answerYn");
				if(answerYn.equals("Y")) {
					replyDtl = homepageFreeBbsService.getSuperVisionReplyDtl(intNum);
				}*/
			}
		} else if(save.equals("B")) {
			if(num !=""){
				int intNum = Integer.parseInt(num);
				// 게시판 상세보기(자유게시판)
				BbsBDtl = homepageFreeBbsService.getFreeBbsBDtl(intNum);
				model.addAttribute("detail", BbsBDtl);
				
				/*String answerYn = (String)noticeA.get("answerYn");
				if(answerYn.equals("Y")) {
					replyDtl = homepageFreeBbsService.getSuperVisionReplyDtl(intNum);
				}*/
			}
		}
		
		return "homepage/bbs/freeBbsView";
	}
	
	/*@RequestMapping(value="fileDown.do")
    public void fileDown(BbsVO vo, HttpServletRequest request, HttpServletResponse response) throws Exception {
        
		FileInputStream fis = null;
		OutputStream os = null;

        // MIME Type 을 application/octet-stream 타입으로 변경

        // 무조건 팝업(다운로드창)이 뜨게 된다.

        response.setContentType("application/octet-stream");

       

        // 브라우저는 ISO-8859-1을 인식하기 때문에

        // UTF-8 -> ISO-8859-1로 디코딩, 인코딩 한다.

        //orgname = new String(orgname.getBytes("UTF-8"), "iso-8859-1");

       

        // 파일명 지정
        String header = request.getHeader("User-Agent");
        String fileNm = "";
        if (header.contains("MSIE") || header.contains("Trident")) {
            fileNm = URLEncoder.encode(vo.getFileNm(),"UTF-8").replaceAll("\\+", "%20");
            response.setHeader("Content-Disposition", "attachment;filename=" + fileNm+ ";");
        } else {
            fileNm = new String(vo.getFileNm().getBytes("UTF-8"), "ISO-8859-1");
           response.setHeader("Content-Disposition", "attachment; filename=\"" + fileNm + "\"");
        }
//        response.setHeader("Content-Disposition", "attachment; filename=" + vo.getFileNm());
       
        try{
	        os = response.getOutputStream();
	
	        // String path = servletContext.getRealPath("/resources");
	
	        // d:/upload 폴더를 생성한다.
	
	        // server에 clean을 하면 resources 경로의 것이 다 지워지기 때문에
	
	        // 다른 경로로 잡는다(실제 서버에서는 위의 방식으로)
	
	        //FileInputStream fis = new FileInputStream(path + File.separator + newname);
	        fis = new FileInputStream(vo.getFilePath() + "/" + vo.getSysFileNm());
	        int n = 0;
	
	        byte[] b = new byte[512];
	
	        while((n = fis.read(b)) != -1 ) {
	            os.write(b, 0, n);
	        }
        }catch (Exception e) {
			// TODO: handle exception
		}finally {
			fis.close();
	        os.close();
		}      
    }*/
	
}