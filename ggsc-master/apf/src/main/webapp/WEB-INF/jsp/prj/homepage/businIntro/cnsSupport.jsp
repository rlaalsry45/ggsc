<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="file:///C|/Users/asdf/Documents/favicon.ico">
    <title>이렇게 이용하세요</title>
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
                <li class="dropdown-item active"><a href="/gnoincoun/salutation.do">인사말<i class="fa fa-caret-right"></i></a></li>
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
            <li class="dropdown active">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">사업소개<i class="fa fa-angle-down"></i></a>
              <ul class="dropdown-menu"  role="menu">
                <li class="dropdown-item active"><a href="/gnoincoun/cnsSupport.do">상담지원사업<i class="fa fa-caret-right"></i></a></li>
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
          <dt>사업소개</dt>
          <dd class="explanation">마음으로 만나는 어르신의 행복한 노후</dd>
          <dd class="explanEng">Enterprise Guidance</dd>
        </dl>
      </div>
    </section>
    <!-- 서브 비쥬얼 영역 //-->
    <div class="container content-wrapper">
      <div class="page-header">
        <h1 class="title"><i class="fa fa-question"></i>상담지원사업</h1>
        <ol class="breadcrumb">
          <li><a href="/gnoincoun/homepageMainList.do">홈</a></li>
          <li><a href="#">사업소개</a></li>
          <li class="active">상담지원사업</li>
        </ol>
      </div>
      <div class="content">
        <!-- 소개 -->
        
          <h2 class="title">심리상담 및 종합상담 소개</h2>
          <h3 class="title">경기도노인종합상담센터란?</h3>
          <p class="text">경기도 노인문제 해결 및 완화를 위해  노인상담현장을 지원합니다.</p>
          <h3 class="title">경기도노인종합상담센터 목표는?</h3>
          <p class="mb60">경기도노인종합상담센터는 이런 어르신들께 ‘사랑의 빛’을 갚는 마음으로 평온한 노후를 저해하는 심리·사회적 어려움 해소에 도움이 되고자 합니다.</p>
        <!-- 소개 //-->
        <!-- 탭메뉴 -->
        <ul class="nav nav-tabs nav-justified" id="myTab" role="tablist">
          <li class="nav-item active">
            <a class="nav-link" id="info01-tab" data-toggle="tab" href="#info01" role="tab" aria-controls="info01" aria-selected="true">이용안내</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" id="info02-tab" data-toggle="tab" href="#info02" role="tab" aria-controls="info02" aria-selected="false">상담안내</a>
          </li>
        </ul>
        <!-- 탭메뉴 //-->
        <!-- 탭컨텐츠 영역 -->
        <div class="tab-content" id="myTabContent">
          <!-- 이용안내 -->
          <div class="tab-pane fade in active" id="info01" role="tabpanel" aria-labelledby="info01-tab">
            <div class="cont-box">
              <h2 class="title mt30">이용시간</h2>  
              <h3 class="title">평일 10:00 ~ 17:00<span class="">(주말 및 공휴일 제외)</span></h3>  
              <h2 class="title mt30">이용방법</h2>  
              <h3 class="title">온라인상담</h3>
              <p class="text">홈페이지 상담실 신청 후, 1주일 이내 답변</p>
              <h3 class="title">내방상담</h3>
              <p class="text">전화로 사전예약 후, 상담가능</p>
              <h3 class="title">찾아오시는 길</h3>
              <p class="text">경기도 수원시 장안구 경수대로 1150, 도서관 3층<br />(자세한 내용은 홈페이지 찾아오시는길 참조)</p>
              <a href="#" class="btn btn-sm btn-default"><i class="fa fa-map-marker mr5"></i>약도보기</a>
              <a href="javascript:top_tel()" class="btn btn-lg btn-primary w100p mt30"><span>전화상담은</span> <strong>031-222-1360</strong></a>
              <hr />
              <h3>이용대상</h3>
              <blockquote> 경기도 내 거주 노인 및 노인가족 등 </blockquote>
              <h3>이용시간</h3>
              <blockquote>평일 10:00~17:00(주말 및 공휴일 제외) </blockquote>
              <h3>이용절차</h3>
              <blockquote>
                <ol class="flowchart">
                  <li><span><strong>사전예약신청</strong> (전화 또는 방문)</span></li>

                  <li><span> <strong>상담진행</strong> </span></li>
                </ol>
              </blockquote>
              <h3>이용방법</h3>
              <blockquote>
                <ul class="basic">
                  <li> 전화상담 :  031-222-1360</li>
                  <li> 온라인상담 : 홈페이지 상담실 신청 후, 1주일 이내 답변</li>
                  <li> 내방상담 : 전화로 사전예약 후, 상담가능</li>
                  <li> 홈페이지 찾아오시는 길 참조 <input value="약도보기" onclick="javascript:menu(1,6)" type="button" class="sudden"></li>
                </ul>
              </blockquote>
              <h3>이용비용</h3>
              <blockquote> 무료 </blockquote>
              <h3>상담분야</h3>
              <blockquote> 우울, 자살, 치매, 성상담, 가족상담, 생활상담, 심리검사 등 </blockquote>
              <h3>상담내용</h3>
              <blockquote>
                <table class="basic">
                  <tbody><tr>
                    <th> 제목 </th>
                    <th> 내용 </th>
                  </tr>
                  <tr>
                    <td>자살예방상담</td>
                    <td class="l"> 우울 및 자살예방을 위한 상담</td>
                  </tr>
                  <tr>
                    <td>노인 성상담</td>
                    <td class="l">노년기 성에 관련된 전문상담</td>
                  </tr>
                  <tr>
                    <td>가족상담</td>
                    <td class="l"> 가족갈등, 폭력 학대 등과 관련된 상담</td>
                  </tr>
                  <tr>
                    <td>정서·심리</td>
                    <td class="l">치매건강, 중독, 고독 등 정서관련 심리상담</td>
                  </tr>
                  <tr>
                    <td>경제생활</td>
                    <td class="l">경제적 빈곤, 복지서비스관련 정보제공 등 복지상담 및 연계</td>
                  </tr>
                  <tr>
                    <td>위기상담지원</td>
                    <td class="l">위급한 상황발생시 긴급지원 및 정서심리상담 지원</td>
                  </tr>
                  <tr>
                    <td>심리검사</td>
                    <td class="l"> 우울, 자살생각, 치매(MMSE-KE), MMPI, 성격유형검사 등</td>
                  </tr>
                </tbody></table>
              </blockquote>
            </div>
          </div>
          <!-- 이용안내 //-->
          <!-- 상담안내 -->
          <div class="tab-pane fade in" id="info02" role="tabpanel" aria-labelledby="info02-tab">
            <div class="cont-box">
              <h3>개인상담</h3>
              <blockquote> 우울, 자살, 치매, 성상담, 가족상담, 생활상담, 심리검사 등</blockquote>
              <h4>상담분야</h4>
              <blockquote>
                <ul class="linebox">
                  <li>자살예방상담 : 우울 및 자살예방을 위한 상담</li>
                  <li> 노인 성상담 : 노년기 성에 관련된 전문상담</li>
                  <li> 가족상담 : 가족갈등, 폭력 학대 등과 관련된 상담</li>
                  <li>정서·심리 : 치매건강, 중독, 고독 등 정서관련 심리상담</li>
                  <li> 경제생활 : 경제적 빈곤, 복지서비스관련 정보제공 등 복지상담 및 연계</li>
                  <li> 위기상담지원 : 위급한 상황발생시 긴급지원 및 정서심리상담 지원</li>
                  <li>심리검사 : 우울, 자살생각, 치매(MMSE-KE), MMPI, 성격유형검사 등</li>
                </ul>
              </blockquote>
              <h4>상담체계도</h4>
              <blockquote>
              <img src="/gnoincoun/assets/img/contents07.png"></blockquote>
              <h3>집단상담</h3>
              <blockquote> 어르신과 그 가족들이 가지고 있는 심리·정서적 어려움을 바탕으로 집단을 구성하여 자신의 어려움을 스스로 극복할 수 있도록 도와드리고 자기 성장의 기회를 제공하기 위한 프로그램</blockquote>
              <h4>프로그램 내용</h4>
              <blockquote>
                <ul class="linebox">
                  <li> 대인관계향상프로그램(부부관계개선, 의사소통, 성인식개선 등 집단상담프로그램)</li>
                  <li>우울 및 자살예방집단프로그램(자아존중감, 긍정성 등 집단상담프로그램)</li>
                  <li> 웰다잉집단상담프로그램(자기성장을 위한 자아통합프로그램)</li>
                  <li> 사별애도집단상담프로그램(사별 후 사회적응을 위한 프로그램)</li>
                  <li>기타 노인성질환 및 정서지지를 위한 집단상담프로그램 실시</li>
                </ul>
              </blockquote>
              <h4>대상</h4>
              <blockquote> 경기도 내 거주 60세 이상 어르신 및 시·군 상담센터 실무자 </blockquote>
              <h4>프로그램 구성</h4>
              <blockquote>주 1회, 8~12회기 진행 </blockquote>
              <h3>온라인 상담 <input value="바로가기" onclick="javascript:menu(4,5)" type="button" class="sudden"></h3>
              <blockquote>
                <ul class="basic">
                  <li> 경기도노인종합상담센터 홈페이지(www.gnoin.kr) '어르신 고민나눔터'에 신청하시면 답변을 받으실 수 있습니다.</li>
                  <li> 이용시간 : 24시간 언제나 가능</li>
                  <li> 상담내용 : 노인 관련 다양한 문제에 대해 상담신청 가능</li>
                </ul>
              </blockquote>
              <h4>위기상담지원 </h4>
              <blockquote>
                  <img src="/gnoincoun/assets/img/contents08.png"></blockquote>
              <h4>찾아가는 노인상담서비스 </h4>
              <blockquote>
                <ul class="basic">
                  <li> 31개 시·군 56개 상담센터와 함께 찾아가는 노인상담실시</li>
                  <li> 지역별 상담센터 상담실무자와 협력하여 찾아가는 노인상담홍보</li>
                </ul>
              </blockquote>
            </div>
          </div>
          <!-- 상담안내 //-->
        </div>
        <!-- 탭컨텐츠 영역 //-->
      </div><!-- .container /-->
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