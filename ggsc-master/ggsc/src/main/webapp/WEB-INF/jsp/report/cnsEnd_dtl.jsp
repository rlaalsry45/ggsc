<%@ page import="egovframework.rte.psl.dataaccess.util.EgovMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<script src="/gnoincoundb/js/html2canvas.min.js" ></script>
<script src="/gnoincoundb/js/jspdf.min.js" ></script>

<script type="text/javascript">
	$(document).ready(function() {
		
		str = "${result.cnsEndMethd}";
		name = "cnsEndMethd";
		fn_checked(str, name);
		
		str = "${result.cnsStft}";
		name = "cnsStft";
		fn_checked(str, name);
		
		str = "${result.cnsEndResn}";
		name = "cnsEndResn";
		fn_checked(str, name);
	});
		
	
	function fn_save(){	
		if(confirm("수정 하시겠습니까?")){
			document.frm.action = "/gnoincoundb/cnsEndUpd.do";
		   	document.frm.submit();
		}
	}
	
	function fn_list(mnuCd){
		document.location.href = "/gnoincoundb/cnsEndList.do?mnuCd=" + mnuCd;
	}
	
	function findUserPopup(){
		var userNm = $("#cnsleNm").val();
		userNm = encodeURI(encodeURIComponent(userNm));		
		var url = "/gnoincoundb/findUserPopup.do?userNm=" + userNm+"&cnsTargetGb=Y";
		var name = "회원 찾기";
		var option = "width = 530, height = 500, top = 50, left = 100, location = yes";
		window.open(url, name, option);encodeURI(encodeURIComponent(jindan_name));
	}
	
	function fn_checked(str, name){
		if(str != ""){
			var arr = str.split(",");
			for(var i in arr){
				$("input[name=" + name + "][value=" + arr[i] + "]").prop("checked", true);
			}	
		}
	}
	
</script>

