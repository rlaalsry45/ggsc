package ams.adm.auth;
import java.util.List;

import org.springframework.stereotype.Repository;

import ams.adm.auth.AuthVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

 

@SuppressWarnings("unchecked")
@Repository("authDAO")
public class AuthDAO extends EgovAbstractDAO {
	

	
	
	public List<EgovMap> authListCombo(AuthVO vo){
		return (List<EgovMap>)list("authDAO.authListCombo", vo);
	}
	
	public List<EgovMap> authGrpListCombo(AuthVO vo){
		return (List<EgovMap>)list("authDAO.authGrpListCombo", vo);
	}
	
	
	
	
	
	
	
	
	
	
	public List<EgovMap> authList(AuthVO vo){
		return (List<EgovMap>)list("authDAO.authList", vo);
	}
	
	public int authListCnt(AuthVO vo){
		return (Integer)select("authDAO.authListCnt", vo);
	}
	
	public List<EgovMap> authDtl(AuthVO vo){
		return (List<EgovMap>)list("authDAO.authDtl", vo);
	}
	
	public void updAuth(AuthVO vo) {
		update("authDAO.updAuth",vo);
	}

	public void insAuth(AuthVO vo){
		insert("authDAO.insAuth", vo);
	}

	public void delAuth(AuthVO vo){
		delete("authDAO.delAuth", vo);
	}


		
		
		
		
		
		
		
		
		
		
	
	public List<EgovMap> authGrpList(AuthVO vo){
		return (List<EgovMap>)list("authDAO.authGrpList", vo);
	}
	
	public int authGrpListCnt(AuthVO vo){
		return (Integer)select("authDAO.authGrpListCnt", vo);
	}
	
	public List<EgovMap> authGrpDtl(AuthVO vo){
		return (List<EgovMap>)list("authDAO.authGrpDtl", vo);
	}
	
	public void updAuthGrp(AuthVO vo) {
		update("authDAO.updAuthGrp",vo);
	}

	public void insAuthGrp(AuthVO vo){
		insert("authDAO.insAuthGrp", vo);
	}

	public void delAuthGrp(AuthVO vo){
		delete("authDAO.delAuthGrp", vo);
	}


		
		
		
		
		
		
		
		
		
		
	
	
	
	
	

	


}
