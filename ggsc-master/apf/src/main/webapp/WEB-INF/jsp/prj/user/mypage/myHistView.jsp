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
                            <h1 class="title">마이페이지</h1>
                            <p>요양지시서 등록정보를 확인 가능합니다.</p>
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
					<!-- view  start -->
					<table class="notice_view" border="1" cellspacing="0" summary=""> 
					<caption>의료요양지시서 등록 상세 내용입니다.</caption> 
					<colgroup> 
					<col width="10%"></col>
					<col width="30%"></col> 
					<col width="10%"></col>
					<col width="20%"></col>
					<col width="10%"></col>
					<col width="20%"></col>
					</colgroup> 
						<thead> 
						<tr> 
							<th scope="row">제목</th> 
							<td colspan="5">${mypageVO.title}</td> 
						</tr> 
						</thead> 
						<tbody> 
						<tr> 
							<th scope="row">작성자</th> 
							<td>${mypageVO.reg_id}</td> 
							<th scope="row">등록일</th> 
							<td>${mypageVO.reg_tm}</td>
							<th scope="row">파일명</th> 
							<td>${mypageVO.org_file_nm}</td>
						</tr>
						<tr> 
						<td class="cont" colspan="6"> 
							${mypageVO.content}
						</td> 
						</tr> 
						</tbody> 
					</table>
					<div class="txtR mgT10">
						<button onclick="location.href='/regHist.do'" type="button" class="btn btn-sm btn-primary">목록</button>
					</div>
					
					<!-- view  end -->
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

    