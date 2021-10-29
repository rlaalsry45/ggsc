package ams.adm.log;

import java.util.List;

import org.springframework.stereotype.Repository;

import ams.adm.log.LogVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@SuppressWarnings("unchecked")
@Repository("logDAO")
public class LogDAO extends EgovAbstractDAO {
	
	public List<EgovMap> logList(LogVO vo){
		return (List<EgovMap>)list("logDAO.logList", vo);
	}
	
	public int logListCnt(LogVO vo){
		return (Integer)select("logDAO.logListCnt", vo);
	}
	
	public List<EgovMap> logDtl(LogVO vo){
		return (List<EgovMap>)list("logDAO.logDtl", vo);
	}
	


	
	
	
	
	
	
	
	
	
	
}
