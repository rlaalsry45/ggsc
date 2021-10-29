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
package egovframework.user.main.service.impl;

import java.util.List;
import java.util.Map;

import egovframework.user.main.service.EgovMainService;
import egovframework.user.main.service.LoginVO;
import egovframework.user.main.service.MainDefaultVO;
import egovframework.user.main.service.MainVO;
import egovframework.user.mypage.service.MypageVO;
import egovframework.user.notice.service.NotDefaultVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

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

@Service("mainService")
public class EgovMainServiceImpl extends EgovAbstractServiceImpl implements EgovMainService {

	private static final Logger LOGGER = LoggerFactory.getLogger(EgovMainServiceImpl.class);

	/** SampleDAO */
	// TODO ibatis 사용
	@Resource(name = "mainMapper")
	private MainMapper mainMapper; 
	// TODO mybatis 사용
	//  @Resource(name="sampleMapper")
	//	private SampleMapper sampleDAO;

	/** ID Generation */
	@Resource(name = "egovIdGnrService")
	private EgovIdGnrService egovIdGnrService;

	
	
	/**
	 * 메인페이지에 노출될 공지사항 리스트 조회
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 글 목록
	 * @exception Exception
	 */
	@Override
	public List<?> selectMainList(MainDefaultVO searchVO) throws Exception {
		return mainMapper.selectMainList(searchVO);
	}
	
	

	public LoginVO selectLoginInfo(LoginVO vo){
		try {
			return mainMapper.selectLoginInfo(vo);
		} catch (Exception e) {
			utility.func.Logging(this.getClass().getName(), e);
			return null;

		}
	}


	
	
	@Override
	public int insertJoin(Map<String, Object> param){
		// TODO Auto-generated method stub
		int ret = 0;
		try{
			mainMapper.insertJoin(param);
			mainMapper.insertJoin(param);
		}catch(Exception e){
			utility.func.Logging(this.getClass().getName(), e);
			return 1;

		}
		return ret;
	}
	
	@Override
	public int insertUsrInfoData(MypageVO mypageVO) {
		// TODO Auto-generated method stub
		int ret = 0;
		try{
			
			mainMapper.insertUsrInfoData(mypageVO);
			
		}catch(Exception e){
			utility.func.Logging(this.getClass().getName(), e);
			return 1;

		}
		return ret;
	}
	

}
