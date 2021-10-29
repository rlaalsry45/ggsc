<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="egovframework.rte.psl.dataaccess.util.EgovMap"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%-- <%
   EgovMap loginVO = (EgovMap)session.getAttribute("LoginVO");
%> --%>
<!-- 
		<div class="fl">
			<a id="menu-icon" class="btn-menu"><i class="fa fa-bars"></i></a>
			<a id="menu-icon-mobile" class="btn-menu"><i class="fa fa-bars"></i></a>
		</div>
  		-->
  		
  		<!-- <div class="btn"> -->
  		<div class="gnb">
  			<c:forEach var="result" items="${topMenuList}">
  				<c:if test="${fn:substring(mnuCd, 0, 3) == result.mnuCd }">
  					<button type="button" id="${result.mnuCd}" class="btn btn-topmenu active" onclick="fn_goPage('${result.mnuPath}','${result.mnuCd}')">${result.mnuNm }</button>
  				</c:if>
  				<c:if test="${fn:substring(mnuCd, 0, 3)!=result.mnuCd }">
  					<button type="button" id="${result.mnuCd}" class="btn btn-topmenu" onclick="fn_goPage('${result.mnuPath}','${result.mnuCd}')">${result.mnuNm }</button>
  				</c:if>
  			</c:forEach>
 		</div>
		<div class="user-area">
			<div class="login-info">
				<%-- <i class="fa fa-user-circle"></i><strong>김포시북부노인복지관</strong>&nbsp;&nbsp;<strong>박상담<c:out value = "${userVO.userId }"/></strong> --%>
				<i class="fa fa-user-circle"></i><strong><c:out value="${userVO.centerNm}"/></strong>&nbsp;&nbsp;<strong><c:out value = "${userVO.userNm }"/></strong>
				<button type="button" class="btn-primary btn-xs btn-logout" onclick="javascript:logout();"><i class="fa fa-sign-out"></i>LOGOUT</button>
				<!-- <button type="button" class="btn-defT btn-xs" onclick="javascript:manualDown();"><i class="fa fa-download"></i>매뉴얼다운로드</button> -->
			</div>
		</div>
	<script type="text/javascript">
		$(document).ready(function() {

		});
	</script>
		