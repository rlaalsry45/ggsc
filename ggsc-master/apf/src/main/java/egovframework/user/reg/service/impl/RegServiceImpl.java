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
package egovframework.user.reg.service.impl;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.user.notice.service.NotVO;
import egovframework.user.reg.service.RegService;
import egovframework.user.reg.service.RegVO;

/**
 * @Class Name : EgovSampleServiceImpl.java
 * @Description : Sample Business Implement Class
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

@Service("regService")
public class RegServiceImpl extends EgovAbstractServiceImpl implements RegService {

	private static final Logger LOGGER = LoggerFactory.getLogger(RegServiceImpl.class);

	/** SampleDAO */
	// TODO ibatis 사용
	@Resource(name = "regMapper")
	private RegMapper regMapper;
	// TODO mybatis 사용
	//  @Resource(name="sampleMapper")
	//	private SampleMapper sampleDAO;

	/** ID Generation */
	@Resource(name = "egovIdGnrService")
	private EgovIdGnrService egovIdGnrService;

	
	
	/**
	 * 등록안내 파일 정보를 조회한다.
	 */
	@Override
	public NotVO selectRegView(NotVO vo) throws Exception {
		NotVO resultVO = regMapper.selectRegView(vo);
		if (resultVO == null)
			throw processException("info.nodata.msg");
		return resultVO;
	}
	
	
	/**
	 * 글을 등록한다.
	 */
	@Override
	public String insertReg(RegVO vo) throws Exception {
		LOGGER.debug(vo.toString());

		/** ID Generation Service */
		String id = egovIdGnrService.getNextStringId();
		vo.setId(id);
		LOGGER.debug(vo.toString());

		regMapper.insertReg(vo);
		return id;
	}
	
	/**
	 * 요양지시서 등록정보 중복체크
	 */
	@Override
	public int schIdDupCheck(RegVO vo) throws Exception {
		
		int tmpMngNo = regMapper.schIdDupCheck(vo);
		return tmpMngNo;
	}
	
	
	/**
	 * 요양지시서 - 관리번호 MAX+1 정보 가져오기
	 */
	@Override
	public String selectMaxMngNo(RegVO vo) throws Exception {
		
		String tmpMngNo = regMapper.selectMaxMngNo(vo);
		return tmpMngNo;
	}
	
	
	
	/**
	 * 요양지시서- 작성자 정보 등록
	 */
	@Override
	public void witrInfoInsert(RegVO vo) throws Exception {
		regMapper.witrInfoInsert(vo);
	}
	
	
	/**
	 * 요양지시서- 제1대리인 일련번호 가져오기
	 */
	@Override
	public int selectRpt1_num(RegVO vo) throws Exception {
		
		int tmpMngNo = regMapper.selectRpt1_num(vo);
		return tmpMngNo;
	}
	
	
	/**
	 * 요양지시서- 제1대리인 정보 등록
	 */
	@Override
	public void rpt1InfoInsert(RegVO vo) throws Exception {
		regMapper.rpt1InfoInsert(vo);
	}
	
	
	
	/**
	 * 요양지시서- 제2대리인 일련번호 가져오기
	 */
	@Override
	public int selectRpt2_num(RegVO vo) throws Exception {
		
		int tmpMngNo = regMapper.selectRpt2_num(vo);
		return tmpMngNo;
	}
	
	
	/**
	 * 요양지시서- 제2대리인 정보 등록
	 */
	@Override
	public void rpt2InfoInsert(RegVO vo) throws Exception {
		regMapper.rpt2InfoInsert(vo);
	}
	
	
	/**
	 * 요양지시서 - 첨부파일 업로드 
	 */
	@Override
	public void cdFileUpload(RegVO vo) throws Exception {
		regMapper.cdFileUpload(vo);
	}
	
	
	
	
	
	/**
	 * 신탁계약서 등록정보 중복체크
	 */
	@Override
	public int schTrstIdDupCheck(RegVO vo) throws Exception {
		
		int tmpMngNo = regMapper.schTrstIdDupCheck(vo);
		return tmpMngNo;
	}
	
	
	
	/**
	 * 신탁계약서 - 관리번호 MAX+1 정보 가져오기
	 */
	@Override
	public String selectTrstMaxMngNo(RegVO vo) throws Exception {
		
		String tmpMngNo = regMapper.selectTrstMaxMngNo(vo);
		return tmpMngNo;
	}
	
	/**
	 * 신탁계약서- 정보 등록
	 */
	@Override
	public void witrTrstInfoInsert(RegVO vo) throws Exception {
		regMapper.witrTrstInfoInsert(vo);
	}
	
	/**
	 * 신탁계약서 - 첨부파일 업로드
	 */
	@Override
	public void trstFileUpload(RegVO vo) throws Exception {
		regMapper.trstFileUpload(vo);
	}
	
}
