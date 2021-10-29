package ams.adm.mnu;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ams.adm.mnu.MnuVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;


@Service("mnuService")
public class MnuServiceImpl extends EgovAbstractServiceImpl {

	
    @Resource(name="mnuDAO")
    private MnuDAO mnuDAO;

    
	public List<EgovMap> mnuList(MnuVO vo) {
		return mnuDAO.mnuList(vo);
	}
	
	public int mnuListCnt(MnuVO vo) {
		return mnuDAO.mnuListCnt(vo);
	}
	
	public List<EgovMap> mnuDtl(MnuVO vo) {
		return mnuDAO.mnuDtl(vo);
	}
	
	public void updMnu(MnuVO vo) {
		mnuDAO.updMnu(vo);
	}
	
	public void insMnu(MnuVO vo) {
		mnuDAO.insMnu(vo);
	}

	public void delMnu(MnuVO vo) {
		mnuDAO.delMnu(vo);
	}

	public List<EgovMap> hMnuList(MnuVO vo) {
		return mnuDAO.hMnuList(vo);
	}
	
	
	
    
	

	


}
