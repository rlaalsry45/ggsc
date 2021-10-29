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
    <title>함께하는 사람들</title>
    <!-- Bootstrap core CSS -->
    <link href="/gnoincoun/assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="/gnoincoun/assets/css/font-awesome.min.css" rel="stylesheet">
    <!--[if lt IE 9]><script src="assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="/gnoincoun/assets/js/ie-emulation-modes-warning.js"></script>
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="assets/js/html5shiv.min.js"></script>
      <script src="assets/js/respond.min.js"></script>
    <![endif]-->
    <!-- Custom styles for this template -->
    <link href="/gnoincoun/assets/css/theme.css" rel="stylesheet">
  </head>
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
            <li class="dropdown active">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">센터소개<i class="fa fa-angle-down"></i></a>
              <ul class="dropdown-menu"  role="menu">
                <li class="dropdown-item"><a href="/gnoincoun/salutation.do">인사말<i class="fa fa-caret-right"></i></a></li>
                <li class="dropdown-item"><a href="/gnoincoun/operatCorp.do">운영법인<i class="fa fa-caret-right"></i></a></li>
                <li class="dropdown-item"><a href="/gnoincoun/missionVis.do">미션관 비젼 <i class="fa fa-caret-right"></i></a></li>
                <li class="dropdown-item"><a href="/gnoincoun/centerFoot.do">센터의 발자취<i class="fa fa-caret-right"></i></a></li>
                <li class="dropdown-item active"><a href="/gnoincoun/peopleTg.do">함께하는 사람들<i class="fa fa-caret-right"></i></a></li>
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
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">소통의 공간<i class="fa fa-angle-down"></i></a>
              <ul class="dropdown-menu"  role="menu">
                <li class="dropdown-item"><a href="/gnoincoun/centerNewsList.do">센터소식<i class="fa fa-caret-right"></i></a></li>
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
            센터소개    </dt>
          <dd class="explanation">
            마음으로 만나는 어르신의 행복한 노후     </dd>
          <dd class="explanEng">
            GNOIN Hall Introdution    </dd>
        </dl>
      </div>
    </section>
    <!-- 서브 비쥬얼 영역 //-->
    <div class="container content-wrapper">
      <div class="page-header">
        <h1 class="title">함께하는 사람들</h1>
        <ol class="breadcrumb">
          <li><a href="/gnoincoun/homepageMainList.do">홈</a></li>
          <li><a href="#">센터소개</a></li>
          <li class="active">함께하는 사람들</li>
        </ol>
      </div>
      <div class="content">
        <div class="cont-box">
          <h3>조직도 </h3>
          <blockquote><img src="/gnoincoun/assets/img/organization_3.png" alt="조직도"></blockquote>
          <h3>직원현황</h3>
          <blockquote>
            <table class="basic">
              <tbody><tr>
                <th rowspan="3"> 직원현황 </th>
                <th colspan="7"> 경기도노인종합상담센터 </th>
              </tr>
              <tr>
                <th colspan="4">노인상담사업</th>
                <th colspan="2">취약노인보호사업</th>
              </tr>
              <tr>
                <th> 센터장 </th>
                <th>팀장</th>
                <th>사회복지사</th>
                <th>상담사</th>
                <th style="line-height:1.5;">광역지원기관<br>전담사회복지사</th>
                <th style="line-height:1.5;">광역지원기관<br>응급관리요원</th>
              </tr>
              <tr>
                <td class="b"> 인원 </td>
                <td> 1명 </td>
                <td> 1명 </td>
                <td>2명</td>
                <td>  1명 </td>
                <td> 6명 </td>
                <td> 2명 </td>
              </tr>
              <tr>
                <td class="b"> 계 13명 </td>
                <td colspan="4"> 5명 </td>
                <td> 6명 </td>
                <td> 2명 </td>
              </tr>
            </tbody></table>
          </blockquote>
          <h3>직원안내</h3>
          <blockquote>



        <table class="basic">
              <colgroup>
              <col width="20%">
              <col width="12%">
              <col width="10%">
              <col width="15%">
              </colgroup>
          <tbody><tr>
          <th> 구 분 </th>
          <th> 직 위 </th>
          <th> 성 명 </th>
          <th> 전화번호 </th>
          <th> 업무내용 </th>
          </tr>
          <tr>
          <td colspan="2">센터장</td>
          <td class="b">김미나</td>
          <td class="m">070-4832-6360</td>
          <td class="l"> • 센터 운영 총괄<br>
             • 대외 협력업무 </td>
          </tr>
          <tr>
          <td colspan="2">팀장</td>
          <td class="b">오명심</td>
          <td class="m">070-4832-6361</td>
          <td class="l">• 센터 사업 총괄<br>
            • 복무 및 인사관리</td>
          </tr>
          <tr>
          <td rowspan="3">노인상담사업팀</td>
          <td>과장</td>
          <td class="b">박경숙</td>
          <td class="m">070-4832-6363</td>
          <td class="l">• 상담지원사업 <br> • 교육지원사업<br> • 외부지원사업</td>
          </tr>
          <tr>
          <td>대리</td>
          <td class="b">김지원</td>
          <td class="m">031-222-1360</td>
          <td class="l"> • 회계 및 총무<br>• 홍보사업<br>• 연계협력사업</td>
          </tr>
          <tr>
          <td>대리</td>
          <td class="b">강진주</td>
          <td class="m">070-4832-6362</td>
          <td class="l">• 상담지원사업<br>
             • 교육지원시업<br>
             • 외부지원사업</td>
          </tr>
          <tr>
          <td rowspan="8">취약노인보호사업팀</td>
          <td>대리</td>
          <td class="b">유윤정</td>
          <td class="m">070-4832-6370</td>
          <td class="l">• 노인맞춤돌봄서비스사업</td>
          </tr>
          <tr>
          <td>주임</td>
          <td class="b">유정순</td>
          <td class="m">070-4832-6377</td>
          <td class="l">• 노인맞춤돌봄서비스사업</td>
          </tr>
          <tr>
          <td>주임</td>
          <td class="b">한지원</td>
          <td class="m">070-4832-6371</td>
          <td class="l">• 노인맞춤돌봄서비스사업</td>
          </tr>
          <tr>
          <td>주임</td>
          <td class="b">윤온유</td>
          <td class="m">070-4832-6364</td>
          <td class="l">• 노인맞춤돌봄서비스사업</td>
          </tr>
          <tr>
          <td>주임</td>
          <td class="b">김이안</td>
          <td class="m">070-4832-6368</td>
          <td class="l">• 노인맞춤돌봄서비스사업</td>
          </tr>
          <tr>
          <td>주임</td>
          <td class="b">황윤희</td>
          <td class="m">070-4832-6374(1390)</td>
          <td class="l">• 노인맞춤돌봄서비스사업</td>
          </tr>
          <tr>
          <td>주임</td>
          <td class="b">김태원</td>
          <td class="m">070-4832-6365</td>
          <td class="l">• 독거노인·중중장애인 응급안전안심서비스사업</td>
          </tr>
           <tr>
          <td>주임</td>
          <td class="b">문양술</td>
          <td class="m">070-4832-6367</td>
          <td class="l">• 독거노인·중중장애인 응급안전안심서비스사업</td>
          </tr>
        </tbody></table>


          </blockquote>
        </div>
      </div><!-- .content /-->
    </div><!-- .container /-->
    <!-- FOOTER -->
    <footer>
      <div class="copyaddress">
        <ul>
          <!--<li><b>경기도노인종합상담센터</b></li>-->
          <li><span>주소 : </span><a href="javascript:top_address()">경기도 수원시 장안구 경수대로 1150, 도서관 3층</a></li>
          <li><span>사업자등록번호 : </span>722-82-00367<span class="ml10">대표 : </span>김미나</li>
          <!--<li class="col col-xs-4 text-right"><span>대표 : </span>김미나</li>-->
          <li><span> TEL : </span> <a href="javascript:top_tel()">031-222-1360</a></li>
          <li><span> FAX : </span><a href="javascript:top_fax()">070-4832-6366</a></li>
          <li><span>E-mail : </span><a href="javascript:top_email()">ggnoincoun@gmail.com</a></li>
          <li><span>개인정보담당자 : </span>김지원  </li>
          <li class="copyright">COPYRIGHT(c) <b>GNOIN</b> ALL RIGHT RESERVED</li>
        </ul>
      </div>
     <!-- <p class="pull-right"><a href="#">Top</a></p>-->
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