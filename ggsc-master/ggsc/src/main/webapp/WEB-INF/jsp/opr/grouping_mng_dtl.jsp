<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.HrowColor { cursor:pointer}
.HrowColor.active { background-color:rgb(252, 230, 224)}
.MrowColor { cursor:pointer}
.MrowColor.active { background-color:rgb(252, 230, 224)}
</style>
<script type="text/javascript">

	$(document).ready(function() {
		
		listH("${schHclassNm}");
	});

	function fn_reg(no){
		
		if(no == 1) {
			var hclassNm = $("#hclassNm").val();
			addHClass(hclassNm);
		} else if(no == 2){
			var hclassCd = $("#hclassCd").val();
			var mclassNm = $("#mclassNm").val();
			addMClass(hclassCd,mclassNm);
		} else {
			var mclassCd = $("#mclassCd").val();
			var sclassNm = $("#sclassNm").val();
			addSClass(mclassCd,sclassNm);
		}
		
	}  	
	function fn_list(mnuCd){
		document.location.href = "/gnoincoundb/grouping_mng_list.do?mnuCd=" + mnuCd;
		/* document.location.href = "/counsellor_mngList.do?mnuCd=" + mnuCd; */
	}  	
	
	function fn_clear(cd) {
		if(cd == "h") {
			$("#hclassNm").val("");		
		} else if(cd == "m") {
			$("#mclassNm").val("");			
		} else if(cd == "s"){
			$("#sclassNm").val("");
		}
	}
	
	// 대분류 click 이벤트
	$(document).on('click','.HrowColor',function(){
		$(".HrowColor").removeClass("active");
		$(this).addClass('active');
		
		var cd = $(this).data('cd');
		var nm = $(this).data('nm');
		
		fn_regHTxt(cd,nm,0);
		
	});
	
	// 중분류 click 이벤트
	$(document).on('click','.MrowColor',function(){
		$(".MrowColor").removeClass("active");
		$(this).addClass('active');
		
		var cd = $(this).data('cd');
		var nm = $(this).data('nm');
		
		fn_regMTxt(cd,nm,0);
		
	});
	
	// 대분류 목록 리스트
	function listH(schHclassNm) {
		// var param = $("#searchForm").serialize(); //ajax로 넘길 data
		var param = {schHclassNm : schHclassNm};
		var token = $("meta[name='_csrf']").attr("th:content");
		var header = $("meta[name='_csrf_header']").attr("th:content");
		
		$.ajax({
			type : "POST",
			url : "/gnoincoundb/grouping_mng_dtl_ajax.do",
			data : param,
			dataType : "json",
			beforeSend : function(xhr){
				xhr.setRequestHeader(header, token);
			},
			success : function(json) {
				var html = '';
				var html2 = '';
				$.each(json.listH, function(i, d) {
					html += '<tr class="HrowColor" data-cd ='+d.hclassCd+' data-nm='+d.hclassNm+' >';
					html += '<td style="text-align: center;">' + d.hclassNm + '</td>';
					html += '<td style="text-align: center;">' + d.hclassCd + '</td>';
					html += '<td style="text-align: center;">' + d.odr + '</td>';
					html += '</tr>';
				});
				
				if (json.listH.length == 0) {
					html += '<tr><td colspan="3" style="text-align: center;">정보가 없습니다.</td></tr>';
				}
				$("#tby1").html(html);
				
				html2 += '<tr><td colspan="3" style="text-align: center;">정보가 없습니다.</td></tr>';
				$("#tby2").html(html2);
				$("#tby3").html(html2);

				/* var p = json.paginationInfo;
	        	var pageView = Paging(p.totalRecordCount,10,10,
	        			p.currentPageNo ,'list' ,1);
	        	$("#page1").empty().html(pageView); */
			},
			error : function(e) {
				alert("서버와 통신 오류입니다.");
			}
		});
	}
	
	// 중분류 리스트 목록
	function listM(hclassCd) {
		var param = {mclList : hclassCd};
		var token = $("meta[name='_csrf']").attr("th:content");
		var header = $("meta[name='_csrf_header']").attr("th:content");
		$.ajax({
			type : "POST",
			url : "/gnoincoundb/grouping_mng_dtl_ajax.do",
			data : param,
			dataType : "json",
			beforeSend : function(xhr){
				xhr.setRequestHeader(header, token);
			},
			success : function(json) {
				var html2 = '';
				$.each(json.listM, function(i, d) {	
					html2 += '<tr class="MrowColor" data-cd ='+d.mclassCd+' data-nm='+d.mclassNm+'>';
					html2 += '<td style="text-align: center;">' + d.mclassNm + '</td>';
					html2 += '<td style="text-align: center;">' + d.mclassCd + '</td>';
					html2 += '<td style="text-align: center;">' + d.odr + '</td>';
					html2 += '</tr>';
				});
				if (json.listM.length == 0) {
					html2 += '<tr><td colspan="3" style="text-align: center;">정보가 없습니다.</td></tr>';
				}
				$("#tby2").html(html2);
			},
			error : function(e) {
				alert("서버와 통신 오류입니다.");
			}
		});
	}
	
	// 소분류 리스트 목록
	function listS(mclassCd,hclassCd) {
		var param = {sclList : mclassCd, hclList : hclassCd};
		var token = $("meta[name='_csrf']").attr("th:content");
		var header = $("meta[name='_csrf_header']").attr("th:content");
		
		$.ajax({
			type : "POST",
			url : "/gnoincoundb/grouping_mng_dtl_ajax.do",
			beforeSend : function(xhr){
				xhr.setRequestHeader(header, token);
			},
			data : param,
			dataType : "json",
			success : function(json) {
				var html = '';
				$.each(json.listS, function(i, d) {	
				console.log(d.sclassNm);
					html += '<tr style="cursor:pointer;">';
					html += '<td style="text-align: center;">' + d.sclassNm + '</td>';
					html += '<td style="text-align: center;">' + d.sclassCd + '</td>';
					html += '<td style="text-align: center;">' + d.odr + '</td>';
					html += '</tr>';
				});
				if (json.listS.length == 0) {
					html += '<tr><td colspan="3" style="text-align: center;">정보가 없습니다.</td></tr>';
				}
				$("#tby3").html(html);
			},
			error : function(e) {
				alert("서버와 통신 오류입니다.");
			}
		});
	}
	
	// 대분류 등록 ajax
	function addHClass(hclassNm) {
		if(hclassNm.length <1){
			alert('[대분류명]을 입력해주세요.');
			return false;
		}
		var param = {addHclassNm : hclassNm};
		var token = $("meta[name='_csrf']").attr("th:content");
		var header = $("meta[name='_csrf_header']").attr("th:content");
		$.ajax({
			type : "POST",
			url : "/gnoincoundb/grouping_mng_dtl_ajax.do",
			data : param,
			dataType : "json",
			beforeSend : function(xhr){
				xhr.setRequestHeader(header, token);
			},
			success : function(json) {
				if(json.error){
					alert(json.error);
				}else{
					var mclassCd = "${mclassCd}";
					listH();
				}
			},
			error : function(e) {
				alert("서버와 통신 오류입니다.");
			}
		});
	}
	
	// 중분류 등록 ajax
	function addMClass(hclassCd,mclassNm) {
		if(mclassNm.length <1){
			alert('[중분류명]을 입력해주세요.');
			return false;
		}
		
		var param = {addHclassCd : hclassCd , addMclassNm : mclassNm};
		var token = $("meta[name='_csrf']").attr("th:content");
		var header = $("meta[name='_csrf_header']").attr("th:content");
		$.ajax({
			type : "POST",
			url : "/gnoincoundb/grouping_mng_dtl_ajax.do",
			data : param,
			dataType : "json",
			beforeSend : function(xhr){
				xhr.setRequestHeader(header, token);
			},
			success : function(json) {
				if(json.error){
					alert(json.error);
				}else{
					listM(hclassCd);
				}
			},
			error : function(e) {
				alert("서버와 통신 오류입니다.");
			}
		});
	}
	
	// 소분류 등록 ajax
	function addSClass(mclassCd,sclassNm) {
		if(sclassNm.length <1){
			alert('[소분류명]을 입력해주세요.');
			return false;
		}
		var hclassCd = $("#hclassCd").val();
		var param = {addMclassCd : mclassCd , addSclassNm : sclassNm};
		var token = $("meta[name='_csrf']").attr("th:content");
		var header = $("meta[name='_csrf_header']").attr("th:content");
		$.ajax({
			type : "POST",
			url : "/gnoincoundb/grouping_mng_dtl_ajax.do",
			data : param,
			dataType : "json",
			beforeSend : function(xhr){
				xhr.setRequestHeader(header, token);
			},
			success : function(json) {
				if(json.error){
					alert(json.error);
				}else{
					listS(mclassCd,hclassCd);
				}
			},
			error : function(e) {
				alert("서버와 통신 오류입니다.");
			}
		});
	}
	
	// 클릭시 text 값 넣는 event(대분류)
	function fn_regHTxt(hclassCd , hclassNm){

		$("#hclassNm").val(hclassNm);
		$("#hclassCd").val("");
		$("#hclassCd").val(hclassCd);
		
		listM(hclassCd); // 등록후 리스트 목록 최신화
	}
	// 클릭시 text 값 넣는 event(중분류)
	function fn_regMTxt(mclassCd, mclassNm){
		
		$("#mclassNm").val(mclassNm);
		$("#mclassCd").val("");
		$("#mclassCd").val(mclassCd);
		var hclassCd = $("#hclassCd").val();
		
		listS(mclassCd,hclassCd);
	}
	
	// 대분류 검색 기능
	function search() {
		var schHclassNm = $("#schHclassNm").val();
		listH(schHclassNm);
	}
	
