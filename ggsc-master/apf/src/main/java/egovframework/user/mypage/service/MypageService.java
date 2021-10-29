/*
 * Copyright 2008-2009 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package egovframework.user.mypage.service;

import java.util.List;


/**
 * @Class Name : EgovSampleService.java
 * @Description : EgovSampleService Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2009.03.16           최초생성
 *
 * @author 개발프레임웍크 실행환경 개발팀
 * @since 2009. 03.16
 * @version 1.0
 * @see
 *
 *  Copyright (C) by MOPAS All right reserved.
 */
public interface MypageService {

	
	/** 신탁계약 - 위탁자 정보조회 */	 
	int regDataSch1(MypageDefaultVO searchVO);
	
	/** 신탁계약 - 수탁자 정보조회 */	 
	int regDataSch2(MypageDefaultVO searchVO);
	
	/** 신탁계약 - 수익자 정보조회 */	 
	int regDataSch3(MypageDefaultVO searchVO);
	
	/** 의료요양지시서 - 작성자 정보조회 */	 
	int regDataSch4(MypageDefaultVO searchVO);
	
	
	/**  신탁계약 - 위탁자 정보조회 */
	List<?> mypageList1(MypageDefaultVO searchVO) throws Exception;
	
	/**  신탁계약 - 수탁자 정보조회 */
	List<?> mypageList2(MypageDefaultVO searchVO) throws Exception;
	
	/**  신탁계약 - 수익자 정보조회 */
	List<?> mypageList3(MypageDefaultVO searchVO) throws Exception;
	
	/**  의료요양지시서 - 작성자 정보조회 */
	List<?> mypageList4(MypageDefaultVO searchVO) throws Exception;
	
	
	
	
	/** 마이페이지 회원정보를 조회한다. */
	MypageVO selectMypageInfo(MypageVO vo) throws Exception;
	
	
	/** * 마이페이지 지시서 목록을 조회 */
	List<?> mypageList(MypageDefaultVO searchVO) throws Exception;
	
	/**
	 * 마이페이지 지시서 목록 총수를 조회
	 */
	int mypageListTotCnt(MypageDefaultVO searchVO);
	
	
	/**
	 * 마이페이지 -> 회원 지시서 등록이력 상세정보 조회
	 */
	MypageVO selectMyHistView(MypageVO vo) throws Exception;
	
	
	
	/**
	 * 글을 등록한다.
	 * @param vo - 등록할 정보가 담긴 SampleVO
	 * @return 등록 결과
	 * @exception Exception
	 */
	String insertMypage(MypageVO vo) throws Exception;
	
	
	/**
	 * 회원정보 등록하기
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public int insertMemberReg(MypageVO mypageVO) throws Exception;
	
	void insertData(MypageVO mypageVO) throws Exception;
	
	
	/**
	 * 사전의료요양지시서 업로드된 보고서 조회
	 */
	List<?> schUploadRptMypage(MypageVO mypageVO) throws Exception;
	
	
	/**
	 * 요양지시서- 보고서 업로드
	 */
	void mypageCdRptUpload(MypageVO vo) throws Exception;
	
	
	/**
	 * 사전의료요양지시서 업로드된 감독기록 조회
	 */
	List<?> schReportMypage(MypageVO mypageVO) throws Exception;
	
	
	/**  
	 * 감독기록 증빙자료 업로그 일련번호 조회
	 * */	 
	int mypageReportMaxNum(MypageVO mypageVO);
	
	
	/**
	 * 요양지시서- 감독기록 업로드
	 */
	void mypageReportUpload(MypageVO vo) throws Exception;
	
	

}
