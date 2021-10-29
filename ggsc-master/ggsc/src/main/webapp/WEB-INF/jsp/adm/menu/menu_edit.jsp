<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 <!-- content -->
<section id="content">

	<!-- start -->

	<h2 class="h2-title">
		<i class="fa fa-check-square"></i>메뉴-권한 맵핑 관리</h2>

		<!-- 검색영역 -->
	<form name="searchForm" id="searchForm" method="post" onsubmit="return false;">
<!-- 	<input type="hidden" name="currentPageNo" id="sCurPageNo" value="0"> -->
	<input type="hidden" id="searchYn" name="searchYn" value="Y">
	<input type="hidden" id="sCurPageNo" name="currentPageNo" value="0">
<!-- 		<div class="search-box"> -->
<!-- 				<div class="search-group"> -->
<!-- 					<span class="label"><label>메뉴레벨</label></span> <span class="form"> -->
<!-- 						<select name="searchLvl" id="searchLvl"> -->
<!-- 							<option value="">전체</option> -->
<!-- 							<option value="1">대메뉴</option> -->
<!-- 							<option value="2">중메뉴</option> -->
<!-- 					</select> -->
<!-- 					</span> -->
<!-- 				</div> -->
<!-- 				<div class="search-group"> -->
<!-- 					<span class="label"><label>메뉴명</label></span> <span class="form"> -->
<!-- 						<input type="text" id="searchNm" name="searchNm" -->
<%-- 						value="${vo.searchNm}"> --%>
<!-- 					</span> -->
<!-- 				</div> -->
<!-- 			<div class="btn"><button type="button" class="btn-search" onclick="search(0)"><i class="fa fa-search"></i>검색</button></div> -->
<!-- 			</div> -->
<!-- 		</div> -->
	</form>
		<!-- //검색영역 -->

		<form id="authForm" name="authForm">
			<input type="hidden" id="authCurPageNo" name="currentPageNo" value="0">
<!-- 			<input type="hidden" id="authCds2" name="auCds"> -->
			<div class="box-style1">
				<!-- 접수완료정보 -->
				<h3 class="h3-title"><i class="fa fa-stop-circle-o "></i>권한리스트</h3>
					<table class="table-style2">
					<thead>
						<tr>
							<th scope="col">순번</th>
							<th scope="col">권한그룹</th>
							<th scope="col">권한명</th>
							<th scope="col">권한설명</th>
							<th scope="col">사용여부</th>
						</tr>
					</thead>
					<tbody id="tby1">
<%-- 						<c:forEach var="result" items="${menuList}" varStatus="status"> --%>
<%-- 							<tr onclick="javascript:viewInfo(${result.mnuSer})"> --%>
<%-- 							  <td>${(totalPageCnt-result.rnum)+1}</td> --%>
<%-- 							  <td><c:out value="${result.mnuLvl}" /></td> --%>
<%-- 							  <td><c:out value="${result.mnuNm}" /></td> --%>
<%-- 							  <td><c:out value="${result.useYn}" /></td> --%>
<!-- 							</tr> -->
<%-- 						</c:forEach> --%>
					</tbody>
					</table>



					<!-- 페이징 -->
					<div class="paginate" id="page1">
<!-- 						<a href="#"><i class="fa fa-angle-double-left"></i></a> -->
<!-- 						<a href="#"><i class="fa fa-angle-left"></i></a> -->
<!-- 						<a href="#">1</a> -->
<!-- 						<a href="#" class="active">2</a> -->
<!-- 						<a href="#">3</a> -->
<!-- 						<a href="#">4</a> -->
<!-- 						<a href="#">5</a> -->
<!-- 						<a href="#"><i class="fa fa-angle-right"></i></a> -->
<%-- 						<ui:pagination paginationInfo = "${menuPageInfo}" type="image" jsFunction="menuLinkPage"/> --%>
					</div>
					<!-- // 페이징 -->
			<!-- // 접수완료정보 -->
			</div>
			</form>

		<!-- col-2 -->
		<div class="col-2 mg-t5">
			<div class="col-2-box w30">
				<!-- 1 -->
				<form id="menuForm" name="menuForm" >
