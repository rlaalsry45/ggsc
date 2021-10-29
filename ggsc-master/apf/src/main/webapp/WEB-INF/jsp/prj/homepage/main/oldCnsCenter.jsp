<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="file:///C|/Users/asdf/Documents/favicon.ico">
    <title>인사말</title>
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
            <li class="dropdown active">
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
            시·군 노인상담센터    </dt>
          <dd class="explanation">
            함께 나누는 사랑, 모두가 행복해집니다.    </dd>
          <dd class="explanEng">
            Counseling Center    </dd>
        </dl>
      </div>
    </section>
    <!-- 서브 비쥬얼 영역 //-->
    <div class="container content-wrapper">
      <div class="page-header">
        <h1 class="title">시&middot;군 노인상담센터</h1>
        <ol class="breadcrumb">
          <li><a href="/gnoincoun/homepageMainList.do">홈</a></li>
          <li><a href="#">센터소개</a></li>
          <li class="active">시&middot;군 노인상담센터</li>
        </ol>
      </div>
      <div class="content">
        <div class="acronym" style="display:block">
          <p style="background-image:url('/gnoincoun/assets/img/acronym03.png');"><strong> 경기도의 31개 시ㆍ군에는
                  어르신 가까운 곳에 노인상담센터가 있습니다. <span>왼쪽 지도를 클릭하시면 해당 권역 지역 센터가 안내되며, 해당 센터 홈페이지 <img src="/gnoincoun/assets/img/blit_internet.png" align="middle"> 를
                      클릭하시면 보다 자세히 안내됩니다.
                  </span></strong>
          </p>
        </div>
        <div class="panel-map sub-map">
              <h2 class="title">상담센터</h2>
              <!-- 기관 정보 -->
              <script language="javascript">
                function selectGigan(data){ 
                  for(var i = 1; i <= 10;i++){ 
                    var boxOn = "details"+data; 
                    var boxOff = "details"+i; 

                    if(i == data){ 
                      var boxOn = "details"+data; 
                      document.getElementById(boxOn).style.display = "block";
                    } else {
                      var boxOff = "details"+i; 
                      document.getElementById(boxOff).style.display = "none";
                    }	

                  }
                }
              </script>
              <div class="construct row">
                <div class="territory"><img src="/gnoincoun/assets/img/bg_map.png" usemap="#Map" border="0" alt="경기도 지도">
                  <map name="Map">
                    <area shape="poly" coords="104,5,123,26,135,23,136,29,163,33,162,45,133,75,133,84,116,89,103,100,88,104,67,118,32,117,24,112,16,120,3,111,3,93,24,88,28,71,32,59,43,52,61,43,70,32,79,15,103,4" href="#" alt="북부권역">
                    <area shape="poly" coords="165,45,190,59,191,73,180,76,182,111,198,110,233,126,220,136,225,147,217,156,219,185,200,197,195,205,176,210,174,200,150,184,144,174,135,176,137,163,125,159,115,160,122,146,109,140,116,124,104,123,101,105,117,90,133,88,135,76" href="#" alt="동부권역
