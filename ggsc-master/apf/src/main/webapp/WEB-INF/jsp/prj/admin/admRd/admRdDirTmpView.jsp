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
				<h1>요양지시서등록</h1>
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
					<li class="active">
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
				<h1>요양지시서 임시 Excel 데이타 </h1>
			</div>
			
			
			<p class="board_total"><b>임시 등록한 Excel 데이타입니다.</b></p>
			<!-- list  start -->
			<div style="width:910px;height:500px;overflow-y:scroll;overflow-x:scroll;white-space:nowrap;">
			
				<table class="notice_tbl" border="0" cellspacing="0" summary="요양지시서관리입니다."> 
				<caption></caption> 
				<colgroup> 
					<col width="*"></col>
				</colgroup> 
				<thead> 
				<tr> 
					<th scope="col">순번</th>
					<th scope="col">구분</th>
					<th scope="col">년도</th>
					<th scope="col">월</th>
					<th scope="col">회차</th>
					<th scope="col">제목</th>
					<th scope="col">작성자ID</th>
					<th scope="col">작성자성명</th>
					<th scope="col">작성자생년월일</th>
					<th scope="col">작성자연락처</th>
					<th scope="col">작성자주소</th>
					<th scope="col">제1대리인</br>ID</th>
					<th scope="col">제1대리인</br>성명</th>
					<th scope="col">제1대리인</br>생년월일</th>
					<th scope="col">제1대리인</br>연락처</th>
					<th scope="col">제1대리인</br>주소</th>
					<th scope="col">제2대리인</br>성명</th>
					<th scope="col">제2대리인</br>생년월일</th>
					<th scope="col">제2대리인</br>연락처</th>
					<th scope="col">제2대리인</br>주소</th>
					<th scope="col">증인</br>성명</th>
					<th scope="col">증인</br>생년월일</th>
					<th scope="col">증인</br>연락처</th>
					<th scope="col">증인</br>주소</th>
					<th scope="col">작성일자</th>
					<th scope="col">적용시점</th>
					<th scope="col">기타시점</th>
					<th scope="col">제1대리인권한</br>병원치료</th>
					<th scope="col">제1대리인권한</br>입소계약</th>
					<th scope="col">제1대리인권한</br>신체자유</th>
					<th scope="col">제1대리인권한</br>예금계좌관리</th>
					<th scope="col">제1대리인권한</br>은행</th>
					<th scope="col">제1대리인권한</br>계좌번호</th>
					<th scope="col">제1대리인권한</br>예금주</th>
					<th scope="col">제1대리인권한</br>임차보증금반환</th>
					<th scope="col">제1대리인권한</br>소유주택임차</th>
					<th scope="col">제1대리인권한</br>사회보장급여신청</th>
					<th scope="col">제1대리인권한</br>공법상신청행위</th>
					<th scope="col">제2대리인권한</br>보고요구</th>
					<th scope="col">제2대리인권한</br>해임</th>
					<th scope="col">제2대리인권한</br>손해배상청구</th>
					<th scope="col">제2대리인권한</br>제1대리인선임</th>
					<th scope="col">작성자</th>
					<th scope="col">지원자</th>
					<th scope="col">보관자</th>
					<th scope="col">부록작성</th>
					<th scope="col">등록일자</th>
					
				</tr> 
				</thead> 
				<tbody> 
				
				<input type="hidden" id="selectedId" name="selectedId" value=""/>
				
				
				<c:forEach var="result" items="${admRdDirTmpViewList}" varStatus="status">
					
						<tr>
							<td><c:out value="${result.cdNum}"/></td>
							<td><c:out value="${result.rdGb}"/></td> 						
							<td><c:out value="${result.year}"/></td> 
							<td><c:out value="${result.month}"/></td> 
							<td><c:out value="${result.cnt}"/></td> 
							<td class="txtL paL10"><c:out value="${result.title}"/></td> 
							
							<td><c:out value="${result.witrId}"/></td>
							<td><c:out value="${result.witrName}"/></td> 
							<td><c:out value="${result.witrBirthDt}"/></td> 
							<td><c:out value="${result.witrTel}"/></td>
							<td><c:out value="${result.witrAddr}"/></td> 
							
							<td><c:out value="${result.rpt1Id}"/></td>
							<td><c:out value="${result.rpt1Name}"/></td>
							<td><c:out value="${result.rpt1BirthCorp}"/></td> 
							<td><c:out value="${result.rpt1Tel}"/></td> 
							<td><c:out value="${result.rpt1Addr}"/></td>
							
							<td><c:out value="${result.rpt2Name}"/></td>
							<td><c:out value="${result.rpt2BirthCorp}"/></td> 
							<td><c:out value="${result.rpt2Tel}"/></td> 
							<td><c:out value="${result.rpt2Addr}"/></td>
							
							<td><c:out value="${result.witName}"/></td>
							<td><c:out value="${result.witBirth}"/></td> 
							<td><c:out value="${result.witTel}"/></td> 
							<td><c:out value="${result.witAddr}"/></td>
							
							<td><c:out value="${result.aplyRegDt}"/></td>
							<td><c:out value="${result.aplyPoint}"/></td> 
							<td><c:out value="${result.aplyEtc}"/></td> 
							
							<td><c:out value="${result.rpt1Auth1}"/></td>
							<td><c:out value="${result.rpt1Auth2}"/></td>
							<td><c:out value="${result.rpt1Auth3}"/></td>
							<td><c:out value="${result.rpt1Auth4}"/></td>
							<td><c:out value="${result.rpt1Auth5}"/></td>
							<td><c:out value="${result.rpt1Auth6}"/></td>
							<td><c:out value="${result.rpt1Auth7}"/></td>
							<td><c:out value="${result.rpt1Auth8}"/></td>
							<td><c:out value="${result.rpt1Auth9}"/></td>
							<td><c:out value="${result.rpt1Auth10}"/></td>
							<td><c:out value="${result.rpt1Auth11}"/></td>
							
							<td><c:out value="${result.rpt2Auth1}"/></td>
							<td><c:out value="${result.rpt2Auth2}"/></td>
							<td><c:out value="${result.rpt2Auth3}"/></td>
							<td><c:out value="${result.rpt2Auth4}"/></td>
							
							<td><c:out value="${result.writerName}"/></td>
							<td><c:out value="${result.rptName}"/></td>
							<td><c:out value="${result.keepName}"/></td>
							<td><c:out value="${result.suplYn}"/></td>
												
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
	    	
	    	document.admRdFrm.action = "/admRdDirList.do";
       		document.admRdFrm.submit();
	    }
	    
	    /* 실제데이타 저장 */
        function fn_TmpReg() {
        	
           	document.admRdFrm.action = "/admRdDirTmpReg.do";
           	document.admRdFrm.submit();
        }
	    
	    /* 임시데이타 삭제 */
        function fn_TmpDel() {
        	
           	document.admRdFrm.action = "/admRdDirTmpDel.do";
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