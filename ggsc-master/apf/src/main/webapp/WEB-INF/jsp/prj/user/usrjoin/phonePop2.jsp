<%-- <%@ page import="kcb.org.json.*" %>
<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="euc-kr"%>

<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<%
    //**************************************************************************
	// 파일명 : phone_popup2.jsp
	// - 팝업페이지
	// 휴대폰 본인확인 서비스 인증페이지 호출 화면
    //
    // ※주의
    // 	실제 운영시에는 화면에 보여지는 데이터를 삭제하여 주시기 바랍니다.
    // 	방문자에게 사이트데이터가 노출될 수 있습니다.
    //**************************************************************************
	
	//' UTF-8 환경의 경우 주석 해제 + 전체 페이지 상단 charset, pageEncoding 및 파일인코딩 변경 필요
	request.setCharacterEncoding("UTF-8");
	
	/**************************************************************************
	 * okcert3 휴대폰 본인확인 서비스 파라미터
	 **************************************************************************/
	
	//'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	//' 회원사 사이트명, URL
    //'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	String SITE_NAME = "한국후견협회"; 		// 요청사이트명 
	String SITE_URL = "www.futureplan.or.kr";
	//String SITE_URL = "http://192.168.0.154:8080/";
	
	//'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    //' KCB로부터 부여받은 회원사코드(아이디) 설정 (12자리) 
    //'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	String CP_CD = "V41230000000";	// 회원사코드
	session.setAttribute("PHONE_CP_CD", CP_CD);
	
	//'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    //' 리턴 URL 설정
    //'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	//' opener(popup1)의 도메인과 일치하도록 설정해야 함. 
	//' (http://www.test.co.kr과 http://test.co.kr는 다른 도메인으로 인식하며, http 및 https도 일치해야 함)
	//String RETURN_URL = "http://"+request.getServerName()+":8080/phone_popup/phone_popup3.jsp";// 인증 완료 후 리턴될 URL (도메인 포함 full path)
	String RETURN_URL = "http://"+request.getServerName()+"/memberReg.do";// 인증 완료 후 리턴될 URL (도메인 포함 full path)

	//'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    //' 인증요청사유코드 (가이드 문서 참조)
    //'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	String RQST_CAUS_CD = "00";
	
	//'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	//' 채널 코드 (공백가능. 필요한 회원사에서만 입력)
    //'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	//String CHNL_CD = request.getParameter("CHNL_CD");	
	//'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    //' 리턴메시지 (공백가능. returnUrl에서 같이 전달받고자 하는 값이 있다면 설정.)
    //'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	//String RETURN_MSG = "";
	
	
	//' ########################################################################
	//' # 타겟 및 팝업URL : 운영/테스트 전환시 변경 필요
	//' ########################################################################
	String target = "PROD";	// 테스트="TEST", 운영="PROD"
	//String target = "TEST";
	//String popupUrl = "http://192.168.0.154:8080/";	// 테스트 URL
	String popupUrl = "https://safe.ok-name.co.kr/CommonSvl";// 운영 URL
	
	//'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    //' 라이센스 파일
    //'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	//String license = "C:\\okcert3_license\\" + CP_CD + "_IDS_01_" + target + "_AES_license.dat";
	String license = "/www/futureplan_or_kr/www/okcert3_license/" + CP_CD + "_IDS_01_" + target + "_AES_license.dat";
	
	//'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    //' 서비스명 (고정값)
    //'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	String svcName = "IDS_HS_POPUP_START";
	
	/**************************************************************************
	okcert3 요청 정보
	**************************************************************************/
	JSONObject reqJson = new JSONObject();
	reqJson.put("RETURN_URL", RETURN_URL);
	reqJson.put("SITE_NAME", SITE_NAME);
	reqJson.put("SITE_URL", SITE_URL);
	reqJson.put("RQST_CAUS_CD", RQST_CAUS_CD);
	
	//reqJson.put("CHNL_CD", CHNL_CD);
	//reqJson.put("RETURN_MSG", RETURN_MSG);
	
	// 사전에 입력받은 정보로 팝업창 개인정보를 고정할 경우 사용 (가이드 참고)
	//reqJson.put("IN_TP_BIT", "15");
	//reqJson.put("NAME", "홍길동");
	//reqJson.put("BIRTHDAY", "19870725");
	//reqJson.put("TEL_NO", "01012345678");
	//reqJson.put("NTV_FRNR_CD", "F");	// 내국인 L 외국인 F
	//reqJson.put("SEX_CD", "F");		// 남성 M 여성 F
	
	//' 거래일련번호는 기본적으로 모듈 내에서 자동 채번되고 채번된 값을 리턴해줌.
	//'	회원사가 직접 채번하길 원하는 경우에만 아래 코드를 주석 해제 후 사용.
	//' 각 거래마다 중복 없는 String 을 생성하여 입력. 최대길이:20
	//reqJson.put("TX_SEQ_NO", "123456789012345"); 
	
	String reqStr = reqJson.toString();
	
	/**************************************************************************
	okcert3 실행
	**************************************************************************/
	kcb.module.v3.OkCert okcert = new kcb.module.v3.OkCert();
	
	// '************ IBM JDK 사용 시, 주석 해제하여 호출 ************
	// okcert.setProtocol2type("22");
	// '객체 내 license를 리로드해야 될 경우에만 주석 해제하여 호출. (v1.1.7 이후 라이센스는 파일위치를 key로 하여 static HashMap으로 사용됨)
	// okcert.delLicense(license);
	
	System.out.println("target =============   "+target);
	System.out.println("CP_CD =============   "+CP_CD);
	System.out.println("svcName =============   "+svcName);
	System.out.println("license =============   "+license);
	System.out.println("reqStr =============   "+reqStr);
	
	
	
	//' callOkCert 메소드호출 : String license 파일 path로 라이센스 로드
	String resultStr = okcert.callOkCert(target, CP_CD, svcName, license,  reqStr);
	
	
	
	System.out.println("resultStr =============   "+resultStr);
	
	
	/*
	// 'OkCert3 내부에서 String license 파일 path로 라이센스를 못 읽어올 경우(Executable Jar 환경 등에서 발생),
	// '메소드 마지막 파라미터에 InputStream를 사용하여 라이센스 로드
	String resultStr = null;
	if ( ! okcert.containsLicense(license) ) {			// 로드된 라이센스 정보가 HashMap에 없는 경우
		java.io.InputStream is = new java.io.FileInputStream(license);	// 환경에 맞게 InputStream 로드
		resultStr = okcert.callOkCert(target, CP_CD, svcName, license,  reqStr, is);
	} else {											// 로드된 라이센스 정보가 HashMap에 있는 경우
		resultStr = okcert.callOkCert(target, CP_CD, svcName, license,  reqStr);
	}
	*/
	
	
	
	
	JSONObject resJson = new JSONObject(resultStr);

    String RSLT_CD =  resJson.getString("RSLT_CD");
    String RSLT_MSG = resJson.getString("RSLT_MSG");
    //if(resJson.has("TX_SEQ_NO")) String TX_SEQ_NO = resJson.getString("TX_SEQ_NO"); // 필요 시 거래 일련 번호 에 대하여 DB저장 등의 처리
    String MDL_TKN = "";
    
	boolean succ = false;
	
    if ("B000".equals(RSLT_CD) && resJson.has("MDL_TKN") ) {
		MDL_TKN = resJson.getString("MDL_TKN");
		succ = true;
    }
    
%>

<html>
<title>KCB 휴대폰 본인확인 서비스</title>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">


<script type="text/javascript">
		
function request(){
	document.form1.action = "<%=popupUrl%>";
	document.form1.method = "post";

	document.form1.submit();
}

</script>

</head>

<body>
	<form name="form1">
	<!-- 인증 요청 정보 -->
	<!--// 필수 항목 -->
	<input type="hidden" name="tc" value="kcb.oknm.online.safehscert.popup.cmd.P931_CertChoiceCmd"/>	<!-- 변경불가-->
	<input type="hidden" name="cp_cd" value="<%=CP_CD%>">	<!-- 회원사코드 -->
	<input type="hidden" name="mdl_tkn" value="<%=MDL_TKN%>">	<!-- 토큰 --> 
	<input type="hidden" name="target_id" value="">	
	<!-- 필수 항목 //-->	
	</form>
</body>
<%
	if (succ) {
		//인증요청
		out.println("<script>request();</script>");
	} else {
		//요청 실패 페이지로 리턴
		out.println("<script>alert('" + RSLT_CD + " : " + RSLT_MSG + "'); self.close(); </script>");
	}
%>
</html>


 --%>