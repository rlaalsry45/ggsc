package ggsc.join.service.impl;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import ggsc.join.service.CnsrVO;
import ggsc.join.service.UsermVO;

@Repository("CnsrJoinDAO")
public class CnsrJoinDAO extends EgovAbstractDAO{

	public void insertCnsrMng(CnsrVO param) {
		insert("CnsrJoinDAO.insertCnsrMng", param);
	}
	public void insertUserM(UsermVO param) {
		insert("CnsrJoinDAO.insertUserM", param);
	}
}
