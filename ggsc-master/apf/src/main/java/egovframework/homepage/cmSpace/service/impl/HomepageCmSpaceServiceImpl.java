package egovframework.homepage.cmSpace.service.impl;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Calendar;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import egovframework.homepage.cmSpace.service.CmSpaceVO;
import egovframework.homepage.cmSpace.service.HomepageCmSpaceService;
import egovframework.homepage.freeBbs.service.BbsVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;


@Service("homepageCmSpaceService")
public class HomepageCmSpaceServiceImpl extends EgovAbstractServiceImpl implements HomepageCmSpaceService {

	private static final Logger LOGGER = LoggerFactory.getLogger(HomepageCmSpaceServiceImpl.class);
	
	/** SampleDAO */
	// TODO ibatis 사용
	@Resource(name = "homepageCmSpaceMapper")
	private HomepageCmSpaceMapper homepageCmSpaceMapper;
	// TODO mybatis 사용
	//  @Resource(name="sampleMapper")
	//	private SampleMapper sampleDAO;
	
	// 공지사항 목록
	public List<EgovMap> getNoticeList(CmSpaceVO vo) {
		return homepageCmSpaceMapper.getNoticeList(vo);
	}
	
	// 공지사항 목록 갯수
	public int getNoticeTotal(CmSpaceVO vo) {
		return homepageCmSpaceMapper.getNoticeTotal(vo);
	}
	
	// 공지사항 등록
	public void insertNoticeReg(CmSpaceVO vo) throws Exception {
		System.out.println("공지사항 파일 등록1");
		homepageCmSpaceMapper.insertNoticeReg(vo);
		MultipartFile file = vo.getFile();
		EgovMap fMap = fileUpload(file, vo);
		if(vo.getFile().getSize() != 0){
			System.out.println("공지사항 파일 등록2");
			// 공지사항 파일업로드
			homepageCmSpaceMapper.insertNoticeFileUpload(vo);
		}
	}
	
	// 공지사항 상세
	public EgovMap getNoticeDtl(CmSpaceVO vo) {
		// 조회수 증가
		homepageCmSpaceMapper.updateNoticeViewCount(vo.getNum());
		return homepageCmSpaceMapper.getNoticeDtl(vo);
	}
	
	// 센터소식 목록
	public List<EgovMap> getCenterNewsList(CmSpaceVO vo) {
		return homepageCmSpaceMapper.getCenterNewsList(vo);
	}
	
	// 메인화면 센터소식(보여질 목록 3개)
	public List<EgovMap> getCenterNewsListM(CmSpaceVO vo) {
		return homepageCmSpaceMapper.getCenterNewsListM(vo);
	}
	
	// 센터목록 갯수
	public int getCenterNewsTotal(CmSpaceVO vo) {
		return homepageCmSpaceMapper.getCenterNewsTotal(vo);
	}
	
	// 센터소식 상세
	public EgovMap getCenterNewsDtl(CmSpaceVO vo) {
		// 조회수 증가
		homepageCmSpaceMapper.updateCenterNewsViewCount(vo.getNum());
		return homepageCmSpaceMapper.getCenterNewsDtl(vo);
	}
	
	// 문서자료실 목록
	public List<EgovMap> getDocLibraryList(CmSpaceVO vo) {
		return homepageCmSpaceMapper.getDocLibraryList(vo);
	}
	
	// 메인화면 문서자료실(보여질 목록 4개)
	public List<EgovMap> getDocLibraryListM(CmSpaceVO vo) {
		return homepageCmSpaceMapper.getDocLibraryListM(vo);
	}
	
	// 문서자료실 목록 갯수
	public int getDocLibraryTotal(CmSpaceVO vo) {
		return homepageCmSpaceMapper.getDocLibraryTotal(vo);
	}
	
	// 문서자료실 상세
	public EgovMap getDocLibraryDtl(CmSpaceVO vo) {
		// 조회수 증가
		homepageCmSpaceMapper.updateDocLibraryViewCount(vo.getNum());
		return homepageCmSpaceMapper.getDocLibraryDtl(vo);
	}
	
	// 자유게시판 목록
	public List<EgovMap> getFreeBoardList(CmSpaceVO vo) {
		return homepageCmSpaceMapper.getFreeBoardList(vo);
	}
	
	// 메인화면 자유게시판(보여질 목록 4개)
	public List<EgovMap> getFreeBoardListM(CmSpaceVO vo) {
		return homepageCmSpaceMapper.getFreeBoardListM(vo);
	}
	
	// 자유게시판 목록 갯수
	public int getFreeBoardTotal(CmSpaceVO vo) {
		return homepageCmSpaceMapper.getFreeBoardTotal(vo);
	}
	
