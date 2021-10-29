package ggsc.support.service;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import ams.cmm.PageVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public class ExcelVO extends PageVO{
	private List<EgovMap> list;
	private int number;
	private String[] header;
	private String[] mapKey;
	private String FileName;
	private String centerGb;
	private String authCd;
	private String schLinkReqGb;
	
	private String schCnsGb;
	private String schCenterGb;
	private String schCnsleNm;
	private String schDateGb;
	private String schText;
	private String schGubun;
	private String schAcptNm;
	private String schDt;
	private String schUserId;
	private String schCnsrNm;
	private String schSigunNm;
	private String schCnsrGb;
	private String schZoneGb;
	
	private String schStartDate;
	private String schEndDate;
	private String schWriteYn;
	
	private String schLocalGb;
	private String schorganGb;
	private String schLeaderNm;
	private String schPgrmNm;
	private String schJoinOrgCd;
	private String schEduManGb;
	private String schPromotionGb;
	private String schVisitOrgGb;
	
	
	
	public String getSchVisitOrgGb() {
		return schVisitOrgGb;
	}

	public void setSchVisitOrgGb(String schVisitOrgGb) {
		this.schVisitOrgGb = schVisitOrgGb;
	}

	public String getSchPromotionGb() {
		return schPromotionGb;
	}

	public void setSchPromotionGb(String schPromotionGb) {
		this.schPromotionGb = schPromotionGb;
	}

	public String getSchEduManGb() {
		return schEduManGb;
	}

	public void setSchEduManGb(String schEduManGb) {
		this.schEduManGb = schEduManGb;
	}

	public String getSchJoinOrgCd() {
		return schJoinOrgCd;
	}

	public void setSchJoinOrgCd(String schJoinOrgCd) {
		this.schJoinOrgCd = schJoinOrgCd;
	}

	public String getSchLinkReqGb() {
		return schLinkReqGb;
	}

	public void setSchLinkReqGb(String schLinkReqGb) {
		this.schLinkReqGb = schLinkReqGb;
	}

	public String getAuthCd() {
		return authCd;
	}

	public void setAuthCd(String authCd) {
		this.authCd = authCd;
	}

	public String getSchLeaderNm() {
		return schLeaderNm;
	}

	public void setSchLeaderNm(String schLeaderNm) {
		this.schLeaderNm = schLeaderNm;
	}

	public String getSchPgrmNm() {
		return schPgrmNm;
	}

	public void setSchPgrmNm(String schPgrmNm) {
		this.schPgrmNm = schPgrmNm;
	}

	public String getSchWriteYn() {
		return schWriteYn;
	}

	public void setSchWriteYn(String schWriteYn) {
		this.schWriteYn = schWriteYn;
	}

	public String getSchStartDate() {
		return schStartDate;
	}

	public void setSchStartDate(String schStartDate) {
		this.schStartDate = schStartDate;
	}

	public String getSchEndDate() {
		return schEndDate;
	}

	public void setSchEndDate(String schEndDate) {
		this.schEndDate = schEndDate;
	}

	public String getCenterGb() {
		return centerGb;
	}

	public void setCenterGb(String centerGb) {
		this.centerGb = centerGb;
	}

	public String getSchLocalGb() {
		return schLocalGb;
	}

	public void setSchLocalGb(String schLocalGb) {
		this.schLocalGb = schLocalGb;
	}

	public String getSchorganGb() {
		return schorganGb;
	}

	public void setSchorganGb(String schorganGb) {
		this.schorganGb = schorganGb;
	}

	public String getSchZoneGb() {
		return schZoneGb;
	}

	public void setSchZoneGb(String schZoneGb) {
		this.schZoneGb = schZoneGb;
	}

	public String getSchCnsrGb() {
		return schCnsrGb;
	}

	public void setSchCnsrGb(String schCnsrGb) {
		this.schCnsrGb = schCnsrGb;
	}

	public String getSchSigunNm() {
		return schSigunNm;
	}

	public void setSchSigunNm(String schSigunNm) {
		this.schSigunNm = schSigunNm;
	}

	public String getSchUserId() {
		return schUserId;
	}

	public void setSchUserId(String schUserId) {
		this.schUserId = schUserId;
	}

	public String getSchCnsrNm() {
		return schCnsrNm;
	}

	public void setSchCnsrNm(String schCnsrNm) {
		this.schCnsrNm = schCnsrNm;
	}

	
	
	
	
	public String getSchAcptNm() {
		return schAcptNm;
	}

	public void setSchAcptNm(String schAcptNm) {
		this.schAcptNm = schAcptNm;
	}

	public String getSchDt() {
		return schDt;
	}

	public void setSchDt(String schDt) {
		this.schDt = schDt;
	}

	public String getSchGubun() {
		return schGubun;
	}

	public void setSchGubun(String schGubun) {
		this.schGubun = schGubun;
	}

	public String getSchCnsGb() {
		return schCnsGb;
	}

	public void setSchCnsGb(String schCnsGb) {
		this.schCnsGb = schCnsGb;
	}

	public String getSchCenterGb() {
		return schCenterGb;
	}

	public void setSchCenterGb(String schCenterGb) {
		this.schCenterGb = schCenterGb;
	}

	public String getSchCnsleNm() {
		return schCnsleNm;
	}

	public void setSchCnsleNm(String schCnsleNm) {
		this.schCnsleNm = schCnsleNm;
	}

	public String getSchDateGb() {
		return schDateGb;
	}

	public void setSchDateGb(String schDateGb) {
		this.schDateGb = schDateGb;
	}

	public String getSchText() {
		return schText;
	}

	public void setSchText(String schText) {
		this.schText = schText;
	}
	
	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}
	
	
	@Override
	public String toString() {
		return "ExcelVO [list=" + list + ", number=" + number + ", header=" + Arrays.toString(header) + ", mapKey="
				+ Arrays.toString(mapKey) + ", FileName=" + FileName + ", centerGb=" + centerGb + ", schCnsGb="
				+ schCnsGb + ", schCenterGb=" + schCenterGb + ", schCnsleNm=" + schCnsleNm + ", schDateGb=" + schDateGb
				+ ", schText=" + schText + ", schGubun=" + schGubun + ", schAcptNm=" + schAcptNm + ", schDt=" + schDt
				+ ", schUserId=" + schUserId + ", schCnsrNm=" + schCnsrNm + ", schSigunNm=" + schSigunNm
				+ ", schCnsrGb=" + schCnsrGb + ", schZoneGb=" + schZoneGb + ", schStartDate=" + schStartDate
				+ ", schEndDate=" + schEndDate + ", schLocalGb=" + schLocalGb + ", schorganGb=" + schorganGb + "]";
	}

	public String[] getHeader() {
		String[] tmp = new String[this.header.length];
		for(int i=0;i<tmp.length;i++) {
			tmp[i] = this.header[i];
		}
		return tmp;
	}
	
	
	public List<EgovMap> getList() {
      if(this.list != null ) {
      List<EgovMap> tmp = new ArrayList<EgovMap>();
      for(EgovMap map : this.list) {
         tmp.add(map);
      }
         return tmp;
      }else {
         return null;
      }
   }
	

	public void setList(List<EgovMap> list) {
		this.list = list;
	}

	public String[] getMapKey() {
		String[] tmp = new String[this.mapKey.length];
		for(int i=0;i<tmp.length;i++) {
			tmp[i] = this.mapKey[i];
		}
		return tmp;
	}
	
	public void init() {
		switch(number) {
			case 1 :
				setInit("상담대상자 관리대장", 
						new String[] {"순번", "caseNo", "상담구분", "센터구분", "상담일시", "회기", "상담경위", "성명", "생년월일", "성별", "주소", "연락처", "주호소내용"}, 
						new String[] {"rnum", "caseNo", "cnsGbNm", "centerGbNm", "cnsDt", "cnsCnt", "cnsDtlNm", "cnsleNm", "birthDt", "gender", "addr", "mobile", "majorApplNm"});
			break;
			case 2 : 
				setInit("상담종결 관리대장",
						new String[] {"순번", "caseNo", "상담구분", "센터구분", "상담일시", "내담자ID", "내담자명", "생년월일", "성별", "주소", "연락처", "종결일", "종결사유", "상담사의견","자원봉사자의견"},
						new String[] {"rnum", "caseNo", "cnsGbNm", "centerGbNm", "cnsDtS", "cnsleId", "cnsleNm", "birthDt", "gender", "addr", "mobile", "cnsDtE", "cnsEndResnNm","cntn", "vltrCntn"});
				break;
			case 3 : 
				setInit("네트워크회의보고서 목록",
						new String[] {"순번", "센터구분", "작성자", "참여기관", "회의일자", "참여인원", "장소", "등록일자","내용"},
					    new String[] {"rnum", "centerGb", "inputNm", "joinOrgCd", "meetDt", "joinMan", "joinPlace", "dbInsTm", "joinCntn"});
				break;
			case 4 : 
				setInit("교육활동보고서 목록",
						new String[] {"순번", "센터구분", "작성자", "진행자", "대상인원", "교육활동일시", "교육주제", "교육방법", "대상자", "등록일", "주요내용"},
						new String[] {"rnum", "centerNm", "inputNm", "hostGb", "eduPeople", "eduDt", "eduTitleNm", "eduWay", "eduManNm", "dbInsTm", "majorCntn"});
				break;
			case 5 :
				setInit("홍보활동보고서 목록",
						new String[] {"순번", "센터구분", "시군구분", "작성자", "홍보", "일시", "홍보활동분야", "참여자구분", "참여자", "홍보대상자", "대상인원", "장소", "등록일", "내용"},
						new String[] {"rnum", "centerGb", "sigunCd", "inputNm", "promotion", "prAtvyDt", "prAtvyArea", "prAtvyPtctGb", "prAtvyPtct", "prAtvyRcpt", "prAtvyMan", "prAtvyPlace", "dbInsTm", "prAtvyCntn"});
				break;
			case 6 :
				setInit("마음나눔봉사단 목록", 
						new String[] { "순번", "상담구분", "센터구분", "성명", "일자"},
						new String[] { "rnum", "cnsNm", "centerNm", "voluntNm", "bDate"});
				break;
			case 7 :
				setInit("성인식개선사업 목록", 
						new String[] { "순번", "상담구분", "센터구분", "성명", "일자" },
						new String[] { "rnum", "cnsNm", "centerNm", "bSubject", "bDate"});
				break;
			case 8 : 
				setInit("상담사례종결서 목록",
						new String[] {"순번", "상담구분", "센터구분", "내담자", "상담사", "종결방법", "종결사유", "상담기간"},
						new String[] {"rnum", "cnsGbNm", "centerNm", "cnsleNm", "cnsrNm", "cnsEndMethdNm", "cnsEndResnNm", "cnsPeriod"});
				break;
			case 9 :
				setInit("연계기관방문보고서 목록",
						new String[] {"순번", "시군", "방문기관구분", "방문기관명", "방문일자", "방문자", "방문인원", "등록일", "내용"},
						new String[] {"rnum", "sigunCdNm", "visitOrgGbNm", "visitOrgNm", "visitDt", "visitr", "visitManCnt", "dbInsTm", "visitCntn"});
				break;
			case 10 :
				setInit("상담접수관리 목록",
						new String[] { "순번", "caseNo", "상담구분", "권역구분", "지역구분", "센터구분", "신청자", "성별", "연락처", "연령", "주소", "상담이력", "접수확인", "신청일자"},
						new String[] { "rnum", "caseNo", "cnsGbNm", "zoneGbNm", "localGbNm", "centerNm", "userNm", "gender", "mobile", "age", "addr", "cnsHistYnNm", "acptYnNm", "dbInsTmNm"});
				break;
			case 11 :
				setInit("상담사 목록",
						new String[] { "순번", "상담구분", "센터구분", "상담사구분", "성명", "아이디", "승인여부" },
						new String[] { "rnum", "cnsGbNm", "centerNm", "cnsrGbNm", "cnsrNm", "userId", "useYn"  });
				break;
			case 12 : 
				setInit("센터 목록",
						new String[] { "순번", "권역구분", "시∙군", "센터명", "주소", "홈페이지", "전화번호", "사용여부" },
						new String[] { "rnum", "zoneGb", "localNm", "centerNm", "addr", "homepage", "tel", "useYn" });
				break;
			case 13 :
				setInit("분류 목록",
						new String[] { "순번", ""},
						new String[] {});
				break;
			case 14 : 
				setInit("유관기관 목록",
						new String[] { "순번", "기관구분", "지역", "기관명", "홈페이지", "전화번호", "팩스번호"},
						new String[] { "rnum", "orgGbNm", "localGbNm", "relOrgNm", "url", "tel", "fax"});
				break;
			case 15 : 
				setInit("실적보고서",
						new String[] { "계", "1-1 성별", "계", "1-2내담자와 관계", "계", "1-3 나이", "계", "개인상담(건)", "집단상담(건)", "4-1 상담", "4-2 연계(내부)", "4-3 외부연계", "단회기 상담", "지속상담" ,"심리검사" ,"네트워크 활동(건)", "교육"},
						new String[] { "cnsPersonal", "cntNumber", "cntPersonalMale", "cntPersonalFemale", "cntNumberFemale", "cntNumberFemale", "cntNumberFemale", "cntNumberFemale", "cntNumberFemale", "cntNumberFemale", "cntNumberFemale", "cntNumberFemale", "cntNumberFemale" });
				break;
			case 16 : 
				setInit("상담사실적",
						new String[] {},
						new String[] {});
				break;
			case 17 : 
				setInit("교육실적",
						new String[] {},
						new String[] {});
				break;
			case 18 : 
				setInit("홍보실적",
						new String[] {},
						new String[] {});
				break;
			case 19 : 
				setInit("학력별상담현황",
						new String[] {},
						new String[] {});
				break;
			case 20 : 
				setInit("연령별상담현황",
						new String[] {},
						new String[] {});
				break;
			case 21 : 
				setInit("주호소별현황",
						new String[] {},
						new String[] {});
				break;
			case 22 : 
				setInit("개인상담현황",
						new String[] {"순번", "caseNo", "상담상태", "상담구분", "상담회기", "상담자구분", "시군구분", "센터구분", "상담자명", "내담자명", "생년월일", "성별", "주소", "내담자연락처", "긴급연락처", "상담일시", "내담자와의관계", "상담방법", "주호소문제", "상담내용", "등록일시","주/야간"},
						new String[] {"rnum", "caseNo", "cnsStat", "cnsGb", "cnsCnt", "cnsrGb", "sigunCd", "centerGb", "cnsrNm", "cnsleNm", "birthDt", "gender", "addr", "mobile", "emgcyTel", "cnsDt", "cnsMethd", "cnsleRel", "majorApplCd", "cnsCntn", "dbInsTm","shift"});
				break;
			case 23 : 
				setInit("집단상담현황",
						new String[] {"순번" ,"상담구분", "시군구분","센터구분","주호소문제","프로그램명","회기","활동일시","활동장소","내담자와의관계","리더","리더구분","진행자","작성자","참석자","참석자명","활동주제","상담종류","활동목표","프로그램내용","평가","향후계획","비고","작성일"},
						new String[] {"rnum","cnsGb","sigunGb","centerGb","majorApplCd","pgrmNm","cnsCnt","atvyDt","atvyPlace","olderRel","leader","leaderGb","anchor","inputNm","atdeCnt","atdeNm","atvyTitle","cnsType","atvyGoal","pgrmCntn","evat","afterPlan","etc","dbInsTm"});
				break;
			case 24 : 
				setInit("일월년별현황",
						new String[] {},
						new String[] {});
				break;
			case 25 : 
				setInit("센터별현황",
						new String[] {},
						new String[] {});
				break;
			case 26 : 
				setInit("심리검사현황",
						new String[] {},
						new String[] {});
				break;
				
			case 28 : 
				setInit("사전검사",
						new String[] {"순번", "caseNo", "상담구분", "시군구분", "센터구분", "내담자명", "상담동의서", "개인정보동의서", "노인상담선별척도지", "상담대상자", "등록일자"},
						new String[] {"rnum", "caseNo", "cnsGbNm", "sigunCd", "centerGbNm", "userNm", "agrePathNm", "perInfoPathNm", "docCntnPathNm", "cnsTargetGbNm", "dbInsTmNm"});
				break;
				
				
			case 29 : 
				setInit("초기상담신청서",
						new String[] {"순번", "caseNo", "상담사명", "상담방법", "상담경위", "주호소문제", "내담자와의관계", "성별", "내담자명", "생년월일", "연락처", "긴급연락처" , "주소", "학력", "문자해독", "종교", "주거형태", "주택형태", "결혼상태", "동거형태", "상담일", "등록일"},
						new String[] {"rnum", "caseNo", "cnsrNm", "cnsMethd", "cnsDtl", "majorApplCd", "olderRel", "gender", "cnsleNm", "birthDt", "mobile", "emgcyTel", "addr", "edu", "decodeLvl", "relg", "livgForm", "houseForm", "merrStat", "liveForm", "cnsDt", "dbInsTm"});
				break;
				
			case 30 : 
				setInit("연계의뢰서",
						new String[] {"순번","caseNo","연계구분","내부연계구분","외부연계구분","내담자ID","내담자명","상담구분","권역구분","지역구분","센터구분","의뢰부서","담당","의뢰일","협조부서","담당","회신기한","성명","성별","생년월일","주소","연락처","대상자 특이사항","의뢰사유 및 요청사항","처리결과","비고 ","등록일"},
						new String[] {"rnum","caseNo","linkReqGb","internalGb","outernalGb","cnsleId","cnsleNm","cnsGb","zoneGb","localGb","centerGb","reqDept","reqDeptPer","reqDt","helpDept","helpDeptPer","relyTerm","cnsleNm","gender","birthDt","addr","telNo","rcptSgct","reqResnCntn","pgrsRslt","etc", "dbInsTm"});
				break;
				
			/*case 27 :
	            setInit("테스트", 
	                  new String[] { "구분||1||4", "상담센터||1||4", "1-1. 성별||8||1", "1-2. 내담자와의 관계||8||1", "[ROW]",
	                              "계||2||2", "성별||6||1", "", "[ROW]",
	                              "소계||2||1", "남||2||1", "여||2||1", "[ROW]",
	                              "명","건","명","건","명","건","명","건"
	                              }
	            , new String[] {});
	            
	            break;*/
		}
	}
	
	
	
	private void setInit(String FileName, String[] header, String[] mapKey) {
		this.FileName = FileName;
		this.header = header;
		this.mapKey = mapKey;
	}
	
	public String getFileName() {
		String tmp = this.FileName;
		try {
			tmp = URLEncoder.encode(tmp,"UTF-8").replaceAll("\\+", "%20");
		} catch (UnsupportedEncodingException err) {
			tmp = null;
			utility.func.Logging(this.getClass().getName(), err);
		}
		return tmp;
		
	}	
}