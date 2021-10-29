package egovframework.homepage.com.util.service;

import java.util.List;

public interface ComCodeService {
	
	// 상담신청구분
	List<?> selectCnsReqList() throws Exception;
	// 센터구분
	List<?> selectCenterGbList() throws Exception;
	// 권역구분
	List<?> selectZoneGbList() throws Exception;
	// 상담구분
	List<?> selectCnsGbList() throws Exception;
	// 학력
	List<?> selectEduList() throws Exception;
	// 주거형태
	List<?> selectLivgList() throws Exception;
	// 주택형태
	List<?> selectHouseList() throws Exception;
	// 동거형태
	List<?> selectLiveList() throws Exception;
	// 상담자구분
	List<?> selectCnsrGbList() throws Exception;
	// 상담경위
	List<?> selectCnsDtlList() throws Exception;
	// 노인과의 관계
	List<?> selectOlderRelList() throws Exception;
	// 결혼상태
	List<?> selectMerrStatList() throws Exception;
	// 주요문제
	List<?> selectMajorProbList() throws Exception;
	// 상담진행상태
	List<?> selectCnsStatList() throws Exception;
	// 지역구분
	List<?> selectLocalGbList() throws Exception;
	// 주호소문제
	List<?> selectMajorApplList() throws Exception;
}