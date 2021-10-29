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

	<form id="mypageFrm" name="mypageFrm" method="post">
    <section id="" class="padding">
        <div class="container">
			<div class="row">
               <div class="col-md-12 col-sm-12">
                    <div class="contact-form bottom">
                        <h2>회원정보확인</h2>
						<p>개인정보는 개인정보취급장침에 따라 안전하게 보호되며 회원님의 명백한 동의없이 공개 또는 제3자에게 제공되지 않습니다.</p>
                        
                            <table class="notice_view mgB30" border="1" cellspacing="0" summary=""> 
							<caption>공지사항 상세 내용입니다.</caption> 
							<colgroup> 
							<col width="20%"></col>
							<col width="*"></col> 
							</colgroup> 
								<tr> 
									<th scope="row">이름</th> 
									<td>${mypageVO.name}</td> 
								</tr> 
								<tr> 
									<th scope="row">아이디</th> 
									<td>${mypageVO.id}</td> 
								</tr>
								<tr> 
									<th scope="row">비밀번호</th> 
									<td>******</td>
								</tr> 
								<tr> 
									<th scope="row">생년월일</th> 
									<td>${mypageVO.birth_dt}</td>
								</tr> 
								<tr> 
									<th scope="row">주소</th> 
									<td>${mypageVO.addr}</td>
								</tr>
								<tr> 
									<th scope="row">전화번호</th> 
									<td>${mypageVO.tel}</td>
								</tr>
								<tr> 
									<th scope="row">이메일</th> 
									<td>${mypageVO.email}</td>
								</tr>
							</table>
                        
                    </div>
                </div>
            </div>
        </div>
    </section>
	<!--/#services-->
	</form>
	
	
    <!--/#action-->
    <script type="text/javaScript" language="javascript" defer="defer">
        <!--
        /* 글 수정 화면 function */
        function fn_egov_select(id) {
        	document.listForm.selectedId.value = id;
           	document.listForm.action = "<c:url value='/updateSampleView.do'/>";
           	document.listForm.submit();
        }
        
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

    