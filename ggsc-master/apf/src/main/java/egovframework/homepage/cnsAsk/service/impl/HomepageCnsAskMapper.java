package egovframework.homepage.cnsAsk.service.impl;

import java.util.List;

import egovframework.homepage.cnsAsk.service.CnsAskVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper("homepageCnsAskMapper")
public interface HomepageCnsAskMapper {

	// 상담문의하기
	List<EgovMap> getCnsAskList(CnsAskVO vo);
	
	// 상담문의 등록
	void getCnsAskReg(CnsAskVO vo);
	
}
