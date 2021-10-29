<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>    

<script src="/gnoincoun/editor/js/summernote_0.8.3.js"></script>
<script src="/gnoincoun/editor/js/summernote_0.8.3.min.js"></script>
<script src="/gnoincoun/editor/lang/summernote-ko-KR.js"></script>
<script src="/gnoincoun/editor/js/bootstrap_3.3.5.js"></script>
<link rel="stylesheet" href="/gnoincoun/editor/css/summernote_0.8.3.css">

<script type="text/javascript">
	$(document).ready(function() {
	   $('#rcontent').summernote({
	        minHeight: 400,
	        maxHeight: null,
	        focus: true, 
	        lang : 'ko-KR',
	   });
	});
	function fn_fileDown(sysFileNm, filePath, fileNm){
		$("#fileNm").val(fileNm);
		$("#sysFileNm").val(sysFileNm);
		$("#filePath").val(filePath);
		document.downForm.action = "/gnoincoun/fileDown2.do";
       	document.downForm.submit();
	}
	
 	function fn_movePage(num,prevYn) {
 		document.location.href = "/gnoincoun/noticeDtl.do?num="+num+"&prevYn="+prevYn;
 	}
</script>

<style>
	#wrap {width: 100%; margin: auto; height: auto;}
	/* .container {width: 100%;} */
</style>
<section class="service-2 section">
	<form name="downForm" id="downForm" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<input type="hidden" id="fileNm" name="fileNm" value="" />
		<input type="hidden" id="sysFileNm" name="sysFileNm" value="" />
		<input type="hidden" id="filePath" name="filePath" value="" />
	</form>
	<div id="wrap">
	  	<div style="border-top: 1px solid #f09d4c;">
			<img src='/gnoincoun/images/bbs1.jpg' alt="맘편한 상담" style="width: 1920px;"/>
		</div>
		<div style="width: 910px; margin: auto;">
			<span style="float: left; margin-top: 20px; margin-bottom: 15px;font: bold; font-weight: 900;">소통공간</span>
			<ul class="main-menu" style="width: 400px; float: right;margin-top: 20px; margin-bottom: 15px;">
				<li><a href="/gnoincoun/centerNewsList.do">센터소식</a></li>
				<li><a href="/gnoincoun/noticeList.do">공지사항</a></li>
				<li><a href="/gnoincoun/docLibraryList.do">문서자료실</a></li>
				<li><a href="/gnoincoun/freeBoardList.do">자유게시판</a></li>
			</ul>
		</div>
		<div style="border-bottom: 1px solid #CFCFCF; padding-bottom: 63px;">
		</div>
		 <!-- 서브 비쥬얼 영역 //-->
    <div class="container content-wrapper" style="width: 970px; margin-top: 0px;">
      <div class="page-header">
        <h1 class="title"><i class="fa fa-comments-o"></i>공지사항</h1>
        <ol class="breadcrumb">
          <li><a href="/gnoincoun/homepageMainList.do">홈</a></li>
          <li><a href="#">소통의 공간</a></li>
          <li class="active">공지사항</li>
        </ol>
      </div>
      <div class="content-area">
        <div class="article-area">
          <div class="board_box article-header" >
            <div class="txt_area">   
              <!-- 제목 -->
              <strong class="tit"><c:out value="${detail.title } " escapeXml="false" /> </strong>
              <!-- 제목 //-->
              <!-- 글등록정보 -->
              <div class="user_area">
                <span class="nick">
                  <span class="ellip"><span class="ellip"><c:out value="${detail.writer }" /></span></span>
                  <span class="time"><c:out value="${detail.dbInsTm }" /></span>
                  <span class="no"><c:out value="${detail.num }" /></span>
                </span>
              </div>
              <!-- 글등록정보 //-->
            </div>
            <div class="file-area">
              <c:if test="${detail.fileNm != null }">
              	<a href="javascript:fn_fileDown('<c:out value="${detail.sysFileNm}"/>','<c:out value="${detail.filePath}"/>','<c:out value="${detail.fileNm}"/>')"  class="btn btn-default mb3"><i class="fa fa-download mr5"></i>첨부파일 다운로드</a>
              </c:if>
              <!-- <a href="" class="btn btn-default mb3"><i class="fa fa-download mr5"></i>첨부파일2 다운로드</a>
              <a href="" class="btn btn-default mb3"><i class="fa fa-download mr5"></i>첨부파일3 다운로드</a> -->
            </div>
          </div><!-- board_box //-->
          <div class="article-body">
            <div class="article">
				<textarea id="rcontent" name="content">
					<c:out value="${detail.cntn }" escapeXml="false" />
				</textarea>
			</div>
          </div>
          </div><!-- .article-body /-->
            <div style="width: 60%; margin: auto;">
		</div>
        </div><!-- .article-list-area /-->
        <div class="btn-wrap line bt bb pt10 pb10 mt20 text-center">
          <button type="button" class="btn btn-default btn-lg fl" onclick="javascript:fn_movePage('<c:out value="${detail.num}" />','Y');"><i class="fa fa-caret-left mr5"></i>이전글</button>
          <button type="button" class="btn btn-normal btn-lg" onclick="location.href='/gnoincoun/centerNewsList.do'"><i class="fa fa-align-justify mr5"></i>목록</button>
          <button type="button" class="btn btn-default btn-lg fr" onclick="javascript:fn_movePage('<c:out value="${detail.num}" />','N');">다음글<i class="fa fa-caret-right ml5"></i></button>
        </div>
      </div><!-- .content-area /-->
    </div><!-- .container.content-wrapper /-->
	</div>
</section> <!-- End section -->