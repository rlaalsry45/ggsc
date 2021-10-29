<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>    
  <script>
  
	$(document).ready(function() {
		var writer = "${cnsrNm}";
  		$("#writer").val(writer);
	});
	
	function fn_freeBoardReg() {
		if(confirm("등록 하시겠습니까?")){
			var title = $("#title").val();
			var cntn = $("#cntn").val();
			
			if(title.length == 0) {
				alert("제목을 입력해주세요.");
				$("#title").focus();
				return false;
			}
			if(cntn.length == 0) {
				alert("내용을 입력해주세요.");
				$("#cntn").focus();
				return false;
			}
			document.frm.action = "/gnoincoun/freeBoardReg.do";
	       	document.frm.submit();
		}	
	}
  </script>
<style>
	#wrap {width: 50%; margin: auto; height: auto;}
</style>
<section class="service-2 section">
	<div id="wrap">
            <section class="title_explain hidden-xs" style="margin-top: 0px; height: 120px;">
      <div class="container" style="font-size: 22px; margin-top: 0px;">
        <dl style="margin-top: 10px;">
          <dt>
            소통의 공간    </dt>
          <dd class="explanation">
            함께 나누는 사랑, 모두가 행복해집니다.    </dd>
          <dd class="explanEng">
            Communication Board    </dd>
        </dl>
      </div>
    </section>
    <!-- 서브 비쥬얼 영역 //-->
    <div class="container content-wrapper" style="width: 970px;">
      <div class="page-header">
        <h1 class="title"><i class="fa fa-comments-o"></i>자유게시판</h1>
        <ol class="breadcrumb">
          <li><a href="/gnoincoun/homepageMainList.do">홈</a></li>
          <li><a href="#">소통의 공간</a></li>
          <li class="active">자유게시판</li>
        </ol>
      </div>
      <div class="content-area">
        <form class="form-wrap" id="frm" name="frm" method="post" enctype="multipart/form-data">
          <div class="form-group">
            <label class="control-label" for="title">제목</label>
            <input type="text" class="form-control" id="title" name="title">
          </div>
          <div class="form-group">
            <label class="control-label" for="writer">작성자<i class="cr">*</i></label>
            <input type="text" class="form-control" id="writer" name="writer" readonly="readonly">
          </div>
          <div class="form-group">
            <label class="control-label" for="cntn">내용</label>
            <textarea rows="5" class="form-control" id="cntn" name="cntn"></textarea>
          </div>
          <!-- 파일첨부 /-->
           <div class="form-group clearfix" style="display: none;">
            <label class="control-label" for="">첨부파일</label>
            <div class="filebox"> <input class="upload-name" value="파일선택" disabled="disabled"><label for="ex_filename">파일</label> <input type="file" id="ex_filename" name="file" class="upload-hidden"></div>
          </div>
          <!-- 파일첨부 /-->
          <div class="btn-wrap line bt bb pt10 pb10 mt20 text-center hidden-xs">
            <button type="button" onclick="javascript:fn_freeBoardReg();"class="btn btn-primary btn-lg fr">등록하기</button>
          </div>
           <!-- 모바일용 -->
          <div class="btn-wrap line bt mt20 pt20 pb20  visible-xs">
            <button type="button" onclick="javascript:fn_freeBoardReg();" class="btn btn-primary btn-lg w100p">등록하기</button>
          </div> 
        </form>
      </div><!-- .content-area /-->
    </div><!-- .container.content-wrapper /-->
	</div>
</section> <!-- End section -->