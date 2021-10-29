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
				<h1>신탁계약등록</h1>
			</div>
			<div class="nav-container">
				<ul class="left_nav">
					<li>
						<a href="/admRdCntList.do">차수관리</a>
					</li>
					<li class="active">
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
					<li>
						<a href="/admRdEachList.do">개별등록</a>
					</li>
				</ul>
			</div>
		</div> 
		<!-- //snb --> 
		
		<form commandName="searchVO" id="admRdFrm" name="admRdFrm" method="post">
		<!-- content --> 
		<div class="content" > 
			<div class="paT40 paB25">
				<h1>신탁계약 임시 Excel 데이타 </h1>
			</div>
			
			
			<p class="board_total"><b>임시 등록한 Excel 데이타입니다.</b></p>
			<!-- list  start -->
			<div style="width:910px;height:500px;overflow-y:scroll;overflow-x:scroll;white-space:nowrap;">
			
				<table class="notice_tbl" border="0" cellspacing="0" summary="요양지시서관리입니다."> 
				<caption></caption> 
				<colgroup> 
					<col width="5%"></col>
					<col width="5%"></col>
					<col width="5%"></col>
					<col width="5%"></col>
					<col width="5%"></col>
					<col width="5%"></col>
					<col width="5%"></col>
					<col width="5%"></col>
					<col width="5%"></col>
					<col width="5%"></col>
					<col width="5%"></col>
					<col width="5%"></col>
					<col width="5%"></col>
					<col width="5%"></col>
					<col width="5%"></col>
					<col width="5%"></col>
					<col width="5%"></col>
					<col width="5%"></col>
					<col width="5%"></col>
					<col width="5%"></col>
					<col width="5%"></col>
					<col width="5%"></col>
					<col width="5%"></col>
					<col width="5%"></col>
					<col width="5%"></col>
					<col width="5%"></col>
				</colgroup> 
				<thead> 
				<tr> 
					<th scope="col">번호</th>
					
					<th scope="col">구분</th>
					<th scope="col">년도</th> 
					<th scope="col">월</th> 
					<th scope="col">회차</th> 
					<th scope="col">타이틀</th>
					
					<th scope="col">아이디</th> 
					<th scope="col">성명</th> 
					<th scope="col">생년월일</th> 
					<th scope="col">연락처</th>
					<th scope="col">주소</th> 
					
					<th scope="col">아이디</th> 
					<th scope="col">성명</th>
					<th scope="col">대표</th> 
					<th scope="col">연락처</th> 
					<th scope="col">주소</th>
					 
					<th scope="col">아이디</th>
					<th scope="col">성명</th> 
					<th scope="col">생년월일</th> 
					<th scope="col">연락처</th>
					<th scope="col">주소</th>
					
					 
					<th scope="col">계약일자</th> 
					<th scope="col">맡긴금액</th> 
					<th scope="col">게시일자</th>
					<th scope="col">지출금액</th> 
					<th scope="col">작성일자</th> 
					
				</tr> 
				</thead> 
				<tbody> 
				
				<input type="hidden" id="selectedId" name="selectedId" value=""/>
				
				
				<c:forEach var="result" items="${admRdBdTmpViewList}" varStatus="status">
					
						<tr>
							<td><c:out value="${result.rdNum}"/></td>
							<td><c:out value="${result.rdGb}"/></td> 						
							<td><c:out value="${result.year}"/></td> 
							<td><c:out value="${result.month}"/></td> 
							<td><c:out value="${result.cnt}"/></td> 
							<td class="txtL paL10"><c:out value="${result.title}"/></td> 
							
							<td><c:out value="${result.trstId}"/></td>
							<td><c:out value="${result.trstName}"/></td> 
							<td><c:out value="${result.birthDt}"/></td> 
							<td><c:out value="${result.tel}"/></td>
							<td><c:out value="${result.addr}"/></td>
							
							<td><c:out value="${result.trstId2}"/></td>
							<td><c:out value="${result.trstName2}"/></td> 
							<td><c:out value="${result.rptName2}"/></td> 
							<td><c:out value="${result.tel2}"/></td>
							<td><c:out value="${result.addr2}"/></td>
							
							<td><c:out value="${result.trstId3}"/></td>
							<td><c:out value="${result.trstName3}"/></td> 
							<td><c:out value="${result.birthDt3}"/></td> 
							<td><c:out value="${result.tel3}"/></td>
							<td><c:out value="${result.addr3}"/></td>
							
							<td><c:out value="${result.ctrtDt}"/></td>
							<td><c:out value="${result.putAmt}"/></td>
							<td><c:out value="${result.openDt}"/></td>
							<td><c:out value="${result.expsAmt}"/></td>					
							
							<td><c:out value="${result.regDt}"/></td> 
						</tr>
					
				</c:forEach>
				
				</tbody>
				</table>
			</div>
			
			<div style="height:15px;">
				
			</div>
			
			
			<div class="fl_R">
				<a href="javascript:fn_back();" class="btn_big"><strong>목록</strong></a>
				<a href="javascript:fn_TmpReg();" class="btn_big"><strong>실제데이타저장</strong></a>
				<a href="javascript:fn_TmpDel();" class="btn_big"><strong>임시데이타삭제</strong></a>
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
        
	    /* 뒤로가기 */
	    function fn_back() {
	    	
	    	document.admRdFrm.action = "/admRdBdList.do";
           	document.admRdFrm.submit();
	    }
	    
	    /* 임시데이타 저장 */
        function fn_TmpReg() {
        	
           	document.admRdFrm.action = "/admRdBdTmpReg.do";
           	document.admRdFrm.submit();
        }
	    
	    /* 임시데이타 삭제 */
        function fn_TmpDel() {
        	
           	document.admRdFrm.action = "/admRdBdTmpDel.do";
           	document.admRdFrm.submit();
        }
	    
        
	    
	    
        /* 상세정보 및 Excel 파일 등록화면으로 이동 */
        function fn_detail(rdNum) {
        	
        	document.admRdFrm.selectedId.value = rdNum;
        	
        	document.admRdFrm.action = "/admRdBdView.do";
           	document.admRdFrm.submit();
        }
        
        /* pagination 페이지 링크 function */
        function fn_egov_link_page(pageNo){
        	
        	alert("pageNo ====  "+pageNo);
        	//document.admNotFrm.pageIndex.value = pageNo;
        	//alert("document.admNotFrm.pageIndex.value == "+document.admNotFrm.pageIndex.value);
        	
        	document.admRdFrm.action = "/admRdEachList.do";
           	document.admRdFrm.submit();
        }
        
        /* 글 목록 화면 function */
        function fn_egov_selectList() {
        	
        	document.admRdFrm.action = "/admRdEachList.do";
           	document.admRdFrm.submit();
        }
        
        
        
       
        
        
        //-->
    </script>
	
	
	<!-- footer --> 
	<div class="footer"> 
		<p>All Rights Reserved.</p>
	</div> 
	<!-- //footer --> 