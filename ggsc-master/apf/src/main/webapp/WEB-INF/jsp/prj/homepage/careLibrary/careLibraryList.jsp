<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="file:///C|/Users/asdf/Documents/favicon.ico">
    <title>공지사항</title>
    <!-- Bootstrap core CSS -->
    <!--<link href="/gnoincoun/assets/css/bootstrap.min.css" rel="stylesheet">-->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
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
			var searchCondition = "${vo.searchCondition}";
			var searchKeyword = "${vo.searchKeyword}";
			if(searchCondition != "") {
				$('#searchCondition').val('${vo.searchCondition}').attr('selected','selected');				
			}
			if(searchKeyword != "") {
				$('#searchKeyword').val(searchKeyword);			
			}
		});
		
		function fn_detail(num){
			document.location.href = "/gnoincoun/careLibraryView.do?num="+num;
		}
	  	
	  	function fn_fileDown(fileNm,filePath,sysFileNm) {
	  		if(fileNm == "") {
	  			alert("등록하신 첨부파일이 없습니다.");
	  		} else {
		        document.location.href = "/gnoincoun/fileDown.do?sysFileNm="+sysFileNm+"&filePath="+filePath+"&fileNm="+fileNm;  			
	  		}
	  	}
	  	
        /* pagination 페이지 링크 function */
        function fn_egov_link_page(pageNo){
        	
        	var searchCondition = "${vo.searchCondition}";
			var searchKeyword = "${vo.searchKeyword}";
        	if(searchKeyword != "") {
        		$('#searchConditionFrm').val(searchCondition);
        		$('#searchKeywordFrm').val(searchKeyword);
        	}
        	
        	$("#pageIndex").val(pageNo);
        	document.frm.action = "/gnoincoun/careLibraryList.do";
           	document.frm.submit();
        }
		
        function fn_searchForm() {
        	document.searchForm.action = "/gnoincoun/careLibraryList.do";
           	document.searchForm.submit();
        }
        
		function fn_reg() {
			var loginYn = "${loginYn}";
			if(loginYn == "Y") {
				document.location.href = "/gnoincoun/careLibraryInsert.do";
			} else if(loginYn == "N") {
				alert("로그인 후에 글쓰기를 하실 수 있습니다.");
				// location.href="/gnoincoun/login.do";
			}
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
                <li class="dropdown-item active"><a href="/gnoincoun/centerNewsList.do">센터소식<i class="fa fa-caret-right"></i></a></li>
                <li class="dropdown-item"><a href="/gnoincoun/docLibraryList.do">문서자료실<i class="fa fa-caret-right"></i></a></li>
                <li class="dropdown-item"><a href="/gnoincoun/freeBoardList.do">자유게시판<i class="fa fa-caret-right"></i></a></li>
                <li class="dropdown-item"><a href="/gnoincoun/comfCnsWrite.do">맘편한 상담<i class="fa fa-caret-right"></i></a></li>
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
        <h1 class="title"><i class="fa fa-comments-o"></i>마음돌봄 자료실</h1>
        <ol class="breadcrumb">
          <li><a href="/gnoincoun/homepageMainList.do">Home</a></li>
          <li><a href="#">소통의 공간</a></li>
          <li class="active">마음돌봄 자료실</li>
        </ol>
      </div>

      <form id="frm" name="frm" method="get">
      <input type="hidden" id="searchConditionFrm" name="searchCondition" />
      <input type="hidden" id="searchKeywordFrm" name="searchKeyword" />
      <input type="hidden" id="pageIndex" name="pageIndex" />
        <div class="table-wrap table-list">
       		<table class="table">
	            <colgroup>
	              <col class="hidden-xs" style="width: 80px" />
	              <col  />
	              <col style="width: 120px" />
	              <col class="hidden-xs" style="width: 100px" />
	              <col class="hidden-xs"  style="width: 80px" />
	            </colgroup>
	            <thead class="hidden-xs">
	              <tr>
	                <th scope="col" class="num hidden-xs">번호</th>
	                <th scope="col" class="subject">제목</th>
	                <th scope="col" class="time">등록일</th>
	                <th scope="col" class="file hidden-xs">첨부파일</th>
	                <th scope="col" class="no hidden-xs">조회수</th>
	              </tr>
	            </thead>
	            <tbody>
		            <c:forEach var="result" items="${crLibraryList}" varStatus="status">
			            <tr>
			              <td class="num hidden-xs"><c:out value="${paginationInfo.totalRecordCount+1 - ((vo.pageIndex-1) * vo.pageSize + status.count)}"/><%-- <c:out value="${result.num}"/> --%></td>
			              <td class="subject"><a href="javascript:fn_detail('<c:out value="${result.num}"/>');" class="tit"><c:out value="${result.title}"/></a></td>
			              <td class="time"><c:out value="${result.dbInsTm}"/></td>
			              <td class="file hidden-xs">
			              	<c:if test="${result.fileNm != null }">
				              	<a href="javascript:fn_fileDown('<c:out value="${result.sysFileNm}"/>','<c:out value="${result.filePath}"/>','<c:out value="${result.fileNm}"/>')" class="btn btn-default btn-sm"><i class="fa fa-download mr5"></i><span>다운로드</span></a>
			              	</c:if>
			              </td>
			              <td class="no hidden-xs"><c:out value="${result.viewCount }"/></td>
			            </tr>
		            </c:forEach>
	            </tbody>
            </table>
        </div>
        <!-- paging -->
	   <div class="blog-pagination" id="paging">
             <ul class="pagination">
               	<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_egov_link_page" />
             	<form:hidden path="pageIndex" />
           </ul>
       </div>
       </form>
        <!-- paging //-->
        <!-- <div class="btn-wrap line bt bb pt10 pb10 mt20 text-center hidden-xs">
          <button type="button" class="btn btn-primary btn-lg fr" onclick="javascript:fn_reg()">글쓰기</button>
        </div> -->
         <!-- 모바일용 -->
        <!-- <div class="btn-wrap p15 visible-xs">
          <button type="button" onclick="location.href='/centerNewsWrite.do'" class="btn btn-primary btn-lg w100p">글쓰기</button>
        </div> -->
        <!-- .search-wrap -->
        <form id="searchForm" name="searchForm" method="post">
	        <div class="search-wrap form-inline text-center">
	          <div class="form-group select">
	            <select class="form-control" id="searchCondition" name="searchCondition">
	              <option value="1">전체</option>
	              <option value="2">제목</option>
	              <option value="3">내용</option>
	            </select>
	          </div>
	          <div class="input-group search-group">
	            <div class="form-group">
	              <input type="text" class="form-control" id="searchKeyword" name="searchKeyword" placeholder="Search">
	            </div>
	            <div class="input-group-btn">
	             <button type="button" onclick="javascript:fn_searchForm();" class="btn btn-default btn-search"><i class="fa fa-search mr5"></i>검색하기</button>
	            </div>
	          </div><!-- /input-group -->
	        </div><!-- .search-wrap //-->
        </form>
      </div><!-- .content /-->

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