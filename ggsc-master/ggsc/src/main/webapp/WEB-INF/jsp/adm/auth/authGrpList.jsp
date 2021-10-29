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
		list1( <c:out value="${vo.curPage}" /> );
	} ) ;
	
	
	function new1(){
		$("#authGrpNo").val("");
		$("#saveFlag").val("Ins");
		$("#schForm").submit();
	}
	
	
	function dtl1(key1){
		$("#authGrpNo").val(key1);
		$("#saveFlag").val("Upd");
		$("#schForm").submit();
	}

	
	function list1(curPage) {
		
 		$("#fromIndex").val( ( curPage - 1 ) * <c:out value="${vo.pageRows}" /> );
 		$("#toIndex").val( curPage * <c:out value="${vo.pageRows}" /> );
		$("#curPage").val( curPage ) ;
	
		$.ajax({
			type : "POST",
			url : "/authGrpListAjax.do",
			data : $("#schForm").serialize(),
			dataType : "json",
			success : function(json) {
				
				var html = '' ;
				if( 0 == json.list.length ) {
					html = '<tr><td colspan="4" rowspan="' + json.vo.pageRows + '" >데이터가 없습니다.</td></tr>';
				} else {
					$.each(json.list, function(i, d) {
						html += '<tr onclick="dtl1(\''+ d.authGrpNo +'\');">';
						html += '<td>' + d.authGrpCd+ '</td>';
						html += '<td>' + d.authGrpNm + '</td>';
						html += '<td>' + d.cntn + '</td>';
						html += '<td>' + d.useYn + '</td>';
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


	<form name="schForm" id="schForm" action="/authGrpDtl.do" method="post" >

		<input type='hidden' id='saveFlag' name='saveFlag' value='${vo.saveFlag}'/>
		<input type='hidden' id='schFrom' name='schFrom' value='${vo.schFrom}' />
		<input type='hidden' id='schTo' name='schTo' value='${vo.schTo}' />
		<input type='hidden' id='fromIndex' name='fromIndex' value='${vo.fromIndex}' />
		<input type='hidden' id='toIndex' name='toIndex' value='${vo.toIndex}' />
		<input type='hidden' id='curPage' name='curPage' value='${vo.curPage}' />
	
		<input type='hidden' id='authGrpNo' name='authGrpNo' value='${vo.authGrpNo}' />
		
		<input type="text" style='width:0px;height:0px;opacity:0;' readonly />

		<div class="search-box">
			<div class="search-group">
				<span class="label">
					<select id='schColm' name="schColm" >
						<option value="1">그룹권한코드</option>
	    				<option value="2">그룹권한명</option>
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
			<col width="25%"></col>
			<col width="25%"></col> 
			<col width="25%"></col>
			<col width="*"></col>
		</colgroup>
					
		<thead>
			<tr>
				<th scope="col">그룹권한코드</th>
				<th scope="col">그룹권한명</th>
				<th scope="col">설명</th>
				<th scope="col">사용여부</th>
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