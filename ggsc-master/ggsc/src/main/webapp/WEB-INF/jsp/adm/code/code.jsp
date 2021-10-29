<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

	<!-- content -->
	<section id="content">

		<!-- start -->

		<h2 class="h2-title"><i class="fa fa-check-square"></i>공통코드관리</h2>

		<!-- <div class="btn-box-top"><button type="button" class="btn-basic btn-point"><i class="fa fa-pencil-square-o"></i>등록</button></div> -->

		<!-- 검색영역 -->
		<form name="searchForm" id="searchForm" method="post">
		<input type="hidden" name="currentPageNo" id="currentPageNo" value="0">
		<div class="search-box">
				<div class="search-group">
					<span class="label"><label>코드그룹명</label></span>
					<span class="form">
						<select name="schCodeGrp" id="schCodeGrp">
							<option value="">전체</option>
						</select>
					</span>
				</div>
				<%-- <div class="search-group">
					<span class="label"><label>코드명</label></span>
					<span class="form">
						<input type="text" id="schCodeNm" name="schCodeNm" value="${vo.schCodeNm}">
					</span>
				</div> --%>
			<div class="btn">
			<button type="button" class="btn-search" id="searchBtn">
				<i class="fa fa-search"></i>검색
			</button>
			</div>
		</div>
		</form>
		<!-- //검색영역 -->

		<form id="listForm" name="listForm" action="">
		<div class="box-style1 x-scroll-auto">
			<h3 class="h3-title"><i class="fa fa-stop-circle-o "></i>코드 정보</h3>
				<!-- 테이블스타일1 -->
				<table class="table-style1 col-width9-1">
					<thead>
						<tr>
							<th scope="col">순번</th>
							<th scope="col">코드그룹코드</th>
							<th scope="col">코드그룹명</th>
							<th scope="col">코드</th>
							<th scope="col">코드명</th>
							<th scope="col">설명</th>
							<th scope="col">순번</th>
							<th scope="col">사용여부</th>
							<th scope="col">등록일자</th>
						</tr>
					</thead>
					<tbody id="tby1">
						<c:forEach var="result" items="${list}" varStatus="status">
							<tr onclick="javascript:viewInfo(${result.comSer})">
							  <td>${(totalPageCnt-result.rnum)+1}</td>
							  <td><c:out value="${result.comGrp}" /></td>
							  <td><c:out value="${result.comGrpNm}" /></td>
							  <td><c:out value="${result.comCd}" /></td>
							  <td><c:out value="${result.comNm}" /></td>
							  <td><c:out value="${result.cntn}" /></td>
							  <td><c:out value="${result.odr}" /></td>
							  <td><c:out value="${result.useYn}" /></td>
							  <td><c:out value="${result.dbInsTm}" /></td>
							</tr>
						</c:forEach>
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
					<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="list"/>
				</div>
				<!-- // 페이징 -->
		</div>
		</form>

		<!-- 등록폼 -->
		<form name="regForm" id="regForm" method="post">
		<input type="hidden" name="comSer" id="comSer" value="0" >
		<input type="hidden" id="regId" name="regId" value="${userVO.userId}" />
		<div class="box-style1 mg-t5">
			<h3 class="h3-title"><i class="fa fa-stop-circle-o "></i>코드 등록</h3>
				<div class="write-box">
					<div class="write-group"><label class="label">코드명</label><span class="form"><input type="text" name="comNm" id="comNm" title="코드명"></span></div>
					<div class="write-group"><label class="label">코드</label><span class="form"><input type="text" name="comCd" id="comCd" title="코드" ></span></div>
					<div class="write-group"><label class="label">코드그룹명</label><span class="form"><input type="text" name="comGrpNm" id="comGrpNm" title="코드그룹" ></span></div>
					<div class="write-group"><label class="label">코드그룹코드</label><span class="form"><input type="text" name="comGrp" id="comGrp" title="코드그룹" ></span></div>
				</div>
				<div class="write-box">
					<div class="write-group-wide"><label class="label">설명</label><span class="form"><input type="text" name="cntn" id="cntn" title="설명"></span></div>
				</div>
				<div class="write-box">
					<div class="write-group2"><label class="label">사용여부</label><span class="form">
						<select name="useYn" id="useYn" title="사용여부">
							<option value="Y" >사용</option>
							<option value="N" >미사용</option>
						</select>
					</div>
					<div class="write-group2"><label class="label">등록일자</label><span class="form"><input type="text" name="dbInsTm" id="dbInsTm" title="등록일자" readonly></span></div>
				</div>
		<!-- 버튼영역 -->
		<div class="btn-box">
			<button type="button" class="btn-basic" id="clear" ><i class="fa fa-repeat"></i>초기화</button>
