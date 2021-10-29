package ams.adm.menu.service.impl;

import java.sql.SQLException;
import java.util.List;

import org.springframework.stereotype.Repository;

import ams.adm.auth.AuthVO;
import ams.main.mnu.service.MenuVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Repository("menuDAO")
public class MenuDAO extends EgovAbstractDAO {

	public List<?> selectMenuList(MenuVO vo) {
		return list("menuDAO.selectMenuList", vo);
	}

	public List<?> selectEditMenuList(MenuVO vo) {
		return list("menuDAO.selectEditMenuList", vo);
	}

	public List<?> UpMenuList(MenuVO vo) {
		return list("menuDAO.UpMenuList", vo);
	}

	public int selectMenuListTotalCnt(MenuVO vo) {
		return (Integer) select("menuDAO.selectMenuListTotalCnt", vo);
	}

	public void insertMenu(MenuVO vo) {
		insert("menuDAO.insertMenu", vo);
	}

	public void updateMenu(MenuVO vo) {
		update("menuDAO.updateMenu", vo);
	}

	public List<?> selectUpMenuInfo(MenuVO vo) {
		return list("menuDAO.selectUpMenuInfo", vo);
	}

	public EgovMap selectMenuInfo(MenuVO vo) {
		return (EgovMap) select("menuDAO.selectMenuInfo", vo);
	}

	public List<?> selectLeftMenuList(String mnuCd) {
		return list("menuDAO.selectLeftMenuList", mnuCd);
	}

	@SuppressWarnings("unchecked")
	public List<EgovMap> selectTopMenuList(MenuVO vo) {
		return (List<EgovMap>) list("menuDAO.selectTopMenuList", vo);
	}

	/**
	 * 맵핑
	 *
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<?> selectMapList(MenuVO vo) {
		return (List<?>) list("menuDAO.selectMapList", vo);
	}

	public List<?> selectAuthList(AuthVO vo) {
		return (List<?>) list("authDAO.selectAuthList", vo);
	}

	public int selectMapListTotalCnt(MenuVO vo) {
		return (Integer) select("menuDAO.selectMapListTotalCnt", vo);
	}

	public int mapListCnt(MenuVO vo) {
		return (Integer) select("menuDAO.mapListCnt", vo);
	}

	public void insertMap(MenuVO vo) {
		insert("menuDAO.insertMap", vo);
	}

	public void deleteMap(MenuVO vo) {
		delete("menuDAO.deleteMap", vo);
	}

	public List<?> selectAuthMenuMapList(MenuVO vo) {
		return (List<?>) list("menuDAO.selectAuthMenuMapList", vo);
	}

	public void deleteByAuthCdMap(MenuVO vo) {
		delete("menuDAO.deleteByAuthCdMap", vo);
	}
}
