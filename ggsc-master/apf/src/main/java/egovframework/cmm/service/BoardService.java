package egovframework.cmm.service;

import java.util.List;

import egovframework.cmm.service.BoardVO;
import egovframework.cmm.util.EditorTmpFileVO;

public interface BoardService {

	List<BoardVO> selectBoardListByBoSel(BoardVO vo) throws Exception;

	int getBoardListTotalCntByBoSel(BoardVO vo) throws Exception;

	EditorTmpFileVO getBoardInfo(EditorTmpFileVO vo) throws Exception;

	BoardVO getBeforBoardByIdx(BoardVO vo) throws Exception;

	void updateBoardHitCnt(BoardVO vo) throws Exception;

	List<BoardVO> selectMainBoardListByBoSel(BoardVO vo) throws Exception;

	void insertBoard(BoardVO vo) throws Exception;
	
	void updateBoard(BoardVO vo) throws Exception;

	int getBoardMaxIdx(BoardVO vo) throws Exception;

	void deleteBoard(BoardVO vo) throws Exception;
}
