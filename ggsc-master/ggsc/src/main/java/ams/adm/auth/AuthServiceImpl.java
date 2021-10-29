package ams.adm.auth;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ams.adm.auth.AuthVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;
 
@Service("authService")
public class AuthServiceImpl extends EgovAbstractServiceImpl {


	@Resource(name="authDAO")
    private AuthDAO authDAO;

    

	public List<EgovMap> authListCombo(AuthVO vo) {
		return authDAO.authListCombo(vo);
	}
	
	public List<EgovMap> authGrpListCombo(AuthVO vo) {
		return authDAO.authGrpListCombo(vo);
	}
	
	
	



	public List<EgovMap> authList(AuthVO vo) {
		return authDAO.authList(vo);
	}
	
	public int authListCnt(AuthVO vo) {
		return authDAO.authListCnt(vo);
	}
	
	public List<EgovMap> authDtl(AuthVO vo) {
		return authDAO.authDtl(vo);
	}
	
	public void updAuth(AuthVO vo) {
		authDAO.updAuth(vo);
	}
	
	public void insAuth(AuthVO vo) {
		authDAO.insAuth(vo);
	}

	public void delAuth(AuthVO vo) {
		authDAO.delAuth(vo);
	}

		
		
	    
		
    
    



	public List<EgovMap> authGrpList(AuthVO vo) {
		return authDAO.authGrpList(vo);
	}
	
	public int authGrpListCnt(AuthVO vo) {
		return authDAO.authGrpListCnt(vo);
	}
	
	public List<EgovMap> authGrpDtl(AuthVO vo) {
		return authDAO.authGrpDtl(vo);
	}
	
	public void updAuthGrp(AuthVO vo) {
		authDAO.updAuthGrp(vo);
	}
	
	public void insAuthGrp(AuthVO vo) {
		authDAO.insAuthGrp(vo);
	}

	public void delAuthGrp(AuthVO vo) {
		authDAO.delAuthGrp(vo);
	}

		
		
	    
		
    
    
    
    
}