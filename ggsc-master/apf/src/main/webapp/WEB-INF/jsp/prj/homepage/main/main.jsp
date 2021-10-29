<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<title>경기도노인종합상담센터</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
	<!-- <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet"> -->
	<!-- <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" /> -->
	<link rel="stylesheet" href="/gnoincoun/assets/css/swiper-bundle.min.css" />
	<link rel="stylesheet" href="/gnoincoun/css/style2.css" />
	
	<!-- <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script> -->
	<script src="/gnoincoun/assets/js/jquery-3.3.1.min.js"></script>
	<!-- <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script> -->
	<script src="/gnoincoun/assets/js/swiper-bundle.min.js"></script>
	<script src="/gnoincoun/js/script2.js"></script>
</head>
<style>
a { text-decoration:none; color:#333;} 
.main-menu > li > a:hover {font-weight: bold;}
body {min-width:320px;}
</style>
<body>
	<div id="wrap">
		<div class='header wrap'>
			<span class='logo-box'><a href="/gnoincoun/homepageMainList.do"><img src="/gnoincoun/images/logo.png" alt="경기도노인종합상담센터" class='logo'/></a></span>
			<!-- <ul class='navigator'>
				<li>로그인</li>
				<li>회원가입</li>
				<li>마이페이지</li>
				<li class='all-menu'>
					<span class='all-menu-icon'></span>
					전체 메뉴</li>
			</ul> -->
			<ul class='navigator'>
				<c:choose>
					<c:when test="${sessionScope.LoginVO == null }">
						<li><a href="/gnoincoun/login.do">로그인</a></li>
						<li><a href="/gnoincoun/agree.do">회원가입</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="/gnoincoun/logout.do">로그아웃</a></li>
						<li><a href="/gnoincoun/mypageView.do">마이페이지</a></li>
					</c:otherwise>
				</c:choose>
				<li class='all-menu'>
					<span class='all-menu-icon'></span>
					전체 메뉴</li>
			</ul>

			<ul class='main-menu'>
				<li><a href="/gnoincoun/comfCnsWrite.do">맘편한상담<c:out value="${loginVo.userNm }"/></a></li>
				<li><a href="/gnoincoun/psyInfo.do">간편한심리검사</a></li>
				<li><a href="/gnoincoun/eduAppWrite.do">교육신청</a></li>
				<li><a href="/gnoincoun/centerIntroList.do">센터안내</a></li>
				<li><a href="/gnoincoun/busiIntroList.do">센터사업소개</a></li>
				<li><a href="/gnoincoun/centerNewsList.do">소통공간</a></li>
			</ul>
		</div>

		<div class='full main-image'>
			<img src='/gnoincoun/images/main.png' alt="행복한 세상"/>
		</div>

		<div class='wrap main-content'>
			<div class='banner-box-01'>
				<li><a href="/gnoincoun/centerIntroList.do"><img src="/gnoincoun/images/banner_01.png" alt="이렇게 이용하세요"/></a></li>
				<li><a href="/gnoincoun/psyInfo.do"><img src="/gnoincoun/images/banner_02.png" alt="간편한 심리검사"/></a></li>
				<li><a href="/gnoincoun/comfCnsWrite.do"><img src="/gnoincoun/images/banner_03.png" alt="맘편한 상담"/></a></li>
				<li><a href="/gnoincoun/mypageView.do"><img src="/gnoincoun/images/banner_04.png" alt="마이페이지"/></a></li>
			</div>

			<div class='banner-box-02'>
				<li><a href="/gnoincoun/centerIntroList.do"><img src="/gnoincoun/images/banner_05.png" alt="센터안내"/></a></li>
				<li><a href="/gnoincoun/busiIntroList.do"><img src="/gnoincoun/images/banner_06.png" alt="시군지원사업"/></a></li>
				<li><a href="/gnoincoun/busiIntroList.do?gubun=noin"><img src="/gnoincoun/images/banner_07.png" alt="24시노인온상담"/></a></li>
				<li><a href="/gnoincoun/busiIntroList.do?gubun=mid"><img src="/gnoincoun/images/banner_09.png" alt="중장년상담"/></a></li>
				<li><a href="/gnoincoun/busiIntroList.do?gubun=weak"><img src="/gnoincoun/images/banner_10.png" alt="취약노인지원사업"/></a></li>
				<li><a href="/gnoincoun/busiIntroList.do?gubun=gender"><img src="/gnoincoun/images/banner_08.png" alt="성인지교육사업"/></a></li>
			</div>
		</div>

		<div class='full bg-gray'>
			<div class='wrap'>
				<div class='banner-one'>
					<a href="/gnoincoun/comfCnsWrite.do"><img src="/gnoincoun/images/banner_one.png" alt="상담 신청하기" /></a>
				</div>



				<div class='map-box'>
					<div class='main-title'>
						<div class='left'><img src="/gnoincoun/images/map/icon_map.png" alt="icon" class='map_icon'/>&nbsp;지도에 표시된 마커를 선택해주세요.</div>
						<div class='right'>선택지역 : <span id='nowMap'>전체</span></div>
					</div>
					<div class='main-content'>
						<div class='left'>
							<div class='map_img'>
								<img src="/gnoincoun/images/map/map.png" alt="경기도청" usemap="#marker"/>
								<map name="marker">
								
								</map>
							<!-- <div class='map_namyangju map_marker'>
								<img src='/gnoincoun/images/map/namyangju.png'></div>
							</div> -->
							</div>
						</div>

						<div class='right'>
							<div class='map-search'>
								<div class='row'>
									<li class='subject'>지역 검색</li>
									<li class='content select2'>
										<select><option value=''>경기도</select>
										<select><option value=''>고양시</select>
									</li>
								</div>
								<div class='row'>
									<li class='subject'>명칭 검색</li>
									<li class='content' style='position:relative'>
										<input type='text' class='form-control' />
										<img src="/gnoincoun/images/map/icon_search.png" style='position:absolute; top:0; right:0; cursor:pointer;  '/>
									</li>
								</div>

								<div class='bar mg20'></div>

								<div class='map-search-text'>
									<span>지역 검색에서 시/군/구가 안 나오면 해당 지역에 센터가 없음으로 명칭 검색에서 명칭을 입력해 주세요.</span>

									<div class='marker-text'>지도에 있는 마커를 선택하시면<br>상세 지부가 나타납니다.</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>



		<div class='wrap board-box'>
			<div class='border-header'>
				<h2>센터소식</h2>
				<ul class='border-btn-box'>
					<li class='active'><a href="/gnoincoun/centerNewsList.do">센터소식</a></li>
				<li><a href="/gnoincoun/docLibraryList.do">문서자료실</a></li>
				<li><a href="/gnoincoun/freeBoardList.do">자유게시판</a></li>
				</ul>
			</div>

			<div class='board-list'>
				<ul>
					<li class='board-image'><img src="/gnoincoun/images/board_01.png" /></li>
					<ul class='board-text'>
						<li class='date'>
							<span class='date_ym'>2021.01</span><br>
							<span class='date_d'>19</span>
						</li>
						<li class='subject'>경기도형 노인맞춤돌봄서비스 종사자 안전관리메뉴얼 안내</li>
						<dd class='icon_arrow'></dd>
					</ul>
				</ul>

				<ul>
					<li class='board-image'><img src="/gnoincoun/images/board_02.png" /></li>
					<ul class='board-text'>
						<li class='date'>
							<span class='date_ym'>2021.01</span><br>
							<span class='date_d'>15</span>
						</li>
						<li class='subject'>2020년 경기도노인종합상담센터 5차 직원 채용 서류전형 합격자 공고</li>
						<dd class='icon_arrow'></dd>
					</ul>
				</ul>

				<ul>
					<li class='board-image'><img src="/gnoincoun/images/board_03.png" /></li>
					<ul class='board-text'>
						<li class='date'>
							<span class='date_ym'>2020.12</span><br>
							<span class='date_d'>17</span>
						</li>
						<li class='subject'>2020년 경기도노인종합상담센터 5차 직원[행정직] 채용 공고</li>
						<dd class='icon_arrow'></dd>
					</ul>
				</ul>

				<ul>
					<li class='board-image'><img src="/gnoincoun/images/board_04.png" /></li>
					<ul class='board-text'>
						<li class='date'>
							<span class='date_ym'>2020.11</span><br>
							<span class='date_d'>16</span>
						</li>
						<li class='subject'>경기도노인종합상담센터 20주년 심포지엄 개최 안내</li>
						<dd class='icon_arrow'></dd>
					</ul>
				</ul>
			</div>



			<div class="swiper-container mySwiper site-list">
			  <div class="swiper-wrapper">
				<div class="swiper-slide"><img src="/gnoincoun/images/site_01.png" alt="보건복지부" /></div>
				<div class="swiper-slide"><img src="/gnoincoun/images/site_02.png" alt="보건복지부" /></div>
				<div class="swiper-slide"><img src="/gnoincoun/images/site_03.png" alt="보건복지부" /></div>
				<div class="swiper-slide"><img src="/gnoincoun/images/site_04.png" alt="보건복지부" /></div>
				<div class="swiper-slide"><img src="/gnoincoun/images/site_05.png" alt="보건복지부" /></div>
				<div class="swiper-slide"><img src="/gnoincoun/images/site_05.png" alt="보건복지부" /></div>
			  </div>
			  <div class='swiper-button-prev'></div>
			  <div class="swiper-button-next"></div>
			</div>

		</div>

		<div id="footer">
			<div class='footer-top'>
				<div class='wrap'>
					<div class='logo-image'>
						<img src="/gnoincoun/images/logo_slogan_white.png" />
					</div>
					<div class='text-content'>
						<p>경기도노인종합상담센터</p>
						<div>05836 경기도 수원시 장안구 경수대로 1150, 도서관 3층     대표 : 김미나     고유번호 : 136-82-61243<br>
							  전화 :  031-222-1360     팩스 : 070-4832-6366     이메일 :  ggnoincoun@gmail.com     개인정보담당자 : 강진주</div>
					</div>

					<ul class='site-select'>
						<ul class='site-select-list'>
							<li><a href="http://www.mohw.go.kr/" target="_blank">보건복지부</a></li>
							<li><a href="https://www.gg.go.kr/" target="_blank">경기도청</a></li>
							<li><a href="https://gg.pass.or.kr/" target="_blank">경기도사회서비스원</a></li>
							<li><a href="https://ggwf.gg.go.kr/" target="_blank">경기복지재단</a></li>
							<li><a href="https://www.ggwf.or.kr/" target="_blank">경기복지플랫폼</a></li>
							<li><a href="https://www.gg.go.kr/oldman_job/" target="_blank">경기도노인일자리지원센터</a></li>
							<li><a href="https://ggss.or.kr/" target="_blank">경기도지역사회서비스지원단</a></li>
							<li><a href="https://gepa.co.kr/" target="_blank">경기도노인보호전문기관</a></li>
							<li><a href="https://kg1389.or.kr/" target="_blank">경기동부노인보호전문기관</a></li>
							<li><a href="https://www.gnnoin.kr/" target="_blank">경기북부노인보호전문기관</a></li>
							<li><a href="https://www.ggw1389.or.kr/main/main.php/" target="_blank">경기서부노인보호전문기관</a></li>
							<li><a href="http://www.gaswc.or.kr/" target="_blank">경기도노인종합복지관협회</a></li>
							<li><a href="https://gyeonggi.nid.or.kr/home/main/main.aspx/" target="_blank">경기도광역치매센터</a></li>
							<li><a href="http://www.kgacold.co.kr/" target="_blank">경기도재가노인복지협회</a></li>
							<li><a href="https://noininfo.or.kr/" target="_blank">경기도노인복지시설엽합회</a></li> 
							<li><a href="https://happycam5060.or.kr:45870/" target="_blank">경기도중장년해피캠퍼스 남부센터</a></li> 
							<li><a href="https://http://www.gaswc.or.kr/" target="_blank">경기도노인복지관협회</a></li> 
							<li><a href="https://www.mentalhealth.or.kr/" target="_blank">경기도정신건강복지센터</a></li>
						</ul>
						<li>유관 사이트 바로가기</li>
					</ul>
				</div> 
			</div>
			<div class='footer-bottom'>
				<div class='wrap'>
					<span><a href="">이용약관</a></span>
					<span><a href="">개인정보취급방침</a></span>
					<span><a href="">이메일추출방지정책</a></span>
					<span><a href="">장애인차별금지법</a></span>
					<span><a href="">찾아오시는 길</a></span>
					<span class='copyright'>Copyright (c) 2021 GNOIN. All rights reserved.</span>
				</div>
			</div>

		</div>

	</div>
</body>
</html>