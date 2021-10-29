<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html><html><head>

<link href="/css/style.css" rel="stylesheet" />
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"  />

<script src="/js/jquery-1.11.2.min.js" type="text/javascript" ></script>
<script src="/js/util/paging.js" type="text/javascript" ></script>
<script src="/editor/js/summernote_0.8.3.js"></script>
<script src="/editor/js/summernote_0.8.3.min.js"></script>
<script src="/editor/lang/summernote-ko-KR.js"></script>
<script src="/editor/js/bootstrap_3.3.5.js"></script>
<link rel="stylesheet" href="/editor/css/summernote_0.8.3.css">
<link rel="stylesheet" href="/editor/css/bootstrap_3.3.5.css">

<script type="text/javascript">

	$(document).ready(function() {
		initInput();
	} ) ;
	
	
	function inputFormReset(){ $("#inputForm")[0].reset(); }
	
	
// 	function uploadImgFile(file, editor){
// 		data = new FormData();
//         data.append("file", file);
//         $.ajax({
//             data : data,
//             type : "POST",
//             url : "/uploadImgFile2.do",
//             enctype : "multipart/form-data",
//             contentType : false,
//             processData : false,
//             success : function(data) {
//                $(editor).summernote('insertImage', "/getImage.do?fileNm=" + data.url);
                //$("#imgPath").val(data.url);

//             }
//         });
// 	}
	
	function initInput(){
		
		$("#mailNo").val( '<c:out value="${vo.mailNo}" />' );
		
		$('#cntn').summernote({
		     minHeight: 400,
		     maxHeight: null,
		     focus: true, 
		     lang : 'ko-KR',
		     callbacks: { }
		});
		  
		if( 'Ins' == '${vo.saveFlag}' ) {
			$('#saveBtn').show();
		} else {
			$.ajax({
				type : "POST",
				url : "/mailDtlAjax.do",
				data : $("#inputForm").serialize(),
				dataType : "json",
				success : function(json) {
					$.each(json.list, function(i, d) {
						$('#mailNo').val(d.mailNo) ;
						$('#subject').val(d.subject) ;
						$('#filePath').html( '<a style="color:#f00;" href="/download3.do?oriFileNm=' + d.oriFileNm + '&filePath=' + d.filePath + '" >' + d.oriFileNm + '</a>' ) ;
						$('#sendList').val(d.sendList) ;
						$('#sendDt').html(d.sendDt) ;
// 						$('#sendResult').html(d.sendResult) ;
						$('#regId').html(d.regId) ;
// 						$('#delBtn').show();
						$('#cntn').summernote('code', d.cntn )
					});
				},
				error : function(e) { alert("오류가 발생했습니다."); 	}
			});
		}
	}

	
	function del() {
		
		if( true == confirm("삭제하시겠습니까?") ) { 
			$("#saveFlag").val("Del");
			document.inputForm.action = "/mail" + $("#saveFlag").val() + ".do";
	       	document.inputForm.submit();
		} 
	}

	
	function save() {
		
		if ( true == confirm("저장하시겠습니까?") ) {
			document.inputForm.action = "/mail" + $("#saveFlag").val() + ".do";
	       	document.inputForm.submit();
		}
	}
	

</script>
</head>



<body>


<section id="content" >


<h2 class="h2-title"><i class="fa fa-check-square"></i>상세</h2>
	

<div class="box-style1 x-scroll-auto" >

<form name="inputForm" id="inputForm" method="post" action='/mailIns.do' enctype="multipart/form-data" >

	<input type='hidden' id='saveFlag' name='saveFlag' value='${vo.saveFlag}'/>
	<input type='hidden' id='schColm' name='schColm' value='${vo.schColm}' />
	<input type='hidden' id='schStr' name='schStr' value='${vo.schStr}' />
	<input type='hidden' id='schFrom' name='schFrom' value='${vo.schFrom}' />
	<input type='hidden' id='schTo' name='schTo' value='${vo.schTo}' />
	<input type='hidden' id='fromIndex' name='fromIndex' value='${vo.fromIndex}' />
	<input type='hidden' id='toIndex' name='toIndex' value='${vo.toIndex}' />
	<input type='hidden' id='curPage' name='curPage' value='${vo.curPage}' />

	<input type='hidden' id='mailNo' name='mailNo' value='${vo.mailNo}' />
	
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
				<td colspan='3'><input type='text' id='subject' name='subject' /></td>
				<td>발송일시</td>
				<td><span id='sendDt' ></span></td>
				<td>발송자</td>
				<td><span id='regId' ></span></td>
			</tr>
			
			<tr>
				<td>내용</td>
				<td colspan='7'><textarea id='cntn' name='cntn' ></textarea></td>
			</tr>
			
			<tr>
				<td>첨부파일</td>
				<td colspan='3'><input type="file" name="file1" id="file1" /></td>
				<td colspan='4'><span id='filePath'></span></td>
			</tr>
			
			<tr>
				<td>발송목록</td>
				<td colspan='7'><textarea id='sendList' name='sendList' ></textarea><br />* 이메일주소와 콤마(,)만 입력가능</td>
			</tr>
			
			<tr>
				<td colspan='8' style='text-align:right;' >
					<button id='saveBtn' type="button" class="btn-basic" onClick="save();" style="background-color:#fc692f;color:white;display:none;">저장</button>
<!-- 					<button id='delBtn' type="button" class="btn-basic" onClick="del();" style="background-color:#fc692f;color:white;display:none;">삭제</button> -->
				</td>
			</tr>

		</tbody>   

	</table>
</form>

</div>


</section>


</body></html>