package egovframework.cmm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.cmm.util.EditorTmpFileVO;
import egovframework.cmm.service.FileDefaultVO;
import egovframework.cmm.service.FileVO;
import egovframework.cmm.service.FileService;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.psl.dataaccess.util.EgovMap;


	
@Service("fileService")
public class FileServiceImpl extends EgovAbstractServiceImpl implements FileService {

	private static final Logger LOGGER = LoggerFactory.getLogger(FileServiceImpl.class);	

	
	@Resource(name = "fileMapper")
	private FileMapper fileMapper;
	
	/** ID Generation */
	@Resource(name = "egovIdGnrService")
	private EgovIdGnrService egovIdGnrService;
	
	
    
	@Override
	public EgovMap getFileInfo(FileVO vo) throws Exception {
		return fileMapper.getFileInfo(vo);
	}

	@Override/////////
	public int getMaxTmpEditorFile(EditorTmpFileVO vo){
		int ret = 0;
		try{
			ret = fileMapper.getMaxTmpEditorFile(vo);
		}catch(Exception err){
			utility.func.Logging(this.getClass().getName(), err);

		}
		return ret;
	}

	@Override/////////
	public void insertTmpEditorFile(EditorTmpFileVO vo){
		try {
			fileMapper.insertTmpEditorFile(vo);
		} catch (Exception err) {
			// TODO Auto-generated catch block
			utility.func.Logging(this.getClass().getName(), err);

		}
	}

	@Override
	public List<EditorTmpFileVO> selectTmpEditorFileList(EditorTmpFileVO vo) throws Exception {
		return fileMapper.selectTmpEditorFileList(vo);
	}

	@Override////////
	public int getMaxTmpEditorFileIdx(EditorTmpFileVO vo){
		try {
			return fileMapper.getMaxTmpEditorFileIdx(vo);
		} catch (Exception err) {
			utility.func.Logging(this.getClass().getName(), err);
			return (Integer) null;
		}
	}

	@Override
	public void updateSetUpCdByTmpFileIdx(EditorTmpFileVO vo) throws Exception {
		fileMapper.updateSetUpCdByTmpFileIdx(vo);
	}

}
