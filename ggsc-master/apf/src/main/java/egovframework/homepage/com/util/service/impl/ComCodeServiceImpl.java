package egovframework.homepage.com.util.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.homepage.com.util.service.ComCodeService;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("comCodeService")
public class ComCodeServiceImpl extends EgovAbstractServiceImpl implements ComCodeService {

	private static final Logger LOGGER = LoggerFactory.getLogger(ComCodeServiceImpl.class);
	
	/** SampleDAO */
	// TODO ibatis 사용
	@Resource(name = "comCodeMapper")
	private ComCodeMapper comCodeMapper;
	// TODO mybatis 사용
	//  @Resource(name="sampleMapper")
	//	private SampleMapper sampleDAO;
	
	// 상담신청구분
	@Override
	public List<?> selectCnsReqList(){
		try {
			return comCodeMapper.selectCnsReqList();
		} catch (Exception err) {
			// TODO Auto-generated catch block
			utility.func.Logging(this.getClass().getName(), err);
			return null;
		}
	}
	// 센터구분/////////
	@Override
	public List<?> selectCenterGbList(){
		try {
			return comCodeMapper.selectCenterGbList();
		} catch (Exception err) {
			// TODO: handle exception
			utility.func.Logging(this.getClass().getName(), err);
			return null;
		}
	}
	// 권역구분/////////
	@Override
	public List<?> selectZoneGbList(){
		try {
			return comCodeMapper.selectZoneGbList();
		} catch (Exception err) {
			// TODO: handle exception
			utility.func.Logging(this.getClass().getName(), err);
			return null;
		}
	}
	// 상담구분//////////
	@Override
	public List<?> selectCnsGbList(){
		try {
			return comCodeMapper.selectCnsGbList();
		} catch (Exception err) {
			utility.func.Logging(this.getClass().getName(), err);
			return null;
		}
	}
	
	// 학력///////////
	@Override
	public List<?> selectEduList(){
		try {
			return comCodeMapper.selectEduList();
		} catch (Exception err) {
			utility.func.Logging(this.getClass().getName(), err);
			return null;
		}
	}
	// 주거형태//////////
	@Override
	public List<?> selectLivgList(){
		try {
			return comCodeMapper.selectLivgList();
		} catch (Exception err) {
			utility.func.Logging(this.getClass().getName(), err);
			return null;
		}
	}
	// 주택형태//////////
	@Override
	public List<?> selectHouseList(){
		try {
			return comCodeMapper.selectHouseList();
		} catch (Exception err) {
			// TODO: handle exception
			utility.func.Logging(this.getClass().getName(), err);
			return null;
		}
	}
	// 동거형태///////////
	@Override
	public List<?> selectLiveList(){
		try {
			return comCodeMapper.selectLiveList();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			utility.func.Logging(this.getClass().getName(), e);
			return null;
		}
	}
	// 상담자구분///////////
	@Override
	public List<?> selectCnsrGbList(){
		try {
			return comCodeMapper.selectCnsrGbList();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			utility.func.Logging(this.getClass().getName(), e);
			return null;

		}
	}
	// 상담경위
	@Override
	public List<?> selectCnsDtlList(){
		return comCodeMapper.selectCnsDtlList();
	}
	// 노인과의 관계/////////
	@Override
	public List<?> selectOlderRelList(){
		try {
			return comCodeMapper.selectOlderRelList();
		} catch (Exception e) {
			utility.func.Logging(this.getClass().getName(), e);
			return null;

		}
	}
	// 결혼상태//////////
	@Override
	public List<?> selectMerrStatList(){
		try {
			return comCodeMapper.selectMerrStatList();
		} catch (Exception e) {
			utility.func.Logging(this.getClass().getName(), e);
			return null;

		}
	}
	// 주요문제//////////
	@Override
	public List<?> selectMajorProbList(){
		try {
			return comCodeMapper.selectMajorProbList();
		} catch (Exception e) {
			utility.func.Logging(this.getClass().getName(), e);
			return null;

		}
	}
	
	// 상담진행상태/////////
	@Override
	public List<?> selectCnsStatList(){
		try {
			return comCodeMapper.selectCnsStatList();
		} catch (Exception e) {
			utility.func.Logging(this.getClass().getName(), e);
			return null;

		}
	}
	
	// 지역구분////
	@Override
	public List<?> selectLocalGbList() throws Exception {
		try {
			return comCodeMapper.selectLocalGbList();
		} catch (Exception e) {
			utility.func.Logging(this.getClass().getName(), e);
			return null;

		}
	}
	
	// 주호소문제////////
	@Override
	public List<?> selectMajorApplList() throws Exception {
		try {
			return comCodeMapper.selectMajorApplList();
		} catch (Exception e) {
			utility.func.Logging(this.getClass().getName(), e);
			return null;

		}
	}
	
}