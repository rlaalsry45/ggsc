package egovframework.cmm.web;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import egovframework.cmm.Globals;
import egovframework.cmm.service.FileService;
import egovframework.cmm.util.DateTimeUtil;
import egovframework.cmm.util.EditorTmpFileVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
public class UploadController {

	@Resource(name = "fileService")
	private FileService fileService;
	/**
	 * 컴페인을 조회한다
	 * @param vo - 로그인후 이동할 URL이 담긴 LoginVO
	 * @return 로그인 페이지
	 * @exception Exception
	 */
    @RequestMapping(value="/cmm/board/upload_file.do")/////
	public String upload_file(MultipartHttpServletRequest request,
			HttpServletResponse response,
			ModelMap model)
			{///////
		try{
			String currentDate = DateTimeUtil.currentDate();
			String rootPath = request.getRealPath("/");
			String filePath = rootPath+Globals.boardFileUrl+currentDate;
			File dir = new File(filePath);
	        if (!dir.isDirectory()) {
	            dir.mkdirs();
	        }
	        List<MultipartFile> mf = request.getFiles("file");
	        List<EgovMap> urlList = new ArrayList<EgovMap>();
	        if(mf!=null){
	        	for(int i=0;i<mf.size();i++){
	    	        String originalfileName = mf.get(i).getOriginalFilename();
	    	    	int pos = originalfileName.lastIndexOf( "." );
	    	    	String fileName = originalfileName.substring(0,pos);
	    	    	String fileExt = originalfileName.substring(pos + 1);
	    	        String saveFileName = fileName+ "_"+DateTimeUtil.currentDateTime() + "." + fileExt;
	    	        // 저장되는 파일 이름

	    	        String savePath = filePath + "/"+saveFileName; // 저장 될 파일 경로

	    	        mf.get(i).transferTo(new File(savePath)); // 파일 저장
	    	        String url = "/"+Globals.boardFileUrl+currentDate+"/"+saveFileName;
	    	        EgovMap map = new EgovMap();
	    	        map.put("url",url);
	    	        urlList.add(map);
	        	}
	        }
	        model.addAttribute("success","true");
	        model.addAttribute("urlList",urlList);
		}catch(Exception err){//////
			utility.func.Logging(this.getClass().getName(), err);

		}
		return "jsonView";
	}

	/**
	 * 컴페인을 조회한다
	 * @param vo - 로그인후 이동할 URL이 담긴 LoginVO
	 * @return 로그인 페이지
	 * @exception Exception
	 */
    @RequestMapping(value="/cmm/board/upload_tmp_file.do")
	public String upload_tmp_file(MultipartHttpServletRequest request,HttpServletResponse response,ModelMap model){
    	
		try{
			String currentDate = DateTimeUtil.currentDate();
			String rootPath = request.getRealPath("/");
			String filePath = rootPath+Globals.boardTmpFileUrl+currentDate;
			
			String reqfileNum = request.getParameter("file_num");
			
			System.out.println("에디터 파일  filePath =============   "+filePath);
			System.out.println("에디터 파일  reqfileNum =============   "+reqfileNum);
			
			
			File dir = new File(filePath);
	        if (!dir.isDirectory()) {
	            dir.mkdirs();
	        }
	        List<MultipartFile> mf = request.getFiles("file");
	        List<EgovMap> urlList = new ArrayList<EgovMap>();
	        if(mf!=null){
	        	
		        // FileDefaultVO vo = new FileDefaultVO();
	        	// EditorTmpFileVO으로 소스 수정
	        	EditorTmpFileVO vo = new EditorTmpFileVO();
		        
		        if(request.getParameter("file_num")!=null && Integer.parseInt(request.getParameter("file_num").toString().trim())>0){
		        	System.out.println("11111111111111111111111111111");
		        	vo.setFile_num(Integer.parseInt(request.getParameter("file_num").toString().trim()));
		        }else{
		        	System.out.println("22222222222222222222222222222");
			        int file_num = fileService.getMaxTmpEditorFile(vo);
			        System.out.println("파일 명  int file_num =============   "+file_num);
			        vo.setFile_num(file_num);
		        }
		        
	        	for(int i=0;i<mf.size();i++){
	    	        String originalfileName = mf.get(i).getOriginalFilename();
	    	    	int pos = originalfileName.lastIndexOf( "." );
	    	    	String fileName = originalfileName.substring(0,pos);
	    	    	String fileExt = originalfileName.substring(pos + 1);
	    	        String saveFileName = fileName+ "_"+DateTimeUtil.currentDateTime() + "." + fileExt;
	    	        // 저장되는 파일 이름
	    	        String savePath = filePath + "/"+saveFileName; // 저장 될 파일 경로
	    	        
	    	        System.out.println("이미지 저장  savePath =============   "+savePath);
	    	        
	    	        mf.get(i).transferTo(new File(savePath)); // 파일 저장

	    	        int maxIdx = fileService.getMaxTmpEditorFileIdx(vo);
	    	        vo.setIdx(maxIdx);
	    	        vo.setReg_dt(currentDate);
	    	        vo.setFile_name(saveFileName);
	    	        vo.setFile_path("/"+Globals.boardTmpFileUrl+currentDate);
	    	        vo.setUp_yn("N");
	    	        fileService.insertTmpEditorFile(vo);
//	    	        String url = URLEncoder.encode("/"+Globals.boardTmpFileUrl+currentDate+"/"+saveFileName , "UTF-8");
	    	        String url ="/"+Globals.boardTmpFileUrl+currentDate+"/"+saveFileName;
	    	        EgovMap map = new EgovMap();
	    	        map.put("url",url);
	    	        urlList.add(map);
	    	        model.addAttribute("file_num",vo.getFile_num());
	    	        System.out.println("###############"+vo.getFile_num()+"########"+url);
	        	}
	        }
	        model.addAttribute("success","true");
	        model.addAttribute("urlList",urlList);
		}catch(Exception e){///////
	        model.addAttribute("success","fail");
		}
		return "jsonView";
	}
}
