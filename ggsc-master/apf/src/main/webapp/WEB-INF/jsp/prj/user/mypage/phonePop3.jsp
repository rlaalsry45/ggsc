<%-- <%@ page import="kcb.org.json.*" %>
<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="euc-kr"%>

<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%
    //**************************************************************************
	// ���ϸ� : phone_popup3.jsp
	// - �˾�������
	// �޴��� ����Ȯ�� ���� ��� ȭ��(return url).
	// ��ȣȭ�� ������������� ��ȣȭ�Ѵ�.
	//**************************************************************************
	
	//' ó����� ��� ��ū ����
	String MDL_TKN = request.getParameter("mdl_tkn");

	//'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    //' KCB�κ��� �ο����� ȸ�����ڵ�(���̵�) ���� (12�ڸ�) 
    //'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	String CP_CD = "V41230000000";	// ȸ�����ڵ�
	//String CP_CD = (String)session.getAttribute("PHONE_CP_CD");
	
	//'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    //' Ÿ�� : �/�׽�Ʈ ��ȯ�� ���� �ʿ�
    //'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	String target = "PROD";	// �׽�Ʈ="TEST", �="PROD"
	
	//'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    //' ���̼��� ����
    //'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	//String license = "C:\\okcert3_license\\" + CP_CD + "_IDS_01_" + target + "_AES_license.dat";
	String license = "/www/futureplan_or_kr/www/okcert3_license/" + CP_CD + "_IDS_01_" + target + "_AES_license.dat";
	
	System.out.println("phonePop3.jsp license ==================  "+license);
	
	//'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    //' ���񽺸� (������)
    //'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	String svcName = "IDS_HS_POPUP_RESULT";
	
	
	/**************************************************************************
	okcert3 ��û ����
	**************************************************************************/
	JSONObject reqJson = new JSONObject();
	
	reqJson.put("MDL_TKN", MDL_TKN);
	String reqStr = reqJson.toString();
	
	System.out.println("phonePop3.jsp MDL_TKN =================== "+MDL_TKN);
	/**************************************************************************
	okcert3 ����
	**************************************************************************/
	kcb.module.v3.OkCert okcert = new kcb.module.v3.OkCert();
	
	// '************ IBM JDK ��� ��, �ּ� �����Ͽ� ȣ�� ************
	// okcert.setProtocol2type("22");
	// '��ü �� license�� ���ε��ؾ� �� ��쿡�� �ּ� �����Ͽ� ȣ��. (v1.1.7 ���� ���̼����� ������ġ�� key�� �Ͽ� static HashMap���� ����)
	// okcert.delLicense(license);
	
	
	//' callOkCert �޼ҵ�ȣ�� : String license ���� path�� ���̼��� �ε�
	String resultStr = okcert.callOkCert(target, CP_CD, svcName, license,  reqStr);
	
	
	System.out.println("phonePop3.jsp resultStr =====================  " +resultStr);
	
	
	/*
	// 'OkCert3 ���ο��� String license ���� path�� ���̼����� �� �о�� ���(Executable Jar ȯ�� ��� �߻�),
	// '�޼ҵ� ������ �Ķ���Ϳ� InputStream�� ����Ͽ� ���̼��� �ε�
	String resultStr = null;
	if ( ! okcert.containsLicense(license) ) {			// �ε�� ���̼��� ������ HashMap�� ���� ���
		java.io.InputStream is = new java.io.FileInputStream(license);	// ȯ�濡 �°� InputStream �ε�
		resultStr = okcert.callOkCert(target, CP_CD, svcName, license,  reqStr, is);
	} else {											// �ε�� ���̼��� ������ HashMap�� �ִ� ���
		resultStr = okcert.callOkCert(target, CP_CD, svcName, license,  reqStr);
	}
	*/
	
	JSONObject resJson = new JSONObject(resultStr);
	
    String RSLT_CD =  resJson.getString("RSLT_CD");
    String RSLT_MSG =  resJson.getString("RSLT_MSG");
	String TX_SEQ_NO =  resJson.getString("TX_SEQ_NO");
	
	String RSLT_NAME = "";
	String RSLT_BIRTHDAY = "";
	String RSLT_SEX_CD = "";
	String RSLT_NTV_FRNR_CD = "";
	
	String DI = "";
	String CI = "";
	String CI_UPDATE = "";
	String TEL_COM_CD = "";
	String TEL_NO = "";
	
	String RETURN_MSG= "";
	if(resJson.has("RETURN_MSG")) RETURN_MSG =  resJson.getString("RETURN_MSG");
	
	System.out.println("phonePop3.jsp RETURN_MSG  ===================  "+RETURN_MSG);
	System.out.println("phonePop3.jsp RSLT_CD  ===================  "+RSLT_CD);
	
	if ("B000".equals(RSLT_CD)){
		RSLT_NAME = resJson.getString("RSLT_NAME");
		RSLT_BIRTHDAY = resJson.getString("RSLT_BIRTHDAY");
		RSLT_SEX_CD = resJson.getString("RSLT_SEX_CD");
		RSLT_NTV_FRNR_CD = resJson.getString("RSLT_NTV_FRNR_CD");
		
		DI = resJson.getString("DI");
		CI = resJson.getString("CI");
		CI_UPDATE = resJson.getString("CI_UPDATE");
		TEL_COM_CD = resJson.getString("TEL_COM_CD");
		TEL_NO = resJson.getString("TEL_NO");
	}
%>

<title>KCB �޴��� ����Ȯ�� ����</title>
<script type="text/javascript" >
	function fncOpenerSubmit() {

		

		//opener.document.kcbResultForm.action = "/insertMove.do";
		//opener.document.kcbResultForm.submit();
		
		
		opener.document.form2.action = "/phoneresult.do";
		opener.document.form2.submit();
		
		
		window.close();
	}	
</script>
</head>
<body>
</body>
<%
	//������� ��ȣȭ ����
	// ��������� Ȯ���Ͽ� �������б���� ó���� �����ؾ��Ѵ�.
	if ("B000".equals(RSLT_CD)) {
		out.println("<script>alert('������������'); fncOpenerSubmit();</script>");
	}
	else {
		out.println("<script>alert('������������ : " + RSLT_CD + " : " + RSLT_MSG + "'); fncOpenerSubmit();</script>");
	}
%>
</html>
 --%>