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
		mnuLvlCombo();
	} ) ;
	
	
	function mnuLvlCombo() {
		var mnuLvl = $("#mnuLvl option:selected").val();
		$("#mnuLvl2").val(mnuLvl);

		var param = {
			mnuLvl : mnuLvl - 1
		};

		$.ajax({
			type : "POST",
			url : "/hMnuListAjax.do",
			data : param,
			dataType : "json",
			success : function(json) {
				var html = '';
				if (json.hMnuList.length == 0) {
					html += "<option value='' selected='selected'></option>";
					$("#hMnuCd2").val("");
				} else {
					$.each(json.hMnuList, function(i, d) {
						html += "<option value='"+d.mnuCd+"'>" + d.mnuNm + "</option>";
						if( i == 1 ) $("#hMnuCd2").val(d.mnuCd);
					});
				}
				$("#hMnuCd").html(html);
			},
			error : function(e) { alert("오류가 발생했습니다."); 	}
		}); 
	}


	function inputFormReset(){ $("#inputForm")[0].reset(); }
	
	
	function initInput(){
		
		$("#mnuNo").val( '<c:out value="${vo.mnuNo}" />' );
		
		if( 'Ins' == '${vo.saveFlag}' ) {
			
		} else {
			$.ajax({
				type : "POST",
				url : "/mnuDtlAjax.do",
				data : $("#inputForm").serialize(),
				dataType : "json",
				success : function(json) {
					$.each(json.list, function(i, d) {
						$("#mnuNo").val(d.mnuNo);
						$("#mnuNm").val(d.mnuNm);
						$("#mnuCd").val(d.mnuCd);
						$("#mnuLvl").val(d.mnuLvl);
						$("#mnuLvl2").val(d.mnuLvl);
						$("#mnuPath").val(d.mnuPath);
						$("#cntn").val(d.cntn);
						$("#useYn").val(d.useYn);
						$("#hMnuCd").val(d.hMnuCd);
						$("#hMnuCd2").val(d.hMnuCd);
						$("#odr").val(d.odr);
						$("#authType").val(d.authType);
						$("#hMnuCd").val(d.hMnuCd);

						$('#mnuCd').attr("readonly",true);
						$('#delBtn').show();
					});
				},
				error : function(e) { alert("오류가 발생했습니다."); 	}
			});
		}
	}

	
	function del() {
		
		if( true == confirm("삭제하시겠습니까?") ) { 
			$.ajax({
				type : "POST",
				url : "/mnuDelAjax.do",
				data : $("#inputForm").serialize() ,
				dataType : "json",
				success : function(json) {
					alert('삭제되었습니다.');
					$('#inputForm').submit();
				},
				error : function(e) { alert("오류가 발생했습니다."); 	}
			});
		} 
	}

	
	function save() {
		
		if ( true == confirm("저장하시겠습니까?") ) {
			$.ajax({
				type : "POST",
				url : "/mnu" + $("#saveFlag").val() + "Ajax.do" ,
				data : $("#inputForm").serialize(),
				dataType : "json",
				success : function(json) {
					alert('저장되었습니다.');
					if( "Ins" == $("#saveFlag").val() ) {
						$('#schColm').val("1");
						$('#schStr').val("");
						$('#curPage').val("1");
						$('#inputForm').submit();
					} else if( "Upd" == $("#saveFlag").val() ) {
						$('#inputForm').submit();
					}
				},
				error : function(e) { alert("오류가 발생했습니다."); 	}
			});
		}
	}
	

	function setHMnuCd(key1) {
		$("#hMnuCd2").val( key1 );
	}
</script>
</head>



<body>


<section id="content" >


<h2 class="h2-title"><i class="fa fa-check-square"></i>상세</h2>
	

<div class="box-style1 x-scroll-auto" >

<form name="inputForm" id="inputForm" method="post" action='/mnuList.do'>

	<input type='hidden' id='saveFlag' name='saveFlag' value='${vo.saveFlag}'/>
	<input type='hidden' id='schColm' name='schColm' value='${vo.schColm}' />
	<input type='hidden' id='schStr' name='schStr' value='${vo.schStr}' />
	<input type='hidden' id='schFrom' name='schFrom' value='${vo.schFrom}' />
	<input type='hidden' id='schTo' name='schTo' value='${vo.schTo}' />
	<input type='hidden' id='fromIndex' name='fromIndex' value='${vo.fromIndex}' />
	<input type='hidden' id='toIndex' name='toIndex' value='${vo.toIndex}' />
	<input type='hidden' id='curPage' name='curPage' value='${vo.curPage}' />

	<input type='hidden' id='mnuNo' name='mnuNo' value='${vo.mnuNo}' />
	
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
				<td>메뉴명</td>
				<td><input type='text' id='mnuNm' name='mnuNm' /></td>
				<td colspan='2'></td>
				<td>메뉴코드</td>
				<td><input type='text' id='mnuCd' name='mnuCd'  /></td>
				<td colspan='2'></td>
			</tr>
			
			<tr>
				<td>메뉴 경로</td>
				<td colspan='3'><input type='text' id='mnuPath' name='mnuPath' /></td>
				<td>설명</td>
				<td colspan='3'><input type='text' id='cntn' name='cntn' /></td>
			</tr>
			
			<tr>
				<td>메뉴레벨</td>
				<td>
					<select id="mnuLvl" name="mnuLvl" onchange="mnuLvlCombo();">
							<option value="1">대메뉴</option>
							<option value="2">중메뉴</option>
							<option value="3">소메뉴</option>
					</select>
				</td>
				<td>메뉴레벨코드</td>
				<td><input type="text" name="mnuLvl2" id="mnuLvl2" title="메뉴레벨코드" value="1" readonly /></td>
				<td>상위메뉴명</td>
				<td>
					<select id="hMnuCd" name="hMnuCd" onchange="setHMnuCd(this.value);" >
						<c:forEach var="list" items="${list}" varStatus="status">
							<option value="${list.mnuCd}">${list.mnuNm}</option>
						</c:forEach>
					</select>
				</td>
				<td>상위메뉴코드</td>
				<td><input type="text" name="hMnuCd2" id="hMnuCd2" readonly /></td>
			</tr>
			
			<tr>
				<td>타입</td>
				<td>
					<select id="authType" name="authType" title="타입">
						<option value="M">메뉴</option>
						<option value="B">버튼</option>
					</select>
				</td>
				<td>정렬순서</td>
				<td><input type='text' id='odr' name='odr'  /></td>
				<td>사용여부</td>
				<td>
					<select id='useYn' name="useYn" >
						<option value="Y">Y</option>
						<option value="N">N</option>
					</select>
				</td>
				<td colspan='2' ></td>
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