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
package egovframework.user.reg.service.impl;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.user.notice.service.NotVO;
import egovframework.user.reg.service.RegVO;

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
@Mapper("regMapper")
public interface RegMapper {

	/**
	 * 등록안내 파일 정보를 조회한다.
	 */
	NotVO selectRegView(NotVO vo) throws Exception;
	
	
	/**
	 * 글을 등록한다.
	 */
	void insertReg(RegVO vo) throws Exception;
	
	
	/**
	 * 요양지시서 등록정보 중복체크
	 */
	int schIdDupCheck(RegVO vo) throws Exception;
	
	
	/**
	 * 요양지시서 - 관리번호 MAX+1 정보 가져오기
	 */
	String selectMaxMngNo(RegVO vo) throws Exception;
	
	
	/**
	 * 요양지시서- 작성자 및 기타 정보 등록
	 */
	void witrInfoInsert(RegVO vo) throws Exception;
	
		
	
	/**
	 * 요양지시서- 제1대리인 일련번호 가져오기
	 */
	int selectRpt1_num(RegVO vo) throws Exception;
	
	
	
	/**
	 * 요양지시서- 제1대리인 정보 등록
	 */
	void rpt1InfoInsert(RegVO vo) throws Exception;
	
	
	/**
	 * 요양지시서- 제2대리인 일련번호 가져오기
	 */
	int selectRpt2_num(RegVO vo) throws Exception;
	
	/**
	 * 요양지시서- 제2대리인 정보 등록
	 */
	void rpt2InfoInsert(RegVO vo) throws Exception;
	
	/**
	 * 요양지시서 - 첨부파일 업로드
	 */
	void cdFileUpload(RegVO vo) throws Exception;
	
	
	
	
	/**
	 * 신탁계약서 등록정보 중복체크
	 */
	int schTrstIdDupCheck(RegVO vo) throws Exception;
	
	
	/**
	 * 신탁계약서 - 관리번호 MAX+1 정보 가져오기
	 */
	String selectTrstMaxMngNo(RegVO vo) throws Exception;
	
	/**
	 * 신탁계약서- 정보 등록
	 */
	void witrTrstInfoInsert(RegVO vo) throws Exception;
	
	/**
	 * 신탁계약서 - 첨부파일 업로드
	 */
	void trstFileUpload(RegVO vo) throws Exception;
	
	
	
}