<!-- 			<input type="hidden" id="menuCurPageNo" name="currentPageNo" value="0"> -->
			<input type="hidden" id="authCd" name="authCd">
			<input type="hidden" id="authNm" name="authNm">
			<input type="hidden" id="mnuCds" name="mnuCds">
			<input type="hidden" id="mnuSers" name="mnuSers">
			<input type="hidden" id="mnuLvls" name="mnuLvls">
			<input type="hidden" id="regId" name="regId" value="${userVO.userId}" />
			<div class="box-style1">
			<h3 class="h3-title"><i class="fa fa-stop-circle-o "></i>메뉴리스트</h3>

				<!-- thead 고정 -->
				<div class="theadfixed-box">
					<table class="table-style2 col-width9">
						<tr>
						<th scope="col">순번</th>
						<th scope="col">메뉴레벨</th>
						<th scope="col">메뉴명</th>
						<th scope="col">사용여부</th>
						<th scope="col"><input type="checkbox" id="mnuAll" name="mnuAll" onclick="javascript:checkAll('A')"></th>
					</tr>
					</table>
				</div>
				<!-- // thead 고정 -->
				<!-- 스크롤 영역 -->
				<div class="tbody-box h330">
					<table class="table-style2 col-width9">
						<tbody id="tby2">
<%-- 					<c:forEach var="result" items="${authList}" varStatus="status"> --%>
<!-- 						<tr> -->
<%-- 						<td>${(totalPageCnt-result.rnum)+1}</td> --%>
<%-- 						<td><c:out value="${result.authGrpNm}" /></td> --%>
<%-- 						<td><c:out value="${result.authNm}" /></td> --%>
<%-- 						<td><c:out value="${result.authCntn}" /></td> --%>
<%-- 						<td><c:out value="${result.useYn}" /></td> --%>
<%-- 						<td><input type="checkbox" name="authSeq" id="authSeq" value="${result.authCd}"></td> --%>
<!-- 						</tr> -->
<%-- 					</c:forEach> --%>
				</tbody>
					</table>
				</div>
				<!-- // 스크롤 영역 -->

				<!-- 페이징 -->
				<div class="paginate" id="page2">
					<!-- a href="#"><i class="fa fa-angle-double-left"></i></a>
					<a href="#"><i class="fa fa-angle-left"></i></a>
					<a href="#">1</a>
					<a href="#" class="active">2</a>
					<a href="#">3</a>
					<a href="#">4</a>
					<a href="#">5</a>
					<a href="#"><i class="fa fa-angle-right"></i></a>
					<a href="#"><i class="fa fa-angle-double-right "></i></a-->
				</div>
				<!-- // 페이징 -->
				<div class="btn-box">
					<button type="button" class="btn-basic" onclick="location.href='/adm/menu_mng.do?mnuCd=${vo.mnuCd}'">
						<i class="fa fa-repeat"></i>이전화면</a>
 					</button>
					<button type="button" class="btn-basic btn-point" onclick="valChkData()"><i class="fa fa-pencil-square-o"></i>저장</button>
				</div>
			</div>
			</form>
				<!-- // 1 -->
			</div>
			<div class="col-2-box w70">
				<!-- 2 -->
		<form id="mapForm" name="mapForm">
		<input type="hidden" id="mapCurPageNo" name="currentPageNo" value="0">
		<input type="hidden" id="m_searchYn" name="searchYn" value="Y">
		<input type="hidden" id="mapSers" name="mapSers">
		<input type="hidden" id="m_authCd" name="authCd">
