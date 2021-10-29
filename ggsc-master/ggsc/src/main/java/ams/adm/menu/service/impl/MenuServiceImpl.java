package ams.adm.menu.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ams.adm.auth.AuthDAO;
import ams.adm.auth.AuthVO;
import ams.adm.menu.service.MenuService;
import ams.main.mnu.service.MenuVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("menuService")
public class MenuServiceImpl extends EgovAbstractServiceImpl implements
		MenuService {

	@Resource(name = "menuDAO")
	private MenuDAO menuDAO;

    @Resource(name="authDAO")
    private AuthDAO authDAO;

	@Override
	public List<?> selectMenuList(MenuVO vo) {
		// TODO Auto-generated method stub
		return menuDAO.selectMenuList(vo);
	}

	@Override
	public List<?> selectEditMenuList(MenuVO vo) {
		// TODO Auto-generated method stub
		return menuDAO.selectEditMenuList(vo);
	}

	@Override
	public List<?> UpMenuList(MenuVO vo)  {
		// TODO Auto-generated method stub
		return menuDAO.UpMenuList(vo);
	}

	@Override
	public int selectMenuListTotalCnt(MenuVO vo)  {
		// TODO Auto-generated method stub
		return menuDAO.selectMenuListTotalCnt(vo);
	}

	@Override
	public void insertMenu(MenuVO vo)  {
		// TODO Auto-generated method stub
		menuDAO.insertMenu(vo);
	}

	@Override
	public void updateMenu(MenuVO vo)  {
		// TODO Auto-generated method stub
		menuDAO.updateMenu(vo);
	}

	@Override
	public EgovMap selectMenuInfo(MenuVO vo)  {
		// TODO Auto-generated method stub
		return menuDAO.selectMenuInfo(vo);
	}

	@Override
	public List<?> selectUpMenuInfo(MenuVO vo)  {
		// TODO Auto-generated method stub
		return menuDAO.selectUpMenuInfo(vo);
	}
	
	@Override
	public List<?> selectLeftMenuList(String mnuCd) {
		List<?> list = menuDAO.selectLeftMenuList(mnuCd);
		
		for(EgovMap rs : (List<EgovMap>)list){
			String mnu = (String)rs.get("mnuCd");
			
			if(mnu.equals("M01")){
				rs.put("icon", "/img/Icon-admin-On.png");
			}else if(mnu.equals("M02")){
				rs.put("icon", "/img/Icon-cns-On.png");
			}else if(mnu.equals("M03")){
				rs.put("icon", "/img/Icon-report-On.png");
			}else if(mnu.equals("M04")){
				rs.put("icon", "/img/Icon-stats-On.png");
			}else if(mnu.equals("M05")){
				rs.put("icon", "/img/Icon-admin-On.png");
			}else if(mnu.equals("M06")){
				rs.put("icon", "/img/Icon-monitering-On.png");
			}else if(mnu.equals("M07")){
				rs.put("icon", "/img/Icon-suport-On.png");
			}else if(mnu.equals("M08")){
				rs.put("icon", "/img/Icon-homepage-On.png");
			}else if(mnu.equals("M09")){
				rs.put("icon", "/img/Icon-common-On.png");
			}
		}
		
		return list;
	}
	
	@Override
	public List<EgovMap> selectTopMenuList(MenuVO vo) {
		return menuDAO.selectTopMenuList(vo);
	}
	/** 맵핑
	 * @param vo
	 * @return
	 * @throws Exception
	 */

	@Override
	public List<?> selectMapList(MenuVO vo)  {
		// TODO Auto-generated method stub
		return menuDAO.selectMapList(vo);
	}

	@Override
	public int selectMapListTotalCnt(MenuVO vo)  {
		// TODO Auto-generated method stub
		return menuDAO.selectMapListTotalCnt(vo);
	}

	@Override
	public List<?> selectAuthList(AuthVO vo) {
		// TODO Auto-generated method stub
		//return authDAO.selectAuthList(vo);
		return null;
	}

	@Override
	public int mapListCnt(MenuVO vo) {
		// TODO Auto-generated method stub
		return menuDAO.mapListCnt(vo);
	}

	@Override
	public void insertMap(MenuVO vo)  {
		// TODO Auto-generated method stub
		menuDAO.insertMap(vo);
	}

	@Override
	public void deleteMap(MenuVO vo)  {
		// TODO Auto-generated method stub
		menuDAO.deleteMap(vo);
	}

	@Override
	public List<?> selectAuthMenuMapList(MenuVO vo)  {
		// TODO Auto-generated method stub
		return menuDAO.selectAuthMenuMapList(vo);
	}

	@Override
	public void deleteByAuthCdMap(MenuVO vo) {
		menuDAO.deleteByAuthCdMap(vo);
	}

}
