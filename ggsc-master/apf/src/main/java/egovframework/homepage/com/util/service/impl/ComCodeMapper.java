package egovframework.homepage.com.util.service.impl;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("comCodeMapper")
public interface ComCodeMapper {
	
	// 상담신청구분
	List<?> selectCnsReqList();
	// 센터구분
	List<?> selectCenterGbList();
	// 권역구분
	List<?> selectZoneGbList();
	// 상담구분
	List<?> selectCnsGbList();
	// 학력
	List<?> selectEduList(); 
	// 주거형태
	List<?> selectLivgList();
	// 주택형태
	List<?> selectHouseList();
	// 동거형태
	List<?> selectLiveList();
	// 상담자구분
	List<?> selectCnsrGbList();
	// 상담경위
	List<?> selectCnsDtlList();
	// 노인과의 관계
	List<?> selectOlderRelList(); 
	// 결혼상태
	List<?> selectMerrStatList(); 
	// 주요문제
	List<?> selectMajorProbList();
	// 상담진행상태
	List<?> selectCnsStatList();
	// 지역구분
	List<?> selectLocalGbList();
	// 주호소문제
	List<?> selectMajorApplList();
	
}
