package ams.main.mnu.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import ams.main.mnu.service.MenuVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * 메뉴관리, 메뉴생성, 사이트맵 생성에 대한 DAO 클래스를 정의한다.
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

@Repository("menuManageDAO")
public class MenuManageDAO extends EgovAbstractDAO {

	/**
	 * MainMenu Left Menu 조회
	 * 
	 * @param vo MenuManageVO
	 * @return List
	 * @exception Exception
	 */
	public List<?> selectMainMenuLeft(MenuVO vo) {
		return list("menuManageDAO.selectMenuLeft", vo);
	}

	public List<?> selectMenuForUser(MenuVO vo) {
		return list("menuManageDAO.selectMenuForUser", vo);
	}

	public List<?> selectMenuLeftByUser(MenuVO vo) {
		return list("menuManageDAO.selectMenuLeftByUser", vo);
	}

	public List<?> selectMenuList(MenuVO vo) {
		return list("menuManageDAO.selectMenuList", vo);
	}

	public List<?> selectMenuListByStep2(MenuVO vo) {
		return list("menuManageDAO.selectMenuListByStep2", vo);
	}

	public EgovMap getMenuInfo(MenuVO vo) {
		return (EgovMap) select("menuManageDAO.getMenuInfo", vo);
	}

	public List<?> selectSubMenu(String hMnuCd) {
		return list("menuManageDAO.selectSubMenu", hMnuCd);
	}

	public List<?> selectUserParentMenu(MenuVO vo) {
		return list("menuManageDAO.selectUserParentMenu", vo);
	}

	public List<?> selectUserAuthMenu(MenuVO vo) {
		return list("menuManageDAO.selectUserAuthMenu", vo);
	}

//	/**
//	 * MainMenu Head MenuURL 조회
//	 * @param vo MenuManageVO
//	 * @return  String
//	 * @exception Exception
//	 */
//	public String selectLastMenuURL(MenuVO vo) throws Exception{
//		return (String)select("menuManageDAO.selectLastMenuURL", vo);
//	}
//
//	/**
//	 * MainMenu Left Menu 조회
//	 * @param vo MenuManageVO
//	 * @return int
//	 * @exception Exception
//	 */
//	public int selectLastMenuNo(MenuVO vo) throws Exception{
//		return (Integer)select("menuManageDAO.selectLastMenuNo", vo);
//	}
//
//	/**
//	 * MainMenu Left Menu 조회
//	 * @param vo MenuManageVO
//	 * @return int
//	 * @exception Exception
//	 */
//	public int selectLastMenuNoCnt(MenuVO vo) throws Exception{
//		return (Integer)select("menuManageDAO.selectLastMenuNoCnt", vo);
//	}
//
//	/**
//	 * MainMenu Head Menu 조회 - Anonymous
//	 * @param vo MenuManageVO
//	 * @return List
//	 * @exception Exception
//	 */
//	public List<?> selectMainMenuHeadByAuthor(MenuVO vo) throws Exception{
//		return list("menuManageDAO.selectMainMenuHeadByAuthor", vo);
//	}
//
//	/**
//	 * MainMenu Left Menu 조회 - Anonymous
//	 * @param vo MenuManageVO
//	 * @return List
//	 * @exception Exception
//	 */
//	public List<?> selectMainMenuLeftByAuthor(MenuVO vo) throws Exception{
//		return list("menuManageDAO.selectMainMenuLeftByAuthor", vo);
//	}

}