package ams.adm.sms;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ams.adm.sms.SmsVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;


@Service("smsService")
public class SmsServiceImpl extends EgovAbstractServiceImpl {

	
    @Resource(name="smsDAO")
    private SmsDAO smsDAO;

    
	public List<EgovMap> smsList(SmsVO vo) {
		return smsDAO.smsList(vo);
	}
	
	public int smsListCnt(SmsVO vo) {
		return smsDAO.smsListCnt(vo);
	}
	
	public List<EgovMap> smsDtl(SmsVO vo) {
		return smsDAO.smsDtl(vo);
	}
	
	public void updSms(SmsVO vo) {
		smsDAO.updSms(vo);
	}
	
	public void updSmsFile(SmsVO vo) {
		smsDAO.updSmsFile(vo);
	}
	
	public void insSms(SmsVO vo) {
		smsDAO.insSms(vo);
	}

	public void delSms(SmsVO vo) {
		smsDAO.delSms(vo);
	}

	
	
    
	

	


}
