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
				<h3 class="title"><b>* 등록하기 </b></h3></br>
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
						
						<tr> 	
							<th scope="row">관리번호</th> 
							<td>${usrMngVO.mng_no}</td> 
							<th scope="row">위탁자ID</th> 
							<td>${usrMngVO.clent_id}</td>
						</tr> 
						
						<tr> 
							<th scope="row">수입지출구분</th>
							<td>
								<select id="icex_gb" name="icex_gb" style="width:40%;" >
									<option value="B">수입</option>
									<option value="A">지출</option>
								</select>
							</td>
							<th scope="row">날짜</th>
							<td>
								<select id="year" name="year" style="width:25%;" >
									<option value="2019">2019년</option>
									<option value="2020">2020년</option>
								    <option value="2021">2021년</option>
								    <option value="2022">2022년</option>
								</select>&nbsp;&nbsp;&nbsp;
								<select id="month" name="month" style="width:20%;" >
									<option value="01">1월</option>
									<option value="02">2월</option>
								    <option value="03">3월</option>
								    <option value="04">4월</option>
								    <option value="05">5월</option>
								    <option value="06">6월</option>
								    <option value="07">7월</option>
								    <option value="08">8월</option>
								    <option value="09">9월</option>
								    <option value="10">10월</option>
								    <option value="11">11월</option>
								    <option value="12">12월</option>
								</select>&nbsp;&nbsp;&nbsp;
								<select id="day" name="day" style="width:20%;" >
									<option value="01">1일</option>
									<option value="02">2일</option>
								    <option value="03">3일</option>
								    <option value="04">4일</option>
								    <option value="05">5일</option>
								    <option value="06">6일</option>
								    <option value="07">7일</option>
								    <option value="08">8일</option>
								    <option value="09">9일</option>
								    <option value="10">10일</option>
								    <option value="11">11일</option>
								    <option value="12">12일</option>
								    <option value="13">13일</option>
								    <option value="14">14일</option>
								    <option value="15">15일</option>
								    <option value="16">16일</option>
								    <option value="17">17일</option>
								    <option value="18">18일</option>
								    <option value="19">19일</option>
								    <option value="20">20일</option>
								    <option value="21">21일</option>
								    <option value="22">22일</option>
								    <option value="23">23일</option>
								    <option value="24">24일</option>
								    <option value="25">25일</option>
								    <option value="26">26일</option>
								    <option value="27">27일</option>
								    <option value="28">28일</option>
								    <option value="29">29일</option>
								    <option value="30">30일</option>
								    <option value="31">31일</option>
								</select>
							
							</td>
						</tr>
						<tr> 
							<th scope="row">범주</th>
							<td>
								<select name="cate_cd" id="cate_cd" style="width:50%;" >
									<c:forEach var="result" items="${expdCateList}" varStatus="status">		
										<option value="${result.comCd}">${result.comNm}</option>
									</c:forEach>
								</select>
							</td>
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
					<a href="javascript:fn_update();" class="btn_big"><strong>등록하기</strong></a>					
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
	    	
	    	var tmpIcex_gb = $("#icex_gb option:selected").val();
	    	data.append("icex_gb",tmpIcex_gb);
	    	
	    	var tmpCate_cd = $("#cate_cd option:selected").val();
	    	data.append("cate_cd",tmpCate_cd);
	    	
	    	var tmpCate_nm = $("#cate_cd option:selected").text();
	    	data.append("cate_nm",tmpCate_nm);
	    	
	    	
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
		        url: "/fn_admExpdReg.do",
		        cache: false,
		        contentType: false,
		        processData: false,
		        dataType:"json",	        
		        success: function(json) {
		        	alert("등록 되었습니다.");
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

    