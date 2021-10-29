package ams.main.mnu.service;

import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * 메뉴관리에 관한 서비스 인터페이스 클래스를 정의한다.
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

public interface MenuManageService {

	/**
	 * MainMenu Head Left 조회
	 * 
	 * @param vo MenuManageVO
	 * @return List
	 * @exception Exception
	 */
	List<?> selectMainMenuLeft(MenuVO vo);

	/**
	 * 권한 매핑에 사용되는 함수
	 * 
	 * @param vo MenuManageVO
	 * @return List
	 * @exception Exception
	 */
	List<?> selectMenuList(MenuVO vo);

	List<?> selectMenuForUser(MenuVO vo);

	List<?> selectMenuLeftByUser(MenuVO vo);

	List<?> selectMenuListByStep2(MenuVO menuVO);

	EgovMap getMenuInfo(MenuVO menuVO);

	List<?> selectUserParentMenu(MenuVO vo);

	List<?> selectUserAuthMenu(MenuVO vo);

//	/**
//	 * MainMenu Head MenuURL 조회
//	 * @param iMenuNo int
//	 * @param sUniqId String
//	 * @return String
//	 * @exception Exception
//	 */
//	String selectLastMenuURL(int iMenuNo, String sUniqId) throws Exception;
//
//	/**
//	 * MainMenu Head Menu 조회 - Anonymous
//	 * @param vo MenuManageVO
//	 * @return List
//	 * @exception Exception
//	 */
//	List<?> selectMainMenuHeadByAuthor(MenuVO vo) throws Exception;
//
//	/**
//	 * MainMenu Head Left 조회 - Anonymous
//	 * @param vo MenuManageVO
//	 * @return List
//	 * @exception Exception
//	 */
//	List<?> selectMainMenuLeftByAuthor(MenuVO vo) throws Exception;

}