package ams.adm.menu.service;

import java.util.List;

import ams.adm.auth.AuthVO;
import ams.main.mnu.service.MenuVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface MenuService {

	public List<?> selectMenuList(MenuVO vo);

	public List<?> selectEditMenuList(MenuVO vo);

	public List<?> UpMenuList(MenuVO vo);

	public int selectMenuListTotalCnt(MenuVO vo);

	public void insertMenu(MenuVO vo);

	public void updateMenu(MenuVO vo);

	EgovMap selectMenuInfo(MenuVO vo);

	public List<?> selectUpMenuInfo(MenuVO vo);

	public List<?> selectLeftMenuList(String mnuCd);

	public List<EgovMap> selectTopMenuList(MenuVO vo);

	/**
	 * 맵핑
	 *
	 * @param vo
	 * @return
	 * @throws Exception
	 */

	public List<?> selectMapList(MenuVO vo);

	public List<?> selectAuthList(AuthVO vo);

	public int selectMapListTotalCnt(MenuVO vo);

	public int mapListCnt(MenuVO vo);

	public void insertMap(MenuVO vo);

	public void deleteMap(MenuVO vo);

	public List<?> selectAuthMenuMapList(MenuVO vo);

	public void deleteByAuthCdMap(MenuVO vo);

}