<section id="content">
	<h2 class="h2-title"><i class="fa fa-check-square"></i>상담사례 종결서 상세</h2>
		<div class="box-style1 x-scroll-auto" >
		<div class="btn" style="float: right; margin: 0;">
			<button type="button" class="btn-basic" onClick="javascript:fn_list('${mnuCd}');" style="background-color: green;color:white;">목록</button>
			<c:if test="${ result != null && (map.authCd <= 3 || ( map.authCd > 3 && map.userId == result.cnsrId )) }">
				<button type="button" class="btn-basic" onClick="javascript:fn_save();" style="background-color: green;color:white;">수정</button>
			</c:if>
			<!-- <button type="button" class="btn-basic" onClick="javascript:fn_save();" style="background-color: green;color:white;">수정</button> -->
			<!-- <button type="button" class="btn-basic" onClick="javascript:fn_pdf();" style="background-color: green;color:white;">PDF</button> -->
			<button type="button" id="pdfBtn" class="btn-basic btn-primary" onclick="javascript:fn_pdfDownload(23, '${result.num }')">PDF 다운</button>
		</div>	
			<form id="frm" name="frm" method="post">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<input type="hidden" id="cnsleId" name="cnsleId" value="${result.cnsleId}" />
				<input type="hidden" id="caseNo" name="caseNo" value="${result.caseNo }" />
				<input type="hidden" id="cnsGb" name="cnsGb" value="${result.cnsGb}"/>
				<input type="hidden" id="num" name="num" value="${result.num }" />
				<input type="hidden" id="mnuCd" name="mnuCd" value="${mnuCd }" />
				<table class="table-write">
					<colgroup>
						<col width="5%"></col>
						<col width="5%"></col> 
						<col width="40%"></col>
						<col width="10%"></col>
						<col width="40%"></col>
					</colgroup>
					<tr>
						<%-- <th colspan="2">상담자</th>
						<td><input type="text" class="wd200" id="clientNm" name="clientNm" value="${result.clientNm} " /></td> --%>
						<th colspan="2">상담사ID</th>
						<td><input type="text" class="wd200" id="cnsrId" name="cnsrId" value="${result.cnsrId} " readonly /></td>
						<th>상담사</th>
						<td><input type="text" class="wd200" id="cnsrNm" name="cnsrNm" value="${result.cnsrNm }" readonly /></td>
					</tr>
					<tr>
						<th colspan="2">내담자</th>
						<td>
							<input type="text" class="wd200" id="cnsleNm" name="cnsleNm" value="${result.cnsleNm }" readOnly />
							<!--  <button type="button" class="btn-basic" style="padding: 2px 6px;" onclick="javascript:findUserPopup();">찾기</button>-->
						</td>
						<th>생년월일</th>
						<td>
							<span class="form"><input type="text" class="wd200" id="birthDt" name="birthDt" value="${result.birthDt }"  readOnly/></span>
						</td>
					</tr>
					<tr>
						<th rowspan="2"colspan="2">연락처</th>
						<td>
							Home.<input type="text" class="wd200" id="tel" name="tel" value="${result.tel }" readOnly onlyNumber maxLength=11/>
						</td>
						<th rowspan="2">주소</th>
						<td rowspan="2">
							<input type="text" id="addr" name="addr" value="${result.addr }" readOnly/>
						</td>
					</tr>
					<tr>
						<td>
							H.P<input type="text" class="wd200" id="mobile" name="mobile" value="${result.mobile }" onlyNumber maxLength=11 readOnly/>
						</td>
					</tr>
					<tr>
						<th colspan="2">상담기간</th>
						<td colspan="3">
							<span class="form"><input type="text" class="wd200" id="datepicker2" name="cnsDtS" value="${result.cnsDtS }" readOnly /></span>
							 &nbsp;&nbsp;&nbsp;&nbsp; ~ &nbsp; 
							 <span class="form"><input type="text" class="wd200" id="datepicker3" name="cnsDtE" value="${result.cnsDtE }" readOnly/></span>
						</td>
					</tr>
					<tr>
						<th colspan="2">종결방법</th>
						<td colspan="3">
							<input type="radio" id="cnsEndMethd1" name="cnsEndMethd" value="1" <c:if test="${result.cnsEndMethd == 1}"> checked </c:if>/><label for="cnsEndMethd1">면접</label>
							<input type="radio" id="cnsEndMethd2" name="cnsEndMethd" value="2" <c:if test="${result.cnsEndMethd == 2}"> checked </c:if>/><label for="cnsEndMethd2">전화</label>
							<input type="radio" id="cnsEndMethd3" name="cnsEndMethd" value="3" <c:if test="${result.cnsEndMethd == 3}"> checked </c:if>/><label for="cnsEndMethd3">기타</label> 
						</td>
					</tr>
					<tr>
						<th colspan="2">상담회기</th>
						<td colspan="3">
							<input type="text" class="wd200" id="cnsCnt" name="cnsCnt" value="${result.cnsCnt }" onlyNumber />
						</td>
					</tr>
					<tr>
						<th rowspan="2" colspan="2">내담자 상담만족도</th>
						<td colspan="3">
							<input type="radio" id="cnsStft1" name="cnsStft" value="1" <c:if test="${result.cnsStft == 1}"> checked </c:if>/><label for="cnsStft1">1</label>
							<input type="radio" id="cnsStft2" name="cnsStft" value="2" <c:if test="${result.cnsStft == 2}"> checked </c:if>/><label for="cnsStft2">2</label>
							<input type="radio" id="cnsStft3" name="cnsStft" value="3" <c:if test="${result.cnsStft == 3}"> checked </c:if>/><label for="cnsStft3">3</label>
							<input type="radio" id="cnsStft4" name="cnsStft" value="4" <c:if test="${result.cnsStft == 4}"> checked </c:if>/><label for="cnsStft4">4</label>
							<input type="radio" id="cnsStft5" name="cnsStft" value="5" <c:if test="${result.cnsStft == 5}"> checked </c:if>/><label for="cnsStft5">5</label>
							<input type="radio" id="cnsStft6" name="cnsStft" value="6" <c:if test="${result.cnsStft == 6}"> checked </c:if>/><label for="cnsStft6">6</label>
							<input type="radio" id="cnsStft7" name="cnsStft" value="7" <c:if test="${result.cnsStft == 7}"> checked </c:if>/><label for="cnsStft7">7</label>
							<input type="radio" id="cnsStft8" name="cnsStft" value="8" <c:if test="${result.cnsStft == 8}"> checked </c:if>/><label for="cnsStft8">8</label>
							<input type="radio" id="cnsStft9" name="cnsStft" value="9" <c:if test="${result.cnsStft == 9}"> checked </c:if>/><label for="cnsStft9">9</label>
							<input type="radio" id="cnsStft10" name="cnsStft" value="10" <c:if test="${result.cnsStft == 10}"> checked </c:if>/><label for="cnsStft10">10</label>
						</td>
					</tr>
					<tr>
						<td colspan="3">
							도움된 내용:<br>
							<textarea id="helpCntn" name="helpCntn" style="height: 160px; width: 600px;">${result.helpCntn }</textarea>
						</td>
					</tr>
					<tr>
						<th colspan="2">종결사유</th> 
						<td colspan="3">
							<c:forEach items="${cnsEndList }" var="list">
								<input type="radio" id="cnsEndResn1" name="cnsEndResn" value="${list.odr}" <c:if test="${list.odr == result.cnsEndResn}">checked</c:if> /><label for="cnsEndResn1">${list.mclassNm }</label>
							</c:forEach>
						</td>
					</tr>
					<tr>
						<th rowspan="2">상담사의견</th>
						<th>상담사</th>
						<td colspan="3">
							<textarea id="cntn" name="cntn" style="height: 160px; width: 600px;">${result.cntn }</textarea>
						</td>
					</tr>
					<tr>
						<th>자원봉사자</th>
						<td colspan="3">
							<textarea id="vltrCntn" name="vltrCntn" style="height: 160px; width: 600px;">${result.vltrCntn }</textarea>
						</td>
					</tr>
				</table>
				<div style='width: 100%;'>
		        <br/>
		        <div style='width: 100%; text-align: center; font-size: 20px;'>위 <span>상담을</span> 종결합니다.</div>
		       		<div style='text-align: right; font-size: 20px;'>
			       		<p style="margin: 15px;">작성일 : <span class="form"><input type="text" class="wd130" id="datepicker4" name="writeDt" value="${fn:substring(result.dbInsTm,0,10) }" readOnly /></span></p>
			        	<p style="margin: 50px 68px;">상담사 : ${result.cnsrNm } (인)</p>
		        	</div>
		        </div>  
			</form>
		</div>
		<!-- end -->
	</section>
</html>