<!-- 		<input type="hidden" id="authCds2" name="authCds"> -->
		<div class="box-style1 x-scroll-auto">
			<h3 class="h3-title"><i class="fa fa-stop-circle-o "></i>맵핑 리스트</h3>
				<!-- 테이블스타일1 -->
				<table class="table-style1">
					<thead>
						<tr>
							<th scope="col"><input type="checkbox" name="mapAll" id="mapAll" onclick="javascript:checkAll('M')"></th>
							<th scope="col">권한명</th>
							<th scope="col">상위메뉴</th>
							<th scope="col">메뉴명</th>
							<th scope="col">권한그룹</th>
							<th scope="col">메뉴PATH</th>
							<th scope="col">사용여부</th>
							<th scope="col">등록일자</th>
						</tr>
					</thead>
					<tbody id="tby3">
					<c:forEach var="result" items="${mapList}" varStatus="status" >
						<!-- tr>
							<td><input type="checkbox" name="mapSer" id="mapSer" ></td>
							<td>${result.authNm}</td>
							<td>${result.hMnuCd}</td>
							<td>${result.mnuNm}</td>
							<td>${result.authGrpNm}</td>
							<td>${result.mnuPath}</td>
							<td>${result.useYn}</td>
							<td>${result.dbInsTm}</td>
						</tr-->
					</c:forEach>
<%-- 					<c:if test="${fn:length(list) == 0}"> --%>
<!-- 						<tr> -->
<!-- 							<td colspan="9">생성 정보가 존재하지 않습니다.</td> -->
<!-- 						</tr> -->
<%-- 					</c:if> --%>
					</tbody>
				</table>
				<!-- 페이징 -->
				<div class="paginate" id="page3">
					<!-- a href="#"><i class="fa fa-angle-double-left"></i></a>
					<a href="#"><i class="fa fa-angle-left"></i></a>
					<a href="#">1</a>
					<a href="#" class="active">2</a>
					<a href="#">3</a>
					<a href="#">4</a>
					<a href="#">5</a>
					<a href="#"><i class="fa fa-angle-right"></i></a>
					<a href="#"><i class="fa fa-angle-double-right "></i></a-->
				<!-- ui:pagination paginationInfo = "${mapPageInfo}" type="image" jsFunction="mapLinkPage"/-->
<!-- 				 -->
				</div>
				<div class="btn-box">
					<button type="button" class="btn-basic" onclick="javascript:delChkData();"><i class="fa fa-minus-circle"></i>삭제</button>
				</div>
		</div>
		</form>
				<!-- // 2 -->
			</div>
		</div>
		<!-- col-2 -->

		<!-- end -->

	</section>
	<!-- //content -->

