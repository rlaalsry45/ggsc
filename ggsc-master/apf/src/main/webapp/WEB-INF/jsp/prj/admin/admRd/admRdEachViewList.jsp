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
		
		
		<form commandName="searchVO" id="admRdFrm" name="admRdFrm" method="post">
		<!-- content --> 
		<div class="content"> 
			<div class="paT40 paB25">
				<h1>개별등록 상세</h1>
			</div>
			
			<p class="board_total"><b>개별등록 목록입니다.</b></p>
			
		
			<!-- list  start -->
			
				<table class="notice_tbl"> 
				<caption></caption> 
				<colgroup> 
					<col width="7%"></col>
					<col width="10%"></col>
					<col width="8%"></col>
					<col width="8%"></col>
					<col width="7%"></col>
					<col width="20%"></col>
					<col width="10%"></col>
					<col width="10%"></col>
					<col width="20%"></col>
				</colgroup> 
				<thead> 
				<tr> 
					<th scope="col">번호</th>
					<th scope="col">구분</th> 
					<th scope="col">년도</th> 
					<th scope="col">월</th> 
					<th scope="col">차수</th>
					<th scope="col">제목</th> 
					<th scope="col">ID</th> 
					<th scope="col">성명</th>
					<th scope="col">파일명</th>
				</tr> 
				</thead> 
				<tbody> 
				
				<input type="hidden" id="selectedId" name="selectedId" value=""/>
				<input type="hidden" id="id" name="id" value=""/>
				
				<c:forEach var="result" items="${admRdEachViewList}" varStatus="status">
					<c:if test="${result.rdGb=='3'}">
						<tr style="cursor:pointer;" onclick="javascript:fn_detail('<c:out value="${result.rdNum}"/>','<c:out value="${result.id}"/>');" onmouseover="this.style.backgroundColor='#f1f1f1'" onmouseout="this.style.backgroundColor='#ffffff'">
					</c:if>
					<c:if test="${result.rdGb!='3'}">
						<tr>
					</c:if>
							<td><c:out value="${result.fileNum}"/></td> 
						<c:if test="${result.rdGb=='1'}">
							<td>신탁계약</td>
						</c:if>
						<c:if test="${result.rdGb=='2'}">
							<td>의료요양지시서</td>
						</c:if>
						<c:if test="${result.rdGb=='3'}">
							<td>개별등록</td>
						</c:if>
							<td><c:out value="${result.year}"/></td> 
							<td><c:out value="${result.month}"/></td> 
							<td><c:out value="${result.cnt}"/></td>
							<td class="txtL paL10"><c:out value="${result.id}"/></td>
							<td><c:out value="${result.id}"/></td> 
							<td><c:out value="${result.name}"/></td> 
							<td><c:out value="${result.orgFileNm}"/></td> 
						</tr>
					
				</c:forEach>
				
				</tbody>
				</table>
			
			
			<div class="fl_R"><a href="javascript:fn_list();" class="btn_big"><strong>목록</strong></a></div>
			
			<!-- list  end -->
		</div> 
		</form>
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


<!--/#action-->
    <script type="text/javaScript" language="javascript" defer="defer">
        
	    /* 검색하기 */
	    function fn_list() {
	    	
	       	document.admRdFrm.action = "/admRdEachList.do";
	       	document.admRdFrm.submit();
	    }
	    
	    
	    /* 목록 상세페이지로 이동 */
        function fn_detail(rdNum,id) {
        	
			document.admRdFrm.selectedId.value = rdNum;
			document.admRdFrm.id.value = id;
			
			document.admRdFrm.action = "/admRdEach_detail.do";
	       	document.admRdFrm.submit();
        }
	    
	    
        //-->
    </script>
