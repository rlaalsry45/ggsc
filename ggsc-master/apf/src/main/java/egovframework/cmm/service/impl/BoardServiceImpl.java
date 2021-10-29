package egovframework.cmm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;



import egovframework.cmm.service.BoardVO;
import egovframework.cmm.service.BoardDefaultVO;
import egovframework.cmm.service.BoardService;
import egovframework.cmm.service.FileService;
import egovframework.cmm.util.EditorTmpFileVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

@Component
@Service("boardService")
public class BoardServiceImpl extends EgovAbstractServiceImpl implements BoardService {
	
	
	@Resource(name = "boardMapper")
	private BoardMapper boardMapper;
	
	/** ID Generation */
	@Resource(name = "egovIdGnrService")
	private EgovIdGnrService egovIdGnrService;
	
	private static final Logger LOGGER = LoggerFactory.getLogger(BoardServiceImpl.class);	
	

	public List<BoardVO> selectBoardListByBoSel(BoardVO vo) throws Exception {
		return boardMapper.selectBoardListByBoSel(vo);
	}

	@Override
	public int getBoardListTotalCntByBoSel(BoardVO vo){
		try {
			return boardMapper.getBoardListTotalCntByBoSel(vo);
		} catch (Exception err) {
			utility.func.Logging(this.getClass().getName(), err);
			return (Integer) null;
		}
	}

	@Override
	public EditorTmpFileVO getBoardInfo(EditorTmpFileVO vo) throws Exception {
		return boardMapper.getBoardInfo(vo);
	}

	@Override
	public BoardVO getBeforBoardByIdx(BoardVO vo) throws Exception {
		return boardMapper.getBeforBoardByIdx(vo);
	}

	@Override
	public void updateBoardHitCnt(BoardVO vo) throws Exception {
		boardMapper.updateBoardHitCnt(vo);
	}

	@Override
	public List<BoardVO> selectMainBoardListByBoSel(BoardVO vo)
			throws Exception {
		return boardMapper.selectMainBoardListByBoSel(vo);
	}

	@Override
	public void insertBoard(BoardVO vo) throws Exception {
		boardMapper.insertBoard(vo);
	}

	@Override
	public void updateBoard(BoardVO vo) throws Exception {
		boardMapper.updateBoard(vo);
	}
    
	@Override
	public int getBoardMaxIdx(BoardVO vo) throws Exception {
		return boardMapper.getBoardMaxIdx(vo);
	}

	@Override
	public void deleteBoard(BoardVO vo) throws Exception {
		boardMapper.deleteBoard(vo);
	}

}