	// 자유게시판 등록
	public void insertFreeBoardReg(CmSpaceVO vo) throws Exception {
		homepageCmSpaceMapper.insertFreeBoardReg(vo);
		if(vo.getFile().getSize() != 0){
			MultipartFile file = vo.getFile();
			EgovMap fMap = fileUpload(file, vo);
			// 자유게시판 파일업로드
			homepageCmSpaceMapper.insertFreeBoardFileUpload(vo);
		}
		
	}
	
	// 자유게시판 상세
	public EgovMap getFreeBoardDtl(CmSpaceVO vo) {
		// 조회수 증가
		homepageCmSpaceMapper.updateFreeBoardViewCount(vo.getNum());
		return homepageCmSpaceMapper.getFreeBoardDtl(vo);
	}
	
	// 온라인상담 목록
	public List<EgovMap> getOnlineCnsList(CmSpaceVO vo) {
		return homepageCmSpaceMapper.getOnlineCnsList(vo);
	}
	
	// 온라인상담 목록 갯수
	public int getOnlineCnsTotal(CmSpaceVO vo) {
		return homepageCmSpaceMapper.getOnlineCnsTotal(vo);
	}
	
	// 온라인상담 등록
	public void insertOnlineCnsReg(CmSpaceVO vo) throws Exception {
		
		homepageCmSpaceMapper.insertOnlineCnsReg(vo);
		MultipartFile file = vo.getFile();
		EgovMap fMap = fileUpload(file, vo);
		if(vo.getFile().getSize() != 0){
			// 온라인상담 파일업로드
			homepageCmSpaceMapper.insertOnlineCnsFileUpload(vo);
		}
	}
	
	// 온라인상담 상세
	public EgovMap getOnlineCnsDtl(CmSpaceVO vo) {
		return homepageCmSpaceMapper.getOnlineCnsDtl(vo);
	}
	
	
	public static EgovMap fileUpload(MultipartFile file,CmSpaceVO  vo) throws IOException {
		EgovMap map = new EgovMap();
		if (file.getSize() > 0) {
			String fileRoot = utility.func.filePath;
			String originalFileName = file.getOriginalFilename(); // 오리지날 파일명
			String extension = originalFileName.substring(originalFileName.lastIndexOf(".")); // 파일 확장자
			// 랜덤 UUID+확장자로 저장될 savedFileName
			String savedFileName = UUID.randomUUID() + extension;
			
		
			map.put("fileNm", originalFileName);
			map.put("fileSize", file.getSize());

			String[] exts = new String[] { "jpg", "jpeg", "bmp", "png", "psd", "doc", "docx", "xls", "xlsx", "ppt",
					"pptx", "zip", "txt" };

			boolean uploadOK = false;
			for (String a : exts) {
				if (a.equals(extension.substring(1, extension.length()).toLowerCase())) {
					uploadOK = true;
					break;
				}
			}

			System.out.println("file extension : " + extension);

			if (!uploadOK) {
				System.out.println("file upload false");
				map.put("fileNm", "");
				map.put("sysFileNm", "");
				map.put("filePath", "");
				map.put("fileSize", 0);
				System.out.println("file upload false return > " + map.toString());
				return map;
			}

			File Folder = new File(fileRoot);
			if (!Folder.exists()) {
				try {
					Folder.mkdir(); // 폴더 생성합니다.
					Folder.setWritable(true); // 쓰기가능설정
					Folder.setReadable(true); // 읽기가능설정
				} catch (NullPointerException e) {
					utility.func.Logging("AMSComm.fileUpload", "Folder Null");
				}
			}

			File targetFile = new File(fileRoot + savedFileName);
			try {				
				byte[] data = file.getBytes();
				FileOutputStream fos = new FileOutputStream(fileRoot + savedFileName);
				fos.write(data);
				fos.close();
				
				// data type long => int 변경
				vo.setFileSize((int) file.getSize());
				vo.setFileNm(originalFileName);
				vo.setSysFileNm(savedFileName);
				vo.setFilePath("");
				
			} catch (IOException e) {
				FileUtils.deleteQuietly(targetFile); // 실패시 저장된 파일 삭제
				utility.func.Logging("AMSComm.fileUpload", "IO");
			}

		} else {
			map.put("fileNm", "");
			map.put("sysFileNm", "");
			map.put("filePath", "");
			map.put("fileSize", 0);
		}
		return map;
	}
	
	
	
	/**
	 * 파일 name 추출
	 * @param extName
	 * @return
	 */
	private static String genSaveFileName(String extName) {
		String fileName = "";
		
		Calendar calendar = Calendar.getInstance();
		fileName += calendar.get(Calendar.YEAR);
		fileName += calendar.get(Calendar.MONTH);
		fileName += calendar.get(Calendar.DATE);
		fileName += calendar.get(Calendar.HOUR);
		fileName += calendar.get(Calendar.MINUTE);
		fileName += calendar.get(Calendar.SECOND);
		fileName += calendar.get(Calendar.MILLISECOND);
		fileName += extName;
		
		return fileName;
	}
	
}