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
				<h1>신탁계약결과</h1>
			</div>
			<div class="nav-container">
				<ul class="left_nav">
					<li>
						<a href="/admRdCntList.do">차수관리</a>
					</li>
					<li>
						<a href="/admRdBdList.do">신탁계약등록</a>
					</li>
					<li class="active">
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
		<!-- content --> 
		<div class="content"> 
			<div class="paT40 paB25">
				<h1>신탁계약 Excel파일 등록결과</h1>
			</div>
			
			<p class="board_total"><b>신탁계약 Excel파일 등록결과입니다</b></p>
			
		
			<!-- list  start -->
			<div style="width:910px;height:500px;overflow-y:scroll;overflow-x:scroll;white-space:nowrap;">
				<table class="notice_tbl"> 
				<caption></caption> 
				<colgroup> 
					<col width="10%"></col>
					<col width="10%"></col>
					<col width="10%"></col>
					<col width="10%"></col>
					<col width="10%"></col>
					<col width="10%"></col>
					<col width="10%"></col>
					<col width="10%"></col>
					<col width="10%"></col>
					<col width="10%"></col>
					<col width="10%"></col>
					<col width="10%"></col>
					<col width="10%"></col>
					<col width="10%"></col>
					<col width="10%"></col>
					<col width="10%"></col>
					<col width="10%"></col>
					<col width="10%"></col>
					<col width="10%"></col>
					<col width="10%"></col>
					<col width="10%"></col>
					<col width="10%"></col>
					<col width="10%"></col>
					<col width="10%"></col>
					<col width="10%"></col>
					<col width="10%"></col>
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
				
				<c:forEach var="result" items="${admRdBdRstList}" varStatus="status">
				
					<tr>
						<td><c:out value="${result.histNum}"/></td>
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
			<!--
			<div class="paginate"> 
				<a class="pre" href="#">이전</a> 
				<a href="#">1</a> 
				<strong>2</strong> 
				<a href="#">3</a> 
				<a href="#">4</a> 
				<a href="#">5</a> 
				<a href="#">6</a> 
				<a href="#">7</a> 
				<a href="#">8</a> 
				<a href="#">9</a> 
				<a href="#">10</a> 
				<a class="next" href="#">다음</a> 
			</div>
			-->
			<!--<div class="fl_R"><a href="#" class="btn_big"><strong>등록하기</strong></a></div>-->
			<!-- <div>
				<fieldset class="srch"> 
				<legend>검색영역</legend> 
				<select> 
					<option>제목</option> 
					<option>내용</option>
					<option>제목+내용</option>				
				<input title="검색어" class="keyword" accesskey="s" type="text">
				<a class="btn_chk" href="sub_02_1_1.html"><strong>검색</strong></a>
				</fieldset> 
			</div> -->
			<!-- list  end -->
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
