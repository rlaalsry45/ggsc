<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="file:///C|/Users/asdf/Documents/favicon.ico">
    <title>상담문의하기</title>
    <!-- Bootstrap core CSS -->
    <link href="/gnoincoun/assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="/gnoincoun/assets/css/font-awesome.min.css" rel="stylesheet">
    <!--[if lt IE 9]><script src="assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="/gnoincoun/assets/js/ie-emulation-modes-warning.js"></script>
    <script src="/gnoincoun/js/jquery-1.11.2.min.js" ></script>
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="assets/js/html5shiv.min.js"></script>
      <script src="assets/js/respond.min.js"></script>
    <![endif]-->
    <!-- Custom styles for this template -->
    <link href="/gnoincoun/assets/css/theme.css" rel="stylesheet">
  </head>
  <script>
		$(document).ready(function() {
			var ansCntn = "${detail.ansCntn}";
			var openStatYn = "${detail.openStatYn}";
			
	  		if(ansCntn == "") {
				$("#answer").css("display", "none");
	  		} else {
				$("#answer").css("display", "inline-block");
	  		}
	  		
	  		if(openStatYn == "N") {
	  			$("#openOk").css("display", "none");
	  			$("#openNo").css("display", "block");
	  		} else if(openStatYn == "Y") {
	  			$("#openNo").css("display", "none");
	  			$("#openOk").css("display", "block");
	  		}
	  		
		});
		
		function fn_fileDown() {
	  		var sysFileNm = "${detail.sysFileNm}";
	  		var filePath = "${detail.filePath}";
	  		var fileNm = "${detail.fileNm}";
	        document.location.href = "/gnoincoun/fileDown.do?sysFileNm="+sysFileNm+"&filePath="+filePath+"&fileNm="+fileNm;
	  	}
		
		function fn_pwCheck() {
			var pwCheck = $("#pwCheck").val();
			var pw = "${detail.pw}";
			if(pw == pwCheck) {
	  			$("#openNo").css("display", "none");
	  			$("#openOk").css("display", "inline-block");
			} else {
	  			alert("비밀번호가 틀렸습니다.");
			}
		}
		
		function fn_movePage(num,prevYn) {
	  		document.location.href = "/gnoincoun/onlineCnsDtl.do?num="+num+"&prevYn="+prevYn;
	  	}
  </script>
  <body>
    <!-- 헤더 ================================================== -->
    <header class="navbar-wrapper">
      <nav class="navbar navbar-static-top">
        <div class="navbar-header">
          <div class="container">
            <a class="navbar-brand" href="/gnoincoun/homepageMainList.do"><img src="/gnoincoun/assets/img/logo.png" alt="경기도노인종합상담센터" /></a>
            <div class="social-icons pull-right">
              <ul class="nav nav-pills">
                <li><a href="/gnoincoun/homepageMainList.do" class="btn btn-primary btn-xs"><i class="fa fa-home mr5"></i>홈</a></li>
                <c:choose>
				    <c:when test="${loginYn eq 'Y'}">
				        <li><a href="/gnoincoun/logout.do" class="btn btn-primary btn-xs"><i class="fa fa-lock mr5"></i>로그아웃</a></li>
				        <li><a href="/gnoincoun/mypageView.do" class="btn btn-primary  btn-xs"><i class="fa fa-user mr5"></i>마이페이지</a></li>
				    </c:when>
				    <c:otherwise>
				        <li><a href="/gnoincoun/login.do" class="btn btn-primary btn-xs"><i class="fa fa-unlock-alt mr5"></i>로그인</a></li>
				        <li><a href="/gnoincoun/agree.do" class="btn btn-primary  btn-xs"><i class="fa fa-user mr5"></i>회원가입</a></li>
				    </c:otherwise>
				</c:choose> 
              </ul>
            </div>
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
              <span class="sr-only">전체메뉴</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
          </div>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
          <div class="container">
          <ul class="nav navbar-nav navbar-right">
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">센터소개<i class="fa fa-angle-down"></i></a>
              <ul class="dropdown-menu"  role="menu">
                <li class="dropdown-item"><a href="/gnoincoun/salutation.do">인사말<i class="fa fa-caret-right"></i></a></li>
                <li class="dropdown-item"><a href="/gnoincoun/operatCorp.do">운영법인<i class="fa fa-caret-right"></i></a></li>
                <li class="dropdown-item"><a href="/gnoincoun/missionVis.do">미션관 비젼 <i class="fa fa-caret-right"></i></a></li>
                <li class="dropdown-item"><a href="/gnoincoun/centerFoot.do">센터의 발자취<i class="fa fa-caret-right"></i></a></li>
                <li class="dropdown-item"><a href="/gnoincoun/peopleTg.do">함께하는 사람들<i class="fa fa-caret-right"></i></a></li>
                <li class="dropdown-item"><a href="/gnoincoun/directions.do">오시는길<i class="fa fa-caret-right"></i></a></li>
              </ul>
            </li>
            <li>
              <a href="/gnoincoun/oldCnsCenter.do">시&middot;군 노인상담센터</a>
            </li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">사업소개<i class="fa fa-angle-down"></i></a>
              <ul class="dropdown-menu"  role="menu">
                <li class="dropdown-item"><a href="/gnoincoun/cnsSupport.do">상담지원사업<i class="fa fa-caret-right"></i></a></li>
                <li class="dropdown-item"><a href="/gnoincoun/eduBusin.do">교육사업<i class="fa fa-caret-right"></i></a></li>
                <li class="dropdown-item"><a href="/gnoincoun/publicBusin.do">홍보사업<i class="fa fa-caret-right"></i></a></li>
                <li class="dropdown-item"><a href="/gnoincoun/linkBusin.do">연계협력사업<i class="fa fa-caret-right"></i></a></li>
              </ul>
            </li>
            <li class="dropdown active">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">소통의 공간<i class="fa fa-angle-down"></i></a>
              <ul class="dropdown-menu"  role="menu">
                <li class="dropdown-item"><a href="/gnoincoun/centerNewsList.do">센터소식<i class="fa fa-caret-right"></i></a></li>
                <li class="dropdown-item"><a href="/gnoincoun/docLibraryList.do">문서자료실<i class="fa fa-caret-right"></i></a></li>
                <li class="dropdown-item"><a href="/gnoincoun/freeBoardList.do">자유게시판<i class="fa fa-caret-right"></i></a></li>
                <li class="dropdown-item active"><a href="/gnoincoun/comfCnsWrite.do">맘편한 상담<i class="fa fa-caret-right"></i></a></li>
                <li class="dropdown-item"><a href="/gnoincoun/psyCnsList.do">간편한 심리검사<i class="fa fa-caret-right"></i></a></li>
              </ul>
            </li>
          </ul>
            </div>
        </div><!-- navbar-collapse -->
      </nav>
    </header>
    <!-- 컨텐츠  ================================================== -->
    <!-- 서브 비쥬얼 영역 -->
    <section class="title_explain hidden-xs">
      <div class="container">
        <dl>
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
    <div class="container content-wrapper">
      <div class="page-header">
        <h1 class="title"><i class="fa fa-comments-o"></i>상담문의하기</h1>
        <ol class="breadcrumb">
          <li><a href="/gnoincoun/homepageMainList.do">홈</a></li>
          <li><a href="#">소통의 공간</a></li>
          <li class="active">상담문의하기</li>
        </ol>
      </div>
      <div id="openOk">
      <div class="content-area">
        <div class="article-area">
          <div class="board_box article-header" >
            <div class="txt_area">   
              <!-- 제목 -->
              <strong class="tit"><c:out value="${detail.title }" /> </strong>
              <!-- 제목 //-->
              <!-- 글등록정보 -->
              <div class="user_area">
                <span class="nick">
                  <span class="ellip"><span class="ellip"><c:out value="${detail.writer }" /></span></span>
                  <span class="time"><c:out value="${detail.dbInsTm }" /></span>
                  <%-- <span class="no"><c:out value="${detail.num }" /></span> --%>
                  <span class="ellip">
                 	<c:if test="${detail.openStatYn eq 'N' }">비공개</c:if>
                	<c:if test="${detail.openStatYn eq 'Y' }">공개</c:if>
                  </span>
                </span>
              </div>
              <!-- 글등록정보 //-->
            </div>
            <div class="file-area">
              <a href="javascript:fn_fileDown()" class="btn btn-default mb3"><i class="fa fa-download mr5"></i>첨부파일 다운로드</a>
              <!-- <a href="" class="btn btn-default mb3"><i class="fa fa-download mr5"></i>첨부파일2 다운로드</a>
              <a href="" class="btn btn-default mb3"><i class="fa fa-download mr5"></i>첨부파일3 다운로드</a> -->
            </div>
           </div><!-- board_box //-->
           <div class="article-body">
             <div class="article">
              	 <c:out value="${detail.cntn }"/>
             </div>
          </div><!-- .article-body /-->
          
          <div id="answer">
	          <div class="board_box article-header" >
	          </div>
	          <!-- 답변영역 -->
	          <div class="txt_area">   
	            <!-- 제목 -->
	            <strong class="tit">답변</strong>
	            <!-- 제목 //-->
	            <!-- 글등록정보 -->
	            <div class="user_area">
	              <span class="nick">
	                <span class="ellip"><span class="ellip"><c:out value="${detail.regNm }" /></span></span>
	                <span class="time"><c:out value="${detail.ansDbInsTm }" /></span>
	              </span>
	            </div>
	            <!-- 글등록정보 //-->
		          <div class="article-body">
				      <div class="article">
				      	<c:out value="${detail.ansCntn }" escapeXml="false"/>
			          </div>
		          </div><!-- .article-body /-->              
	          </div><!-- 답변영역 // -->
          </div>          
          
        </div><!-- .article-list-area /-->
        <div class="btn-wrap line bt bb pt10 pb10 mt20 text-center">
          <button type="button" class="btn btn-default btn-lg fl" onclick="javascript:fn_movePage('<c:out value="${detail.num}"/>','Y');"><i class="fa fa-caret-left mr5"></i>이전글</button>
          <button type="button" class="btn btn-normal btn-lg" onclick="location.href='/gnoincoun/onlineCnsList.do'"><i class="fa fa-align-justify mr5"></i>목록</button>
          <button type="button" class="btn btn-default btn-lg fr" onclick="javascript:fn_movePage('<c:out value="${detail.num}"/>','N');">다음글<i class="fa fa-caret-right ml5"></i></button>
        </div>
      </div><!-- .content-area /-->
      </div>
      <!-- 비공개글 문구 -->
      <div class="content-area" id="openNo" style="margin-top: 20px;">
      	<div style="text-align: center;">
	      	<div>내용확인을 위해 아래에 비밀번호를 입력하세요</div>
	      	<div>
	      		<input type="password" class="form-control" id="pwCheck" name="pwCheck" style="width: 200px; margin: auto; margin-top: 30px;">
	      		<button type="button" onclick="javascript:fn_pwCheck();"class="btn btn-primary btn-lg" style="margin: auto;">확인</button>
	      		<button type="button" onclick="location.href='/gnoincoun/onlineCnsList.do'" class="btn btn-primary btn-lg" style="margin-left: 10px; margin: auto;">취소</button>
	      	</div>
      	</div>
      </div><!-- 비공개글 문구 //-->
    </div><!-- .container.content-wrapper /-->
    <!-- FOOTER -->
    <footer>
      <div class="copyaddress">
        <ul>
          <li><b>경기도노인종합상담센터</b></li>
          <li><span>주소 : </span><a href="javascript:top_address()">경기도 수원시 장안구 경수대로 1150, 도서관 3층</a></li>
          <li><span>사업자등록번호 : </span>722-82-00367<span class="ml10">대표 : </span>김미나</li>
          <li><span> TEL : </span> <a href="javascript:top_tel()">031-222-1360</a></li>
          <li><span> FAX : </span><a href="javascript:top_fax()">070-4832-6366</a></li>
          <li><span>E-mail : </span><a href="javascript:top_email()">ggnoincoun@gmail.com</a></li>
          <li><span>개인정보담당자 : </span>김지원  </li>
          <li class="copyright">COPYRIGHT(c) <b>GNOIN</b> ALL RIGHT RESERVED</li>
        </ul>
      </div>
    </footer>

    <script src="/gnoincoun/assets/js/jquery.min.js"></script>
    <script src="/gnoincoun/assets/js/bootstrap.min.js"></script>
    <!--<script src="assets/js/docs.min.js"></script>-->
    <script src="/gnoincoun/assets/js/ie10-viewport-bug-workaround.js"></script>
    <script>
      $(document).ready(function(){ 
          // 로그인 회원가입 관리자 메뉴  
          $('.navbar-toggle').on('click', function() {
            $('.social-icons').fadeToggle(200);
          });
      });
		</script>
  </body>
</html>