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
		
		$("#manualNo").val( '<c:out value="${vo.manualNo}" />' );
		
		if( 'Ins' == '${vo.saveFlag}' ) {
			
		} else {
			$.ajax({
				type : "POST",
				url : "/manualDtlAjax.do",
				data : $("#inputForm").serialize(),
				dataType : "json",
				success : function(json) {
					$.each(json.list, function(i, d) {
						$('#manualNo').val(d.manualNo) ;
						$('#subject').val(d.subject) ;
						$('#regId').html(d.regId) ;
						$('#cntn').val(d.cntn) ;
						$('#filePath').html( '<a style="color:#f00;" href="/download3.do?oriFileNm=' + d.oriFileNm + '&filePath=' + d.filePath + '" >' + d.oriFileNm + '</a>' ) ;
					
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
			document.inputForm.action = "/manual" + $("#saveFlag").val() + ".do";
	       	document.inputForm.submit();
		} 
	}

	
	function save() {
		
		if ( true == confirm("저장하시겠습니까?") ) {
			document.inputForm.action = "/manual" + $("#saveFlag").val() + ".do";
	       	document.inputForm.submit();
		}
	}
	

</script>
</head>



<body>


<section id="content" >


<h2 class="h2-title"><i class="fa fa-check-square"></i>상세</h2>
	

<div class="box-style1 x-scroll-auto" >

<form name="inputForm" id="inputForm" method="post" action='/manualIns.do' enctype="multipart/form-data" >

	<input type='hidden' id='saveFlag' name='saveFlag' value='${vo.saveFlag}'/>
	<input type='hidden' id='schColm' name='schColm' value='${vo.schColm}' />
	<input type='hidden' id='schStr' name='schStr' value='${vo.schStr}' />
	<input type='hidden' id='schFrom' name='schFrom' value='${vo.schFrom}' />
	<input type='hidden' id='schTo' name='schTo' value='${vo.schTo}' />
	<input type='hidden' id='fromIndex' name='fromIndex' value='${vo.fromIndex}' />
	<input type='hidden' id='toIndex' name='toIndex' value='${vo.toIndex}' />
	<input type='hidden' id='curPage' name='curPage' value='${vo.curPage}' />

	<input type='hidden' id='manualNo' name='manualNo' value='${vo.manualNo}' />
	
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
				<td>제목</td>
				<td colspan='5'><input type='text' id='subject' name='subject' /></td>
				<td>등록자</td>
				<td><span id='regId' ></span></td>
			</tr>
			
			<tr>
				<td>내용</td>
				<td colspan='7'><textarea id='cntn' name='cntn' ></textarea></td>
			</tr>
			
			<tr>
				<td>첨부</td>
				<td colspan='3'><input type="file" name="file1" id="file1" /></td>
				<td colspan='4'><span id='filePath'></span></td>
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