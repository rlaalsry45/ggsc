package ggsc.join.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import ggsc.join.service.CnsrJoinService;
import ggsc.join.service.CnsrVO;
import ggsc.join.service.UsermVO;

@Service("CnsrJoinService")
public class CnsrJoinServiceImpl extends EgovAbstractServiceImpl implements CnsrJoinService{

	@Resource(name="CnsrJoinDAO")
    private CnsrJoinDAO CnsrJoinDAO;
	
	public void insertCnsrMng(CnsrVO param) {
		CnsrJoinDAO.insertCnsrMng(param);
	}
	public void insertUserM(UsermVO param) {
		CnsrJoinDAO.insertUserM(param);
	}
	
}
