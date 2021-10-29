package ams.adm.com.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import egovframework.rte.psl.dataaccess.util.EgovMap;
import ggsc.com.util.service.ComCodeVO;
import ggsc.com.util.service.impl.ComCodeDAO;

public class DeptConfUtil extends org.springframework.web.context.ContextLoaderListener {

	private static DeptConfUtil deptConfUtil;

	private ComCodeDAO comCodeDao;

	public ComCodeDAO getComCodeDAO() {
		return comCodeDao;
	}

	public void setComCodeDAO(ComCodeDAO comCodeDao) {
		this.comCodeDao = comCodeDao;
	}

	public static HashMap<String, List<EgovMap>> CODE_MAP_LVL2 = new HashMap<String, List<EgovMap>>(); // 상위부서
	public static HashMap<String, List<EgovMap>> CODE_MAP_LVL3 = new HashMap<String, List<EgovMap>>(); // 부서

	public DeptConfUtil() {
	}

	public static synchronized DeptConfUtil getInstance() {
		if (deptConfUtil == null) {
			deptConfUtil = new DeptConfUtil();
		}
		return deptConfUtil;
	}

	private void init() {
		ApplicationContext context = new ClassPathXmlApplicationContext("egovframework/spring/com/init-servlet.xml");
		comCodeDao = (ComCodeDAO) context.getBean("comCodeDAO");

		System.out.println("CODE LIST INIT START.............");

		makeCodeList();
	}

	@SuppressWarnings("unchecked")
	public synchronized void makeCodeList() {

		CODE_MAP_LVL2.clear();

		List<EgovMap> codeListLvl2 = (List<EgovMap>) comCodeDao.selectDeptUpList(new ComCodeVO());
		CODE_MAP_LVL2.put("list", codeListLvl2);

		for (EgovMap lvl2 : codeListLvl2) {
			ComCodeVO vo = new ComCodeVO();
			vo.setDeptId(String.valueOf(lvl2.get("deptId")));
			CODE_MAP_LVL3.put(String.valueOf(lvl2.get("deptId")), (List<EgovMap>) comCodeDao.selectDeptList(vo));
		}

	}

	public List<EgovMap> getCodeList(String codeValue, String type) {
		List<EgovMap> rtnList = null;
		if (CODE_MAP_LVL2.size() < 1)
			makeCodeList();

		if ("LVL2".equals(type)) {
			rtnList = CODE_MAP_LVL2.get("list");
		} else if ("LVL3".equals(type)) {
			System.out.println(CODE_MAP_LVL3.toString());

			if (CODE_MAP_LVL3.containsKey(codeValue.trim())) {
				rtnList = CODE_MAP_LVL3.get(codeValue);
			} else {
				rtnList = new ArrayList<EgovMap>();
			}
		}

		return rtnList;
	}

}