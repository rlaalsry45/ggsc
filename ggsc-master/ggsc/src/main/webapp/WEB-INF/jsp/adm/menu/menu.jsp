<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- content -->
<section id="content">

	<!-- start -->

	<h2 class="h2-title">
		<i class="fa fa-check-square"></i>메뉴관리
	</h2>

	<!-- <div class="btn-box-top"><button type="button" class="btn-basic btn-point"><i class="fa fa-pencil-square-o"></i>등록</button></div> -->

	<!-- 검색영역 -->
	<form name="searchForm" id="searchForm" action="/gnoincoundb/menu_mng.do"
		method="post">
		<input type="hidden" name="currentPageNo" id="currentPageNo" value="0">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<input type="hidden" id="mnuCd" name="mnuCd" value="${mnuCd }" />
		<div class="search-box">
			<div class="search-group">
				<span class="label"><label>메뉴레벨</label></span> <span class="form">
					<select name="searchLvl" id="searchLvl">
						<option value="">전체</option>
						<option value="1">대메뉴</option>
						<option value="2">중메뉴</option>
				</select>
				</span>
			</div>
			<div class="search-group">
				<span class="label"><label>메뉴명</label></span> <span class="form">
					<input type="text" id="searchNm" name="searchNm" enterSearch data-button='#searchBtn'
					value="${vo.searchNm}">
				</span>
			</div>
			<div class="btn">
				<button type="button" class="btn-search" id="searchBtn">
					<i class="fa fa-search"></i>검색
				</button>
			</div>
		</div>
	</form>
	<!-- //검색영역 -->

	<form id="planForm" name="planForm" action="">
		<div class="box-style1 x-scroll-auto">
			<h3 class="h3-title">
				<i class="fa fa-stop-circle-o "></i>메뉴 정보
			</h3>
			<!-- 테이블스타일1 -->
			<table class="table-style1 col-width6-5">
				<thead>
					<tr>
						<!-- th scope="col">순번</th-->
						<th scope="col">메뉴명</th>
						<th scope="col">메뉴설명</th>
						<th scope="col">경로</th>
						<th scope="col">메뉴코드</th>
						<th scope="col">상위메뉴코드</th>
						<th scope="col">사용여부</th>
					</tr>
				</thead>
				<tbody id="tby1">
					<%-- 					<c:forEach var="list" items="${menuList}" varStatus="status"> --%>
					<%-- 						<tr onclick="javascript:viewInfo(${list.mnuSer})"> --%>
					<%-- 							<td>${(totalPageCnt-list.rnum)+1}</td> --%>
					<%-- 							<td class="ta-l"><c:out value="${list.mnuNm}" /></td> --%>
					<%-- 							<td><c:out value="${list.mnuCntn}" /></td> --%>
					<%-- 							<td class="ta-l"><c:out value="${list.mnuPath}" /></td> --%>
					<%-- 							<td><c:out value="${list.mnuCd}" /></td> --%>
					<%-- 							<td><c:out value="${list.hMnuCd}" /></td> --%>
					<%-- 							<td><c:out value="${list.useYn}" /></td> --%>
					<!-- 						</tr> -->
					<%-- 					</c:forEach> --%>
				</tbody>
			</table>
			<!-- 페이징 -->
			<div class="paginate" id="page1">
				<!-- a href="#"><i class="fa fa-angle-double-left"></i></a>
					<a href="#"><i class="fa fa-angle-left"></i></a>
					<a href="#">1</a>
					<a href="#" class="active">2</a>
					<a href="#">3</a>
					<a href="#">4</a>
					<a href="#">5</a>
					<a href="#"><i class="fa fa-angle-right"></i></a>
					<a href="#"><i class="fa fa-angle-double-right "></i></a-->
				<%-- 					<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="linkPage"/> --%>
			</div>
			<!-- // 페이징 -->
		</div>
	</form>

	<!-- 등록폼 -->
	<form name="regForm" id="regForm" method="post">
		<input type="hidden" name="mnuNo" id="mnuNo" value="0"> <input
			type="hidden" id="regId" name="regId" value="${userVO.userId}" />
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<div class="box-style1 mg-t5">
			<h3 class="h3-title">
				<i class="fa fa-stop-circle-o "></i>메뉴 등록
			</h3>
				<!-- 항목 3개 -->
				<div class="write-box">
					<div class="write-group">
						<label class="label">메뉴명</label><span class="form"><input
							type="text" name="mnuNm" id="mnuNm" title="메뉴명"></span>
					</div>
					<div class="write-group">
						<label class="label">메뉴 코드</label><span class="form"><input
							type="text" name="mnuCd" id="mnuCd" title="메뉴 코드" readonly></span>
					</div>
					<div class="write-group">
						<label class="label">메뉴 PATH</label><span class="form"><input
							type="text" name="mnuPath" id="mnuPath" title="메뉴 PATH"></span>
					</div>
					<div class="write-group">
						<label class="label">메뉴 설명</label><span class="form"><input
							type="text" name="cntn" id="cntn" title="메뉴 설명"></span>
					</div>
				</div>
				<div class="write-box">
					<div class="write-group">
						<label class="label">메뉴레벨</label><span class="form"> <select
							id="mnuLvl" name="mnuLvl" title="메뉴레벨"
							onchange="javascript:mnuLvlSelect();">
								<option value="">선택</option>
								<option value="1">대메뉴</option>
								<option value="2">중메뉴</option>
								<option value="3">소메뉴</option>
						</select>
						</span>
					</div>
					<div class="write-group">
						<label class="label">메뉴레벨코드</label><span class="form"><input
							type="text" name="mnuLvl1" id="mnuLvl1" title="메뉴레벨코드" value="1"
							readonly></span>
					</div>
					<div class="write-group">
						<label class="label">상위메뉴명</label><span class="form"> <select
							id="hMnuCd" name="hMnuCd" title="상위메뉴명">
								<c:forEach var="list" items="${menuList}" varStatus="status">
									<option value="${list.hMnuCd}">${list.cntn}</option>
								</c:forEach>
						</select>
						</span>
					</div>
					<div class="write-group">
						<label class="label">상위메뉴코드</label><span class="form"><input
							type="text" name="hMnuCd1" id="hMnuCd1" title="상위메뉴코드" readonly></span>
					</div>
				</div>
				<div class="write-box">
					<div class="write-group2">
						<label class="label">사용여부</label><span class="form"> <select
							id="useYn" name="useYn" title="사용여부">
								<option value="">선택</option>
								<option value="Y">사용</option>
								<option value="N">미사용</option>
						</select>
						</span>
					</div>
					<div class="write-group">
						<label class="label">순번</label><span class="form"><input
							type="text" name="odr" id="odr" title="순번"></span>
					</div>
					<div class="write-group">
						<label class="label">타입</label><span class="form"> <select
							id="authType" name="authType" title="타입">
								<option value="">선택</option>
								<option value="M">메뉴</option>
								<option value="B">버튼</option>
						</select>
						</span>
					</div>
				</div>
				<!-- 				<div class="col-3"> -->
				<!-- 					<div class="col-3-box"> -->
				<!-- 						<label class="label">사용여부</label> <select name="useYn" id="useYn"> -->
				<!-- 							<option value="Y">사용</option> -->
				<!-- 							<option value="N">미사용</option> -->
				<!-- 						</select> -->
				<!-- 					</div> -->
				<!-- 					<div class="col-3-box"> -->
				<!-- 						<label class="label">관리자 메뉴 여부</label> <select name="adminYn" -->
				<!-- 							id="adminYn"> -->
				<!-- 							<option value="Y">관리자</option> -->
				<!-- 							<option value="N">사용자</option> -->
				<!-- 						</select> -->
				<!-- 					</div> -->

				<!-- // 항목 3개 -->



				<!-- 버튼영역 -->
				<div class="btn-box">
					<button type="button" class="btn-basic" id="clear">
						<i class="fa fa-repeat"></i>초기화
					</button>
					<button type="button" class="btn-basic btn-point" id="saveBtn">
						<i class="fa fa-pencil-square-o"></i>저장
					</button>
				</div>
				<!-- // 버튼영역 -->
			</div>
	</form>
	<!-- // 등록폼 -->

	<!-- 	<form id="deleteForm" name="deleteForm" method="post"> -->
	<!-- 		<input type="hidden" id="mnuSer1" name="mnuSer" value="" /> -->
	<!-- 	</form> -->