</script>
<style>
	.table-style1 input {width:150px;}
	td:nth-child(even){text-align:left;}
	/* td:nth-child(odd){text-align:left;} 홀수 이벤트*/
	#oneBlock {width:48.5%;float:left;}
	#scroll {height:300px;overflow:auto;};
	#twoBlock {width:48.5%;}
	/*#threeBlock {width:48.5%;}*/
	#newHclass {text-align:right;margin-right:18px;margin-top:25px;}
	#newMclass {text-align:right;margin-right:18px;margin-top:25px;}
	#newSclass {text-align:right;margin-right:18px;margin-top:25px;}
	

</style>
<section id="content">
	<h2 class="h2-title"><i class="fa fa-check-square"></i>
		분류정보 등록
	</h2>
	<div class="box-style1">
		<form id="frm" name="frm" method="get">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<input type="hidden" name="mnuCd" value="${mnuCd}"/>
			<div class="search-box" style="width:99.2%;">
				<div class="search-group" style="margin-left:70px;">
					<span class="label"><label>대분류</label></span>
					<span class="label2">
						 <input type="text" name="schHclassNm" id="schHclassNm" style="width: 275px;" value="${schHclassNm}" />
					</span>
					<!-- <span class="form"><input type="text" name="schText" id="schText" value="" /></span> -->
				</div>
				<div class="btn" style="padding-right: 70px;">
					<button type="button" class="btn-search" id="searchBtn"  style="background-color:#3781ba;color:white;" onclick="javascript:search();">
						<i class="fa fa-search"></i>검색
					</button>
				</div>
			</div>
			
		</form>
		<div id="oneBlock">
			<form id="frm2" name="frm2" method="post" onsubmit="return false;">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<input type="hidden" id="mnuCd" name="mnuCd" value="${mnuCd }" />
			<div id="scroll">
				<table id="tableH" class="table-write mg-t5" style="width:93%;">
					<colgroup> 
						<col width="20%"></col>
						<col width="20%"></col> 
						<col width="5%"></col>
					</colgroup>
					<thead>
						<tr>
							<th scope="col" style="position: sticky;top: 0;">대분류명</th>
							<th scope="col" style="position: sticky;top: 0;">대분류코드</th>
							<th scope="col" style="position: sticky;top: 0;">순번</th> 
						</tr>
					</thead>
					<tbody id="tby1">
					
					</tbody>
				</table>
			</div>
				<div id="newHclass">
					대분류명 <input type="text" name="hclassNm" id="hclassNm" value="" style="width: 275px;" />
				</div>
				<div class="btn" style="text-align: right; display: block;width:95.5%;margin-top:10px;">
					<button type="button" class="btn-basic" onClick="javascript:fn_clear('h');"><i class="fa fa-repeat"></i>초기화</button>
					<button type="button" class="btn-basic" onClick="javascript:fn_reg(1);" style="background-color:#fc692f;color:white;">저장</button>
					<button type="button" class="btn-basic" onClick="javascript:fn_list('${mnuCd}');"<%-- onClick="javascript:fn_list('${mnuCd}');" --%> style="background-color:#fc692f;color:white;">목록</button>
				</div>
			</form>
		</div>
		<div id="twoBlock">
			<form id="frm3" name="frm3" method="post" onsubmit="return false;">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<input type="hidden" id="mnuCd" name="mnuCd" value="${mnuCd }" />
				<input type="hidden" id="hclassCd" name="hclassCd" value="" />
			<div id="scroll">
				<table class="table-write mg-t5" style="width:93%;margin-left:20px;">
					<colgroup> 
						<col width="20%"></col>
						<col width="20%"></col> 
						<col width="5%"></col>
					</colgroup>
					<thead>
						<tr>
							<th scope="col" style="position: sticky;top: 0;">중분류명</th>
							<th scope="col" style="position: sticky;top: 0;">중분류코드</th>
							<th scope="col" style="position: sticky;top: 0;">순번</th> 
						</tr>
					</thead>
					<tbody id="tby2">
					
					</tbody>
				</table>
			</div>
				<div id="newMclass">
					중분류명 <input type="text" name="mclassNm" id="mclassNm" value="" style="width: 275px;" />
				</div>
			</form>
			<div class="btn" style="text-align: right; display: block;width:97.8%;margin-top:10px;">
				<button type="button" class="btn-basic" onClick="javascript:fn_clear('m');"><i class="fa fa-repeat"></i>초기화</button>
				<button type="button" class="btn-basic" onClick="javascript:fn_reg(2);" style="background-color:#fc692f;color:white;">저장</button>
				<button type="button" class="btn-basic" onClick="javascript:fn_list('${mnuCd}');"<%-- onClick="javascript:fn_list('${mnuCd}');" --%> style="background-color:#fc692f;color:white;">목록</button>
			</div>
		</div>
		<div id="threeBlock">
			<form id="frm3" name="frm3" method="post" onsubmit="return false;">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<input type="hidden" id="mnuCd" name="mnuCd" value="${mnuCd }" />
				<input type="hidden" id="mclassCd" name="mclassCd" value="" />
			<div id="scroll">
				<table class="table-write mg-t5">
					<colgroup> 
						<col width="20%"></col>
						<col width="20%"></col> 
						<col width="5%"></col>
					</colgroup>
					<thead>
						<tr>
							<th scope="col" style="position: sticky;top: 0;">소분류명</th>
							<th scope="col" style="position: sticky;top: 0;">소분류코드</th>
							<th scope="col" style="position: sticky;top: 0;">순번</th> 
						</tr>
					</thead>
					<tbody id="tby3">
					
					</tbody>
				</table>
			</div>
				<div id="newSclass">
					소분류명 <input type="text" name="sclassNm" id="sclassNm" value="" style="width: 275px;" />
				</div>
			</form>
			<div class="btn" style="text-align: right; display: block; margin-top:10px;">
				<button type="button" class="btn-basic" onClick="javascript:fn_clear('s');"><i class="fa fa-repeat"></i>초기화</button>
				<button type="button" class="btn-basic" onClick="javascript:fn_reg(3);" style="background-color:#fc692f;color:white;">저장</button>
				<button type="button" class="btn-basic" onClick="javascript:fn_list('${mnuCd}');"<%-- onClick="javascript:fn_list('${mnuCd}');" --%> style="background-color:#fc692f;color:white;">목록</button>
			</div>
		</div>
	</div>
</section>
</html>