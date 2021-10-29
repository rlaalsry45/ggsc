package egovframework.homepage.join.service.impl;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.homepage.join.service.JoinVO;
import egovframework.homepage.join.service.HomepageJoinService;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("homepageJoinService")
public class HomepageJoinServiceImpl extends EgovAbstractServiceImpl implements HomepageJoinService {

	private static final Logger LOGGER = LoggerFactory.getLogger(HomepageJoinServiceImpl.class);
	
	/** SampleDAO */
	// TODO ibatis 사용
	@Resource(name = "homepageJoinMapper")
	private HomepageJoinMapper homepageJoinMapper;
	// TODO mybatis 사용
	//  @Resource(name="sampleMapper")
	//	private SampleMapper sampleDAO;
	
	// 회원가입 등록
	public void insertJoinReg(JoinVO vo) {
		homepageJoinMapper.insertJoinReg(vo);
	}
	
	// 아이디 중복확인
	public int getIdCheck(String userId) {
		return homepageJoinMapper.getIdCheck(userId);
	}
	
}