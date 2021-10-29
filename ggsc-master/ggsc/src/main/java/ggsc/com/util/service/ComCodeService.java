package ggsc.com.util.service;

import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface ComCodeService {

	/**
	 * 공통 코드 테이블에서 콤보 박스 데이터를 가져오는 함수(사업장코드, 품목 코드 등등)
	 * 
	 * @param vo comGbCd 값을 넣어서 조회하는 파라미터
	 * @return EgovMap을 리턴( 키 명 : comCd, comNm ) @
	 */
	public List<?> selectComCodeList(ComCodeVO vo);

	/**
	 * 공통 코드 테이블에서 데이터를 가져오는 함수(사업장코드, 품목 코드 등등)
	 * 
	 * @param vo comGbCd, comCd 값을 넣어서 조회하는 파라미터
	 * @return EgovMap을 리턴( 키 명 : comCd, comNm ) @
	 */
	public EgovMap getComCode(ComCodeVO vo);

	/**
	 * 현재날짜를 문자열로 변환하여 가져오는 함수
	 * 
	 * @param vo pbCd 값을 넣어서 조회하는 파라미터
	 * @return 날짜 형식 : yyyy-MM-dd 형식으로 추출 @
	 */
	public String selectCurrentDay(ComCodeVO vo);

	/**
	 * 현재날짜를 문자열로 변환하여 검색에 사용하는 함수
	 * 
	 * @param vo pbCd 값을 넣어서 조회하는 파라미터
	 * @return 날짜 형식 : yyyyMMdd 형식으로 추출 @
	 */
	public String selectCurrentDate(ComCodeVO vo);

	/**
	 * 권한 그룹에 따른 권한 코드를 가져오는 함수
	 * 
	 * @return EgovMap을 리턴( 키 명 : authCd, authNm ) @
	 */
	public List<?> selectAuthList(ComCodeVO vo);

	/**
	 * 부서에 따른 직급 정보를 가져오는 함수
	 * 
	 * @return EgovMap을 리턴( 키 명 : posiCd, posiNm ) @
	 */
	public List<?> selectPosiList(ComCodeVO vo);

	/**
	 * 업체 정보를 가져오는 함수
	 * 
	 * @return EgovMap을 리턴( 키 명 : custCd, custNm ) @
	 */
	public List<?> selectCustList(ComCodeVO vo);

	/**
	 * 계정 정보를 가져오는 함수
	 * 
	 * @return EgovMap을 리턴( 키 명 : userId, userNm ) @
	 */
	public List<?> selectUserList(ComCodeVO vo);

	/**
	 * 상위부서 정보를 가져오는 함수
	 * 
	 * @return EgovMap을 리턴( 키 명 : categoryCd, categoryNm ) @
	 */
	public Object selectDeptUpList(ComCodeVO vo);

	/**
	 * 부서 정보를 가져오는 함수
	 * 
	 * @return EgovMap을 리턴( 키 명 : categoryCd, categoryNm ) @
	 */
	public Object selectDeptList(ComCodeVO vo);

	/**
	 * 직위 정보를 가져오는 함수
	 * 
	 * @return EgovMap을 리턴( 키 명 : jicwiId, jicwiName ) @
	 */
	public Object selectJicwiList();

	/**
	 * 부서 리스트를 가져오는 함수
	 * 
	 * @return List를 리턴( 부서리스트 ) @
	 */
	public Object selectPopupDeptList();

	/**
	 * 코드그룹 리스트를 가져오는 함수
	 * 
	 * @return List를 리턴( GROUP BY COM_GRP ) @
	 */
	public Object selectComGrpList();

	public EgovMap getDeptList();

	public EgovMap getWeekCntInfo(EgovMap paramMap);

	// 지역구분 정보 가져오는 함수
	public List<?> selectAreaList();

	// 센터구분 정보 가져오는 함수
	public List<?> selectCenterGbList();

	// 권역구분 정보 가져오는 함수
	public List<?> selectZoneGbList();

	// 상담구분 정보 가져오는 함수
	public List<?> selectCnsGbList();

}
