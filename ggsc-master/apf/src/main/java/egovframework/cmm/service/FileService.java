package egovframework.cmm.service;

import java.util.List;

import egovframework.cmm.service.FileDefaultVO;
import egovframework.cmm.service.FileVO;
import egovframework.cmm.util.EditorTmpFileVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface FileService {

	EgovMap getFileInfo(FileVO vo) throws Exception;

	public int getMaxTmpEditorFile(EditorTmpFileVO vo) throws Exception;

	void insertTmpEditorFile(EditorTmpFileVO vo) throws Exception;
	
	List<EditorTmpFileVO> selectTmpEditorFileList(EditorTmpFileVO vo) throws Exception;

	public int getMaxTmpEditorFileIdx(EditorTmpFileVO vo) throws Exception;

	void updateSetUpCdByTmpFileIdx(EditorTmpFileVO vo) throws Exception;
}
