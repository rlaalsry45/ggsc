package egovframework.homepage.main.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.homepage.main.service.CenterVO;
import egovframework.homepage.main.service.CommonVO;
import egovframework.homepage.main.service.HomepageMainService;
import egovframework.homepage.main.service.LoginVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("homepageMainService")
public class HomepageMainServiceImpl extends EgovAbstractServiceImpl implements HomepageMainService {

	private static final Logger LOGGER = LoggerFactory.getLogger(HomepageMainServiceImpl.class);
	
	/** SampleDAO */
	// TODO ibatis 사용
	@Resource(name = "homepageMainMapper")
	private HomepageMainMapper homepageMainMapper;
	// TODO mybatis 사용
	//  @Resource(name="sampleMapper")
	//	private SampleMapper sampleDAO;
	
	
	// 로그인 정보
	public EgovMap actionLogin(LoginVO vo){
    	
    	// 1. 아이디와 암호화된 비밀번호가 DB와 일치하는지 확인한다.
		/*LoginVO loginVO = mobileMainMapper.actionLogin(vo);
    	return loginVO;*/
		
		try {
			return homepageMainMapper.actionLogin(vo);
		} catch (Exception e) {
			utility.func.Logging(this.getClass().getName(), e);
			return null;

		}
    }
	
	// 회원 ID 찾기
	public EgovMap findUserId(LoginVO vo) throws Exception {
		return homepageMainMapper.findUserId(vo);
	}
	
	// 회원 PW 찾기
	public int findPw(LoginVO vo) throws Exception {
		return homepageMainMapper.findPw(vo);
	}
	
	// PW 재설정
	public void userPwReset(LoginVO vo) {
		homepageMainMapper.userPwReset(vo);
	}
	
	// 공통값 목록
	public List<EgovMap> getGroupMngDtlMList(CommonVO param) {
		return homepageMainMapper.getGroupMngDtlMList(param);
	}
		
	// 센터 목록
	public List<EgovMap> getCenterManageList(CenterVO centerVO) {
		return homepageMainMapper.getCenterManageList(centerVO);
	}
	
}
