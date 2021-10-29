<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<section id="page-breadcrumb">
        <div class="vertical-center sun">
             <div class="container">
                <div class="row">
                    <div class="action">
                        <div class="col-sm-12">
                            <h1 class="title">로그인</h1>
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
                        <h2>Login</h2>
						<p>로그인을 위해 아래 아이디와 비밀번호를 입력해 주세요.</p>
                        <form id="frm" name="frm" method="post" action="/loginProc.do">
                            <div class="form-group">
                                <input type="text" name="id" class="form-control" required="required" placeholder="아이디를 입력해 주세요" value="admin">
                            </div>
                            <div class="form-group">
                                <input type="password" name="password" class="form-control" required="required" placeholder="비밀번호를 입력해 주세요" value="1234">
                            </div>
                            <div class="bs-example mgT20 txtC">
								<button onclick="javascript:fn_egov_select();" type="button" class="btn btn-primary">로그인</button>
								<button onclick="location.href='/memberMove.do'" type="button" class="btn btn-success">회원가입</button>
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
        
	    var loginYn = "";
		window.onload = function () {
			loginYn = '${loginYn}';
	    	
			if(loginYn=='N'){
	    		alert("로그인 후 이용할 수 있습니다.");
	    	}
		}
		
        /* 글 수정 화면 function */
        function fn_egov_select() {
        	document.frm.submit();
        }
        
        <!--
        /* 글 등록 화면 function */
        function fn_egov_addView() {
           	document.listForm.action = "<c:url value='/addSample.do'/>";
           	document.listForm.submit();
        }
        
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
	
