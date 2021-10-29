package ams.main.mnu.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ams.main.mnu.service.MenuManageService;
import ams.main.mnu.service.MenuVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * 메뉴목록관리, 생성, 사이트맵을 처리하는 비즈니스 구현 클래스를 정의한다.
 * 
 * @author 개발환경 개발팀 이용
 * @since 2009.06.01
 * @version 1.0
 * @see
 *
 *      <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2009.03.20  이  용          최초 생성
 *   2011.07.01  서준식			자기 메뉴 정보를 상위메뉴 정보로 참조하는 메뉴정보가 있는지 조회하는
 *   							selectUpperMenuNoByPk() 메서드 추가
 *   2011.08.31  JJY            경량환경 템플릿 커스터마이징버전 생성
 *
 *      </pre>
 */

@Service("meunManageService")
public class MenuManageServiceImpl extends EgovAbstractServiceImpl implements MenuManageService {

	@Resource(name = "menuManageDAO")
	private MenuManageDAO menuManageDAO;

	/**
	 * MainMenu Head Left 조회
	 * 
	 * @param vo MenuManageVO
	 * @return List
	 * @exception Exception
	 */
	@Override
	public List<?> selectMainMenuLeft(MenuVO vo) {
		return menuManageDAO.selectMainMenuLeft(vo);
	}

	@Override
	public List<?> selectMenuList(MenuVO vo) {
		// TODO Auto-generated method stub
		return menuManageDAO.selectMenuList(vo);
	}

	@Override
	public List<?> selectMenuForUser(MenuVO vo) {
		return menuManageDAO.selectMenuForUser(vo);
	}

	@Override
	public List<?> selectMenuLeftByUser(MenuVO vo) {
		return menuManageDAO.selectMenuLeftByUser(vo);
	}

	@Override
	public List<?> selectMenuListByStep2(MenuVO vo) {
		return menuManageDAO.selectMenuListByStep2(vo);
	}

	@Override
	public EgovMap getMenuInfo(MenuVO vo) {
		return menuManageDAO.getMenuInfo(vo);
	}

	@Override
	public List<?> selectUserParentMenu(MenuVO vo) {
		// TODO Auto-generated method stub
		return menuManageDAO.selectUserParentMenu(vo);
	}

	@Override
	public List<?> selectUserAuthMenu(MenuVO vo) {
		// TODO Auto-generated method stub
		return menuManageDAO.selectUserAuthMenu(vo);
	}

//	/**
//	 * MainMenu Head MenuURL 조회
//	 * @param  iMenuNo  int
//	 * @param  sUniqId  String
//	 * @return String
//	 * @exception Exception
//	 */
//	@Override
//	public String selectLastMenuURL(int iMenuNo, String sUniqId) throws Exception {
//		MenuVO vo = new MenuVO();
//		vo.setMenuNo(selectLastMenuNo(iMenuNo, sUniqId)) ;
//   		return menuManageDAO.selectLastMenuURL(vo);
//	}
//
//	/**
//	 * MainMenu Head Menu MenuNo 조회
//	 * @param  iMenuNo  int
//	 * @param  sUniqId  String
//	 * @return String
//	 * @exception Exception
//	 */
//	private int selectLastMenuNo(int iMenuNo, String sUniqId) throws Exception {
//		int chkMenuNo = iMenuNo;
//		int cntMenuNo = 0;
//		for(;chkMenuNo > -1;){
//			chkMenuNo = selectLastMenuNoChk(chkMenuNo, sUniqId);
//			if(chkMenuNo > 0){
//				cntMenuNo = chkMenuNo;
//			}
//		}
//   		return cntMenuNo;
//	}
//
//	/**
//	 * MainMenu Head Menu Last MenuNo 조회
//	 * @param  iMenuNo  int
//	 * @param  sUniqId  String
//	 * @return String
//	 * @exception Exception
//	 */
//	private int selectLastMenuNoChk(int iMenuNo, String sUniqId) throws Exception {
//		MenuVO vo = new MenuVO();
//		vo.setMenuNo(iMenuNo);
//		vo.setTempValue(sUniqId) ;
//		int chkMenuNo = 0;
//		int cntMenuNo = 0;
//		cntMenuNo = menuManageDAO.selectLastMenuNoCnt(vo);
//		if(cntMenuNo>0){
//			chkMenuNo = menuManageDAO.selectLastMenuNo(vo);
//		}else{
//			chkMenuNo = -1;
//		}
//		return  chkMenuNo;
//	}
//
//	/**
//	 * MainMenu Head Menu 조회
//	 * @param vo MenuManageVO
//	 * @return List
//	 * @exception Exception
//	 */
//	@Override
//	public List<?> selectMainMenuHeadByAuthor(MenuVO vo) throws Exception {
//   		return menuManageDAO.selectMainMenuHeadByAuthor(vo);
//	}
//
//	/**
//	 * MainMenu Head Left 조회
//	 * @param vo MenuManageVO
//	 * @return List
//	 * @exception Exception
//	 */
//	@Override
//	public List<?> selectMainMenuLeftByAuthor(MenuVO vo) throws Exception {
//   		return menuManageDAO.selectMainMenuLeftByAuthor(vo);
//	}

}