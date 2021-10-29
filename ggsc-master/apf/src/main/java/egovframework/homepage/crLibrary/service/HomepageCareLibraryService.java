package egovframework.homepage.crLibrary.service;

import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface HomepageCareLibraryService {
	
	// 마음돌봄 자료실  목록
	List<EgovMap> getCrLibraryList(CrLibraryVO vo);
	
	// 마음돌봄 자료실 상세보기
	EgovMap getCareLibraryDtl(CrLibraryVO vo);
	
	// 마음돌봄 자료실 총갯수
	int getCareLibraryTotal(CrLibraryVO vo);
}