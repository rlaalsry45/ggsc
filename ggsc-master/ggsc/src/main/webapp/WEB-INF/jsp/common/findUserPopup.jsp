<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>신청자 정보 팝업</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/gnoincoundb/css/style.css">
<script src="/gnoincoundb/js/jquery-1.11.2.min.js" ></script>
<script type="text/javascript">
	
	function fn_select(userId, userNm, caseNo, cnsGb, birthDt, mobile, addr, gender, sigunCd){
		opener.document.getElementById("cnsleId").value = userId;
		opener.document.getElementById("cnsleNm").value = userNm;
		if(opener.document.getElementById("cnsleNm2")){
			opener.document.getElementById("cnsleNm2").value = userNm;
		}
		if(opener.document.getElementById("cnsleNm3")){
			opener.document.getElementById("cnsleNm3").value = userNm;
		}
		if(opener.document.getElementById("birthDt")){
			opener.document.getElementById("birthDt").value = birthDt;
		}
		if(opener.document.getElementById("mobile")){
			opener.document.getElementById("mobile").value = mobile;
		}
		if(opener.document.getElementById("addr")){
			opener.document.getElementById("addr").value = addr;
		}
		if(opener.document.getElementById("addr2")) opener.document.getElementById("addr2").value = addr;
		if(opener.document.getElementById("caseNo")) opener.document.getElementById("caseNo").value = caseNo;
		if(opener.document.getElementById("cnsGb")) opener.document.getElementById("cnsGb").value = cnsGb;
		if(opener.document.getElementById("sigunCd")) opener.document.getElementById("sigunCd").value = sigunCd;
		if(opener.document.getElementById("tel")) opener.document.getElementById("tel").value = mobile;
		
		if(opener.getGb){
			opener.getGb();
		}
		
		if(gender == "M") {
			if(opener.document.getElementById("genderM")){
				opener.document.getElementById("genderM").checked = true;
			}
		} else if (gender == "F") {
			if(opener.document.getElementById("genderF")){
				opener.document.getElementById("genderF").checked = true;
			}
		}
		var birth = birthDt.substring(0,4);
		var age = new Date().getFullYear()-parseInt(birth);
		if(opener.document.getElementById("age")) opener.document.getElementById("age").value = age;
		
		
		window.close();
	}
	
	function list(curPage) {
		$("#currentPageNo").val(curPage);
		document.searchForm.action = "/gnoincoundb/findUserPopup.do?cnsTargetGb=${cnsTargetGb}&cnsPerTargetGb=${cnsPerTargetGb}";
       	document.searchForm.submit();
	}
</script>
</head>
<body>
	<h2 class="h2-title mg-t20 mg-l25">
		<i class="fa fa-circle"></i>
		회원 찾기
	</h2>
		<!-- 검색영역 -->
		<form name="searchForm" id="searchForm" method="post" onsubmit="return false">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<input type="hidden" id="currentPageNo" name="currentPageNo" value="1" />
			<input type="hidden" id="mnuCd" name="mnuCd" value="${mnuCd }" />
			<div class="search-box">
				<div class="search-group" style="margin-left:0px;">
					<span class="label"><label>회원ID</label></span>
					<span class="label2">
						<input type='text' name='schUserId' maxLength=12 style="width: 100px;" value='${vo.schUserId}' enterSearch data-button='#searchBtn'/>
					</span>
				</div>
				<div class="search-group" style="margin-left:0px; ">
					<span class="label"><label>회원명</label></span>
					<span class="label2">
						<input type='text' name='schUserNm' maxLength=12 style="width: 100px;" value='${vo.schUserNm}' enterSearch data-button='#searchBtn'/>
					</span>
				</div>
				<br>
				<div class="btn" style="padding-right:10px;">
					<button type="button" class="btn-search" id="searchBtn" onclick="javascript:list(1);">
						<i class="fa fa-search"></i>검색
					</button>
				</div>
			</div>
		</form>
		<table class="table-style1" >
			<colgroup>
				<col width="10%"></col>
				<col width="25%"></col>
				<col width="20%"></col>
				<col width="25%"></col>
				<col width="20%"></col>
			</colgroup>
			<thead>
				<tr>
					<th scope="col">순번</th>
					<th scope="col">caseNo</th>
					<th scope="col">상담구분</th>
					<th scope="col">ID</th>
					<th scope="col">성명</th> 
				</tr>
			</thead>
			<tbody id="tby1">
				<c:if test="${list.size() == 0 }">
					<tr>
						<td colspan="5">정보가 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${list.size() > 0 }">
					<c:forEach items="${list }" var="result" varStatus="rs">
						<tr onclick="javascript:fn_select('${result.userId}', '${result.userNm }', '${result.caseNo }', '${result.cnsGb }', '${result.birthDt }', '${result.mobile }', '${result.addr }', '${result.gender }' , '${result.sigunCd }');">
							<td>${result.rnum }</td>
							<td>${result.caseNo }</td>
							<td>${result.cnsGb }</td>
							<td>${result.userId }</td>
							<td>${result.userNm }</td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
		<div class="paginate" id="page1">
			<div id="paging">
                <ul class="pagination">
                	<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="list" />
                	<form:hidden path="pageIndex" />
                </ul>
            </div>
		</div>
	<div>
		<button type="button" class="btn-basic" onclick="window.close();">닫기</button>
	</div>
</body>
</html>