<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


	 <section id="page-breadcrumb">
        <div class="vertical-center sun">
             <div class="container">
                <div class="row">
                    <div class="action">
                        <div class="col-sm-12">
                            <h1 class="title">회원정보</h1>
                            <p>회원정보를 확인 할 수 있습니다.</p>
                        </div>
                     </div>
                </div>
            </div>
        </div>
    </section>
    <!--/#page-breadcrumb-->

	
	
	 <section id="" class="padding">
        <div class="container">
			<div class="row">
                <div class="col-md-6 col-sm-6 txtR">
                    <img src="images/sub/phone.jpg" alt="휴대폰본인인증">
				</div>
				<div class="col-md-6 col-sm-6">
					<p>
						개인정보는 개인정보취급장침에 따라 안전하게 보호되며 회원님의 명백한 동의없이 공개 또는 제3자에게 제공되지 않습니다.<br /></br>
						본인 명의의 휴대폰으로 본인을 확인합니다.
					</p>
					<div class="bs-example">
						<button onclick="fn_popup();" type="button" class="btn btn-primary">휴대폰본인확인</button>
					</div>
				</div>
				
            </div>
        </div>
    </section>	
    <form name="form1" method="post">
		<input type="hidden" name="CP_CD" maxlength="12" size="16" value="V41230000000">
		<input type="hidden" name="SITE_NAME" maxlength="20" size="24" value="한국후견협회">
	</form>
						    <!-- 휴대폰 본인확인 팝업 처리결과 정보 = phone_popup3 에서 값 입력 -->
							<form name="kcbResultForm" method="post">
								<input type="hidden" name="CP_CD" />
								<input type="hidden" name="TX_SEQ_NO" />
								<input type="hidden" name="RSLT_CD" />
								<input type="hidden" name="RSLT_MSG" />
								
								<input type="hidden" name="RSLT_NAME" />
								<input type="hidden" name="RSLT_BIRTHDAY" />
								<input type="hidden" name="RSLT_SEX_CD" />
								<input type="hidden" name="RSLT_NTV_FRNR_CD" />
								
								<input type="hidden" name="DI" />
								<input type="hidden" name="CI" />
								<input type="hidden" name="CI_UPDATE" />
								<input type="hidden" name="TEL_COM_CD" />
								<input type="hidden" name="TEL_NO" />
								
								<input type="hidden" name="RETURN_MSG" />
							</form>
							
							<form name="form2" method="post">
							</form>	
	
  <%--   <section id="" class="padding">
        <div class="container">
			<div class="row">
               <div class="col-md-12 col-sm-12">
                    <div class="contact-form bottom">
                        <h2>회원정보확인</h2>
						<p>개인정보는 개인정보취급장침에 따라 안전하게 보호되며 회원님의 명백한 동의없이 공개 또는 제3자에게 제공되지 않습니다.</p>
                        
                            <TABLE border="0" cellpadding="3" width="100%">
							    <TR><TD class="e" width="30%">Locale Default Encoding</TD><TD class="v"><%= java.util.Locale.getDefault() %></TD></TR>
							    <TR><TD class="e" width="30%">File Encoding</TD><TD class="v"><%= System.getProperty("file.encoding") %></TD></TR>
							    <TR><TD class="e" width="30%">OutputStreamWriter Encoding</TD><TD class="v"><%= new java.io.OutputStreamWriter(System.out).getEncoding() %></TD></TR>
							</TABLE>
							
							<div>
								<!-- <form name="form1" action="phonePop2.do" method="post"> -->
								<form name="form1" method="post">
									<table>
										<tr>
											<td colspan="2"><strong> - 휴대폰 본인확인 인증</strong></td>
										</tr>
										<tr>
											<td>회원사코드</td>
											<td>
												
											</td>
										</tr>
										<tr>
											<td>요청사이트명</td>
											<td>
												
											</td>
										</tr>
										<tr>
											
										</tr>
									</table>
						        </form>
						    </div>
						    <!-- 휴대폰 본인확인 팝업 처리결과 정보 = phone_popup3 에서 값 입력 -->
							<form name="kcbResultForm" method="post">
								<input type="hidden" name="CP_CD" />
								<input type="hidden" name="TX_SEQ_NO" />
								<input type="hidden" name="RSLT_CD" />
								<input type="hidden" name="RSLT_MSG" />
								
								<input type="hidden" name="RSLT_NAME" />
								<input type="hidden" name="RSLT_BIRTHDAY" />
								<input type="hidden" name="RSLT_SEX_CD" />
								<input type="hidden" name="RSLT_NTV_FRNR_CD" />
								
								<input type="hidden" name="DI" />
								<input type="hidden" name="CI" />
								<input type="hidden" name="CI_UPDATE" />
								<input type="hidden" name="TEL_COM_CD" />
								<input type="hidden" name="TEL_NO" />
								
								<input type="hidden" name="RETURN_MSG" />
							</form>
							
							<form name="form2" method="post">
							</form>
							
                        
                    </div>
                </div>
            </div>
        </div>
    </section> --%>
	<!--/#services-->
	
	
	
    <!--/#action-->
    <script type="text/javaScript" language="javascript" defer="defer">
        
	    
	    
	    
	    function jsSubmit(){
			window.open("", "", "width=430,height=640,scrollbar=yes");
			var form1 = document.form1;
			form1.target = "";
			form1.submit();
	    	
			
			//document.notFrm.action = "/notice_view.do";
           	//document.form1.submit();
           	
		}
	    
	    
	    function fn_popup(){
            var url = "/phonePop2.do";
            var name = "popup";
            var option = "width = 400, height = 600, top = 250, left =500, location = no"
            window.open(url, name, option);
        }
    
        
        
        //-->
    </script>

    