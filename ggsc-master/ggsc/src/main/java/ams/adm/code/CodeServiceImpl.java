package ams.adm.code;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ams.adm.code.CodeVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;


@Service("codeService")
public class CodeServiceImpl extends EgovAbstractServiceImpl {

	
    @Resource(name="codeDAO")
    private CodeDAO codeDAO;

    
	public List<EgovMap> codeList(CodeVO vo) {
		return codeDAO.codeList(vo);
	}
	
	public int codeListCnt(CodeVO vo) {
		return codeDAO.codeListCnt(vo);
	}
	
	public List<EgovMap> codeDtl(CodeVO vo) {
		return codeDAO.codeDtl(vo);
	}
	
	public void updCode(CodeVO vo) {
		codeDAO.updCode(vo);
	}
	
	public void insCode(CodeVO vo) {
		codeDAO.insCode(vo);
	}

	public void delCode(CodeVO vo) {
		codeDAO.delCode(vo);
	}

	
	
    
	

	


}
