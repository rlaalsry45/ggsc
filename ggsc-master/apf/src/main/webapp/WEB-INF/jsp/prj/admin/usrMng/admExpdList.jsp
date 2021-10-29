<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


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
		
		<form commandName="searchVO" id="admCdFrm" name="admCdFrm" method="post">
		<!-- content --> 
		<div class="content"> 
			<div class="paT40 paB25">
				<h1>수입지출관리</h1>
			</div>
			
			<!-- 검색영역 --> 
			<div class="search_box">
				<fieldset>
					<legend>검색영역</legend>
					<div class="search_group ">
						<strong>수입지출구분</strong>
						<span class="search_line">|</span>
						<select id="sel_icex_gb" name="sel_icex_gb" style="width:20%;" >
							<option value="C" <c:if test="${sch_icex_gb=='C'}"> selected </c:if> >전체</option>
							<option value="B" <c:if test="${sch_icex_gb=='B'}"> selected </c:if>>수입</option>
							<option value="A" <c:if test="${sch_icex_gb=='A'}"> selected </c:if> >지출</option>
						</select>
					</div>
					<div class="search_group mgT5">
						<strong>범주</strong>
						<span class="search_line">|</span>
					
						<select id="sel_cate_cd" name="sel_cate_cd" style="width:20%;" >
							
						<c:forEach var="result" items="${expdCateList}" varStatus="status">		
							<option value="${result.comCd}" <c:if test="${result.comCd==sch_cate_cd}"> selected </c:if> >${result.comNm}</option>
						</c:forEach>
						
						</select>
					
					</div>	
					<div class="search_group mgT5">
						<strong>년도</strong>
						<span class="search_line">|</span>
						<select id="sel_year" name="sel_year" style="width:20%;" >
							<option value="2019" <c:if test="${sch_year=='2019'}"> selected </c:if> >2019년</option>
							<option value="2020" <c:if test="${sch_year=='2020'}"> selected </c:if> >2020년</option>
						    <option value="2021" <c:if test="${sch_year=='2021'}"> selected </c:if> >2021년</option>
						    <option value="2022" <c:if test="${sch_year=='2022'}"> selected </c:if> >2022년</option>
						</select>
					</div>
					<div class="search_group mgT5">
						<strong>월</strong>
						<span class="search_line">|</span>
						<select id="sel_month" name="sel_month" style="width:20%;" >
							<option value="01" <c:if test="${sch_month=='01'}"> selected </c:if> >1월</option>
							<option value="02" <c:if test="${sch_month=='02'}"> selected </c:if> >2월</option>
						    <option value="03" <c:if test="${sch_month=='03'}"> selected </c:if> >3월</option>
						    <option value="04" <c:if test="${sch_month=='04'}"> selected </c:if> >4월</option>
						    <option value="05" <c:if test="${sch_month=='05'}"> selected </c:if> >5월</option>
						    <option value="06" <c:if test="${sch_month=='06'}"> selected </c:if> >6월</option>
						    <option value="07" <c:if test="${sch_month=='07'}"> selected </c:if> >7월</option>
						    <option value="08" <c:if test="${sch_month=='08'}"> selected </c:if> >8월</option>
						    <option value="09" <c:if test="${sch_month=='09'}"> selected </c:if> >9월</option>
						    <option value="10" <c:if test="${sch_month=='10'}"> selected </c:if> >10월</option>
						    <option value="11" <c:if test="${sch_month=='11'}"> selected </c:if> >11월</option>
						    <option value="12" <c:if test="${sch_month=='12'}"> selected </c:if> >12월</option>
						</select>
						
						<a class="btn_search" href="javascript:fn_sch();">검색</a>
					
					</div>
				</fieldset> 
			</div>
			<!-- //검색영역 -->
			
			
			<input type="hidden" id="sch_icex_gb" name="sch_icex_gb" value=""/>
			<input type="hidden" id="sch_cate_cd" name="sch_cate_cd" value="" />
			<input type="hidden" id="sch_year" name="sch_year" value="" />
			<input type="hidden" id="sch_month" name="sch_month" value="" />
			 
			<p class="board_total"><font color="blue">Total : ${totCnt}</font> <font color="red">(관리번호를 누르면 상세페이지로 이동합니다.)</font></b></p>
			<!-- list  start -->
			<table class="notice_tbl" border="0" cellspacing="0" summary="요양지시서관리입니다."> 
				<caption></caption>
				<colgroup>
					<col width="15%"></col>
					<col width="10%"></col>
					<col width="15%"></col>
					<col width="15%"></col>
					<col width="15%"></col>
					<col width="20%"></col>
					<col width="10%"></col>
				</colgroup>
				<thead>
				<tr>
					<th scope="col">관리번호</th>
					<th scope="col">날짜</th>
					<th scope="col">수입지출구분</th>
					<th scope="col">범주</th>
					<th scope="col">금액</th>
					<th scope="col">내용</th>
					<th scope="col">증빙자료</th>
				</tr> 
				</thead>
				<tbody>
				
				
				<input type="hidden" id="mng_no" name="mng_no" value="${usrMngVO.mng_no}" >
				<input type="hidden" id="clent_id" name="clent_id" value="${usrMngVO.clent_id}" >
				<input type="hidden" id="expd_num" name="expd_num" value="" >
				<input type="hidden" id="cate_cd" name="cate_cd" value="" >
				
				<c:forEach var="result" items="${expdList}" varStatus="status">
					<tr>
						<td style="cursor:pointer;" onclick="javascript:fn_detail('<c:out value="${result.mngNo}"/>','<c:out value="${result.clentId}"/>','<c:out value="${result.expdNum}"/>','<c:out value="${result.cateCd}"/>');" onmouseover="this.style.backgroundColor='#f1f1f1'" onmouseout="this.style.backgroundColor='#ffffff'">
							${result.mngNo}
						</td>
						<td>
							<c:out value="${result.year}"/>-<c:out value="${result.month}"/>-<c:out value="${result.day}"/>
						</td>
						<td>
						<c:if test="${result.icexGb == 'A'}">
							지출
						</c:if>
						<c:if test="${result.icexGb == 'B'}">
							수입
						</c:if>
						</td>
						<td><c:out value="${result.cateNm}"/></td>
						<td style="text-align:right;"><fmt:formatNumber value="${result.amt}" pattern="#,###"/>원</td>
						<td><c:out value="${result.cntn}"/></td>
						<td>
							<a href="javascript:fn_expd_upload('<c:out value="${result.mngNo}"/>','<c:out value="${result.clentId}"/>','<c:out value="${result.expdNum}"/>','<c:out value="${result.cateCd}"/>');" class="btn_big"><strong>업로드</strong></a>
						</td>
					</tr>
				</c:forEach>
				
				
				
				</tbody>
			</table>
			</br></br>
			<p class="board_total"><font color="blue">금액합계 : <fmt:formatNumber value="${totSum}" pattern="#,###"/>원</font></b></p>
			 

			</br>
			
			<div class="fl_R mgT10">
				<a href="javascript:fn_RegMove();" class="btn_big"><strong>등록</strong></a>
			</div>
			
			
			
			<!-- list  end -->
		</div> 
		<!-- //content --> 
		</form>
		
	</div> 
	<!-- //container --> 
	
