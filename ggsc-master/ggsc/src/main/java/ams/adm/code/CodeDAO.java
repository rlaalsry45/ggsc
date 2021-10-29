package ams.adm.code;

import java.util.List;

import org.springframework.stereotype.Repository;

import ams.adm.code.CodeVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@SuppressWarnings("unchecked")
@Repository("codeDAO")
public class CodeDAO extends EgovAbstractDAO {
	
	public List<EgovMap> codeList(CodeVO vo){
		return (List<EgovMap>)list("codeDAO.codeList", vo);
	}
	
	public int codeListCnt(CodeVO vo){
		return (Integer)select("codeDAO.codeListCnt", vo);
	}
	
	public List<EgovMap> codeDtl(CodeVO vo){
		return (List<EgovMap>)list("codeDAO.codeDtl", vo);
	}
	
	public void updCode(CodeVO vo) {
		update("codeDAO.updCode",vo);
	}

	public void insCode(CodeVO vo){
		insert("codeDAO.insCode", vo);
	}

	public void delCode(CodeVO vo){
		delete("codeDAO.delCode", vo);
	}


	
	
	
	
	
	
	
	
	
	
}
