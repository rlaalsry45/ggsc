<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--[if lte IE 8]><script src="/js/excanvas.js"></script><![endif]-->

<script type="text/javascript">
	$(document).ready(function() {
		var userNm = "${detail.userNm}";
		var loginId = "${loginVo.userId}";
		var userId = "${detail.userId}";
	});

	function fn_reg(save) {
		var token = $("meta[name='_csrf']").attr("th:content");
		var header = $("meta[name='_csrf_header']").attr("th:content");
		var img = canvas.toDataURL("image/jpeg");

		$.ajax({
			url : "/gnoincoundb/signUpload.do",
			type : "post",
			data : {
				imageData : img,
				bFileNm : document.frm.filePath.value
			},
			beforeSend : function(xhr) {
				xhr.setRequestHeader(header, token);
			}
		}).done(function(e) {
			document.frm.filePath.value = e.fileNm;

			if (document.frm.num.value.length == 0) {
				if (confirm("등록 하시겠습니까?")) {
					$("#num").val(0);
					$("#save").val("S");
					document.frm.action = "/gnoincoundb/signReg.do";
					document.frm.submit();
				}
			} else if (document.frm.num.value.length > 0) {
				if (confirm("수정 하시겠습니까?")) {
					$("#save").val("U");
					document.frm.action = "/gnoincoundb/signReg.do";
					document.frm.submit();
				}
			}

		}).fail(function(e) {
			alert('서버 오류가 발생하였습니다.');
		});
		/* var writer = $("#nWriter").val().replace(/ /gi, "");
		var title = $("#nTitle").val().replace(/ /gi, "");
		var cntn = $("#cntn").val().replace(/ /gi, "");
		
		if(writer.length == 0){
			alert("작성자를 입력해 주세요.");
			$("#nWriter").focus();
			return;
		}
		if(title.length == 0){
			alert("제목을 입력해 주세요.");
			$("#nTitle").focus();
			return;
		}
		if(cntn.length == 0){
			alert("내용을 입력해 주세요.");
			$("#cntn").focus();
			return;
		} */

		/*var sign = $("#signature").jSignature("getData");
		$("#filePath").val(sign);
		 */

	}
	function fn_list() {
		document.location.href = "/gnoincoundb/signList.do?&mnuCd=${mnuCd}";
	}
	function fn_change() {
		$("#changeBtn").css("display", "none");
		$("#signature").css("display", "inline-block");
		$("#img").css("display", "none");
		$("#updateBtn").css("display", "inline-block");
	}
	
	function deleteSign(){
		if (confirm("정말 서명을 삭제하시겠습니까?")) {
			document.frm.filePath.value = '';
			$("#save").val("U");
			document.frm.action = "/gnoincoundb/signReg.do";
			document.frm.submit();
		}
	}
</script>

<section id="content">
	<h2 class="h2-title">
		<i class="fa fa-check-square"></i>
		<c:if test="${empty detail.num }">서명관리 - 등록</c:if>
		<c:if test="${!empty detail.num }">서명관리 - 상세 및 수정</c:if>
	</h2>
	<form id="frm" name="frm" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
		<input type="hidden" id="mnuCd" name="mnuCd" value="${mnuCd }" /> 
		<input type="hidden" id="num" name="num" value="${detail.num }" /> 
		<input type="hidden" id="filePath" name="filePath" value="${detail.filePath}" /> 
		<input type="hidden" id="save" name="save" />
		<table class="table-write">
			<colgroup>
				<col width="20%" />
				<col width="*" />
			</colgroup>
			<tr>
				<th>기관명</th>
				<td>${detail.centerNm }</td>
			</tr>
			<tr>
				<th>성명</th>
				<td><c:if test="${empty detail.num }">${loginVo.userNm }</c:if>
					<c:if test="${!empty detail.num }">${detail.userNm }</c:if></td>
			</tr>
			<tr>
				<th>서명</th>
				<td>
					<c:choose>
					<c:when test="${empty detail.filePath}">
						<canvas id="canvas" width=500 height=250
						style='border: 1px solid #777;'></canvas>
						<button type='button' class='btn btn-danger'
							style='padding: 5px 20px; vertical-align: top;'
							onClick='canvasClear()'>초기화</button>
						</c:when>
					<c:when test="${!empty detail.filePath}">
						<img src="/getImage.do?fileNm=${detail.filePath}" alt="서명"/>
						<c:if test="${detail.userId == loginVo.userId}">
							<button type='button' class='btn btn-danger'
								style='padding: 5px 20px; vertical-align: top;'
								onClick="deleteSign()">삭제</button>
						</c:if>
					</c:when>
					</c:choose>
					
				</td>
			</tr>
		</table>
	</form>
	<div class="btn" style="text-align: right; display: block;">
		<c:if test="${ vo.authCd <= 4 && userId == detail.regId || vo.authCd eq 1 }">
			<button type="button" class="btn-basic" id="updateBtn" onClick="javascript:fn_reg();" style="background-color: green; color: white;">저장</button>
		</c:if>
		<button type="button" class="btn-basic" onClick="javascript:fn_list();" style="background-color: #fc692f; color: white;">목록</button>
	</div>
</section>
<script>
	if(document.getElementById("canvas")){
		var iX, iY;
		var bDraw = false;
	
		var canvas = document.getElementById("canvas");
		var ctx = canvas.getContext("2d");
		var bb = canvas.getBoundingClientRect();
		ctx.strokeStyle = "#000000";
		ctx.lineJoin = "round";
		ctx.lineWidth = 2;
	
		ctx.fillStyle = "rgb(255,255,255)";
		ctx.fillRect(0, 0, canvas.width, canvas.height);
	
		$(canvas).mousedown(function(e) {
			iX = e.clientX - bb.left;
			iY = e.clientY - bb.top;
			bDraw = true;
		});
	
		$(canvas).mousemove(function(e) {
			if (bDraw) {
				var iNewX = e.clientX - bb.left;
				var iNewY = e.clientY - bb.top;
	
				ctx.beginPath();
				ctx.moveTo(iX, iY);
				ctx.lineTo(iNewX, iNewY);
				ctx.closePath();
				ctx.stroke();
	
				iX = iNewX;
				iY = iNewY;
			}
		});
	
		$(canvas).mouseup(function(e) {
			bDraw = false;
		});
	
		function canvasClear() {
			ctx.clearRect(0, 0, canvas.width, canvas.height);
			ctx.fillStyle = "rgb(255,255,255)";
			ctx.fillRect(0, 0, canvas.width, canvas.height);
			ctx.beginPath();
	
		}
	}
</script>
</html>