<!-- 			<button type="button" class="btn-basic" onclick="javascript:code_delete();"><i class="fa fa-minus-circle"></i>삭제</button> -->
			<button type="button" class="btn-basic btn-point" id="saveBtn"><i class="fa fa-pencil-square-o" ></i>저장</button>
		</div>
		<!-- // 버튼영역 -->
		</div>
		</form>

	<form id="deleteForm" name="deleteForm" method="post">
		<input type="hidden" id="comSer1" name="comSer" value="" />
	</form>

	<!-- // 등록폼 -->
	</section>
	<!-- //content -->

	<script src="/js/util/paging.js"></script>
	<script type="text/javascript">
	$(document).ready(function() {
		getCodeComGrp();	//코드그룹 불러오기

		list(0);
	});

		//코드그룹 정보 조회
		function getCodeComGrp() {
			$.ajax({
				type:"POST",
				url:"/com/code_com_grp.do",
				dataType:"json",
				success:function(json) {
					var html = '<option value="">전체</option>';
					$.each(json.list, function(i, d) {
						html += '<option value="'+d.comGrp+'">'+d.comGrpNm+'</option>';
					});
					$("#schCodeGrp").html(html);
				},
				error : function(e) {
					alert("서버와 통신 오류입니다.");
				}
			});
		}
		function list(pageNo) {
			search(pageNo);
		}
		$('#searchBtn').click(function() {
			list(0);
		});
		$('#clear').click(function() {
			$(':text:not([id=searchflag])').val('');
			$("#comSer1").val(0);
			$("#comSer").val(0);
			$("#comCd").removeAttr("readonly");
			$("#comGrp").removeAttr("readonly");
			$('select').each(function() {
				$(this).find('option:first').attr('selected', 'true');
			});
		});

		$('#saveBtn').click(
				function() {
					var inputObjs = $("#regForm input");
					var bEmpty = true;
					var focus;

					inputObjs.each(function(index) {
						if (($(this).attr('id') != 'comSer'
								&& $(this).attr('id') != 'cntn'
								&& $(this).attr('id') != 'dbInsTm')
								&& $(this).val() == '') {
							focus = $(this);
							bEmpty = false;
							alert($(this).attr('title') + "을 입력해주세요.");
							focus.focus();

							return false;
						}
					});

					if (!bEmpty) return;

					serCheck();
				}
			);
		function serCheck() {
			var ser = $("#comSer").val();
			if(ser == 0)check();
			else if(ser != 0)save();
		}
		function check() {
			var param = $("#regForm").serialize(); //ajax로 넘길 data

			$.ajax({
				type : "POST",
				url : "/com/code_check.do",
				data : param,
				dataType : "json",
				success : function(json) {
					if(json.codeCheck=="N"){
						save();
					}else {
						alert("코드정보가 중복됩니다.");
					}
				},
				error : function(e) {
					alert("서버와 통신 오류입니다.");
				}
			});
		}
		function list(curPage) {
			$("#currentPageNo").val(curPage);
			var param = $("#searchForm").serialize(); //ajax로 넘길 data

			$.ajax({
				type : "POST",
				url : "/adm/code_list.do",
				data : param,
				dataType : "json",
				success : function(json) {
					var html = '';
					$.each(json.list, function(i, d) {
						var num = 0;
						num = (json.totalPageCnt - d.rnum) + 1;
						html += '<tr onclick="javascript:viewInfo('+ d.comSer +');">';
						html += '<td>' + num +'</td>';
						html += '<td>' + d.comGrp +'</td>';
						html += '<td>' + d.comGrpNm +'</td>';
						html += '<td>' + d.comCd + '</td>';
						html += '<td>' + d.comNm + '</td>';
						html += '<td>' + d.cntn + '</td>';
						html += '<td>' + d.odr + '</td>';
						html += '<td>' + d.useYn + '</td>';
						html += '<td>' + d.dbInsTm + '</td>';
						html += '</tr>';
					});
					if (json.list.length == 0) {
						html += '<tr><td colspan="11">결재상 정보가 없습니다.</td></tr>';
					}
					$("#tby1").html(html);

					var p = json.paginationInfo;
		        	var pageView = Paging(p.totalRecordCount,10,10,
		        			p.currentPageNo ,'list' ,1);
		        	$("#page1").empty().html(pageView);
				},
				error : function(e) {
					alert("서버와 통신 오류입니다.");
				}
			});
		}
		//코드 저장
		function save() {
			var param = $("#regForm").serialize(); //ajax로 넘길 data

			$.ajax({
				type : "POST",
				url : "/code/update_code.do",
				data : param,
				dataType : "json",
				success : function(json) {
					if(json.success=="yes"){
					var html = '';
					$.each(json.list, function(i, d) {

						var num = 0;
						num = (json.totalPageCnt - d.rnum) + 1;
						html += '<tr onclick="javascript:viewInfo('+ d.comSer +');">';
						html += '<td>' + num +'</td>';
						html += '<td>' + d.comGrp +'</td>';
						html += '<td>' + d.comGrpNm +'</td>';
						html += '<td>' + d.comCd + '</td>';
						html += '<td>' + d.comNm + '</td>';
						html += '<td>' + d.cntn + '</td>';
						html += '<td>' + d.odr + '</td>';
						html += '<td>' + d.useYn + '</td>';
						html += '<td>' + d.dbInsTm + '</td>';
						html += '</tr>';
					});
					$("#tby1").html(html);


		        	var p = json.paginationInfo;
		        	var pageView = Paging(p.totalRecordCount,10,10,
		        			p.currentPageNo ,'list' ,1);
		        	$("#page1").empty().html(pageView);

						alert("저장되었습니다.");
							$(':text:not([id=searchflag])').val('');
							$('select').each(function() {
								$(this).find('option:first').attr('selected', 'true');
							});
							$("#comSer1").val(0);
							$("#comSer").val(0);
				    }else {
						alert("실패하였습니다.");
					}
				},
				error : function(e) {
					alert("서버와 통신 오류입니다.");
				}
			}); //end ajax
		}

		function viewInfo(comSer) {
			var param = {comSer : comSer};

			$.ajax({
				type : "POST",
				url : "/code/code_info.do",
				data : param,
				dataType : "json",
				success : function(json) {
					var data = json.codeInfo;
					$("#comSer").val(data.comSer);
					$("#comGrp").val(data.comGrp);
					$("#comGrpNm").val(data.comGrpNm);
					$("#comNm").val(data.comNm);
					$("#cntn").val(data.cntn);
					$("#useYn").val(data.useYn);
					$("#comCd").val(data.comCd);
					$("#comSer1").val(data.comSer);
					$("#dbInsTm").val(data.dbInsTm);
					$("#comCd").attr("readonly",true);
					$("#comGrp").attr("readonly",true);
				},
				error : function(e) {
					alert(e);
				}
			});
		}


	</script>