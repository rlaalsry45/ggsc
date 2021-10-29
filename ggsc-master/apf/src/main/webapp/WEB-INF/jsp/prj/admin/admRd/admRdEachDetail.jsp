<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>



	<!-- wrap --> 
	<div class="wrap"> 
		
		<!-- container --> 
		<div class="container">
			<!-- snb --> 
			<div class="snb">
				<div class="left_title">
					<h1>개별등록</h1>
				</div>
				<div class="nav-container">
					<ul class="left_nav">
						<li>
							<a href="/admRdCntList.do">차수관리</a>
						</li>
						<li>
							<a href="/admRdBdList.do">신탁계약등록</a>
						</li>
						<li>
							<a href="/admRdBdRstList.do">신탁계약결과</a>
						</li>
						<li>
							<a href="/admRdDirList.do">요양지시서등록</a>
						</li>
						<li>
							<a href="/admRdDirRstList.do">요양지시서결과</a>
						</li>
						<li class="active">
							<a href="/admRdEachList.do">개별등록</a>
						</li>
					</ul>
				</div>
			</div> 
			<!-- //snb --> 
			<!-- content --> 
			<div class="content"> 
				<div class="paT40 paB25">
					<h1>개별등록</h1>
				</div>
				
				<!-- view  start -->
				<div class="form_table">
					<form id="regRdFrm" name="regRdFrm" method="post" enctype="multipart/form-data">
							<table class="notice_view" border="1" cellspacing="0" summary=""> 
								<caption>요양지시서관리 내용입니다.</caption> 
								<colgroup> 
								<col width="150">
								<col width="*">
								</colgroup> 
								<tbody> 
								<input type="hidden" id="rd_num" name="rd_num" value="${admRdVO.rd_num}" />
								<input type="hidden" id="rd_gb" name="rd_gb" value="${admRdVO.rd_gb}" />
								<tr> 
									<th>제   목</th> 
									<td>${admRdVO.title}</td> 
								</tr>
								<tr> 
								<th>구   분</th> 
									<td>
										<c:if test="${admRdVO.rd_gb=='1'}">
											<b>신탁계약</b>
										</c:if>
										<c:if test="${admRdVO.rd_gb=='2'}">
											<b>의료요양지시서</b>
										</c:if>
										<c:if test="${admRdVO.rd_gb=='3'}">
											<b>개별등록</b>
										</c:if>
									</td> 
								</tr>  
								<tr> 
									<th>년   도</th> 
									<td>${admRdVO.year}년</td> 
								</tr>
								<tr> 
									<th>월</th> 
									<td>${admRdVO.month}월</td> 
								</tr>
								<tr> 
									<th>차   수</th> 
									<td>${admRdVO.cnt}차</td> 
								</tr>
								<tr>
									<th colspan="2">
										<c:if test="${admRdVO.rd_gb=='1'}">
											<b>신탁계약 Excel파일 업로드</b>
										</c:if>
										<c:if test="${admRdVO.rd_gb=='2'}">
											<b>의료요양지시서 Excel파일 업로드</b>
										</c:if>
										<c:if test="${admRdVO.rd_gb=='3'}">
											<b>개별등록 파일업로드</b>
										</c:if>
									</th> 
								</tr>
								<tr> 
									<th>회원정보검색</th> 
									<td>
										<div class="item">
										<a href="javascript:fn_popup();" class="btn_big"><strong>회원검색</strong></a>  등록할 회원을 선택하세요.
										<input type="text" id="id" name="id" value="" class="i_text wp95" >
										<input type="text" id="name" name="name" value="" class="i_text wp95" >
										</div>
									</td> 
								</tr> 
								<tr> 
									<th>파일</th> 
									<td>
										<div class="item">
											<input type="file" id="uploadFile" name="uploadFile" value="" class="i_text wp95" >
										</div>
									</td> 
								</tr>  
								</tbody> 
							</table>
					</form>
				</div>
				<div class="fl_R mgT10">
					<a href="javascript:fn_reg();" class="btn_big"><strong>저장하기</strong></a>
					<a href="javascript:fn_list();" class="btn_big"><strong>목록보기</strong></a>
				</div>
				<!-- view  end -->
			</div> 
			<!-- //content --> 
		</div> 
		<!-- //container -->
		
	</div>
	<!-- /wrap --> 

	
	<!--/#action-->
    <script type="text/javaScript" language="javascript" defer="defer">
        
	 	//개별 등록하기
	    function fn_reg() {
	    	if(document.regRdFrm.id.value == "" || document.regRdFrm.id.value == null ){
	    		alert("회원정보를 선택해 주세요.");
	    		return;
	    	}
	    	if(document.regRdFrm.name.value == "" || document.regRdFrm.name.value == null ){
	    		alert("회원정보를 선택해 주세요.");
	    		return;
	    	}
	    	if(document.regRdFrm.uploadFile.value == "" || document.regRdFrm.uploadFile.value == null ){
	    		alert("파일을 선택하셔야 합니다.");
	    		return;
	    	}
	    	document.regRdFrm.action = "/admRdEachReg.do";
	       	document.regRdFrm.submit();
	    }
	    
	    
	    //개별등록 목록이동
	    function fn_list() {
	    	
	    	document.regRdFrm.action = "/admRdEachList.do";
	       	document.regRdFrm.submit();
	    }
	    
	    //회원정보검색 팝업
	    function fn_popup(){
	        var url = "/admRdEachPop.do";
	        var name = "popup";
	        var option = "width = 400, height = 600, top = 250, left =500, location = no"
	        window.open(url, name, option);
	    }

        
        
        
        
        //-->
    </script>
	
	
	<!-- footer --> 
	<div class="footer"> 
		<p>All Rights Reserved.</p>
	</div> 
	<!-- //footer --> 