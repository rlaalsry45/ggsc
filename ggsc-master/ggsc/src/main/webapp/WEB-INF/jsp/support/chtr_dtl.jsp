<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>     
<% pageContext.setAttribute("newLineChar", "\n"); %>

<link href="/gnoincoundb/css/style.css" rel="stylesheet">
<script src="/gnoincoundb/editor/js/bootstrap_3.3.5.js"></script>
<link rel="stylesheet" href="/gnoincoundb/editor/css/bootstrap_3.3.5.css">
<title>글쓰기</title>

<script type="text/javascript">

	$(document).ready(function() {
		$("#btn_contactUpload").click(function(e){
			$("#contactFile").click();
		});
		
		$("#contactFile").change(function(e){
			console.log($(this).val());
			if($(this).val().length > 0 ){
				var obj = $(this)[0];
				if(obj.files){
					var file = obj.files[0];
					fn_contact_upload(file);
					$(this).val('');
				}
			}
		});
	});
	
	function fn_reg(){
		
		var frm = document.frm;

		var t = {
				date : frm.appdate.value.substr(0,10),
				time : frm.appdate.value.substr(11,5)
		}
		
		if(frm.appdate.value.length < 0 ){
			alert('[발신일시]를 입력해주세요.');
			frm.appdate.focus();
			return false;
		}else if(frm.appdate.value.length != 16){
			alert('[발신일시]를 정확히 입력해주세요.');
			frm.appdate.focus();
			return false;
		}else if(!isValidDate(t.date)){
			alert('[발신일시] 날짜 형식이 맞지 않습니다.');
			frm.appdate.focus();
			return false;
		}else if(!isValidTime(t.time)){
			alert('[발신일지] 시간 형식이 맞지 않습니다.')
			frm.appdate.focus();
			return false;
		}else if(frm.callback.value.length < 1){
			alert('[발신자]를 선택해주세요.');
			frm.callback.focus();
			return false;
		}else if(frm.subject.value.length < 1){
			alert('[제목]을 입력해주세요.');
			frm.subject.focus();
			return false;
		}else if(frm.msg.value.length < 1){
			alert('[내용]을 입력해주세요.');
			frm.msg.focus();
			return false;
		}else if(frm.phone.value.length < 1){
			alert('[수신자]를 입력해주세요.');
			frm.msg.focus();
			return false;
		}
		
		frm.phone.value = frm.phone.value.replace(/ /g,'');
		
		while(frm.phone.value.substr(frm.phone.value.length-1,1) == ','){
			frm.phone.value = frm.phone.value.substr(0,frm.phone.value.length-1);
		}
		
		
		if(confirm(frm.phone.value.split(',').length + '명에게 발송하시겠습니까?')){
			frm.sendCount.value = frm.phone.value.split(',').length;
			$("#num").val(0);
			
			var token = $("meta[name='_csrf']").attr("th:content");
			var header = $("meta[name='_csrf_header']").attr("th:content");
			
			$.ajax({
				url : "/gnoincoundb/chtrReg.do",
				data : $("#frm").serialize(),
				type : "post",
				dataType : "json",
				beforeSend : function(xhr){
					xhr.setRequestHeader(header, token);
				}
			}).done(function(e){
				if(e.result){
					alert('발송에 성공하였습니다.');
					location.href = "/chtrList.do?mnuCd=${mnuCd}";
				}else{
					alert(e.resultMessage);
				}
			}).fail(function(e){
				alert('서버 오류로 문자 발송에 실패하였습니다.');
			});
			//document.frm.action = "/chtrReg.do";
	       	//document.frm.submit();
		}
	}  	
	
	
	function fn_list(){
		document.location.href = "/gnoincoundb/chtrList.do?mnuCd=${mnuCd}";
	}
	
	function fn_contact_upload(file){
		var token = $("meta[name='_csrf']").attr("th:content");
		var header = $("meta[name='_csrf_header']").attr("th:content");
		
		data = new FormData();
        data.append("file", file);
        $.ajax({
            data : data,
            type : "POST",
            url : "/gnoincoundb/contactUpload.do",
            enctype : "multipart/form-data",
            contentType : false,
            processData : false,
            beforeSend : function(xhr){
		           xhr.setRequestHeader(header, token);
		    }
        }).done(function(e){
        	document.frm.phone.value += e.numbers;
        }).fail(function(e){
        	alert('서버 오류로 불러오기에 실패하였습니다.');
        });
	}
	
