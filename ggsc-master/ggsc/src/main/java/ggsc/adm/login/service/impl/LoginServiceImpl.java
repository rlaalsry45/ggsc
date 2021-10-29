package ggsc.adm.login.service.impl;

import java.net.SocketException;
import java.sql.SQLNonTransientConnectionException;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import ggsc.adm.login.service.LoginService;
import ggsc.adm.login.service.LoginVO;

/**
 * 일반 로그인을 처리하는 비즈니스 구현 클래스
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
@Service("admLoginService")
public class LoginServiceImpl extends EgovAbstractServiceImpl implements LoginService {

	@Resource(name = "loginDAO")
	private LoginDAO loginDAO;

	/**
	 * 일반 로그인을 처리한다
	 * 
	 * @param vo AdmLoginVO
	 * @return AdmLoginVO
	 * @throws SQLNonTransientConnectionException 
	 * @exception Exception
	 */
	@Override
	public EgovMap actionLogin(LoginVO vo) throws SocketException, SQLNonTransientConnectionException {
		// 1. 입력한 비밀번호를 암호화한다.
		// String enpassword = EgovFileScrty.encryptPassword(vo.getPassword(),
		// vo.getId());
		// vo.setPassword(enpassword);

		// 2. 아이디와 암호화된 비밀번호가 DB와 일치하는지 확인한다.
		EgovMap loginVO = loginDAO.actionLogin(vo);

		return loginVO;
	}

	/**
	 * 아이디를 찾는다.
	 * 
	 * @param vo LoginVO
	 * @return LoginVO
	 * @exception Exception
	 */
	@Override
	public LoginVO searchId(LoginVO vo) {

		// 1. 이름, 이메일주소가 DB와 일치하는 사용자 ID를 조회한다.
		LoginVO loginVO = loginDAO.searchId(vo);

		// 2. 결과를 리턴한다.
		if (loginVO != null && !loginVO.getUserId().equals("")) {
			return loginVO;
		} else {
			loginVO = new LoginVO();
		}

		return loginVO;
	}

	@Override
	public EgovMap actionGwLogin(LoginVO vo) {
		EgovMap loginVO = loginDAO.actionGwLogin(vo);
		return loginVO;
	}

//    /**
//	 * 비밀번호를 찾는다.
//	 * @param vo LoginVO
//	 * @return boolean
//	 * @exception Exception
//	 */
//    @Override
//	public boolean searchPassword(AdmLoginVO vo)  {
//
//    	boolean result = true;
//
//    	// 1. 아이디, 이름, 이메일주소, 비밀번호 힌트, 비밀번호 정답이 DB와 일치하는 사용자 Password를 조회한다.
//    	AdmLoginVO loginVO = loginDAO.searchPassword(vo);
//    	if (loginVO == null || loginVO.getPw() == null || loginVO.getPw().equals("")) {
//    		return false;
//    	}
//
//    	// 2. 임시 비밀번호를 생성한다.(영+영+숫+영+영+숫=6자리)
//    	String newpassword = "";
//    	for (int i = 1; i <= 6; i++) {
//    		// 영자
//    		if (i % 3 != 0) {
//    			newpassword += EgovStringUtil.getRandomStr('a', 'z');
//    		// 숫자
//    		} else {
//    			newpassword += EgovNumberUtil.getRandomNum(0, 9);
//    		}
//    	}
//
//    	// 3. 임시 비밀번호를 암호화하여 DB에 저장한다.
//    	AdmLoginVO pwVO = new AdmLoginVO();
//    	String enpassword = EgovFileScrty.encryptPassword(newpassword, vo.getId());
//    	pwVO.setId(vo.getId());
//    	pwVO.setPassword(enpassword);
//    	pwVO.setUserSe(vo.getUserSe());
//    	loginDAO.updatePassword(pwVO);
//
//    	return result;
//    }
}