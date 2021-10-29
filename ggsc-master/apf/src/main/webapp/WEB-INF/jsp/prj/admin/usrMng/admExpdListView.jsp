<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<form id=trstFrm name="trstFrm" method="post">		
	<!-- wrap --> 
	<div class="wrap"> 
		
		<!-- container --> 
		<div class="container">
			<!-- snb --> 
			<div class="snb">
				<div class="left_title">
					<h1>수입지출관리</h1>
				</div>
				
			</div> 
			<!-- //snb --> 
			<!-- content --> 
			<div class="content"> 
				<div class="paT40 paB25">
					<h1>수입지출관리</h1>
				</div>
				
				<!-- view  start -->
				<h3 class="title"><b>* 상세정보 </b></h3></br>
				<table class="notice_view" border="1" cellspacing="0" summary=""> 
				<caption></caption> 
				<colgroup> 
				<col width="15%"></col>
				<col width="25%"></col> 
				<col width="20%"></col>
				<col width="45%"></col>
				</colgroup> 
					<thead> 
					</thead> 
					<tbody> 	
					
						<input type="hidden" id="clent_id" name="clent_id" value="${usrMngVO.clent_id}" >
						<input type="hidden" id="mng_no" name="mng_no" value="${usrMngVO.mng_no}" >
						<input type="hidden" id="expd_num" name="expd_num" value="${usrMngVO.expd_num}" >
						<input type="hidden" id="cate_cd" name="cate_cd" value="${usrMngVO.cate_cd}" >
						
						<tr> 	
							<th scope="row">관리번호</th> 
							<td>${usrMngVO.mng_no}</td> 
							<th scope="row">위탁자ID</th> 
							<td>${usrMngVO.clent_id}</td>
						</tr> 
						
						<tr> 
							<th scope="row">수입지출구분</th>
							<td>
							<c:if test="${usrMngVO.icex_gb=='A'}">
								지출
							</c:if>
							<c:if test="${usrMngVO.icex_gb=='B'}">
								수입
							</c:if>
							</td>
							<th scope="row">날짜</th>
							<td>
								<select id="year" name="year" style="width:25%;" >
									<option value="2019" <c:if test="${result.year=='2019'}"> selected </c:if> >2019년</option>
									<option value="2020" <c:if test="${result.year=='2020'}"> selected </c:if> >2020년</option>
								    <option value="2021" <c:if test="${result.year=='2021'}"> selected </c:if> >2021년</option>
								    <option value="2022" <c:if test="${result.year=='2022'}"> selected </c:if> >2022년</option>
								</select>&nbsp;&nbsp;&nbsp;
								<select id="month" name="month" style="width:20%;" >
									<option value="01" <c:if test="${usrMngVO.month=='01'}"> selected </c:if> >1월</option>
									<option value="02" <c:if test="${usrMngVO.month=='02'}"> selected </c:if> >2월</option>
								    <option value="03" <c:if test="${usrMngVO.month=='03'}"> selected </c:if> >3월</option>
								    <option value="04" <c:if test="${usrMngVO.month=='04'}"> selected </c:if> >4월</option>
								    <option value="05" <c:if test="${usrMngVO.month=='05'}"> selected </c:if> >5월</option>
								    <option value="06" <c:if test="${usrMngVO.month=='06'}"> selected </c:if> >6월</option>
								    <option value="07" <c:if test="${usrMngVO.month=='07'}"> selected </c:if> >7월</option>
								    <option value="08" <c:if test="${usrMngVO.month=='08'}"> selected </c:if> >8월</option>
								    <option value="09" <c:if test="${usrMngVO.month=='09'}"> selected </c:if> >9월</option>
								    <option value="10" <c:if test="${usrMngVO.month=='10'}"> selected </c:if> >10월</option>
								    <option value="11" <c:if test="${usrMngVO.month=='11'}"> selected </c:if> >11월</option>
								    <option value="12" <c:if test="${usrMngVO.month=='12'}"> selected </c:if> >12월</option>
								</select>&nbsp;&nbsp;&nbsp;
								<select id="day" name="day" style="width:20%;" >
									<option value="01" <c:if test="${usrMngVO.day=='01'}"> selected </c:if> >1일</option>
									<option value="02" <c:if test="${usrMngVO.day=='02'}"> selected </c:if> >2일</option>
								    <option value="03" <c:if test="${usrMngVO.day=='03'}"> selected </c:if> >3일</option>
								    <option value="04" <c:if test="${usrMngVO.day=='04'}"> selected </c:if> >4일</option>
								    <option value="05" <c:if test="${usrMngVO.day=='05'}"> selected </c:if> >5일</option>
								    <option value="06" <c:if test="${usrMngVO.day=='06'}"> selected </c:if> >6일</option>
								    <option value="07" <c:if test="${usrMngVO.day=='07'}"> selected </c:if> >7일</option>
								    <option value="08" <c:if test="${usrMngVO.day=='08'}"> selected </c:if> >8일</option>
								    <option value="09" <c:if test="${usrMngVO.day=='09'}"> selected </c:if> >9일</option>
								    <option value="10" <c:if test="${usrMngVO.day=='10'}"> selected </c:if> >10일</option>
								    <option value="11" <c:if test="${usrMngVO.day=='11'}"> selected </c:if> >11일</option>
								    <option value="12" <c:if test="${usrMngVO.day=='12'}"> selected </c:if> >12일</option>
								    <option value="13" <c:if test="${usrMngVO.day=='13'}"> selected </c:if> >13일</option>
								    <option value="14" <c:if test="${usrMngVO.day=='14'}"> selected </c:if> >14일</option>
								    <option value="15" <c:if test="${usrMngVO.day=='15'}"> selected </c:if> >15일</option>
								    <option value="16" <c:if test="${usrMngVO.day=='16'}"> selected </c:if> >16일</option>
								    <option value="17" <c:if test="${usrMngVO.day=='17'}"> selected </c:if> >17일</option>
								    <option value="18" <c:if test="${usrMngVO.day=='18'}"> selected </c:if> >18일</option>
								    <option value="19" <c:if test="${usrMngVO.day=='19'}"> selected </c:if> >19일</option>
								    <option value="20" <c:if test="${usrMngVO.day=='20'}"> selected </c:if> >20일</option>
								    <option value="21" <c:if test="${usrMngVO.day=='21'}"> selected </c:if> >21일</option>
								    <option value="22" <c:if test="${usrMngVO.day=='22'}"> selected </c:if> >22일</option>
								    <option value="23" <c:if test="${usrMngVO.day=='23'}"> selected </c:if> >23일</option>
								    <option value="24" <c:if test="${usrMngVO.day=='24'}"> selected </c:if> >24일</option>
								    <option value="25" <c:if test="${usrMngVO.day=='25'}"> selected </c:if> >25일</option>
								    <option value="26" <c:if test="${usrMngVO.day=='26'}"> selected </c:if> >26일</option>
								    <option value="27" <c:if test="${usrMngVO.day=='27'}"> selected </c:if> >27일</option>
								    <option value="28" <c:if test="${usrMngVO.day=='28'}"> selected </c:if> >28일</option>
								    <option value="29" <c:if test="${usrMngVO.day=='29'}"> selected </c:if> >29일</option>
								    <option value="30" <c:if test="${usrMngVO.day=='30'}"> selected </c:if> >30일</option>
								    <option value="31" <c:if test="${usrMngVO.day=='31'}"> selected </c:if> >31일</option>
								</select>
							
							</td>
						</tr>
						<tr> 
							<th scope="row">범주</th>
							<td>${usrMngVO.cate_nm}"</td>
							<th scope="row">상세범주</th>
							<td>
								<select name="cate_dtl_cd" id="cate_dtl_cd" style="width:40%;" >
								<c:forEach var="result" items="${expdCateDtlList}" varStatus="status">		
									<option value="${result.comCd}" <c:if test="${result.comCd==usrMngVO.cate_dtl_cd}"> selected </c:if> >${result.comNm}</option>
								</c:forEach>
							</select>
							</td>
						</tr>
						<tr> 
							<th scope="row">금액</th>
							<td><input type="text" id="amt" name="amt" value="${usrMngVO.amt}" size="20%" ></td>
							<th scope="row">설명</th>
							<td><input type="text" id="cntn" name="cntn" value="${usrMngVO.cntn}" size="40%" ></td>
						</tr>
						
					</tbody> 
				</table>
				</br>
				
				
				<div class="fl_R mgT10">
					<a href="javascript:fn_list();" class="btn_big"><strong>목록보기</strong></a>
					<a href="javascript:fn_update();" class="btn_big"><strong>수정하기</strong></a>					
					<a href="javascript:fn_delete();" class="btn_big"><strong>삭제하기</strong></a>
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
    		
    	}
    
	    function fn_update() {
	    	

	    	var data=new FormData();
	    	data.append("clent_id",document.trstFrm.clent_id.value);
	    	data.append("mng_no",document.trstFrm.mng_no.value);
	    	data.append("expd_num",document.trstFrm.expd_num.value);
	    	data.append("cate_cd",document.trstFrm.cate_cd.value);
	    	
	    	var tmpYear = $("#year option:selected").val();
	    	data.append("year",tmpYear);
	    	
	    	var tmpMonth = $("#month option:selected").val();
	    	data.append("month",tmpMonth);
	    	
	    	var tmpDay = $("#day option:selected").val();
	    	data.append("day",tmpDay);
	    	
	    	var tmpCateDtlCd = $("#cate_dtl_cd option:selected").val();
	    	data.append("cate_dtl_cd",tmpCateDtlCd);
	    	
	    	var tmpCateDtlNm = $("#cate_dtl_cd option:selected").text();
	    	data.append("cate_dtl_nm",tmpCateDtlNm);
	    	
	    	
	    	data.append("amt",document.trstFrm.amt.value);
	    	data.append("cntn",document.trstFrm.cntn.value);
			
	    	$.ajax({
		        data: data ,
		        type: "POST",
		        url: "/fn_admExpdList_Update.do",
		        cache: false,
		        contentType: false,
		        processData: false,
		        dataType:"json",	        
		        success: function(json) {
		        	alert("수정 되었습니다.");
		        	document.trstFrm.action = "/admExpdList.do";
		           	document.trstFrm.submit();
		        }     
		    });
	    }
	    function fn_list() {
	    	document.trstFrm.action = "<c:url value='/admExpdList.do'/>";
	       	document.trstFrm.submit();
	    }
	    
	    function fn_delete() {
	    	var data=new FormData();
	    	data.append("mng_no",document.trstFrm.mng_no.value);
			data.append("clent_id",document.trstFrm.clent_id.value);
			
	    	
	    	$.ajax({
		        data: data ,
		        type: "POST",
		        url: "/fn_admTrstList_Delete.do",
		        cache: false,
		        contentType: false,
		        processData: false,
		        dataType:"json",	        
		        success: function(json) {
		        	alert("삭제 되었습니다.");
		        	document.trstFrm.action = "/admTrstList.do";
		           	document.trstFrm.submit();
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

    