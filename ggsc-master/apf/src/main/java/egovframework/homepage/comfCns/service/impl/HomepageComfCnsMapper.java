package egovframework.homepage.comfCns.service.impl;

import egovframework.homepage.comfCns.service.AddComfCnsVO;
import egovframework.homepage.comfCns.service.ComfCnsVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("homepageComfCnsMapper")
public interface HomepageComfCnsMapper {

	// 상담신청 등록
	void insertComfCnsReg(ComfCnsVO vo);
	
	// 상담신청 파일업로드
	void insertComfCnsFileUpload(ComfCnsVO vo);
	
	// 상담신청 등록(추가자료입력)
	void insertAddComfCnsReg(AddComfCnsVO vo);
}
