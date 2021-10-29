package egovframework.homepage.mypage.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.homepage.mypage.service.HomepageMypageService;
import egovframework.homepage.mypage.service.MypageVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("homepageMypageService")
public class HomepageMypageServiceImpl extends EgovAbstractServiceImpl implements HomepageMypageService {

	private static final Logger LOGGER = LoggerFactory.getLogger(HomepageMypageServiceImpl.class);
	
	/** SampleDAO */
	// TODO ibatis 사용
	@Resource(name = "homepageMypageMapper")
	private HomepageMypageMapper homepageMypageMapper;
	// TODO mybatis 사용
	//  @Resource(name="sampleMapper")
	//	private SampleMapper sampleDAO;
	
	// 마이페이지 최근상담내역
	public EgovMap getMypageRecCns(MypageVO vo) {
		return homepageMypageMapper.getMypageRecCns(vo);
	}
	
	// 상담이력 목록
	public List<EgovMap> getMypageCnsHisList(MypageVO vo) {
		return homepageMypageMapper.getMypageCnsHisList(vo);
	}
	
	// 마이페이지 상세보기
	public EgovMap getMypageRecCnsDtl(MypageVO vo) {
		return homepageMypageMapper.getMypageRecCnsDtl(vo);
	}
	
}