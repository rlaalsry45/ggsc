<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<form id="usrMngFrm" name="usrMngFrm" method="post">		
	<!-- wrap --> 
	<div class="wrap"> 
		
		<!-- container --> 
		<div class="container">
			<!-- snb --> 
			<div class="snb">
				<div class="left_title">
					<h1>회원관리</h1>
				</div>
				<div class="nav-container">
					<ul class="left_nav">
						<li class="active">
							<a href="/usrMngList.do">회원정보</a>
						</li>
					</ul>
				</div>
			</div> 
			<!-- //snb --> 
			<!-- content --> 
			<div class="content"> 
				<div class="paT40 paB25">
					<h1>회원 상세정보</h1>
				</div>
				<!-- view  start -->
				<table class="notice_view" border="1" cellspacing="0" summary=""> 
					<caption>회원정보 내용입니다.</caption> 
					<colgroup> 
					<col width="150">
					<col width="*">
					</colgroup> 
					<tbody> 
					<tr> 
						<th>아이디(수정불가)</th> 
						<td><input type="text" id="id" name="id" value="${usrMngVO.id}" size="90%" readOnly/></td> 
					</tr> 
					<tr> 
						<th>비밀번호</th> 
						<td><input type="text" id="pwd" name="pwd" value="*****" size="90%" /></td> 
					</tr>
					<tr>
						<th>성명</th> 
						<td><input type="text" id="name" name="name" value="${usrMngVO.name}" size="90%" /></td> 
					</tr> 
					<tr> 
						<th>관리자여부</th> 
						<td>
							<select name="admin_gb" style="width:30%;" >
							<c:if test="${usrMngVO.admin_gb eq 'Y'}">
							    <option value="Y" selected>관리자</option>
							    <option value="N">일반회원</option>
							</c:if>
							<c:if test="${usrMngVO.admin_gb eq 'N'}">
								<option value="Y">관리자</option>
							    <option value="N" selected>일반회원</option>
							</c:if>
							</select>
						
						</td> 
					</tr> 
					<tr> 
						<th>사용여부</th> 
						<td>
							<select name="use_yn" style="width:30%;" >
							<c:if test="${usrMngVO.use_yn eq 'Y'}">
							    <option value="Y" selected>사용</option>
							    <option value="N">미사용</option>
							</c:if>
							<c:if test="${usrMngVO.use_yn eq 'N'}">
								<option value="Y">사용</option>
							    <option value="N" selected>미사용</option>
							</c:if>
							</select>
						
						</td> 
					</tr> 
					<tr> 
						<th>생년월일</th> 
						<td><input type="text" id="birth_dt" name="birth_dt" value="${usrMngVO.birth_dt}" size="90%" /></td> 
					</tr>  
					<tr> 
						<th>기본주소</th> 
						<td>
							<input type="text" id="basic_addr" name="basic_addr" value="${usrMngVO.basic_addr}" size="90%" />
						</td> 
					</tr>
					<tr> 
						<th>상세주소</th> 
						<td>
							<input type="text" id="dtl_addr" name="dtl_addr" value="${usrMngVO.dtl_addr}" size="90%" />						
						</td> 
					</tr>
					<tr>
						<th>전화번호</th> 
						<td><input type="text" id="tel" name="tel" value="${usrMngVO.tel}" size="90%" /></td> 
					</tr> 
					<tr>
						<th>이메일</th> 
						<td><input type="text" id="email" name="email" value="${usrMngVO.email}" size="90%" /></td> 
					</tr> 
					</tbody> 
				</table>
				<div class="fl_R mgT10">
					<a href="javascript:fn_update();" class="btn_big"><strong>수정하기</strong></a>
					<a href="javascript:fn_list();" class="btn_big"><strong>목록보기</strong></a>
					<a href="javascript:fn_pwInit();" class="btn_big"><strong>비밀번호초기화(1234)</strong></a>
				</div>
				<!-- view  end -->
			</div> 
			<!-- //content --> 
		</div> 
		<!-- //container -->
		<!-- footer --> 
		<div class="footer"> 
			<p>All Rights Reserved.</p>
		</div> 
		<!-- //footer --> 
	</div>
	<!-- /wrap --> 
</form>	
	
    <!--/#action-->
    <script type="text/javaScript" language="javascript" defer="defer">
        
    	window.onload = function () {
	    	tmp_val = ${usrMngVO.admin_gb};
	    	alert(tmp_val);
	    	if(tmp_val == "Y"){
	    		$("#admin_gb").val("Y").prop("selected", true);
	    	}else{
	    		$("#admin_gb").val("N").prop("selected", true);
	    	}
	    	
    	}
    
	    function fn_update() {
	    	
	       	document.usrMngFrm.action = "<c:url value='/usrMngUpdate.do'/>";
	       	document.usrMngFrm.submit();
	    }
	    function fn_list() {
	    	document.usrMngFrm.action = "<c:url value='/usrMngList.do'/>";
	       	document.usrMngFrm.submit();
	    }
	    
	    //비밀번호 초기화
	    function fn_pwInit() {
	    	var data=new FormData();
			data.append("id",document.usrMngFrm.id.value);
			
			
	    	$.ajax({
		        data: data ,
		        type: "POST",
		        url: "/usrMngPwdInit.do",
		        cache: false,
		        contentType: false,
		        processData: false,
		        dataType:"json",	        
		        success: function(json) {
		        	//alert("json.url =========== "+json.url);
		        	if(json.success=="true"){
		        		alert("초기화 되었습니다.");
		        		return;
		        	}else{
		        		alert("초기화에 실패 하였습니다.");
		        		return;
		        	}
		        	
		        }
		    });
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

    