</section>
<!-- //content -->

<script src="/gnoincoundb/js/util/paging.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		//$("#datepicker1").val($.datepicker.formatDate("yymmdd", new Date()));
		//$("#datepicker2").val($.datepicker.formatDate("yymmdd", new Date()));
		list(0);
		mnuLvlSelect();
	});

	$('#clear').click(function() {
		$(':text:not([id=searchText])').val('');
		$("#hMnuCd").html("<option value='' selected='selected' >선택</option>");
		$("#mnuNo").val(0);
		$('select').each(function() {
			$(this).find('option:first').attr('selected', 'true');
		});
	});

	function linkPage(pageNo) {
		search(pageNo);
	}
	$('#searchBtn').click(function() {
		list(0);
	});
	//메뉴 저장
	function save() {
		var param = $("#regForm").serialize(); //ajax로 넘길 data
		var token = $("meta[name='_csrf']").attr("th:content");
		var header = $("meta[name='_csrf_header']").attr("th:content");
		
		$.ajax({
			type : "POST",
			url : "/gnoincoundb/adm/reg_menu.do",
			data : param,
			dataType : "json",
			beforeSend : function(xhr){
				xhr.setRequestHeader(header, token);
			},
			success : function(json) {
				if (json.success == "yes") {
					var html = '';
					$.each(json.menuList, function(i, d) {

						var num = 0;
						num = (json.totalPageCnt - d.rnum) + 1;
						html += '<tr onclick="javascript:viewInfo(' + d.mnuNo + ')">';
						html += '<td class="ta-l">' + d.mnuNm + '</td>';
						html += '<td class="ta-l">' + d.mnuCntn + '</td>';
						html += '<td class="ta-l">' + d.mnuPath + '</td>';
						html += '<td>' + d.mnuCd + '</td>';
						html += '<td>' + isNullCheck(d.hMnuCd) + '</td>';
						html += '<td>' + d.useYn + '</td>';
						html += '</tr>';
					});
					$("#tby1").html(html);
					var p = json.paginationInfo;
					var pageView = Paging(p.totalRecordCount, 10, 10,
							p.currentPageNo, 'list', 1);
					$("#page1").empty().html(pageView);
					alert("저장되었습니다.");

					$(':text:not([id=searchflag])').val('');
					$("#mnuNo").val(0);
					$('select').each(function() {
						$(this).find('option:first').attr('selected', 'true');
					list(0);
					});
				} else {
					alert("실패하였습니다.");
				}
			},
			error : function(e) {
				alert("서버와 통신 오류입니다.");
			}
		}); //end ajax
	}

	$('#saveBtn').click(
		function() {
			var inputObjs = $("#regForm input");
			var bEmpty = true;
			var focus;

			inputObjs.each(function(index) {
				if (($(this).attr('id') != 'mnuNo'
						&& $(this).attr('id') != 'mnuCd'
						&& $(this).attr('id') != 'hMnuCd1'
						&& $(this).attr('id') != 'mnuLvl1'
						&& $(this).attr('id') != 'regId'
						&& $(this).attr('id') != 'mnuType' && $(this).attr(
						'id') != 'odr')
						&& $(this).val() == '') {
					focus = $(this);
					bEmpty = false;
					alert($(this).attr('id'));
					alert($(this).attr('title') + "을 입력해주세요.");
					focus.focus();

					return false;
				}
			});

			if (!bEmpty)
				return;

			valChk();
		});

	function list(curPage) {
		$("#currentPageNo").val(curPage);
		var param = $("#searchForm").serialize(); //ajax로 넘길 data
		var token = $("meta[name='_csrf']").attr("th:content");
		var header = $("meta[name='_csrf_header']").attr("th:content");
		
		
		$.ajax({
			type : "POST",
			url : "/gnoincoundb/adm/menu_main_list.do",
			data : param,
			dataType : "json",
			beforeSend : function(xhr){
				xhr.setRequestHeader(header, token);
			},
			success : function(json) {
				var html = '';
				$("#totalPageCnt").html(json.totalPageCnt);
				$.each(json.list, function(i, d) {
					var num = 0;
					num = (json.totalPageCnt - d.rnum) + 1;
					html += '<tr onclick="javascript:viewInfo(' + d.mnuNo
							+ ')">';
					html += '<td class="ta-l">' + d.mnuNm + '</td>';
					html += '<td class="ta-l">' + d.cntn + '</td>';
					html += '<td class="ta-l">' + d.mnuPath + '</td>';
					html += '<td>' + d.mnuCd + '</td>';
					html += '<td>' + isNullCheck(d.hMnuCd) + '</td>';
					html += '<td>' + d.useYn + '</td>';
					html += '</tr>';
				});
				if (json.list.length == 0) {
					html += '<tr><td colspan="11">메뉴 정보가 없습니다.</td></tr>';
				}
				$("#tby1").html(html);

				var p = json.paginationInfo;
				var pageView = Paging(p.totalRecordCount, 10, 10,
						p.currentPageNo, 'list', 1);
				$("#page1").empty().html(pageView);
			},
			error : function(e) {
				alert("서버와 통신 오류입니다.");
			}
		});
	}

	function valChk() {
		if (!$('#mnuLvl').val()) {
			alert("메뉴레벨을 선택하세요.");
			regForm.mnuLvl.focus();
			return;
		} else if (!$('#useYn').val()) {
			alert("사용여부를 선택하세요.");
			regForm.useYn.focus();
			return;
		}
		save();
	}
	function viewInfo(mnuNo) {
		var param = {
			mnuNo : mnuNo
		};
		var token = $("meta[name='_csrf']").attr("th:content");
		var header = $("meta[name='_csrf_header']").attr("th:content");
		
		
		$.ajax({
			type : "POST",
			url : "/gnoincoundb/menu/menu_info.do",
			data : param,
			dataType : "json",
			beforeSend : function(xhr){
				xhr.setRequestHeader(header, token);
			},
			success : function(json) {

				var data = json.menuInfo;
				$("#mnuNm").val(data.mnuNm);
				$("#mnuCd").val(data.mnuCd);
				$("#mnuLvl").val(data.mnuLvl);
				$("#mnuLvl1").val(data.mnuLvl);
				$("#mnuPath").val(data.mnuPath);
				$("#cntn").val(data.cntn);
				$("#useYn").val(data.useYn);
				$("#hMnuCd").val(data.hMnuCd);
				$("#hMnuCd1").val(data.hMnuCd);
				$("#odr").val(data.odr);
				$("#mnuNo").val(data.mnuNo);
				$("#authType").val(data.authType);

				var html = '';
				html += "<option value='' selected='selected'>"
						+ isNullCheck(data.hMnuNm) + "</option>";
				$("#hMnuCd").html(html);
			},
			error : function(e) {
				alert("서버와 통신 오류입니다.");
			}
		});
	}

	function mnuLvlSelect() {
		var mnuLvl = $("#mnuLvl option:selected").val();
		$("#mnuLvl1").val(mnuLvl);

		var param = {
			mnuLvl : mnuLvl - 1
		};
		var token = $("meta[name='_csrf']").attr("th:content");
		var header = $("meta[name='_csrf_header']").attr("th:content");
		
		
		$.ajax({
			type : "POST",
			url : "/gnoincoundb/menu/upMenu_info.do",
			data : param,
			dataType : "json",
			beforeSend : function(xhr){
				xhr.setRequestHeader(header, token);
			},
			success : function(json) {
				var html = '';
				if (json.upMenuList.length == 0) {
					html += "<option value='' selected='selected'>선택</option>";
				} else {
					$.each(json.upMenuList, function(i, d) {
						html += "<option value='"+d.mnuCd+"'>" + d.mnuNm
								+ "</option>";
					});
				}
				$("#hMnuCd").html(html);
				$("#hMnuCd1").html(html);
			},
			error : function(e) {
				alert("서버와 통신 오류입니다.");
			}
		}); //end ajax
	}

	function isNullCheck(obj) {
		if (obj == "null" || obj == null) {
			obj = "";
		}
		return obj;
	}
</script>