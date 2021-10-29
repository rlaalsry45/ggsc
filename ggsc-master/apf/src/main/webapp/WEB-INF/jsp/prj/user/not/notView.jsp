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
						<!-- view  start -->
						<table class="notice_view" border="1" cellspacing="0" summary=""> 
						<caption>공지사항 상세 내용입니다.</caption> 
						<colgroup> 
						<col width="15%"></col>
						<col width="50%"></col> 
						<col width="15%"></col>
						<col width="20%"></col>
						</colgroup> 
							<thead> 
								<tr> 
									<th scope="row">제목</th> 
									<td colspan="3">${notVO.bd_title}</td> 
								</tr> 
							</thead> 
							<tbody> 
								<tr> 
									<th scope="row">작성자</th> 
									<td>${notVO.reg_id}</td> 
									<th scope="row">등록일</th> 
									<td>${notVO.reg_tm}</td>
								</tr>
								<tr> 
									<td class="cont" colspan="4"> 
										${notVO.bd_content}
									</td> 
								</tr>
								<tr> 
									<th scope="row">첨부파일</th> 
									 <td colspan="3"><a href ="javascript:fn_downloadFile('${notVO.file_num}')">${notVO.org_file_nm}</a></td> 
								</tr>
								<input type="hidden" id="file_num" name="file_num" value="${notVO.file_num}"/>
								<input type="hidden" id="org_file_nm" name="org_file_nm" value="${notVO.org_file_nm}"/>
								<input type="hidden" id="sys_file_nm" name="sys_file_nm" value="${notVO.sys_file_nm}"/>
								<input type="hidden" id="file_path" name="file_path" value="${notVO.file_path}"/>
								<input type="hidden" id="file_size" name="file_size" value="${notVO.file_size}"/>
							</tbody> 
						</table>
						<div class="txtR mgT10">
							<button onclick="location.href='/notList.do'" type="button" class="btn btn-sm btn-primary">목록</button>
						</div>
						
						<!-- 
						<table class="notice_view2" border="1" cellspacing="0" summary=""> 
						<caption></caption> 
						<colgroup> 
						<col width="110"> 
						<col> 
						
						</colgroup> 
							<tbody> 
							<tr> 
								<td><strong>이전글</strong></td> 
								<td><a href="#none">이전글입니다.</a></td> 
							</tr>
							<tr> 
								<td><strong>다음글</strong></td> 
								<td><a href="#none">다음글입니다.</a></td> 
							</tr> 				
							</tbody> 
						</table> 
						-->
						<!-- view  end -->
					</div>
	            </div>
	        </div>
	    </section>
		<!--/#services-->
	</form>
	
	
    <!--/#action-->
    <script type="text/javaScript" language="javascript" defer="defer">
        
        
        
        function fn_downloadFile(obj){ 
        	var idx = obj;
        	   	
        	document.notFrm.action = "/notDownloadFile.do";
           	document.notFrm.submit();
        	
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

    