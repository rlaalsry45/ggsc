package egovframework.cmm.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.cmm.service.FileVO;
import egovframework.cmm.service.FileService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
public class DownloadController {

	@Resource(name = "fileService")
	private FileService fileService;
	
    @RequestMapping(value="/cmm/file_down.do")
	public void file_down(FileVO vo,HttpServletRequest req,
			HttpServletResponse resp,
			ModelMap model)
			throws Exception {
        OutputStream outputStream = null;
        EgovMap map = fileService.getFileInfo(vo);
 
         try {
            File file = new File(req.getRealPath("/") +map.get("filePath").toString().trim()+"/"+map.get("fileName").toString().trim()); 
            
            if(file == null){
            	throw new Exception("해당 파일이 존재하지 않습니다.");
            }
            String filename = file.getName();
            String filetype = filename.substring(filename.indexOf(".") + 1, filename.length());
    
            if (filetype.trim().equalsIgnoreCase("txt")) {
                resp.setContentType("text/plain");
            } else {
                resp.setContentType("application/octet-stream");
            }
    
            resp.setContentLength((int) file.length());
    
            boolean ie = req.getHeader("User-Agent").indexOf("MSIE") != -1 || req.getHeader("User-Agent").indexOf("Mozilla") != -1;
            if (ie) {
                filename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", " ").replaceAll("\r", "").replaceAll("\n", "");
            } else {
                filename = new String(filename.getBytes("UTF-8"), "8859_1").replaceAll("\r", "").replaceAll("\n", "");
            }
    
            resp.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\"");
    
            outputStream = resp.getOutputStream();
            FileInputStream fis = null;
            
            try {
                fis = new FileInputStream(file);
                FileCopyUtils.copy(fis, outputStream);
            } finally {
                if (fis!= null) {
                    fis.close();
                }
            }
        } catch (IOException e) {
            throw new RuntimeException(e);
        } finally {
            try {
            	if(outputStream == null) throw new Exception("출력할 파일 스트림이 존재하지 않습니다.");
                outputStream.close();
                resp.flushBuffer();
            } catch (IOException e) {
                throw e;
            }
        }
	}

}
