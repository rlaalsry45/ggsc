package ggsc.adm.login.service;

import java.net.SocketException;
import java.sql.SQLException;
import java.sql.SQLNonTransientConnectionException;

import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * 일반 로그인을 처리하는 비즈니스 인터페이스 클래스
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
public interface LoginService {

	/**
	 * 일반 로그인을 처리한다
	 * 
	 * @return AdmLoginVO
	 *
	 * @param vo AdmLoginVO
	 * @throws SQLNonTransientConnectionException 
	 * @throws SQLException 
	 * @exception Exception Exception
	 */
	public EgovMap actionLogin(LoginVO vo) throws SocketException, SQLNonTransientConnectionException;

	/**
	 * 아이디를 찾는다.
	 * 
	 * @return LoginVO
	 *
	 * @param vo LoginVO
	 * @exception Exception Exception
	 */
	public LoginVO searchId(LoginVO vo);

	public EgovMap actionGwLogin(LoginVO loginVO);
//	/**
//	 * 비밀번호를 찾는다.
//	 * @return boolean
//	 *
//	 * @param vo    LoginVO
//	 * @exception Exception Exception
//	 */
//	public boolean searchPassword(AdmLoginVO vo)
//	  ;

}