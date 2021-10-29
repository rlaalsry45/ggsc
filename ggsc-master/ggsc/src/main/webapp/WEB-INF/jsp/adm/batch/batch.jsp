<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

	<!-- content -->
	<section id="content">
		<h2 class="h2-title"><i class="fa fa-check-square"></i>배치작업</h2>
		<div class="btn-box-top">
			<button type="button" class="btn-basic btn-point2" id="ycProcBtn"><i class="fa fa-repeat"></i>1년미만 적용하기</button>
			<button type="button" class="btn-basic btn-point2" id="hanseEventBtn"><i class="fa fa-repeat"></i>지문정보 적용하기</button>
			<button type="button" class="btn-basic btn-point2" id="ovProcBtn"><i class="fa fa-repeat"></i>초과정보 적용하기</button>
			<button type="button" class="btn-basic btn-point2" id="hwJmProcBtn"><i class="fa fa-repeat"></i>휴일근무정보 적용하기</button>
			<button type="button" class="btn-basic btn-point2" id="organProcBtn"><i class="fa fa-repeat"></i>조직도정보 적용하기</button>
		</div>
		<!-- 검색영역 -->
		<form name="searchForm" id="searchForm" method="post">
		<input type="hidden" name="currentPageNo" id="currentPageNo" value="0">
		<input type="hidden" name="excelName" value="parts_list">
		<div class="search-box">
			<div class="search-group" id="userSelectSpan">
				<span class="label"><label>대상자</label></span>
				<span class="form wd500">
					<span id="batchSchUserIdSpan" style="display:inline-block; width:250px; height:24px; background-color:#fff;" >
						선택된 사원이 없습니다.
					</span>
					<button type="button" class="btn-small h26" href="#org_place" onclick="showHide('org_place');return false;"><i class="fa fa-plus-circle"></i>사원선택</button>
					<label class="mL15px"><input type="checkbox" id="hwPre" /><span>휴일정보 미리적용하기</span></label>
				</span>
			</div>
			<div class="search-group">
				<span class="label"><label>기간</label></span>
				<span class="form">
					<input type="text" id="datepicker1" name="schStartDt" class="input-datepicker1"> ~
					<input type="text" id="datepicker2" name="schEndDt" class="input-datepicker2">
				</span>
			</div>
		</div>
		</form>
		<!-- //검색영역 -->
	</section>
	<!-- //content -->
	<script src="/js/util/paging.js"></script>
	<script type="text/javascript">
	$(document).ready(function() {
		$(".input-datepicker1" ).datepicker("option", "dateFormat", "yy.mm.dd" );
		$(".input-datepicker1").datepicker("setDate", new Date());
		$(".input-datepicker2" ).datepicker("option", "dateFormat", "yy.mm.dd" );
		$(".input-datepicker2").datepicker("setDate", new Date());

		$('#ycProcBtn').click(function(){
			ycProc();
		});

		$('#hanseEventBtn').click(function(){
			hanseEvent();
		});

		$('#ovProcBtn').click(function(){
			ovProc();
		});

		$('#hwJmProcBtn').click(function(){
			hwJmProc();
		});

		$('#organProcBtn').click(function(){
			organProc();
		});
	});

	function ycProc(){
		if(!confirm('적용하시겠습니까?')) return false;
		var param = $("#searchForm").serialize(); //ajax로 넘길 data
		$.ajax({
			type : "POST",
			url : "/adm/batch_mng_yc_proc_ajax.do",
			data : param,
			dataType : "json",
			success : function(json) {
				if(json.result == 'SUCCESS'){
					alert("적용되었습니다.");
				}
				else{
					alert("배치작업에 실패 했습니다.");
				}
			},
			error : function(e) {
				alert("서버와 통신 오류입니다.");
				screenBlock(false);
			},
			beforeSend: function(){
				screenBlock(true);
			},
			complete: function(){
				screenBlock(false);
			}
		});
	}

	function hanseEvent(){
		if(!confirm('적용하시겠습니까?')) return false;
		var param = $("#searchForm").serialize(); //ajax로 넘길 data
		$.ajax({
			type : "POST",
			url : "/adm/batch_mng_hanse_event_ajax.do",
			data : param,
			dataType : "json",
			success : function(json) {
				if(json.result == 'SUCCESS'){
					alert("적용되었습니다.");
				}
				else{
					alert("배치작업에 실패 했습니다.");
				}
			},
			error : function(e) {
				alert("서버와 통신 오류입니다.");
				screenBlock(false);
			},
			beforeSend: function(){
				screenBlock(true);
			},
			complete: function(){
				screenBlock(false);
			}
		});
	}

	function ovProc(){
		if(!confirm('적용하시겠습니까?')) return false;
		var param = $("#searchForm").serialize(); //ajax로 넘길 data
		$.ajax({
			type : "POST",
			url : "/adm/batch_mng_ov_ajax.do",
			data : param,
			dataType : "json",
			success : function(json) {
				if(json.result == 'SUCCESS'){
					alert("적용되었습니다.");
				}
				else{
					alert("배치작업에 실패 했습니다.");
				}
			},
			error : function(e) {
				alert("서버와 통신 오류입니다.");
				screenBlock(false);
			},
			beforeSend: function(){
				screenBlock(true);
			},
			complete: function(){
				screenBlock(false);
			}
		});
	}

	function hwJmProc(){
		if(!confirm('적용하시겠습니까?')) return false;
		var param = $("#searchForm").serialize(); //ajax로 넘길 data
		if($('#hwPre').prop("checked")){
			param += '&gubun=hwPre';
		}
		$.ajax({
			type : "POST",
			url : "/adm/batch_mng_hw_jm_proc_ajax.do",
			data : param,
			dataType : "json",
			success : function(json) {
				if(json.result == 'SUCCESS'){
					alert("적용되었습니다.");
				}
				else{
					alert("배치작업에 실패 했습니다.");
				}
			},
			error : function(e) {
				alert("서버와 통신 오류입니다.");
				screenBlock(false);
			},
			beforeSend: function(){
				screenBlock(true);
			},
			complete: function(){
				screenBlock(false);
			}
		});
	}

	function organProc(){
		if(!confirm('적용하시겠습니까?')) return false;
		var param = $("#searchForm").serialize(); //ajax로 넘길 data
		$.ajax({
			type : "POST",
			url : "/adm/batch_mng_organ_proc_ajax.do",
			data : param,
			dataType : "json",
			success : function(json) {
				if(json.result == 'SUCCESS'){
					alert("적용되었습니다.");
				}
				else{
					alert("배치작업에 실패 했습니다.");
				}
			},
			error : function(e) {
				alert("서버와 통신 오류입니다.");
				screenBlock(false);
			},
			beforeSend: function(){
				screenBlock(true);
			},
			complete: function(){
				screenBlock(false);
			}
		});
	}

	//사원 선택완료 버튼 이벤트
  	function userSelectSuccess(){
  		var keyRightObjs  = $('input[name=selUser]');	//사원선택 팝업 선택된 사용자
  		var html = "";
  		if (keyRightObjs.length == 0) {
        	alert("선택된 사용자가 없습니다.");
        	return false;
      	}
	    if (keyRightObjs.length > 1) {
        	alert("1명만 선택할 수 있습니다.");
        	return false;
      	}
	    var spanSchObj = $("#batchSchUserIdSpan");
	    spanSchObj.empty();												//대상자 초기화
	    //선택완료 된 사용자 ROW 추가
	    var userId = $(keyRightObjs).val();
  		$('#schUserNameInput').val($("#selUserName_"+ userId).text()+'('+$("#selJicwiName_"+ userId).text()+')');
	    html += addUserHtml("regForm", $("#selUserName_"+ userId).text(), $("#selJicwiName_"+ userId).text(), $("#selDeptName_"+ userId).text(), userId);
	    spanSchObj.html(html);
  		showHide('org_place');
  	}

  	//대상자 추가 HTML
	function addUserHtml(formId, userName, jicwiName, deptName, userId){
		var html = "";
		var text = userName + " " + jicwiName + " " + deptName;
    	html += '<button type="button" class="Del" alt="삭제" onclick="delFinalSelUser()"><i class="fa fa-trash-o"></i></button>' + text + '<strong id="yearVacation"></strong>';
    	html += '<input type="hidden" name="schUserId" id="userIdArr_' + userId + '" value="' + userId + '"/>';
    	html += '<input type="hidden" name="schUserName" id="userNameArr_' + userId + '" value="' + $("#selUserName_"+ userId).text() + '"/>';
    	html += '<input type="hidden" name="schDeptName" id="deptNameArr_' + userId + '" value="' + $("#selDeptName_"+ userId).text() + '"/>';
    	html += '<input type="hidden" name="schJicwiName" id="jicwiNameArr_' + userId + '" value="' + $("#selJicwiName_"+ userId).text() + '"/>';
		return html;
	}

	//대상자 삭제 이벤트
  	function delFinalSelUser(){
  		$("#batchSchUserIdSpan").empty();
  		$('#batchSchUserIdSpan').text("선택된 사원이 없습니다.");
  	}
	</script>