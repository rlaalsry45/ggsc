package egovframework.homepage.edu.service.impl;

import egovframework.homepage.edu.service.EduVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("homepageEduMapper")
public interface HomepageEduMapper {

	// 상담신청 등록
	void insertEduReg(EduVO vo);
	
}
