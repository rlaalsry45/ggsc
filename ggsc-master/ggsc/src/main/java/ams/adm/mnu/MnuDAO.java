package ams.adm.mnu;

import java.util.List;

import org.springframework.stereotype.Repository;

import ams.adm.mnu.MnuVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@SuppressWarnings("unchecked")
@Repository("mnuDAO")
public class MnuDAO extends EgovAbstractDAO {
	
	public List<EgovMap> mnuList(MnuVO vo){
		return (List<EgovMap>)list("mnuDAO.mnuList", vo);
	}
	
	public int mnuListCnt(MnuVO vo){
		return (Integer)select("mnuDAO.mnuListCnt", vo);
	}
	
	public List<EgovMap> mnuDtl(MnuVO vo){
		return (List<EgovMap>)list("mnuDAO.mnuDtl", vo);
	}
	
	public void updMnu(MnuVO vo) {
		update("mnuDAO.updMnu",vo);
	}

	public void insMnu(MnuVO vo){
		insert("mnuDAO.insMnu", vo);
	}

	public void delMnu(MnuVO vo){
		delete("mnuDAO.delMnu", vo);
	}

	public List<EgovMap> hMnuList(MnuVO vo){
		return (List<EgovMap>)list("mnuDAO.hMnuList", vo);
	}
	

	
	
	
	
	
	
	
	
	
	
}
