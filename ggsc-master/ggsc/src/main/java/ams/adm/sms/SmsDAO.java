package ams.adm.sms;

import java.util.List;

import org.springframework.stereotype.Repository;

import ams.adm.sms.SmsVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@SuppressWarnings("unchecked")
@Repository("smsDAO")
public class SmsDAO extends EgovAbstractDAO {
	
	public List<EgovMap> smsList(SmsVO vo){
		return (List<EgovMap>)list("smsDAO.smsList", vo);
	}
	
	public int smsListCnt(SmsVO vo){
		return (Integer)select("smsDAO.smsListCnt", vo);
	}
	
	public List<EgovMap> smsDtl(SmsVO vo){
		return (List<EgovMap>)list("smsDAO.smsDtl", vo);
	}
	
	public void updSms(SmsVO vo) {
		update("smsDAO.updSms",vo);
	}

	public void updSmsFile(SmsVO vo) {
		update("smsDAO.updSmsFile",vo);
	}

	public void insSms(SmsVO vo){
		insert("smsDAO.insSms", vo);
	}

	public void delSms(SmsVO vo){
		delete("smsDAO.delSms", vo);
	}


	
	
	
	
	
	
	
	
	
	
}
