package ggsc.join.service;

public interface CnsrJoinService {

	// 상담사 table에 저장
	public void insertCnsrMng(CnsrVO param);
	// 사용자 table에 저장
	public void insertUserM(UsermVO param);
	
}