<script src="/gnoincoundb/js/util/paging.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		menuList(0);
		authList(0);
		//mapList(0);
	});
	function search(pageNo) {
		// 		$("#menuCurPageNo").val(cPage);
		// 		$("#searchYn").val('Y');
		// 		$("#searchForm").submit();
		// 		menuList(0);
	}
	function menuList() {
		var param = $("#menuForm").serialize();
		// 		param+="&"+$("#menuForm").serialize();//ajax로 넘길 data

		$.ajax({
			type : "POST",
			url : "/adm/menu_list.do",
			data : param,
			dataType : "json",
			success : function(json) {
				var html = '';
				$.each(json.menuList,	function(i, d) {
					// 						var num = 0;
					// 						num = (json.totalPageCnt - d.rnum) + 1;
					html += '<tr>';
					html += '<td>' + d.rnum + '</td>';
					html += '<td>' + d.mnuLvl + '</td>';
					html += '<td class="ta-l">'
							+ d.mnuNm + '</td>';
					html += '<td>' + d.useYn + '</td>';
					html += '<td><input type="checkbox" name="mnuCd" value="'+d.mnuCd+'"></td>';
					html += '<input type="hidden" name="mnuSer" id="mnuSer" value="'+d.mnuSer+'">';
					html += '<input type="hidden" name="mnuLvl" id="mnuLvl" value="'+d.mnuLvl+'">';
					html += '</tr>';
				});
				$("#tby2").html(html);
			},
			error : function(e) {
				alert("서버와 통신 오류입니다.");
			}
		}); //end ajax
	}
	function authList(pageNo) {
		$("#sCurPageNo").val(pageNo);
		var param = $("#searchForm").serialize();
		// 			var param = $("#authForm").serialize(); //ajax로 넘길 data
		//
		$.ajax({
			type : "POST",
			url : "/adm/auth_list.do",
			data : param,
			dataType : "json",
			success : function(json) {
				var html = '';
				$.each(json.list, function(i, d) {
					var num = 0;
					num = (json.totalPageCnt - d.rnum) + 1;
					html += '<tr id="authTr'+i+'" onclick="javascript:authCheck(\'' + d.authCd+ '\',\'' + d.authNm + '\', '+i+');">';
					html += '<td>' + num + '</td>';
					html += '<td>' + d.authGrpNm + '</td>';
					html += '<td>' + d.authNm + '</td>';
					html += '<td>' + d.cntn + '</td>';
					html += '<td>' + d.useYn + '</td>';
					html += '</tr>';
				});
				$("#tby1").html(html);
				var p = json.paginationInfo;
				var pageView = Paging(p.totalRecordCount, 10, 10,
						p.currentPageNo, 'authList', 1);
				$("#page1").empty().html(pageView);
			},
			error : function(e) {
				alert("서버와 통신 오류입니다.");
			}
		});
	}

	function mapList(pageNo) {
		$("#mapCurPageNo").val(pageNo);
		$("#m_searchYn").val('Y');
		var param = $("#mapForm").serialize(); //ajax로 넘길 data

		$.ajax({
			type : "POST",
			url : "/adm/menu_edit.do",
			data : param,
			dataType : "json",
			success : function(json) {

				var html = '';
				$.each(	json.mapList,	function(i, d) {
					html += '<tr>';
					html += '<td><input type="checkbox" name="mapSer" id="mapSer" value="'+d.mapSer+'"></td>';
					html += '<td>'
						+ isNullCheck(d.authNm)
						+ '</td>';
					html += '<td>'
							+ isNullCheck(d.hMnuNm)
							+ '</td>';
					html += '<td>'
							+ isNullCheck(d.mnuNm)
							+ '</td>';
					html += '<td>'
							+ isNullCheck(d.authGrpNm)
							+ '</td>';
					html += '<td>'
							+ isNullCheck(d.mnuPath)
							+ '</td>';
					html += '<td>'
							+ isNullCheck(d.useYn)
							+ '</td>';
					html += '<td>'
							+ isNullCheck(d.dbInsTm)
							+ '</td>';
					html += '</tr>';
				});

				if (json.mapList.length == 0) {
					html += '<tr><td colspan="12">정보가 없습니다.</td></tr>';
				}
				$("#tby3").html(html);
				var p = json.mapPageInfo;
				var pageView = Paging(p.totalRecordCount, 10, 10,
						p.currentPageNo, 'mapLinkPage', 1);
				$("#page3").empty().html(pageView);
			},
			error : function(e) {
				alert("서버와 통신 오류입니다.");
			}
		});
	}
	function checkAll(flag) {
		var checkField;
		var chkAll;
		if (flag == 'A') {
			checkField = document.menuForm.mnuCd;
			chkAll = document.menuForm.mnuAll.checked;
		} else {
			checkField = document.mapForm.mapSer;
			chkAll = document.mapForm.mapAll.checked;
		}

		if (chkAll) {
			if (checkField) {
				if (checkField.length > 1) {
					for (var i = 0; i < checkField.length; i++) {
						checkField[i].checked = true;
					}
				} else {
					checkField.checked = true;
				}
			}
		} else {
			if (checkField) {
				if (checkField.length > 1) {
					for (var j = 0; j < checkField.length; j++) {
						checkField[j].checked = false;
					}
				} else {
					checkField.checked = false;
				}
			}
		}
	}

	function valChkData() {
		var resultCheck = false;
		var checkField = document.menuForm.mnuCd;
		var checkField2 = document.menuForm.mnuSer;
		var returnMnuCd = "";
		var returnMnuSer = "";
		var checkedCount = 0;

		if (checkField) {
			if (checkField.length > 1) {
				for (var i = 0; i < checkField.length; i++) {
					if (checkField[i].checked) {
						checkedCount++;
						if (returnMnuCd == "") {
							returnMnuCd = checkField[i].value;
							returnMnuSer = checkField2[i].value;
						} else {
							returnMnuCd = returnMnuCd + ":" + checkField[i].value;
							returnMnuSer = returnMnuSer + ":" + checkField2[i].value;
						}
					}
				}
				if (checkedCount > 0)
					resultCheck = true;
				else {
					alert("선택된 항목이 없습니다.");
					resultCheck = false;
				}
			} else {
				if (document.menuForm.mnuCd.checked == false) {
					alert("선택 항목이 없습니다.");
					resultCheck = false;
				} else {
					returnMnuCd = document.menuForm.mnuCd.value;
					returnMnuSer = document.menuForm.mnuSer.value;
					resultCheck = true;
				}
			}
		} else {
			alert("정보가 없습니다.");
		}
		if (resultCheck) {
			document.menuForm.mnuCds.value = returnMnuCd;
			document.menuForm.mnuSers.value = returnMnuSer;

			registMapData();
		}
	}
	function registMapData() {
		if ($("#authCd").val() == '') {
			alert("권한을 먼저 선택해주세요.");
			return;
		}
		var param = $("#menuForm").serialize(); //ajax로 넘길 data

		$.ajax({
			type : "POST",
			url : "/adm/reg_map.do",
			data : param,
			dataType : "json",
			success : function(json) {
				if (json.success == "yes") {
					/*
					var html = '';
					$.each(	json.mapList,function(i, d) {
						html += '<tr>';
						html += '<td><input type="checkbox" name="mapSeq" id="mapSeq" value="'+d.mapSeq+'"></td>';
						html += '<td>'
								+ isNullCheck(d.hMnuNm)
								+ '</td>';
						html += '<td>'
								+ isNullCheck(d.mnuNm)
								+ '</td>';
						html += '<td>'
								+ isNullCheck(d.authGrpNm)
								+ '</td>';
						html += '<td>'
								+ isNullCheck(d.authNm)
								+ '</td>';
						html += '<td>'
								+ isNullCheck(d.mnuPath)
								+ '</td>';
						html += '<td>'
								+ isNullCheck(d.useYn)
								+ '</td>';
						html += '<td>'
								+ isNullCheck(d.dbInsTm)
								+ '</td>';
						html += '</tr>';
					});
					$("#tby3").html(html);

					var p = json.mapPageInfo;
					var pageView = Paging(p.totalRecordCount, 10, 10,
							p.currentPageNo, 'mapLinkPage', 1);
					$("#page3").empty().html(pageView);
					*/
					alert("저장되었습니다.");

					//menuList(0);
					//authList(0);
					mapList(0);
				} else {
					alert("오류가 발생하여 저장에 실패했습니다.");
				}
			},
			error : function(e) {
				alert("서버와 통신 오류입니다.");
			}
		}); //end ajax
	}
	function delChkData() {
		var resultCheck = false;
		var checkField = document.mapForm.mapSer;
		var returnMap = "";
		var checkedCount = 0;

		if (checkField) {
			if (checkField.length > 1) {
				for (var i = 0; i < checkField.length; i++) {
					if (checkField[i].checked) {
						checkedCount++;
						if (returnMap == "") {
							returnMap = checkField[i].value;
						} else {
							returnMap = returnMap + ":" + checkField[i].value;
						}
					}
				}
				if (checkedCount > 0)
					resultCheck = true;
				else {
					alert("선택된 항목이 없습니다.");
					resultCheck = false;
				}
			} else {
				if (document.mapForm.mapSer.checked == false) {
					alert("선택 항목이 없습니다.");
					resultCheck = false;
				} else {
					returnMap = document.mapForm.mapSer.value;
					resultCheck = true;
				}
			}
		} else {
			alert("정보가 없습니다.");
		}
		if (resultCheck) {
			document.mapForm.mapSers.value = returnMap;
			deleteMapData();
		}
	}
	function authCheck(authCd, authNm, idx) {
		$("#authCd").val(authCd);
		$("#authNm").val(authNm);
		$("#m_authCd").val(authCd);
		$("#authTr"+idx).attr('class', 'active');

		for(var i=0; i<10; i++){
			if (idx != i) {
				$("#authTr"+i).attr('class', '');
			}
		}

		var param = {authCd : authCd}; //ajax로 넘길 data

		$.ajax({
			type : "POST",
			url : "/adm/authMenu_map_list.do",
			data : param,
			dataType : "json",
			success : function(json) {
				$("input[name=mnuCd]:checkbox").each(function() {
					$(this).attr("checked", false);
				});

				$.each(json.mapList, function(i, d) {
					$('input:checkbox[name="mnuCd"]').each(function() {
						var strMnuCd = this.value;
						if(strMnuCd == d.mnuCd){ //값 비교
							this.checked = true; //checked 처리
						}
					 });
				});
			},
			error : function(e) {
				alert("서버와 통신 오류입니다.");
			}
		}); //end ajax

		mapList(0);
	}
	function deleteMapData() {
		var param = $("#mapForm").serialize(); //ajax로 넘길 data

		$.ajax({
			type : "POST",
			url : "/adm/del_map.do",
			data : param,
			dataType : "json",
			success : function(json) {
				if (json.success == "yes") {
					/*
					var html = '';
					$.each(	json.mapList,function(i, d) {
						html += '<tr>';
						html += '<td><input type="checkbox" name="mapSeq" id="mapSeq" value="'+d.mapSeq+'"></td>';
						html += '<td>'
								+ isNullCheck(d.hMnuNm)
								+ '</td>';
						html += '<td>'
								+ isNullCheck(d.mnuNm)
								+ '</td>';
						html += '<td>'
								+ isNullCheck(d.authGrpNm)
								+ '</td>';
						html += '<td>'
								+ isNullCheck(d.authNm)
								+ '</td>';
						html += '<td>'
								+ isNullCheck(d.mnuPath)
								+ '</td>';
						html += '<td>'
								+ isNullCheck(d.useYn)
								+ '</td>';
						html += '<td>'
								+ isNullCheck(d.dbInsTm)
								+ '</td>';
						html += '</tr>';
					});
					$("#tby3").html(html);

					var p = json.mapPageInfo;
					var pageView = Paging(p.totalRecordCount, 10, 10,
							p.currentPageNo, 'mapLinkPage', 1);
					$("#page3").empty().html(pageView);
					*/

					alert("삭제 되었습니다.");

					menuList(0);
					mapList(0);
				} else {
					alert("오류가 발생하여 삭제에 실패했습니다.");
				}
			},
			error : function(e) {
				alert("서버와 통신 오류입니다.");
			}
		}); //end ajax
	}

	function mapLinkPage(rownum) {
		mapList(rownum);
	}
	function menuLinkPage(rownum) {
		menuList(rownum);
	}
	function authLinkPage(rownum) {
		authList(rownum);
	}
	function isNullCheck(obj) {
		if (obj == "null" || obj == null) {
			obj = "";
		}
		return obj;
	}
	// 		function search(page) {
	// 			var checkedVal = $('input:radio[name=kindType]:checked').val();
	// 			$("#searchKindType").val(checkedVal);
	// 			examList(page);
	// 		}
</script>
