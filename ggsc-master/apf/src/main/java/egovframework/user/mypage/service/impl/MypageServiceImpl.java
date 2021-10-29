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
package egovframework.user.mypage.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.user.mypage.service.MypageDefaultVO;
import egovframework.user.mypage.service.MypageService;
import egovframework.user.mypage.service.MypageVO;

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

@Service("mypageService")
public class MypageServiceImpl extends EgovAbstractServiceImpl implements MypageService {

	//private static final Logger LOGGER = LoggerFactory.getLogger(MypageServiceImpl.class);

	/** SampleDAO */
	// TODO ibatis 사용
	@Resource(name = "mypageMapper")
	private MypageMapper mypageMapper;
	// TODO mybatis 사용
	//  @Resource(name="sampleMapper")
	//	private SampleMapper sampleDAO;

	/** ID Generation */
	@Resource(name = "egovIdGnrService")
	private EgovIdGnrService egovIdGnrService;

	
	
	
	/** 신탁계약 - 위탁자 정보조회  */
	@Override
	public int regDataSch1(MypageDefaultVO searchVO) {
		return mypageMapper.regDataSch1(searchVO);
	}
	
	/** 신탁계약 - 수탁자 정보조회  */
	@Override
	public int regDataSch2(MypageDefaultVO searchVO) {
		return mypageMapper.regDataSch2(searchVO);
	}
	
	/** 신탁계약 - 수익자 정보조회  */
	@Override
	public int regDataSch3(MypageDefaultVO searchVO) {
		return mypageMapper.regDataSch3(searchVO);
	}
	
	/** 의료요양지시서 - 작성자 정보조회  */
	@Override
	public int regDataSch4(MypageDefaultVO searchVO) {
		return mypageMapper.regDataSch4(searchVO);
	}
	
	
	
	/**  신탁계약 - 위탁자 정보조회  */
	@Override
	public List<?> mypageList1(MypageDefaultVO searchVO) throws Exception {
		return mypageMapper.mypageList1(searchVO);
	}
	
	/**  신탁계약 - 수탁자 정보조회  */
	@Override
	public List<?> mypageList2(MypageDefaultVO searchVO) throws Exception {
		return mypageMapper.mypageList2(searchVO);
	}
	
	/**  신탁계약 - 수익자 정보조회  */
	@Override
	public List<?> mypageList3(MypageDefaultVO searchVO) throws Exception {
		return mypageMapper.mypageList3(searchVO);
	}
	
	/**  의료요양지시서 - 작성자 정보조회회  */
	@Override
	public List<?> mypageList4(MypageDefaultVO searchVO) throws Exception {
		return mypageMapper.mypageList4(searchVO);
	}
	
	
	
	
	
	
	/**
	 * 마이페이지 회원 상세정보를 조회한다.
	 */
	@Override
	public MypageVO selectMypageInfo(MypageVO vo) throws Exception {
		MypageVO resultVO = mypageMapper.selectMypageInfo(vo);
		if (resultVO == null)
			throw processException("info.nodata.msg");
		return resultVO;
	}
	
	
	/**
	 * 마이페이지 지시서 목록을 조회
	 */
	@Override
	public List<?> mypageList(MypageDefaultVO searchVO) throws Exception {
		return mypageMapper.mypageList(searchVO);
	}
	
	/**
	 * 마이페이지 지시서 목록 총수를 조회
	 */
	@Override
	public int mypageListTotCnt(MypageDefaultVO searchVO) {
		return mypageMapper.mypageListTotCnt(searchVO);
	}
	
	
	/**
	 * 마이페이지 -> 회원 지시서 등록이력 상세정보 조회
	 */
	@Override
	public MypageVO selectMyHistView(MypageVO vo) throws Exception {
		MypageVO resultVO = mypageMapper.selectMyHistView(vo);
		if (resultVO == null)
			throw processException("info.nodata.msg");
		return resultVO;
	}
	
	
	
	/**
	 * 글을 등록한다.
	 * @param vo - 등록할 정보가 담긴 SampleVO
	 * @return 등록 결과
	 * @exception Exception
	 */
	@Override
	public String insertMypage(MypageVO vo){
		//LOGGER.debug(vo.toString());

		try {
			/** ID Generation Service */
			String id = egovIdGnrService.getNextStringId();
			vo.setId(id);
			//LOGGER.debug(vo.toString());
			mypageMapper.insertMypage(vo);
			return id;
		} catch (Exception e) {
			utility.func.Logging(this.getClass().getName(), e);
			return null;

		}
	}
	
	/**
	 * 회원정보 등록하기
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@Override
	public int insertMemberReg(MypageVO mypageVO){
		// TODO Auto-generated method stub
		System.out.println("------------  MypageServiceImpl Start   ----------------");
		int ret = 0;
		try{
			
			mypageMapper.insertMemberReg(mypageVO);
			
		}catch(Exception e){
			utility.func.Logging(this.getClass().getName(), e);
			return 1;

		}
		return ret;
	}
	
	@Override
	
	public void insertData(MypageVO mypageVO) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("------------  MypageServiceImpl Start   ----------------");
		
			
			mypageMapper.insertData(mypageVO);
		
	}
	
	/**
	 * 사전의료요양지시서 업로드된 보고서 조회
	 */
	@Override
	public List<?> schUploadRptMypage(MypageVO vo){
		
		try {
			return mypageMapper.schUploadRptMypage(vo);
		} catch (Exception e) {
			utility.func.Logging(this.getClass().getName(), e);
			return null;

		}
	}
	
	/**
	 * 요양지시서- 보고서 업로드
	 */
	@Override
	public void mypageCdRptUpload(MypageVO vo) throws Exception {
		mypageMapper.mypageCdRptUpload(vo);
	}
	
	
	/**
	 * 사전의료요양지시서 업로드된 감독기록 조회
	 */
	@Override
	public List<?> schReportMypage(MypageVO vo) throws Exception {
		
		return mypageMapper.schReportMypage(vo);
	}
	
	
	
	
	/** 
	 * 감독기록 증빙자료 업로그 일련번호 조회
	 */
	@Override
	public int mypageReportMaxNum(MypageVO vo) {
		return mypageMapper.mypageReportMaxNum(vo);
	}
	
	
	/**
	 * 요양지시서- 감독기록 업로드
	 */
	@Override
	public void mypageReportUpload(MypageVO vo) throws Exception {
		mypageMapper.mypageReportUpload(vo);
	}
	
	
	
	

}
