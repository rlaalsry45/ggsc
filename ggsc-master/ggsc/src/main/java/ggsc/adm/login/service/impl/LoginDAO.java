package ggsc.adm.login.service.impl;

import java.net.SocketException;
import java.sql.SQLNonTransientConnectionException;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import ggsc.adm.login.service.LoginVO;

/**
 * 일반 로그인을 처리하는 DAO 클래스
 * 
 * @author 공통서비스 개발팀 박지욱
 * @since 2009.03.06
 * @version 1.0
 * @see
 *
 *      <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자          수정내용
 *  -------    --------    ---------------------------
 *  2009.03.06  박지욱          최초 생성
 *  2011.08.31  JJY            경량환경 템플릿 커스터마이징버전 생성
 *
 *      </pre>
 */
@Repository("loginDAO")
public class LoginDAO extends EgovAbstractDAO {

	/**
	 * 일반 로그인을 처리한다
	 * 
	 * @param vo LoginVO
	 * @return LoginVO
	 * @exception Exception
	 */
	public EgovMap actionLogin(LoginVO vo) throws SocketException, SQLNonTransientConnectionException {
		return (EgovMap) select("loginDAO.actionLogin", vo);
	}

	/**
	 * 그룹웨어 로그인을 처리한다
	 * 
	 * @param vo LoginVO
	 * @return LoginVO
	 * @exception Exception
	 */
	public EgovMap actionGwLogin(LoginVO vo) {
		return (EgovMap) select("loginDAO.actionGwLogin", vo);
	}

	/**
	 * 아이디를 찾는다.
	 * 
	 * @param vo LoginVO
	 * @return LoginVO
	 * @exception Exception
	 */
	public LoginVO searchId(LoginVO vo) {

		return (LoginVO) select("loginDAO.searchId", vo);
	}

	/**
	 * 비밀번호를 찾는다.
	 * 
	 * @param vo LoginVO
	 * @return LoginVO
	 * @exception Exception
	 */
	public LoginVO searchPassword(LoginVO vo) {

		return (LoginVO) select("loginDAO.searchPassword", vo);
	}

//    /**
//	 * 변경된 비밀번호를 저장한다.
//	 * @param vo LoginVO
//	 * @exception Exception
//	 */
//    public void updatePassword(AdmLoginVO vo)  {
//    	update("loginDAO.updatePassword", vo);
//    }
}
