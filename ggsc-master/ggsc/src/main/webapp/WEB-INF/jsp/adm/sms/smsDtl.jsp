<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html><html><head>

<link href="/css/style.css" rel="stylesheet" />
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"  />

<script src="/js/jquery-1.11.2.min.js" type="text/javascript" ></script>
<script src="/js/util/paging.js" type="text/javascript" ></script>

<script type="text/javascript">

	$(document).ready(function() {
		initInput();
	} ) ;
	
	
	function inputFormReset(){ $("#inputForm")[0].reset(); }
	
	
	function initInput(){
		
		$("#smsNo").val( '<c:out value="${vo.smsNo}" />' );
		
		if( 'Ins' == '${vo.saveFlag}' ) {
			
		} else {
			$.ajax({
				type : "POST",
				url : "/smsDtlAjax.do",
				data : $("#inputForm").serialize(),
				dataType : "json",
				success : function(json) {
					$.each(json.list, function(i, d) {
						$('#smsNo').val(d.smsNo) ;
						$('#subject').val(d.subject) ;
						$('#cntn').val(d.cntn) ;
						$('#sendList').val(d.sendList) ;
						$('#sendDt').val(d.sendDt) ;
						$('#sendResult').html(d.sendResult) ;
						$('#regId').html(d.regId) ;
					
						$('#delBtn').show();
					});
				},
				error : function(e) { alert("오류가 발생했습니다."); 	}
			});
		}
	}

	
	function del() {
		
		if( true == confirm("삭제하시겠습니까?") ) { 
			$("#saveFlag").val("Del");
			document.inputForm.action = "/sms" + $("#saveFlag").val() + ".do";
	       	document.inputForm.submit();
		} 
	}

	
	function save() {
		
		if ( true == confirm("저장하시겠습니까?") ) {
			document.inputForm.action = "/sms" + $("#saveFlag").val() + ".do";
	       	document.inputForm.submit();
		}
	}
	

</script>
</head>



<body>


<section id="content" >


<h2 class="h2-title"><i class="fa fa-check-square"></i>상세</h2>
	

<div class="box-style1 x-scroll-auto" >

<form name="inputForm" id="inputForm" method="post" action='' >

	<input type='hidden' id='saveFlag' name='saveFlag' value='${vo.saveFlag}'/>
	<input type='hidden' id='schColm' name='schColm' value='${vo.schColm}' />
	<input type='hidden' id='schStr' name='schStr' value='${vo.schStr}' />
	<input type='hidden' id='schFrom' name='schFrom' value='${vo.schFrom}' />
	<input type='hidden' id='schTo' name='schTo' value='${vo.schTo}' />
	<input type='hidden' id='fromIndex' name='fromIndex' value='${vo.fromIndex}' />
	<input type='hidden' id='toIndex' name='toIndex' value='${vo.toIndex}' />
	<input type='hidden' id='curPage' name='curPage' value='${vo.curPage}' />

	<input type='hidden' id='smsNo' name='smsNo' value='${vo.smsNo}' />
	
	<table class="table-style1" style="margin-bottom: 5px;">
	
	
		<colgroup> 
			<col width="8%"></col>
			<col width="17%"></col> 
			<col width="8%"></col>
			<col width="17%"></col> 
			<col width="8%"></col>
			<col width="17%"></col> 
			<col width="8%"></col>
			<col width="17%"></col> 
		</colgroup>
					
		<thead>
			<tr>
				<th scope="col"></th>
				<th scope="col"></th>
				<th scope="col"></th>
				<th scope="col"></th>
				<th scope="col"></th> 
				<th scope="col"></th>
				<th scope="col"></th> 
				<th scope="col"></th>
			</tr>
		</thead>
		
		<tbody>
		
			<tr>
				<td>발송예약일시</td>
				<td colspan='3'><input type='text' id='sendDt' name='sendDt' /></td>
				<td>발송상태</td>
				<td><span id='sendResult' ></span></td>
				<td>등록자</td>
				<td><span id='regId' ></span></td>
			</tr>
			
			<tr>
				<td>발송이유</td>
				<td colspan='7'><input type='text' id='subject' name='subject' /></td>
			</tr>
			
			<tr>
				<td>발송전화번호<br>목록</td>
				<td colspan='7'><textarea id='sendList' name='sendList' ></textarea><br>* 전화번호와 콤마(,)만 입력가능</td>
			</tr>
			
			<tr>
				<td>내용</td>
				<td colspan='7'><textarea id='cntn' name='cntn' ></textarea></td>
			</tr>
			
			<tr>
				<td colspan='8' style='text-align:right;' >
					<button type="button" class="btn-basic" onClick="save();" style="background-color:#fc692f;color:white;">저장</button>
					<button id='delBtn' type="button" class="btn-basic" onClick="del();" style="background-color:#fc692f;color:white;display:none;">삭제</button>
				</td>
			</tr>

		</tbody>   

	</table>
</form>

</div>


</section>


</body></html>