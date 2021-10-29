package egovframework.homepage.cnsAsk.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.homepage.cnsAsk.service.CnsAskVO;
import egovframework.homepage.cnsAsk.service.HomepageCnsAskService;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("homepageCnsAskService")
public class HomepageCnsAskServiceImpl extends EgovAbstractServiceImpl implements HomepageCnsAskService {

	private static final Logger LOGGER = LoggerFactory.getLogger(HomepageCnsAskServiceImpl.class);
	
	/** SampleDAO */
	// TODO ibatis 사용
	@Resource(name = "homepageCnsAskMapper")
	private HomepageCnsAskMapper homepageCnsAskMapper;
	// TODO mybatis 사용
	//  @Resource(name="sampleMapper")
	//	private SampleMapper sampleDAO;
	
	// 상담문의하기
	public List<EgovMap> getCnsAskList(CnsAskVO vo) {
		return homepageCnsAskMapper.getCnsAskList(vo);
	}
	
	// 상담문의 등록
	public void getCnsAskReg(CnsAskVO vo) {
		homepageCnsAskMapper.getCnsAskReg(vo);
	}
	
	
}