</script>

<section id="content">
	<h2 class="h2-title"><i class="fa fa-check-square"></i>
		문자발송관리
	</h2>
	<form id="frm" name="frm" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<input type="hidden" id="mnuCd" name="mnuCd" value="${mnuCd }" />
		<input type="hidden" id="num" name="num" value="${detail.num }" />
		<input type='hidden' name='sendCount' />
		<table class="table-write" >
			<colgroup>
				<col width="15%" />
				<col width="35%" />		
				<col width="15%" />		
				<col width="35%" />		
			</colgroup>
			<tr>
				<th>발신일시</th>
				<td>
					<jsp:useBean id="currTime" class="java.util.Date" />
					<fmt:formatDate value="${currTime}" var="currTime" pattern="yyyy-MM-dd HH:mm"/>
					<c:choose>
						<c:when test="${detail != null}"><span data-pattern='datetime'>${detail.appdate}</span></c:when>
						<c:otherwise><input type='text' name='appdate' value='${currTime}'  maxlength=16 /></c:otherwise>
					</c:choose>
				 </td>
				<th>발신자</th>
				<td>
					<c:choose>
						<c:when test="${detail != null}">${detail.adminname}</c:when>
						<c:otherwise>${loginVo.userNm }</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<Th>발신번호</Th>
				<td>
					<c:choose>
						<c:when test="${detail != null}"><span data-pattern='mobile'>${detail.callback}</span></c:when>
						<c:otherwise>
							<select id="callback" name="callback">
								<option value=''>선택하세요</option>
								<c:forEach items="${senderList}" var="list">
									<option value="${list.mclassNm }" >${list.mclassNm }</option>
								</c:forEach>
							</select>
						</c:otherwise>
					</c:choose>
					
				
				</td>
				<th></th>
				<td></td>
			</tr>
			<tr>
				<th>제목</th>
				<td colspan="3">
					<c:choose>
						<c:when test="${detail != null}">${detail.subject}</c:when>
						<c:otherwise><input type="text" name='subject' maxlegnth=15 /></c:otherwise>
					</c:choose>
				</td>
			</tr>
		
			<tr>
				<th>내용</th>
				<td colspan="3" style="text-align: left;">
					<c:choose>
						<c:when test="${detail != null}">${fn:replace(detail.msg,newLineChar, "<br/>")}</c:when>
						<c:otherwise><textarea id="msg" name="msg" name="msg" cols="100" rows="20" ></textarea></c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<th>수신자</th>
				<td colspan=3>
					<c:choose>
						<c:when test="${detail != null}">
							<c:set var="phones" value="${fn:split(detail.phone,'|')}" />
							<c:forEach var="phone" items="${phones}" varStatus="g">
							     <span data-pattern='mobile'>${phone}</span><br />
							</c:forEach> 
						</c:when>
						<c:otherwise><input type='text' class='form-control' name='phone' /></c:otherwise>
					</c:choose>
				</td>
			</tr>
			<c:choose>
				<c:when test="${detail != null}">
					<tr>
						<th>발송 상태</th>
						<td>${detail.result}</td>
						<th>발송 코드</th>
						<td>${detail.resultmessage}</td>
					</tr>
				</c:when>
				<c:otherwise>
					<tr>
						<th>기능</th>
						<td colspan=3>
							<button type='button' class='btn-basic btn-primary' id='btn_contactUpload'>엑셀 파일 불러오기</button>
							<button type='button' class='btn-basic' onClick='window.open("/gnoincoundb/contactSample.do","","")'>샘플 다운로드</button>
						</td>
					</tr>
					<tr>
						<td colspan=4 style='text-indent:10px; color:red; font-size:.8em;'>* 발신 번호 추가/삭제는 뿌리오에 등록 후 분류관리 -> 대분류명 발신번호 에서 추가/삭제 후 이용해주세요.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</table>
	</form>
	<div class="btn" style="text-align: right; display: block;">
		<c:if test="${detail==null}">
			<button type="button" class="btn-basic" id="saveBtn" onClick="javascript:fn_reg();" style="background-color:green;color:white;">발송</button>
		</c:if>
		<button type="button" class="btn-basic" onClick="javascript:fn_list();" style="background-color:#fc692f;color:white;">목록</button>
	</div>
	<input type='file' id='contactFile' style='display:none' />
</section>
</html>