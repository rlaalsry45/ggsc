package egovframework.homepage.edu.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.homepage.edu.service.EduVO;
import egovframework.homepage.edu.service.HomepageEduService;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("homepageEduService")
public class HomepageEduServiceImpl extends EgovAbstractServiceImpl implements HomepageEduService {

	/** SampleDAO */
	// TODO ibatis 사용
	@Resource(name = "homepageEduMapper")
	private HomepageEduMapper homepageEduMapper;
	// TODO mybatis 사용
	//  @Resource(name="sampleMapper")
	//	private SampleMapper sampleDAO;
	
	// 상담신청 등록
	public void insertEduReg(EduVO vo){
		homepageEduMapper.insertEduReg(vo);
	}
	
	
	
	
}