package egovframework.homepage.psyCns.service.impl;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.homepage.psyCns.service.HomepagePsyCnsService;
import egovframework.homepage.psyCns.service.PsyCnsDocVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("homepagePsyCnsService")
public class HomepagePsyCnsServiceImpl extends EgovAbstractServiceImpl implements HomepagePsyCnsService {

	private static final Logger LOGGER = LoggerFactory.getLogger(HomepagePsyCnsServiceImpl.class);
	
	/** SampleDAO */
	// TODO ibatis 사용
	@Resource(name = "homepagePsyCnsMapper")
	private HomepagePsyCnsMapper homepagePsyCnsMapper;
	// TODO mybatis 사용
	//  @Resource(name="sampleMapper")
	//	private SampleMapper sampleDAO;
	
	// DUKE-AD 등록 ajax
	public void insertPsyDukeDoc(PsyCnsDocVO vo) {
		homepagePsyCnsMapper.insertPsyDukeDoc(vo);
	}
	
	// GDS-SI 등록 ajax
	public void insertPsyGdsDoc(PsyCnsDocVO vo) {
		homepagePsyCnsMapper.insertPsyGdsDoc(vo);
	}
	
	// 불안척도 등록 ajax
	public void insertPsyAnxiDoc(PsyCnsDocVO vo) {
		homepagePsyCnsMapper.insertPsyAnxiDoc(vo);
	}
	
	// 대인관계변화척도 등록 ajax
	public void insertPsyPerRelDoc(PsyCnsDocVO vo) {
		homepagePsyCnsMapper.insertPsyPerRelDoc(vo);
	}
	
	// 사별스트레스척도 등록 ajax
	public void insertPsyBereavDoc(PsyCnsDocVO vo) {
		homepagePsyCnsMapper.insertPsyBereavDoc(vo);
	}
	
}