=">
                    <area shape="poly" coords="95,141,81,141,80,146,70,166,73,175,79,179,98,180,105,166,121,147,110,138" href="#" alt="중부권역">
                    <area shape="poly" coords="45,128,38,136,50,143,41,148,28,162,44,171,66,172,79,141,59,139,59,129,49,124" href="#" alt="서부권역">
                    <area shape="poly" coords="52,174,47,181,34,176,26,184,30,199,44,191,54,193,43,201,38,211,54,223,69,233,95,231,108,224,131,235,142,230,150,232,155,221,173,212,171,202,153,188,146,186,144,178,131,177,134,163,111,159,99,181,81,181,70,171" href="#" alt="남부권역">
                  </map>
                  <ul>
                    <li onmouseover="javascript:selectGigan('1');">동부권역<em>10</em></li>
                    <li onmouseover="javascript:selectGigan('2');">서부권역<em>10</em></li>
                    <li onmouseover="javascript:selectGigan('3');">남부권역<em>11</em></li>
                    <li onmouseover="javascript:selectGigan('4');">북부권역<em>13</em></li>
                    <li onmouseover="javascript:selectGigan('5');">중부권역<em>14</em></li>
                  </ul>
                </div>
                <div class="implication">
                  <div id="details1" class="details table-responsive" style="display: none;">
                    <h4>동부권역<em>10개 기관</em></h4>
                    <table class="table table-condensed">
                      <tbody>
                        <tr>
                          <th> 기관명 </th>
                          <th> 주소 </th>
                          <th> 전화번호 </th>
                          <th> 홈페이지 </th>
                      </tr>
                      <tr>
                          <td> 가평군노인복지관 </td>
                          <td class="l"> 경기도 가평군 가평읍 가화로 161번지 </td>
                          <td> 031-581-0763 </td>
                          <td><a href="http://gpsilver.org" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
                      </tr>
                      <tr>
                          <td> 광주시노인종합복지회관 </td>
                          <td class="l"> 경기도 광주시 파발로 202 </td>
                          <td> 031-766-9995 </td>
                          <td><a href="http://gjswc.org" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
                      </tr>
                      <tr>
                          <td> 구리시노인상담센터 </td>
                          <td class="l"> 경기도 구리시 동구릉로 30번길 25-8 </td>
                          <td> 031-556-9988 </td>
                          <td> - </td>
                      </tr>
                      <tr>
                          <td> 남양주시노인복지관 </td>
                          <td class="l"> 경기도 남양주시 진건읍 진건오남로 359 </td>
                          <td> 031-573-6598 </td>
                          <td><a href="http://nyjsw.or.kr " target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
                      </tr>
                      <tr>
                          <td> 남양주시동부노인복지관 </td>
                          <td class="l"> 경기도 남양주시 수동면 비룡로 801-47 </td>
                          <td> 031-559-6099 </td>
                          <td><a href="http://dongbusenior.or.kr" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
                      </tr>
                      <tr>
                          <td> 양평군노인복지관 </td>
                          <td class="l"> 경기도 양평군·읍 양평대교길 4번길 5 </td>
                          <td> 031-775-6684 </td>
                          <td><a href="http://ypsilver21.or.kr " target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
                      </tr>
                      <tr>
                          <td> 여주시노인복지관 </td>
                          <td class="l"> 경기도 여주시 여흥로 160번길 27 </td>
                          <td> 070-4488-4773 </td>
                          <td><a href="http://yjsilver.or.kr" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
                      </tr>
                      <tr>
                          <td> 영락재가복지노인지원서비스센터 </td>
                          <td class="l"> 경기도 하남시 안터로 29-16 </td>
                          <td> 031-793-9369 </td>
                          <td><a href="http://youngnak-noin.or.kr/NSH/" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
                      </tr>
                      <tr>
                          <td> 이천시노인종합복지관 </td>
                          <td class="l"> 경기도 이천시 남천로 31 </td>
                          <td> 031-636-1361 </td>
                          <td><a href="http://ichonold.or.kr" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
                      </tr>
                      <tr>
                          <td> 해피누리노인복지관 </td>
                          <td class="l"> 경기도 남양주시 늘을2로 67</td>
                          <td> 031-593-3000</td>
                          <td>-</td>
                      </tr>
                  </tbody></table>
                  </div>
                  <div id="details2" class="details table-responsive" style="display: block;">
                    <h4>서부권역<em>10개 기관</em> </h4>
                    <table class="table table-condensed">
                      <tbody>
                        <tr>
                          <th> 기관명 </th>
                          <th> 주소 </th>
                          <th> 전화번호 </th>
                          <th> 홈페이지 </th>
                      </tr>
                      <tr>
                          <td> 광명시립소하노인복지관 </td>
                          <td class="l"> 경기도 광명시 소하로 25 </td>
                          <td> 02-2625-9300 </td>
                          <td><a href="http://gmsenior.or.kr" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
                      </tr>
                      <tr>
                          <td> 군포시노인복지관 </td>
                          <td class="l"> 경기도 군포시 고산로 223 </td>
                          <td> 070-4480-0037 </td>
                          <td><a href="http://gpbokji.org" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
                      </tr>
                      <tr>
                          <td> 군포시늘푸른노인복지관 </td>
                          <td class="l"> 경기도 군포시 산본천로 101 </td>
                          <td> 031-392-5755 </td>
                          <td><a href="http://nprsenior.or.kr" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
                      </tr>
                      <tr>
                          <td> 단원구노인복지관 </td>
                          <td class="l"> 경기도 안산시 단원구 선부광장1로 134 </td>
                          <td> 031-489-5073 </td>
                          <td><a href="http://cafe.daum.net/dwsws" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
                      </tr>
                      <tr>
                          <td> 부천시소사노인복지관 </td>
                          <td class="l"> 경기도 부천시 범안로 38 </td>
                          <td> 032-347-0365 </td>
                          <td><a href="http://sosasenior.bucheon4u.kr" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
                      </tr>
                      <tr>
                          <td> 부천시오정노인복지관 </td>
                          <td class="l"> 경기도 부천시 성오로 172 </td>
                          <td> 032-683-9290 </td>
                          <td><a href="http://ojsenior.bucheon4u.kr" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
                      </tr>
                      <tr>
                          <td> 부천시원미노인복지관 </td>
                          <td class="l"> 경기도 부천시 부천로 136번길 27 </td>
                          <td> 070-7545-6914 </td>
                          <td><a href="http://wonmisenior.bucheon4u.kr" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
                      </tr>
                      <tr>
                          <td> 시흥시노인종합복지관 </td>
                          <td class="l"> 경기도 시흥시 장현능곡로 214 </td>
                          <td> 031-313-7979 </td>
                          <td><a href="http://shsenior.or.kr" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
                      </tr>
                      <tr>
                          <td> 안산시상록구노인복지관 </td>
                          <td class="l"> 경기도 안산시 상록구 고잔로 162번지 </td>
                          <td> 031-414-3271 </td>
                          <td><a href="http://ansansenior.or.kr" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
                      </tr>
                      <tr>
                          <td> 안양시노인종합복지관 </td>
                          <td class="l"> 경기도 안양시 동안구 경수대로 665번길 74-30 </td>
                          <td> 031-427-6799 </td>
                          <td><a href="http://happytown.or.kr" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
                      </tr>
                  </tbody></table>
                  </div>
                  <div id="details3" class="details table-responsive" style="display: none;">
                    <h4>남부권역<em>11개 기관</em></h4>
                    <table class="table table-condensed">
                      <tbody>
                        <tr>
                          <th> 기관명 </th>
                          <th> 주소 </th>
                          <th> 전화번호 </th>
                          <th> 홈페이지 </th>
                        </tr>
                        <tr>
                            <td> 화성시동탄노인복지관 </td>
                            <td class="l"> 경기도 화성시 동탄대로8길 36,<br>화성시동탄호수어울림센터 내 C동 1층 사무실</td>
                            <td> 031- 8077-1800 </td>
                            <td><a href=" http://www.dtsenior.or.kr" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
                        </tr>
                        <tr>
                            <td> 안성시노인복지관 </td>
                            <td class="l"> 경기도 안성시 장기로 109 </td>
                            <td> 031-673-5590 </td>
                            <td><a href="http://anseongnoin.or.kr" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
                        </tr>
                        <tr>
                            <td> 오산노인종합복지관 </td>
                            <td class="l"> 경기도 오산시 수청로 192, 3F </td>
                            <td> 031-290-8530 </td>
                            <td><a href="http://www.osannoin.or.kr" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
                        </tr>
                        <tr>
                            <td> 용인시기흥노인복지관 </td>
                            <td class="l"> 경기도 용인시 기흥구 산양로 71 </td>
                            <td> 070-4908-6958 </td>
                            <td><a href="http://ygsenior.or.kr" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
                        </tr>
                        <tr>
                            <td> 용인시수지노인복지관 </td>
                            <td class="l"> 경기도 용인시 수지구 포은대로 435 </td>
                            <td> 031-270-0035 </td>
                            <td><a href="http://sujibokji.or.kr" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
                        </tr>
                        <tr>
                            <td> 용인시처인노인복지관 </td>
                            <td class="l"> 경기도 용인시 처인구 중부대로 1199 </td>
                            <td> 031-324-9304 </td>
                            <td><a href="http://yiswc.or.kr" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
                        </tr>
                        <tr>
                            <td> 평택남부노인복지관 </td>
                            <td class="l"> 경기도 평택시 중앙1로 56번길 25 </td>
                            <td> 070-5102-0122 </td>
                            <td><a href="http://ptsenior.or.kr" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
                        </tr>
                        <tr>
                            <td> 평택북부노인복지관 </td>
                            <td class="l"> 경기도 평택시 서정로 295 </td>
                            <td> 031-615-3912 </td>
                            <td><a href="http://happylog.naver.com/pt3678 " target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
                        </tr>
                        <tr>
                            <td> 평택서부노인복지관 </td>
                            <td class="l"> 경기도 평택시 안중읍 안현로 400 </td>
                            <td> 031-683-0030 </td>
                            <td><a href="http://sbnoin.net " target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
                        </tr>
                        <tr>
                            <td> 팽성노인복지관 </td>
                            <td class="l"> 경기도 평택시 팽성읍 팽성남산 4길 6 </td>
                            <td> 031-650-2661 </td>
                            <td><a href="http://pshwc.or.kr" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
                        </tr>
                        <tr>
                            <td> 화성시남부노인복지관 </td>
                            <td class="l"> 경기도 화성시 향남읍 토성로 37-22 </td>
                            <td> 031-366-5678 </td>
                            <td><a href="http://hssenior.or.kr" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                  <div id="details4" class="details table-responsive" style="display: none;">
                    <h4>북부권역<em>13개 기관</em></h4>
                    <table class="table table-condensed">
                      <tbody>
                        <tr>
                          <th> 기관명 </th>
                          <th> 주소 </th>
                          <th> 전화번호 </th>
                          <th> 홈페이지 </th>
                      </tr>
                      <tr>
                          <td> 고양시덕양노인종합복지관 </td>
                          <td class="l"> 경기도 고양시 덕양구 어울림로 49 </td>
                          <td> 031-969-0672 </td>
                          <td><a href="http://withnoin.org" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
                      </tr>
                      <tr>
                          <td> 고양시일산노인종합복지관 </td>
                          <td class="l"> 경기도 고양시 일산동구 호수로 731 </td>
                          <td> 031-919-9898 </td>
                          <td><a href="http://ilsansenior.org" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
                      </tr>
                      <tr>
                          <td> 고양시대화노인종합복지관 </td>
                          <td class="l"> 경기도 고양시 일산서구 일산로 778 </td>
                          <td> 070-7707-8614 </td>
                          <td><a href="http://dh-seniorwelfarecenter.co.kr" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
                      </tr>
                      <tr>
                          <td> 김포시노인종합복지관 </td>
                          <td class="l"> 경기도 김포시 사우중로 74번길 48 </td>
                          <td> 031-8048-1116 </td>
                          <td><a href="http://gimposenior.org" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
                      </tr>
                      <tr>
                          <td> 김포시북부노인복지관 </td>
                          <td class="l"> 경기도 김포시 통진읍 마송1로 16번길 40-2 </td>
                          <td> 070-7710-3874 </td>
                          <td><a href="http://gpnsenior.org" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
                      </tr>
                      <tr>
                          <td> 동두천시노인복지관 </td>
                          <td class="l"> 경기도 동두천시 동두천로 264 </td>
                          <td> 070-4173-4142 </td>
                          <td><a href="http://ddcnoin.org " target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
                      </tr>
                      <tr>
                          <td> 양주회천노인복지관 </td>
                          <td class="l"> 경기도 양주시 화합로 1426번길 90, 4층</td>
                          <td> 031-859-9081 </td>
                          <td><a href="http://www.yjhcsenior.or.kr/" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
                      </tr>
                      <tr>
                          <td> 송산노인종합복지관 </td>
                          <td class="l"> 경기도 의정부시 용민로 99 </td>
                          <td> 031-852-2674 </td>
                          <td><a href="http://songsan.ne.kr " target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
                      </tr>
                      <tr>
                          <td> 신곡노인종합복지관 </td>
                          <td class="l"> 경기도 의정부시 금신로 297번길 38 </td>
                          <td> 070-7209-5505 </td>
                          <td><a href="http://sgwelfare.org " target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
                      </tr>
                      <tr>
                          <td> 연천군노인복지관 </td>
                          <td class="l"> 경기도 연천군 연천읍 문화로 108번길 11 </td>
                          <td> 031-834-6080 </td>
                          <td><a href="http://lycsenior.org" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
                      </tr>
                      <tr>
                          <td> 의정부노인종합복지관 </td>
                          <td class="l"> 경기도 의정부시 경의로 85번길 16-12 </td>
                          <td> 070-7443-2613 </td>
                          <td><a href="http://uswc4u.or.kr" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
                      </tr>
                      <tr>
                          <td> 파주시노인복지관 </td>
                          <td class="l"> 경기도 파주시 가나무로 130 </td>
                          <td> 070-4759-5559 </td>
                          <td><a href="http://pajusenior.or.kr" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
                      </tr>
                      <tr>
                          <td> 포천시노인복지관 </td>
                          <td class="l"> 경기도 포천시 군내면 청성로 5 </td>
                          <td> 031-8083-2261 </td>
                          <td><a href="http://pcs-nobok.or.kr" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
                      </tr>
                  </tbody></table>
                  </div>
                  <div id="details5" class="details table-responsive" style="display: none;">
                    <h4>중부권역<em>14개 기관</em> </h4>
                    <table class="table table-condensed">
                      <tbody>
                        <tr>
                          <th> 기관명 </th>
                          <th> 주소 </th>
                          <th> 전화번호 </th>
                          <th> 홈페이지 </th>
                      </tr>
                      <tr>
                          <td> 과천시노인복지관 </td>
                          <td class="l"> 경기도 과천시 문원로 57 </td>
                          <td> 02-509-7631 </td>
                          <td><a href="http://gcsilver.or.kr" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
                      </tr>
                      <tr>
                          <td> 밤밭노인복지관 </td>
                          <td class="l"> 경기도 수원시 장안구 상률로 53 </td>
                          <td> 070-7586-8724 </td>
                          <td><a href="http://bambat.org" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
                      </tr>
                      <tr>
                          <td> 버드내노인복지관 </td>
                          <td class="l"> 경기도 수원시 권선구 권선로 564번길 36 </td>
                          <td> 031-547-6288 </td>
                          <td><a href="http://budnae.or.kr" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
                      </tr>
                      <tr>
                          <td> 분당노인종합복지관 </td>
                          <td class="l"> 경기도 성남시 분당구 불정로 50 </td>
                          <td> 031-785-9244 </td>
                          <td><a href="http://bdsenior.or.kr " target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
                      </tr>
                      <tr>
                          <td> 서호노인복지관 </td>
                          <td class="l"> 경기도 수원시 권선구 구운로 4번길 34 </td>
                          <td> 070-8915-5949 </td>
                          <td><a href="http://seoho.or.kr" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
                      </tr>
                      <tr>
                          <td> 수원시광교노인복지관 </td>
                          <td class="l"> 경기도 수원시 영통구 센트럴타운로 22 </td>
                          <td> 031-8006-7423 </td>
                          <td><a href="http://ggsenior.or.kr" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
                      </tr>
                      <tr>
                          <td> 수정노인종합복지관 </td>
                          <td class="l"> 경기도 성남시 수정구 수정남로 268번길 28 </td>
                          <td> 031-739-2925 </td>
                          <td><a href="http://sunobok.or.kr" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
                      </tr>
                      <tr>
                          <td> 수정중앙노인종합복지관 </td>
                          <td class="l"> 경기도 성남시 수정구 성남대로 1480번길 38 </td>
                          <td> 031-752-3366 </td>
                          <td><a href="http://sswc.kr" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
                      </tr>
                      <tr>
                          <td> 의왕시사랑채노인복지관 </td>
                          <td class="l"> 경기도 의왕시 복지로 109 </td>
                          <td> 070-8915-5978 </td>
                          <td><a href="http://noinlove.or.kr" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
                      </tr>
                      <tr>
                          <td> 의왕시아름채노인복지관 </td>
                          <td class="l"> 경기도 의왕시 문화공원로 47 </td>
                          <td> 070-8915-2222 </td>
                          <td><a href="http://uwsenior.or.kr" target="_blank"><img src="/gnoincounassets/img/blit_internet.png"></a></td>
                      </tr>
                      <tr>
                          <td> 중원노인종합복지관 </td>
                          <td class="l"> 경기도 성남시 중원구 제일로 35번길 51 </td>
                          <td> 031-751-6262 </td>
                          <td><a href="http://jwnoin.org" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
                      </tr>
                      <tr>
                          <td> 판교노인종합복지관 </td>
                          <td class="l"> 경기도 성남시 분당구판교역로 99</td>
                          <td> 031-620-2810 </td>
                          <td><a href="http://www.pangyonoin.or.kr" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
                      </tr>
                      <tr>
                          <td> SK청솔노인복지관 </td>
                          <td class="l"> 경기도 수원시 장안구 장안로 174 </td>
                          <td> 070-4014-3955 </td>
                          <td><a href="http://scsnoin.or.kr" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
                      </tr>
                      <tr>
                          <td> 황송노인종합복지관 </td>
                          <td class="l"> 경기도 성남시 중원구 금상로 132 </td>
                          <td> 031-602-1360 </td>
                          <td><a href="http://ypinetree.or.kr" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
                      </tr>
                  </tbody></table>
                  </div>
                </div>
              </div>
              <!-- 기관 정보 //-->
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