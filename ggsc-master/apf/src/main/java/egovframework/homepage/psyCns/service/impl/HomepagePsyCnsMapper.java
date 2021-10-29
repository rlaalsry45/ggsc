package egovframework.homepage.psyCns.service.impl;

import egovframework.homepage.psyCns.service.PsyCnsDocVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("homepagePsyCnsMapper")
public interface HomepagePsyCnsMapper {

	// DUKE-AD 등록 ajax
	void insertPsyDukeDoc(PsyCnsDocVO vo);
	
	// GDS-SI 등록 ajax
	void insertPsyGdsDoc(PsyCnsDocVO vo);
	
	// 불안척도 등록 ajax
	void insertPsyAnxiDoc(PsyCnsDocVO vo);
	
	// 대인관계변화척도 등록 ajax
	void insertPsyPerRelDoc(PsyCnsDocVO vo);
	
	// 사별스트레스척도 등록 ajax
	void insertPsyBereavDoc(PsyCnsDocVO vo);
}
