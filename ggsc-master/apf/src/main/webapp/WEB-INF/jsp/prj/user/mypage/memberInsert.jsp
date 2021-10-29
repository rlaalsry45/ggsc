<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import = "javax.servlet.http.Cookie" %>


<%
 response.setHeader("Cache-Control","no-cache");
 response.setHeader("Pragma","no-cache");
 response.setDateHeader("Expires",0);
 
 Cookie[] cookies = request.getCookies() ;
 
 if(cookies != null){
     for(int i=0; i < cookies.length; i++){
          
         // 쿠키의 유효시간을 0으로 설정하여 만료시킨다
         cookies[i].setMaxAge(0) ;
          
         // 응답 헤더에 추가한다
         response.addCookie(cookies[i]) ;
     }
 }



%>

    
	<section id="page-breadcrumb">
        <div class="vertical-center sun">
             <div class="container">
                <div class="row">
                    <div class="action">
                        <div class="col-sm-12">
                            <h1 class="title">회원가입</h1>
                            <p>고령자미래설계지원센터 방문을 환영합니다.</p>
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
               <div class="col-md-12 col-sm-12">
                    <div class="contact-form bottom">
                        <h2>회원정보입력</h2>
						<p>개인정보는 개인정보취급방침에 따라 안전하게 보호되면 회원님의 명백한 동의없이 공개 또는 제3자에게 제공되지 않습니다.</p>
                        <form id="usrFrm" name="usrFrm" method="post" >
                           
                               <input type="text" id="name" name="name" value="" placeholder="이름을 입력해 주세요">
                            
                                <input type="text" id="id" name="id" value="" placeholder="아이디를 입력해 주세요">
                           
                                <input type="password" id="pwd" name="pwd" value="" placeholder="비밀번호를 입력해 주세요">
                            
                                <input type="text" id="birth_dt" name="birth_dt" value="" placeholder="생연월일 입력해 주세요(예 19760821)">
                            
                                <!-- <button type="button" class="btn btn-success mgL5">주소찾기</button> -->
								<input type="text" id="basic_addr" name="basic_addr" value="" placeholder="기본주소를 입력해 주세요">
								<input type="text" id="dtl_addr" name="dtl_addr" value="" placeholder="상세주소를 입력해 주세요">
                           
                                <input type="text" id="tel" name="tel" value="" placeholder="전화번호를 입력해 주세요(예 01022934023)">
                                ('-' 포함하여 입력해주세요.)
                            
                                <input type="text" id="email" name="email" value="" placeholder="이메일을 입력해 주세요">
                            
							<div class="bs-example mgT20 txtC">
								<button onclick="javascript:fn_insertMemberReg();" type="button" >가입하기</button>
								<button onclick="goMemberRegCancel()" type="button" >취소하기</button>
							</div>
                        </form>
                    </div>
				</div>
            </div>
        </div>
    </section>
	<!--/#services-->
	
	
    <!--/#action-->
    <script type="text/javaScript" language="javascript" defer="defer">
	    
    
/*     if (location.href.indexOf('#reload') == -1) {
    	  location.href += '#reload'
    } */

    	
	    
    	function fn_insertMemberReg(){
    		
    		
    		
    		if(document.usrFrm.name.value == null || document.usrFrm.name.value == "") {
    			alert("이름을 입력 하셔야 합니다.");
    			return;
    		}
    		if(document.usrFrm.id.value == null || document.usrFrm.id.value == "") {
    			alert("아이디를 입력 하셔야 합니다.");
    			return;
    		}
    		if(document.usrFrm.pwd.value == null || document.usrFrm.pwd.value == "") {
    			alert("비밀번호를 입력 하셔야 합니다.");
    			return;
    		}
    		if(document.usrFrm.birth_dt.value == null || document.usrFrm.birth_dt.value == "") {
    			alert("생년월일을 입력 하셔야 합니다.");
    			return;
    		}
    		if(document.usrFrm.basic_addr.value == null || document.usrFrm.basic_addr.value == "") {
    			alert("주소를 입력 하셔야 합니다.");
    			return;
    		}
    		if(document.usrFrm.tel.value == null || document.usrFrm.tel.value == "") {
    			alert("전화번호를 입력 하셔야 합니다.");
    			return;
    		}
    		if(document.usrFrm.email.value == null || document.usrFrm.email.value == "") {
    			alert("이메일을 입력 하셔야 합니다.");
    			return;
    		}
    		
    			
    		
    		document.usrFrm.action = "/insertMemberReg.do";
    		//document.usrFrm.action = "/memberMove2.do";
    		//document.usrFrm.action = "/usrPageInfoProc.do";
    		alert("document.usrFrm.action="+document.usrFrm.action);
            document.usrFrm.submit();
            
          //  gosubmit();
    	}
    	
    	function gosubmit(){
    		document.usrFrm.action = "/insertMemberReg.do";
    		//document.usrFrm.action = "/usrPageInfoProc.do";
            document.usrFrm.submit();
    	}
        
        
        
        
        
        <!--
        /* 글 목록 화면 function */
        function fn_egov_selectList() {
        	document.listForm.action = "<c:url value='/egovSampleList.do'/>";
           	document.listForm.submit();
        }
        
        /* pagination 페이지 링크 function */
        function fn_egov_link_page(pageNo){
        	document.listForm.pageIndex.value = pageNo;
        	document.listForm.action = "<c:url value='/egovSampleList.do'/>";
           	document.listForm.submit();
        }
        
        //-->
    </script>

    