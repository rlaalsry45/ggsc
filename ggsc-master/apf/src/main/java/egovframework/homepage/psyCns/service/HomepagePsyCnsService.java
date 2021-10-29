package egovframework.homepage.psyCns.service;

public interface HomepagePsyCnsService {
	
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