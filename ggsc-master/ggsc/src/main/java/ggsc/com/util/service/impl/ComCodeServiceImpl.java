package ggsc.com.util.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import ggsc.com.util.service.ComCodeService;
import ggsc.com.util.service.ComCodeVO;

@Service("comCodeService")
public class ComCodeServiceImpl extends EgovAbstractServiceImpl implements ComCodeService {

	@Resource(name = "comCodeDAO")
	private ComCodeDAO comCodeDAO;

	@Override
	public String selectCurrentDay(ComCodeVO vo) {
		// TODO Auto-generated method stub
		return comCodeDAO.selectCurrentDay(vo);
	}

	@Override
	public String selectCurrentDate(ComCodeVO vo) {
		// TODO Auto-generated method stub
		return comCodeDAO.selectCurrentDate(vo);
	}

	@Override
	public List<?> selectAuthList(ComCodeVO vo) {
		return comCodeDAO.selectAuthList(vo);
	}

	@Override
	public List<?> selectPosiList(ComCodeVO vo) {
		// TODO Auto-generated method stub
		return comCodeDAO.selectPosiList(vo);
	}

	@Override
	public List<?> selectCustList(ComCodeVO vo) {
		// TODO Auto-generated method stub
		return comCodeDAO.selectCustList(vo);
	}

	@Override
	public List<?> selectComCodeList(ComCodeVO vo) {
		// TODO Auto-generated method stub
		return comCodeDAO.selectComCodeList(vo);
	}

	@Override
	public EgovMap getComCode(ComCodeVO vo) {
		// TODO Auto-generated method stub
		return (EgovMap) comCodeDAO.getComCode(vo);
	}

	@Override
	public List<?> selectUserList(ComCodeVO vo) {
		// TODO Auto-generated method stub
		return comCodeDAO.selectUserList(vo);
	}

	@Override
	public Object selectDeptList(ComCodeVO vo) {
		// TODO Auto-generated method stub
		return comCodeDAO.selectDeptList(vo);
	}

	@Override
	public Object selectDeptUpList(ComCodeVO vo) {
		// TODO Auto-generated method stub
		return comCodeDAO.selectDeptUpList(vo);
	}

	@Override
	public List<?> selectJicwiList() {
		return comCodeDAO.selectJicwiList();
	}

	@Override
	public Object selectPopupDeptList() {
		return comCodeDAO.selectPopupDeptList();
	}

	@Override
	public List<?> selectComGrpList() {
		return comCodeDAO.selectComGrpList();
	}

	@Override
	public EgovMap getDeptList() {
		EgovMap resultMap = new EgovMap();
		ComCodeVO vo = new ComCodeVO();
		List<EgovMap> detpUpList = (List<EgovMap>) selectDeptUpList(vo);
		resultMap.put("deptUpList", detpUpList);
		for (int i = 0; i < detpUpList.size(); i++) {
			String deptId = String.valueOf(detpUpList.get(i).get("deptId"));
			vo.setDeptId(deptId);
			resultMap.put(deptId, selectDeptList(vo));
		}
		return resultMap;
	}

	@Override
	public EgovMap getWeekCntInfo(EgovMap paramMap) {
		return comCodeDAO.getWeekCntInfo(paramMap);
	}

	// 지역구분 가져오는 함수
	@Override
	public List<?> selectAreaList() {
		return comCodeDAO.selectAreaList();
	}

	// 센터구분 정보 가져오는 함수
	public List<?> selectCenterGbList() {
		return comCodeDAO.selectCenterGbList();
	}

	// 권역구분 정보 가져오는 함수
	public List<?> selectZoneGbList() {
		return comCodeDAO.selectZoneGbList();
	}

	// 상담구분 정보 가져오는 함수
	public List<?> selectCnsGbList() {
		return comCodeDAO.selectCnsGbList();
	}

}
