package ams.cmm;

import java.awt.image.BufferedImage;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.bind.DatatypeConverter;

import org.apache.commons.io.FileUtils;
import org.imgscalr.Scalr;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import egovframework.rte.psl.dataaccess.util.EgovMap;



@Controller

public class FileController {
	/*@RequestMapping("/signUpload.do")
	public String signUpload(HttpServletRequest req, HttpSession session, HttpServletResponse res, ModelMap model) throws Exception {
		String realFile = utility.func.imagePath;
		String imageData = req.getParameter("imageData");
		String bFileNm = req.getParameter("bFileNm");
		String savedFileName = UUID.randomUUID() + ".jpg";
		
		byte[] imagedata = DatatypeConverter.parseBase64Binary(imageData.substring(imageData.indexOf(",") + 1));
		BufferedImage bufferedImage = ImageIO.read(new ByteArrayInputStream(imagedata));
		ImageIO.write(bufferedImage, "jpg", new File(realFile + savedFileName));
		
		model.addAttribute("fileNm", savedFileName);
		
		if(bFileNm != null) {
			File bFile = new File(realFile + bFileNm);
			if(bFile.exists()) bFile.delete();
		}
		
		return "jsonView";
	}*/
	
	@RequestMapping("/signUpload.do")
	   public String signUpload(HttpServletRequest req, HttpSession session, HttpServletResponse res, ModelMap model) throws Exception {
	      String realFile = utility.func.imagePath;
	      String imageData = req.getParameter("imageData");
	      String bFileNm = req.getParameter("bFileNm");
	      String savedFileName = UUID.randomUUID() + ".jpg";
	      
	      String imageInfo = imageData.substring(0,imageData.indexOf(","));
	      if(!imageInfo.equals("data:image/jpeg;base64")) { // base64 이미지 검증
	         model.addAttribute("message", "error");
	         return "jsonView";
	      }
	      
	      byte[] imagedata = DatatypeConverter.parseBase64Binary(imageData.substring(imageData.indexOf(",") + 1));
	      BufferedImage bufferedImage = ImageIO.read(new ByteArrayInputStream(imagedata));
	      ImageIO.write(bufferedImage, "jpg", new File(realFile + savedFileName));
	      
	      model.addAttribute("fileNm", savedFileName);
	      
	      if(bFileNm != null && bFileNm.length() > 0) {
	         String extension = bFileNm.substring(bFileNm.lastIndexOf(".")); // 파일 확장자
	         String[] exts = new String[] { "jpg" };
	         boolean uploadOK = false;
	          for(String a : exts) {
	             if(a.equals(extension.substring(1,extension.length()).toLowerCase())) {
	                uploadOK = true;
	                break;
	             }
	          }
	          
	          if(uploadOK) {
	             File bFile = new File(realFile + bFileNm);
	             if(bFile.exists()) bFile.delete();
	          }
	      }
	      
	      return "jsonView";
	   }
	
	
	@RequestMapping("/getImage.do")
	public void getImage(HttpServletRequest req, HttpSession session, HttpServletResponse res) throws Exception {

		String realFile = utility.func.imagePath;
		String fileNm = req.getParameter("fileNm");
		fileNm = fileNm.replaceAll("/images/", "");
		System.out.println("FileName : " + fileNm);
		
		String ext = fileNm.substring(fileNm.lastIndexOf("."));
		
		String[] exts = new String[] { "jpg", "jpeg", "bmp", "png" };
		boolean uploadOK = false;
	    for(String a : exts) {
	    	if(a.equals(ext.substring(1,ext.length()).toLowerCase())) {
	    		uploadOK = true;
	    		break;
	    	}
	    }
		
	    if(!uploadOK) return;
	    
	
		BufferedOutputStream out = null;
		InputStream in = null;
		
		
		try {
			res.setContentType("image/" + ext);
			res.setHeader("Content-Disposition", "inline;filename=" + fileNm);
			File file = new File(realFile + fileNm);
			if(file.exists()){
				in = new FileInputStream(file);
				out = new BufferedOutputStream(res.getOutputStream());
				int len;
				byte[] buf = new byte[1024];
				while ((len = in.read(buf)) > 0) {
					out.write(buf, 0, len);
				}
			}
		} catch (Exception e) {
			utility.func.Logging("getImage.do", e);
		} finally {
			if(out != null){ out.flush(); }
			if(out != null){ out.close(); }
			if(in != null){ in.close(); }
		}
	}
	
	@RequestMapping(value = "/ImageUpload.do")
	public String uploadImgFile(HttpServletRequest request, ModelMap model, @RequestParam("file") MultipartFile file){
		System.out.println("Image Upload Start");
		EgovMap fMap = AMSComm.ImageUpload(file, "images");
		model.addAttribute("url", "/images/" + (String) fMap.get("sysFileNm"));
		model.addAttribute("fileName", (String) fMap.get("fileNm"));
		model.addAttribute("responseCode", (String) fMap.get("responseCode"));
		return "jsonView";
	}
	
	
	

	
	/*
	@RequestMapping(value="/download3.do")
    public void download3(@RequestParam String oriFileNm, @RequestParam String filePath, HttpServletResponse response) throws Exception {
		
		FileInputStream fis = null;
		OutputStream os = null;
        response.setContentType("application/octet-stream");
        response.setHeader("Content-Disposition", "attachment; filename=" + oriFileNm ) ;
       
        try {
	        fis = new FileInputStream( filePath ) ;
        	os = response.getOutputStream();
	        int n = 0;
	        byte[] b = new byte[512];
	        while( ( n = fis.read( b ) ) != -1 ) {
	            os.write( b , 0 , n ) ;
	        }
        }catch (Exception e) {
		}finally {
			fis.close();
	        os.close();
		}      
    }	
    */
	
	
	public static void delFile( List<EgovMap> list1 ){
		Iterator<EgovMap> iter = list1.iterator();
		while( iter.hasNext() ) {
			EgovMap tempMap = iter.next();
			String filePath = (String) tempMap.get( "filePath" );
			if( 0 != filePath.length() ) {
	            FileUtils.deleteQuietly( new File( (String) tempMap.get( "filePath" ) ) );
			}
		}
	}

	
	public static NormalVO insFile( NormalVO vo , MultipartFile mFile ){
		
		String saveFolder = "C:/Users/huensys/Desktop/";
        String oriFileNm = mFile.getOriginalFilename();
        vo.setOriFileNm( oriFileNm ) ;
        
        String ext = oriFileNm.substring( oriFileNm.lastIndexOf(".") );
        
        String savedFileNm = UUID.randomUUID() + ext ;
        
        vo.setFilePath( saveFolder + savedFileNm ) ;
        
        try {
            FileUtils.copyInputStreamToFile( mFile.getInputStream() , new File( saveFolder + savedFileNm ) );	//파일 저장
        } catch (IOException e) {
        	utility.func.Logging("insFile", e);
        }
        
        return vo ;
	}
	
	



//			EgovMap loginVO = null;
//			if (request.getSession().getAttribute("LoginVO") != null) {
//				loginVO = (EgovMap) request.getSession()
//						.getAttribute("LoginVO");
//				model.addAttribute("noticeVO", loginVO);
//			} else {
//				return AMSComm.logoutProcBySvNm(request);
//			}



}
