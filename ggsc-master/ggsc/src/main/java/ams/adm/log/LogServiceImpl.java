package ams.adm.log;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ams.adm.log.LogVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;


@Service("logService")
public class LogServiceImpl extends EgovAbstractServiceImpl {

	
    @Resource(name="logDAO")
    private LogDAO logDAO;

    
	public List<EgovMap> logList(LogVO vo) {
		return logDAO.logList(vo);
	}
	
	public int logListCnt(LogVO vo) {
		return logDAO.logListCnt(vo);
	}
	
	public List<EgovMap> logDtl(LogVO vo) {
		return logDAO.logDtl(vo);
	}
	

	
	
    
	

	


}
