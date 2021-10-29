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
package egovframework.user.about.service.impl;

import java.util.List;

import egovframework.user.about.service.AboutService;
import egovframework.user.about.service.AboutDefaultVO;
import egovframework.user.about.service.AboutVO;
import egovframework.user.notice.service.NotVO;
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

@Service("aboutService")
public class AboutServiceImpl extends EgovAbstractServiceImpl implements AboutService {

	private static final Logger LOGGER = LoggerFactory.getLogger(AboutServiceImpl.class);

	/** SampleDAO */
	// TODO ibatis 사용
	@Resource(name = "aboutMapper")
	private AboutMapper aboutMapper;
	// TODO mybatis 사용
	//  @Resource(name="sampleMapper")
	//	private SampleMapper sampleDAO;

	/** ID Generation */
	@Resource(name = "egovIdGnrService")
	private EgovIdGnrService egovIdGnrService;

	/**
	 * 글을 등록한다.
	 * @param vo - 등록할 정보가 담긴 SampleVO
	 * @return 등록 결과
	 * @exception Exception
	 */
	@Override
	public String insertAbout(AboutVO vo){
		LOGGER.debug(vo.toString());

		try {
			/** ID Generation Service */
			String id = egovIdGnrService.getNextStringId();
			vo.setId(id);
			LOGGER.debug(vo.toString());
			aboutMapper.insertAbout(vo);
			return id;
		} catch (Exception e) {
			utility.func.Logging(this.getClass().getName(), e);
			return null;

		}
	}

}