</div>
<!-- /wrap -->  
	
	
	<!--/#action-->
    <script type="text/javaScript" language="javascript" defer="defer">
        
	    window.onload = function () {
			
	    	document.admCdFrm.sch_icex_gb.value = "";
	    	document.admCdFrm.sch_cate_cd.value = "";
	    	document.admCdFrm.sch_year.value = "";
		}
		   
	    
	    /* 검색하기 */
	    function fn_sch() {
	    	var tmpV = $("#sel_icex_gb option:selected").val();
			document.admCdFrm.sch_icex_gb.value = tmpV;
	    	
	    	var tmpC = $("#sel_cate_cd option:selected").val();
	    	document.admCdFrm.sch_cate_cd.value = tmpC;
	    	
	    	var tmpY = $("#sel_year option:selected").val();
	    	document.admCdFrm.sch_year.value = tmpY;
	    	
	    	var tmpM = $("#sel_month option:selected").val();
	    	document.admCdFrm.sch_month.value = tmpM;
	    	
	    	
	    	//alert(document.admCdFrm.sch_icex_gb.value);
	    	//alert(document.admCdFrm.sch_cate_cd.value);
	    	//alert(document.admCdFrm.sch_year.value);
	    	
	    	
	       	document.admCdFrm.action = "/admExpdList.do";
	       	document.admCdFrm.submit();
	       	
	    }
	    
	    /* 등록 */
	    function fn_RegMove() {
	    	
	    	//document.admCdFrm.mng_no.value = mng_no;
	    	//document.admCdFrm.clent_id.value = clent_id;
	    	//document.admCdFrm.expd_num.value = expd_num;
	    	//document.admCdFrm.cate_cd.value = cate_cd;
	    	
	       	document.admCdFrm.action = "/admExpdRegMove.do";
	       	document.admCdFrm.submit();
	       	
	    }
	    
	    /* 상세보기 화면으로 이동 */
        function fn_detail(mng_no, clent_id, expd_num, cate_cd) {
        	
	    	document.admCdFrm.mng_no.value = mng_no;
	    	document.admCdFrm.clent_id.value = clent_id;
	    	document.admCdFrm.expd_num.value = expd_num;
	    	document.admCdFrm.cate_cd.value = cate_cd;
	    	
	    	
           	document.admCdFrm.action = "/admExpdViewMove.do";
           	document.admCdFrm.submit();
           	
           	
        }
	    
        /* 증빙자료 업로드 페이지로 이동 */
        function fn_expd_upload(mng_no, clent_id, expd_num, cate_cd) {
        	
	    	document.admCdFrm.mng_no.value = mng_no;
	    	document.admCdFrm.clent_id.value = clent_id;
	    	document.admCdFrm.expd_num.value = expd_num;
	    	document.admCdFrm.cate_cd.value = cate_cd;
	    	
	    	
           	document.admCdFrm.action = "/admExpdUploadMove.do";
           	document.admCdFrm.submit();
           	
           	
        }
	    
	    
	    /* pdf 생성 */
	    function fn_make_pdf(mng_no, clent_id) {
	    	var data=new FormData();
	    	data.append("mng_no",mng_no);
	    	data.append("clent_id",clent_id);
	    	
	       	$.ajax({
		        data: data ,
		        type: "POST",
		        url: "/admTrstMakePdf.do",
		        cache: false,
		        contentType: false,
		        processData: false,
		        dataType:"json",	        
		        success: function(json) {
		        	alert("생성 되었습니다.");
		        	document.admCdFrm.action = "/admTrstList.do";
			       	document.admCdFrm.submit();
		        	
		        }     
		    });
	    }
	    
	    
	    
	   
	    
	    
        
        
        //보고서 업로드
        function fn_rpt(mng_no, witr_id, witr_name, rpt1_id, rpt2_id) {
        	
        	document.admCdFrm.mng_no.value = mng_no;
	    	document.admCdFrm.witr_id.value = witr_id;
	    	document.admCdFrm.witr_name.value = witr_name;
	    	document.admCdFrm.rpt1_id.value = rpt1_id;
	    	document.admCdFrm.rpt2_id.value = rpt2_id;
	    	
	    
	    	
           	document.admCdFrm.action = "/admCdRptMove.do";
           	document.admCdFrm.submit();
           	
       	}
        
        //감독기록 업로드
        function fn_report(mng_no, witr_id, witr_name, rpt2_id) {
        	
        	
        	document.admCdFrm.mng_no.value = mng_no;
	    	document.admCdFrm.witr_id.value = witr_id;
	    	document.admCdFrm.witr_name.value = witr_name;
	    	document.admCdFrm.rpt2_id.value = rpt2_id;
	    	
           	document.admCdFrm.action = "/admCdReportMove.do";
           	document.admCdFrm.submit();
           	
       	}
        
       
        
        
        //-->
    </script>
	
	
	<!-- footer --> 
	<div class="footer"> 
		<p>All Rights Reserved.</p>
	</div> 
	<!-- //footer --> 