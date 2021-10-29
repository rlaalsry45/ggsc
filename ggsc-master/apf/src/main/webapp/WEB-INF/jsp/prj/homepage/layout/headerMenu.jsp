<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<!-- <style>
	.navbar-nav>li {width: 14.2%;}
</style> -->
<div class='header wrap' style="margin-top: 15px;">
	<span class='logo-box'><a href="/gnoincoun/homepageMainList.do"><img src="/gnoincoun/images/logo.png" alt="경기도노인종합상담센터" class='logo' /></a></span>
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
			<span class='all-menu-icon'></span>전체 메뉴
			<!--  <a href="/gnoincoun/siteMap.do">
			</a> -->
		</li>
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