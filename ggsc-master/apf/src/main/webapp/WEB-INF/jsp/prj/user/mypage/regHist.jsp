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
                            <p>관리자가 등록한 정보를 확인합니다.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--/#page-breadcrumb-->

	<form id="histFrm" name="histFrm" method="post">
    <section id="" class="padding">
        <div class="container">
            <div class="row">
				<div class="col-md-12 col-sm-12">
					<!-- start notice -->
					
					
					<p class="board_total"><b>신탁계약 - 위탁자정보</b></p>
					<table class="tbl_type" border="1" cellspacing="0" summary="공지사항리스트"> 
						<caption>위탁자정보 목록</caption> 
							<colgroup> 
								<col width="10%"></col>
								<col width="15%"></col>
								<col width="30%"></col>
								<col width="10%"></col>
								<col width="10%"></col>
								<col width="10%"></col>
								<col width="15%"></col>
							</colgroup> 
						<thead> 
							<tr> 
								<th scope="col">번호</th>
								<th scope="col">구분</th> 
								<th scope="col">제목</th>
								<th scope="col">년도</th>
								<th scope="col">월</th>
								<th scope="col">회차</th>
								<th scope="col">등록일자</th> 
							</tr> 
						</thead> 
						<tbody> 
						<input type="hidden" id="selectedNum" name="selectedNum" value=""/>
						<c:forEach var="result" items="${mypageList1}" varStatus="status">
							<tr> 
								<td>${status.count}</td> 
							<c:if test="${result.rdGb=='1'}">
								<td>신탁계약</td>
							</c:if>
							<c:if test="${result.rdGb=='2'}">
								<td>의료요양지시서</td>
							</c:if>
								<td class="t_left"><c:out value="${result.title}"/></td>
								<td><c:out value="${result.year}"/></td>
								<td><c:out value="${result.month}"/></td>
								<td><c:out value="${result.cnt}"/></td> 
								<td><c:out value="${result.regDt}"/></td> 
							</tr> 
						</c:forEach>
						
						</tbody> 
					</table> 
					
					<div style="height:30px;"></div>
					
					<p class="board_total"><b>신탁계약 - 수탁자정보</b></p>
					<table class="tbl_type" border="1" cellspacing="0" summary="공지사항리스트"> 
						<caption>위탁자정보 목록</caption> 
							<colgroup> 
								<col width="10%"></col>
								<col width="15%"></col>
								<col width="30%"></col>
								<col width="10%"></col>
								<col width="10%"></col>
								<col width="10%"></col>
								<col width="15%"></col>
							</colgroup> 
						<thead> 
							<tr> 
								<th scope="col">번호</th>
								<th scope="col">구분</th> 
								<th scope="col">제목</th>
								<th scope="col">년도</th>
								<th scope="col">월</th>
								<th scope="col">회차</th>
								<th scope="col">등록일자</th> 
							</tr> 
						</thead> 
						<tbody> 
						<input type="hidden" id="selectedNum" name="selectedNum" value=""/>
						<c:forEach var="result" items="${mypageList2}" varStatus="status">
							<tr> 
								<td>${status.count}</td> 
							<c:if test="${result.rdGb=='1'}">
								<td>신탁계약</td>
							</c:if>
							<c:if test="${result.rdGb=='2'}">
								<td>의료요양지시서</td>
							</c:if>
								<td class="t_left"><c:out value="${result.title}"/></td>
								<td><c:out value="${result.year}"/></td>
								<td><c:out value="${result.month}"/></td>
								<td><c:out value="${result.cnt}"/></td> 
								<td><c:out value="${result.regDt}"/></td> 
							</tr> 
						</c:forEach>
						
						</tbody> 
					</table> 
					
					<div style="height:30px;"></div>
					
					<p class="board_total"><b>신탁계약 - 수익자정보</b></p>
					<table class="tbl_type" border="1" cellspacing="0" summary="공지사항리스트"> 
						<caption>위탁자정보 목록</caption> 
							<colgroup> 
								<col width="10%"></col>
								<col width="15%"></col>
								<col width="30%"></col>
								<col width="10%"></col>
								<col width="10%"></col>
								<col width="10%"></col>
								<col width="15%"></col>
							</colgroup> 
						<thead> 
							<tr> 
								<th scope="col">번호</th>
								<th scope="col">구분</th> 
								<th scope="col">제목</th>
								<th scope="col">년도</th>
								<th scope="col">월</th>
								<th scope="col">회차</th>
								<th scope="col">등록일자</th> 
							</tr> 
						</thead> 
						<tbody> 
						<input type="hidden" id="selectedNum" name="selectedNum" value=""/>
						<c:forEach var="result" items="${mypageList3}" varStatus="status">
							<tr> 
								<td>${status.count}</td> 
							<c:if test="${result.rdGb=='1'}">
								<td>신탁계약</td>
							</c:if>
							<c:if test="${result.rdGb=='2'}">
								<td>의료요양지시서</td>
							</c:if>
								<td class="t_left"><c:out value="${result.title}"/></td>
								<td><c:out value="${result.year}"/></td>
								<td><c:out value="${result.month}"/></td>
								<td><c:out value="${result.cnt}"/></td> 
								<td><c:out value="${result.regDt}"/></td> 
							</tr> 
						</c:forEach>
						
						</tbody> 
					</table> 
					
					<div style="height:30px;"></div>
					
					<p class="board_total"><b>의료요양지시서 - 작성자정보</b></p>
					<table class="tbl_type" border="1" cellspacing="0" summary="공지사항리스트"> 
						<caption>위탁자정보 목록</caption> 
							<colgroup> 
								<col width="10%"></col>
								<col width="15%"></col>
								<col width="30%"></col>
								<col width="10%"></col>
								<col width="10%"></col>
								<col width="10%"></col>
								<col width="15%"></col>
							</colgroup> 
						<thead> 
							<tr> 
								<th scope="col">번호</th>
								<th scope="col">구분</th> 
								<th scope="col">제목</th>
								<th scope="col">년도</th>
								<th scope="col">월</th>
								<th scope="col">회차</th>
								<th scope="col">등록일자</th> 
							</tr> 
						</thead> 
						<tbody> 
						<input type="hidden" id="selectedNum" name="selectedNum" value=""/>
						<c:forEach var="result" items="${mypageList4}" varStatus="status">
							<tr> 
								<td>${status.count}</td> 
							<c:if test="${result.rdGb=='1'}">
								<td>신탁계약</td>
							</c:if>
							<c:if test="${result.rdGb=='2'}">
								<td>의료요양지시서</td>
							</c:if>
								<td class="t_left"><c:out value="${result.title}"/></td>
								<td><c:out value="${result.year}"/></td>
								<td><c:out value="${result.month}"/></td>
								<td><c:out value="${result.cnt}"/></td> 
								<td><c:out value="${result.regDt}"/></td> 
							</tr> 
						</c:forEach>
						
						</tbody> 
					</table> 
					
					
					
				</div>
            </div>
        </div>
    </section>
	<!--/#services-->
	</form>
	
	
    <!--/#action-->
    <script type="text/javaScript" language="javascript" defer="defer">
        
    	//상세정보 조회
        function fn_detail(num) {
        	document.histFrm.selectedNum.value = num;
        	
        	document.histFrm.action = "/myHist_view.do";
           	document.histFrm.submit();
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

    