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
	                            <h1 class="title">공지사항</h1>
	                            <p>새로운 소식을 알려드립니다.</p>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </section>
	    <!--/#page-breadcrumb-->
	
	
	
	<form commandName="searchVO" id="notFrm" name="notFrm" method="post">
	    <section id="" class="padding">
	        <div class="container">
	            <div class="row">
					<div class="col-md-12 col-sm-12">
						<!-- start notice -->
						<div class="t_right">
							<fieldset class="srch"> 
							<legend>검색영역</legend> 
							<select id="searchCondition" name="searchCondition"> 
								<option>제목</option>
							</select>
							<input id="sch" name="sch" title="검색어" class="keyword" accesskey="s" type="text" value="${searchVO.sch}"/>
							
								<button onclick="javascript:fn_egov_selectList();" type="button" >검색</button>
							
							</fieldset> 
						</div>
						<table class="tbl_type" border="1" cellspacing="0" summary="공지사항리스트"> 
							<caption>공지사항리스트</caption> 
								<colgroup> 
									<col width="10%"></col>
									<col width="50%"></col>
									<col width="15%"></col>
									<col width="15%"></col>
									<col width="10%"></col>
								</colgroup> 
							<thead> 
								<tr> 
									<th scope="col">번호</th> 
									<th scope="col">제목</th> 
									<th scope="col">작성자</th> 
									<th scope="col">날짜</th> 
									<th scope="col">조회</th> 
								</tr> 
							</thead> 
							<tbody> 
						
						<input type="hidden" id="selectedId" name="selectedId" value=""/>
		
							
							<c:forEach var="result" items="${notList}" varStatus="status">

								<tr> 
									<td><c:out value="${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageSize + status.count)}"/></td> 
									<td class="t_left"><a href="javascript:fn_detail('<c:out value="${result.bdId}"/>');"><c:out value="${result.bdTitle}"/></a></td> 
									<td><c:out value="${result.regId}"/></td> 
									<td><c:out value="${result.regTm}"/></td> 
									<td><c:out value="${result.bdCnt}"/></td> 
								</tr> 
							</c:forEach>
						
												
							</tbody> 
						</table> 
						<!-- end notice -->
						<div class="blog-pagination" id="paging">
	                        <ul class="pagination">
	                          	<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_egov_link_page" />
	                          	<form:hidden path="pageIndex" />
	                        </ul>
	                    </div>
	                    
	                   
	                    <!-- /List -->
        	
	                    
					</div>
	            </div>
	        </div>
	        
	        
	        
	    </section>
		<!--/#services-->
	
	</form>
	
    <!--/#action-->
    <script type="text/javaScript" language="javascript" defer="defer">
        
        /* 글 수정 화면 function */
        function fn_detail(id) {
        	document.notFrm.selectedId.value = id;
        	document.notFrm.action = "/notice_view.do";
           	document.notFrm.submit();
        }
        
        /* pagination 페이지 링크 function */
        function fn_egov_link_page(pageNo){
        	document.notFrm.pageIndex.value = pageNo;
        	document.notFrm.action = "/notList.do";
           	document.notFrm.submit();
        }
        
        /* 글 목록 화면 function */
        function fn_egov_selectList() {
        	
        	document.notFrm.action = "/notList.do";
           	document.notFrm.submit();
        }
        
        
        
        /* 글 등록 화면 function */
        function goInsert() {
           	document.notFrm.action = "/goinsertNotList.do";
           	document.notFrm.submit();
        }
        
        
        
        
        
        //-->
    </script>

    