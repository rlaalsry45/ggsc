/*
 * Copyright 2011 MOPAS(Ministry of Public Administration and Security).
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
package egovframework.user.mypage.service.impl;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.user.mypage.service.MypageDefaultVO;
import egovframework.user.mypage.service.MypageVO;

/**
 * sample에 관한 데이터처리 매퍼 클래스
 *
 * @author  표준프레임워크센터
 * @since 2014.01.24
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *          수정일          수정자           수정내용
 *  ----------------    ------------    ---------------------------
 *   2014.01.24        표준프레임워크센터          최초 생성
 *
 * </pre>
 */
@Mapper("mypageMapper")
public interface MypageMapper {

	
	/** 신탁계약 - 위탁자 정보조회 */
	int regDataSch1(MypageDefaultVO searchVO);
	
	/** 신탁계약 - 수탁자 정보조회 */
	int regDataSch2(MypageDefaultVO searchVO);
	
	/** 신탁계약 - 수익자 정보조회 */
	int regDataSch3(MypageDefaultVO searchVO);
	
	/** 의료요양지시서 - 작성자 정보조회 */
	int regDataSch4(MypageDefaultVO searchVO);
	
	
	
	/**  신탁계약 - 위탁자 정보조회  */
	List<?> mypageList1(MypageDefaultVO searchVO) throws Exception;
	
	/**  신탁계약 - 수탁자 정보조회  */
	List<?> mypageList2(MypageDefaultVO searchVO) throws Exception;
	
	/**  신탁계약 - 수익자 정보조회  */
	List<?> mypageList3(MypageDefaultVO searchVO) throws Exception;
	
	/**  의료요양지시서 - 작성자 정보조회  */
	List<?> mypageList4(MypageDefaultVO searchVO) throws Exception;
	
	
	
	
	
	/** 마이페이지 회원 상세정보를 조회한다. */
	MypageVO selectMypageInfo(MypageVO vo) throws Exception;
	
	
	
	/**
	 * 마이페이지 지시서 목록을 조회
	 */
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
	void insertMypage(MypageVO vo) throws Exception;
	
	
	/**
	 * 회원정보 등록하기
	 * @param param
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
	 */
	int mypageReportMaxNum(MypageVO mypageVO);
	
	
	
	/**
	 * 요양지시서- 감독기록 업로드
	 */
	void mypageReportUpload(MypageVO vo) throws Exception;
	
	
	
	
	
	
	
	
	
}
