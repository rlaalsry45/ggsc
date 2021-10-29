<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html><html><head>

<link href="/css/style.css" rel="stylesheet" />
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"  />

<script src="/js/jquery-1.11.2.min.js" type="text/javascript" ></script>
<script src="/js/util/paging.js" type="text/javascript" ></script>

<script type="text/javascript">

	$(document).ready(function() {
		$("#schColm").val("${vo.schColm}");
		$("#schStr").val("${vo.schStr}");
		if( "save" == "${beforeProcess}" ) { alert("저장되었습니다."); }
		else if( "del" == "${beforeProcess}" ) { alert("삭제되었습니다."); }
		list1( <c:out value="${vo.curPage}" /> );
	} ) ;
	
	
	function new1(){
		$("#mailNo").val("");
		$("#saveFlag").val("Ins");
		$("#schForm").submit();
	}
	
	
	function dtl1(key1){
		$("#mailNo").val(key1);
		$("#saveFlag").val("Upd");
		$("#schForm").submit();
	}

	
	function list1(curPage) {
		
 		$("#fromIndex").val( ( curPage - 1 ) * <c:out value="${vo.pageRows}" /> );
 		$("#toIndex").val( curPage * <c:out value="${vo.pageRows}" /> );
		$("#curPage").val( curPage ) ;
	
		$.ajax({
			type : "POST",
			url : "/mailListAjax.do",
			data : $("#schForm").serialize(),
			dataType : "json",
			success : function(json) {
				
				var html = '' ;
				if( 0 == json.list.length ) {
					html = '<tr><td colspan="6" rowspan="' + json.vo.pageRows + '" >데이터가 없습니다.</td></tr>';
				} else {
					$.each(json.list, function(i, d) {
						html += '<tr onclick="dtl1(\''+ d.mailNo +'\');">';
						html += '<td>' + d.sendDt + '</td>';
						html += '<td>' + d.subject + '</td>';
						html += '<td>' + d.cntn + '</td>';
						if( 0 == d.filePath.length ) { 
							html += '<td></td>' ;
						} else {                                                                                                                           
							html += '<td><img src="/images/down.png" style="width:30px;height:30px;z-index:0;" onclick="event.stopPropagation();location.href=\'/download3.do?oriFileNm=' + d.oriFileNm + '&filePath=' + d.filePath + '\';" /></td>';
						} 
						html += '<td>' + d.sendList + '</td>';
						html += '<td>' + d.regId + '</td>';
						html += '</tr>';
					});
				}
				$("#listTbody").html( html ) ;

	        	$("#pageList").empty().html( Paging( json.vo.rowsCnt , json.vo.pageRows , json.vo.pageList , json.vo.curPage ,'list1' ) );
			},
			error : function(e) { alert("오류가 발생했습니다."); 	}
		});
	}
	
</script>
</head>



<body>


<section id="content" >


<h2 class="h2-title"><i class="fa fa-check-square"></i>목록</h2>
	

<div class="box-style1 x-scroll-auto" >


	<form name="schForm" id="schForm" action="/mailDtl.do" method="post" >

		<input type='hidden' id='saveFlag' name='saveFlag' value='${vo.saveFlag}'/>
		<input type='hidden' id='fromIndex' name='fromIndex' value='${vo.fromIndex}' />
		<input type='hidden' id='toIndex' name='toIndex' value='${vo.toIndex}' />
		<input type='hidden' id='curPage' name='curPage' value='${vo.curPage}' />
	
		<input type='hidden' id='mailNo' name='mailNo' value='${vo.mailNo}' />
		
		<input type="text" style='width:0px;height:0px;opacity:0;' readonly />

		<div class="search-box">
			<div class="search-group">
				<span class="label">
					기간
				</span>
				<span class="form" style='width:120px;' >
					<input type="text" name="schFrom" id="schFrom" value='${vo.schFrom}' >
				</span>
					~
				<span class="form" style='width:120px;' >
					<input type="text" name="schTo" id="schTo" value='${vo.schTo}' >
				</span>
				<span class="label">
					<select id='schColm' name="schColm" >
						<option value="1">제목</option>
						<option value="1">제목</option>
	  				</select>
				</span>
				<span class="form">
					<input type="text" name="schStr" id="schStr" onkeydown='javascript:if( 13 == event.keyCode ){ list1(1); }' >
				</span>
			</div>
			<div class="btn">
				<button type="button" class="btn-search" onclick='list1(1)' ><i class="fa fa-search"></i>검색</button>
			</div>
		</div>
	</form>
	
	
	<table class="table-style1" style="margin-bottom:5px;" >
	
		<colgroup> 
			<col width="10%"></col>
			<col width="20%"></col> 
			<col width="20%"></col>
			<col width="10%"></col>
			<col width="30%"></col>
			<col width="*"></col>
		</colgroup>
					
		<thead>
			<tr>
				<th scope="col">발송일시</th>
				<th scope="col">제목</th>
				<th scope="col">내용</th> 
				<th scope="col">첨부파일</th>
				<th scope="col">발송목록</th>
				<th scope="col">등록자</th>
			</tr>
		</thead>
		<tbody id="listTbody" ></tbody>

	</table>
	
	
	<div class="paginate" id="pageList"></div>
	
	<div style='text-align:right'><button type="button" class="btn-basic" onClick="new1();" style="background-color:#fc692f;color:white;">등록</button></div>
	

	<br><br>

	

</div>


</section>


</body></html>