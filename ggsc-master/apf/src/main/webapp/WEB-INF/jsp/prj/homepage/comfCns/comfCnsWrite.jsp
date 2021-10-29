<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>    
  <script>
	  $(document).ready(function() {
			var msg = "${msg}";
			if(msg.length > 0) {
				alert(msg);
				document.location = "/gnoincoun/login.do";
			}
			
			$('input:radio[name=gender]:input[value="${map.gender}"]').attr("checked", true);
		});
		
		function fn_reg() {
			if(confirm("등록 하시겠습니까?")){
				/* var phone1 = $("#phone1").val();
				var phone2 = $("#phone2").val();
				var phone3 = $("#phone3").val();
				var phone =  phone1+phone2+phone3;
				$("#phone").val(phone); */
				document.frm.action = "/gnoincoun/comfCnsReg.do";
		       	document.frm.submit();
		       	alert("등록이 완료됐습니다.");
			}		
		}
  	
  </script>
<style>
	#wrap {width: 100%; margin: auto; height: auto;}
</style>
<section class="service-2 section">
	<div id="wrap">
		<div style="border-top: 1px solid #f09d4c;">
			<img src='/gnoincoun/images/cns1.jpg' alt="맘편한 상담" style="width: 1920px;"/>
		</div>
		<div style="width: 945px; margin: auto;">
			<span style="float: left; margin-top: 20px; margin-bottom: 15px;font: bold; font-weight: 900;">맘편한 상담</span>
			<!-- <ul class="main-menu" style="width: 300px; float: right;margin-top: 20px; margin-bottom: 15px;"> margin-right: 26%;
				<li><a href="javascript: cnsCall();">전화상담</a></li>
				<li><a href="javascript: cnsVisit();">내방상담</a></li>
				<li><a href="javascript: cnsOnline();">온라인상담</a></li>
			</ul> -->
		</div>
		<div class="content" style="width: 50%; margin: auto;">
        	<form class="form-wrap" name="frm" method="post" enctype="multipart/form-data">
        	<!-- <input type="hidden" id="phone" name="phone" /> -->
        	<input type="hidden" id="zoneGb" name="zoneGb" value="${map.zoneGb }" />
        	<input type="hidden" id="localGb" name="localGb" value="9" />
        	<input type="hidden" id="sigunCd" name="sigunCd" value="${map.sigunCd }" />
        	<input type="hidden" id="centerGb" name="centerGb" value="${map.centerGb }" />
            <table  class="table table-condensed line bb">
              <col width="110px" />
              <col />
              <tbody>
                <tr>
                  <th scope="row">상담신청구분<i class="cr">*</i></th>
                  <td>
                    <div class="select">
                      	<select class="form-control" id="cnsReqGb" name="cnsReqGb">
							<c:forEach items="${cnsReqCode }" var="code">
								<option value="${code.odr }">${code.mclassNm }</option>
							</c:forEach>
						</select>
                    </div>
                  </td>
                </tr>
                <tr>
                  <th scope="row">상담구분<i class="cr">*</i></th>
                  <td>
                    <div class="select">
                      	<select class="form-control" id="cnsGb" name="cnsGb">
							<c:forEach items="${cnsGbCode }" var="code">
								<option value="${code.odr }">${code.mclassNm }</option>
							</c:forEach>
						</select>
                    </div>
                  </td>
                </tr>
                <%-- <tr>
                  <th scope="row">상담경위</th>
                  <td>
                    <div class="select">
			            <select class="form-control" id="cnsDtl" name="cnsDtl">
							<c:forEach items="${cnsDtlCode }" var="code">
								<option value="${code.odr }">${code.mclassNm }</option>
							</c:forEach>
						</select>
                    </div>
                  </td>
                </tr>                
                <tr>
                  <th scope="row">노인과의 관계</th>
                  <td>
                    <div class="select">
		                <select class="form-control" id="olderRel" name="olderRel">
							<c:forEach items="${olderRelCode }" var="code">
								<option value="${code.odr }">${code.mclassNm }</option>
							</c:forEach>
						</select>
                    </div>
                  </td>
                </tr>
                <tr>
                  <th scope="row">결혼상태</th>
                  <td>
                    <div class="select">
						<select class="form-control" id="merrStat" name="merrStat">
							<c:forEach items="${merrStatCode }" var="code">
								<option value="${code.odr }">${code.mclassNm }</option>
							</c:forEach>
						</select>
                    </div>
                  </td>
                </tr>
                <tr>
                  <th scope="row">동거형태</th>
                  <td>
                    <div class="select">
						<select class="form-control" id="liveForm" name="liveForm">
							<c:forEach items="${liveCode }" var="code">
								<option value="${code.odr }">${code.mclassNm }</option>
							</c:forEach>
						</select>
                    </div>
                  </td>
                </tr>    
                <tr>
                  <th scope="row">지역구분</th>
                  <td>
                    <div class="select">
						<select class="form-control" id="localGb" name="localGb">
							<c:forEach items="${localGbCode }" var="code">
								<option value="${code.odr }">${code.mclassNm }</option>
							</c:forEach>
						</select>
                    </div>
                  </td>
                </tr>             
                <tr>
                  <th scope="row">주택형태</th>
                  <td>
                    <div class="select">
						<select class="form-control" id="houseForm" name="houseForm">
							<c:forEach items="${houseCode }" var="code">
								<option value="${code.odr }">${code.mclassNm }</option>
							</c:forEach>
						</select>
                    </div>
                  </td>
                </tr>
                <tr>
                  <th scope="row">주거형태</th>
                  <td>
                    <div class="select">
						<select class="form-control" id="livgForm" name="livgForm">
							<c:forEach items="${livgCode }" var="code">
								<option value="${code.odr }">${code.mclassNm }</option>
							</c:forEach>
						</select> 
                    </div>
                  </td>
                </tr>  
                <tr>
                  <th scope="row">주요문제</th>
                  <td>
                    <div class="select">
						<select class="form-control" id="majorProb" name="majorProb">
							<c:forEach items="${majorProbCode }" var="code">
								<option value="${code.odr }">${code.mclassNm }</option>
							</c:forEach>
						</select>  
                    </div>
                  </td>
                </tr> --%>
                <tr>
                  <th scope="row">주호소 문제<i class="cr">*</i></th>
                  <td>
                    <div class="select">
						<select class="form-control" id="majorApplCd" name="majorApplCd">
							<c:forEach items="${majorApplCode }" var="code">
								<option value="${code.odr }">${code.mclassNm }</option>
							</c:forEach>
						</select>  
                    </div>
                  </td>
                </tr>
                <%-- <tr>
                  <th scope="row">종교</th>
                  <td>
                    <div class="select">
						<select class="form-control" id="relg" name="relg">
		                  <option value="1">무교</option>
		                  <option value="2">기독교</option>
		                  <option value="3">천주교</option>
		                  <option value="4">불교</option>
		                  <option value="5">원불교</option>
		                  <option value="6">기타</option>
		                </select>
                    </div>
                  </td>
                </tr>
                <tr>
                  <th scope="row">학력</th>
                  <td>
                    <div class="select">
		                <select class="form-control" id="edu" name="edu">
							<c:forEach items="${eduCode }" var="code">
								<option value="${code.odr }">${code.mclassNm }</option>
							</c:forEach>
						</select>
                    </div>
                  </td>
                </tr>                                               
                <tr>
                  <th scope="row">권역</th>
                  <td>
                    <div class="select">
                      	<select class="form-control" id="zoneGb" name="zoneGb">
							<c:forEach items="${zoneGbCode }" var="code">
								<option value="${code.odr }">${code.mclassNm }</option>
							</c:forEach>
						</select>
                    </div>
                  </td>
                </tr>
                <tr>
                  <th scope="row">센터</th>
                  <td>
                    <div class="select">
                      	<select class="form-control" id="centerGb" name="centerGb">
							<c:forEach items="${centerGbCode }" var="code">
								<option value="${code.odr }">${code.mclassNm }</option>
							</c:forEach>
						</select>
                    </div>
                  </td>
                </tr>
                <tr>
                  <th scope="row">상담일<i class="cr">*</i></th>
                  <td>
                    <div class="input-group">
                        <input type="text" id="datepicker1" name="cnsDt" class="form-control" value="2020-05-22">
                         <span class="input-group-btn">
                           <button class="btn btn-default ico"><i class="fa fa-calendar"></i></button>
                        </span>
                    </div>                   
                  </td>
                </tr>
                <tr>
                  <th scope="row">시간<i class="cr">*</i></th>
                  <td>
                  	<input type="text" id="cnsDtStdHour" name="cnsDtStdHour" class="form-control" maxlength="2" style="width: 42px;float: left;" oninput="this.value = this.value.replace(/[^0-9]/g, ''); $('tel').val(this.value);"><span style="float: left; line-height: 33px;">시</span>
		            <input type="text" id="cnsDtStdMin" name="cnsDtStdMin" class="form-control" maxlength="2" style="width: 42px; float: left;" oninput="this.value = this.value.replace(/[^0-9]/g, ''); $('tel').val(this.value);"><span style="float: left; line-height: 33px;">분</span>
		            <span style="float: left; line-height: 33px;">&nbsp;&nbsp;~&nbsp;&nbsp;</span>
		            <input type="text" id="cnsDtEndHour" name="cnsDtEndHour" class="form-control" maxlength="2" style="width: 42px; float: left;" oninput="this.value = this.value.replace(/[^0-9]/g, ''); $('tel').val(this.value);"><span style="float: left; line-height: 33px;">시</span>
		            <input type="text" id="cnsDtEndMin" name="cnsDtEndMin" class="form-control" maxlength="2" style="width: 42px; float: left;" oninput="this.value = this.value.replace(/[^0-9]/g, ''); $('tel').val(this.value);"><span style="float: left; line-height: 33px;">분 &nbsp;&nbsp;(</span>
		            <input type="text" id="cnsDtTotMin" name="cnsDtTotMin" class="form-control" maxlength="2" style="width: 42px; float: left;" oninput="this.value = this.value.replace(/[^0-9]/g, ''); $('tel').val(this.value);"><span style="float: left; line-height: 33px;">분)</span>
                  </td>
                </tr> --%>                                    
                <tr>
                  <th scope="row">이름<i class="cr">*</i></th>
                  <td><input type="text" class="form-control" id="userNm" name="userNm" maxlength="6" readonly value="${map.userNm }"></td>
                </tr>
                <tr>
                  <th scope="row">성별<i class="cr">*</i></th>
                  <td>
                    <span class="radio-custom"><input type="radio" name="gender" id="gender1" value="M" checked="checked"><label for="gender1"><i></i><span>남</span></label></span>
                    <span class="radio-custom"><input type="radio" name="gender" id="gender2" value="F" ><label for="gender2"><i></i><span>여</span></label></span>
                  </td>
                </tr>
                <tr>
                  <th scope="row">생년월일<i class="cr">*</i></th>
                  <td>
                    <div>
                        <input type="text" id="birth" name="birth" class="form-control" maxlength="8" placeholder="ex)20201025" value="${map.birthDt }" readonly oninput="this.value = this.value.replace(/[^0-9]/g, ''); $('tel').val(this.value);">
                        <!-- <span class="input-group-btn">
                          <button class="btn btn-default ico" id="datepicker1"><i class="fa fa-calendar"></i></button>
                        </span> -->
                    </div>
                  </td>
                </tr>
                <tr>
                  <th scope="row">이메일</th>
                  <td><input type="text" class="form-control" id="email" name="email" maxlength="30" placeholder="" value="${map.email }"></td>
                </tr>
                <!-- <tr>
                  <th scope="row">전화번호</th>
                  <td><input type="text" class="form-control" id="tel" name="" oninput="this.value = this.value.replace(/[^0-9]/g, ''); $('tel').val(this.value);"></td>
                </tr>
                <tr>
                  <th scope="row" class="vt">핸드폰<i class="cr">*</i></th>
                  <td>
                    <div class="row">
                      <div class="col-xs-4 pr0">
                        <div class="input-group">
                          <input type="text" class="form-control" id="phone1" name="phone1" maxlength="3" oninput="this.value = this.value.replace(/[^0-9]/g, ''); $('phone1').val(this.value);">
                          <span class="input-group-addon">-</span>
                        </div>
                      </div>
                      <div class="col-xs-4 pr0 pl0">
                        <div class="input-group">
                          <input type="text" class="form-control" id="phone2" name="phone2" maxlength="4" oninput="this.value = this.value.replace(/[^0-9]/g, ''); $('phone2').val(this.value);">
                          <span class="input-group-addon">-</span>
                        </div>
                      </div>
                      <div class="col-xs-4 pl0"><input type="text" class="form-control" id="phone3" name="phone3" maxlength="4" oninput="this.value = this.value.replace(/[^0-9]/g, ''); $('phone3').val(this.value);"></div>
                    </div>
                  </td>
                </tr> -->
                <tr>
                  <th scope="row" class="vt">전화번호<i class="cr">*</i></th>
                  <td><input type="text" class="form-control" id="phone" name="phone" value="${map.mobile }" readonly /></td>
                </tr>
                <tr>
                  <th scope="row" class="vt">주소<i class="cr">*</i></th>
                  <td>
                    <!-- <div class="input-group">
                        <input name="" id="" type="text" class="form-control" placeholder="0000-0000">
                        <span class="input-group-btn"><button type="button" class="btn btn-primary ">우편번호</button></span>
                    </div> -->
                   <input name="address" id="address" type="text" maxlength="50" class="form-control" value="${map.addr }" readonly />
                  </td>
                </tr>
                <!-- <tr>
                  <td><input type="text" class="form-control" id="" placeholder=""></td>
                </tr>
                <tr>
                  <td><input type="text" class="form-control" id="" placeholder=""></td>
                </tr> -->
                <tr>
                  <th scope="row" class="vt">상담이력</th>
                  <td>
                    <span class="radio-custom"><input type="radio" name="cnsHistYn" id="cnsHistYn1" value="Y" checked="checked"><label for="cnsHistYn1"><i></i><span>유</span></label></span>
                    <span class="radio-custom"><input type="radio" name="cnsHistYn" id="cnsHistYn2" value="N" ><label for="cnsHistYn2"><i></i><span>무</span></label></span>
                  </td>
                </tr>
                <!-- <tr>
                  <td colspan="2">
                    <div class="form-group">
                      <label class="control-label" for="">주상담 희망내용</label>
                      <textarea rows="5" class="form-control" id=""></textarea>
                    </div>
                  </td>
                </tr> -->
                <!-- <tr>
                  <th scope="row" class="vt">주상담<br />희망내용</th>
                  <td>
                      <textarea rows="5" class="form-control" id="cnsCntn" name="cnsCntn"></textarea>
                  </td>
                </tr>
                <tr>
                  <th scope="row" class="vt">심리검사</th>
                  <td>
                      <textarea rows="5" class="form-control" id="psyExam" name="psyExam" ></textarea>
                  </td>
                </tr> -->              
                <!-- <tr>
                  <td colspan="2">
                    파일첨부 /
                    <div class="form-group">
                      <label class="control-label" for="">첨부파일</label>
                      <div class="filebox"> <input class="upload-name" value="파일선택" disabled="disabled"><label for="ex_filename">파일</label> <input type="file" id="ex_filename" class="upload-hidden"></div>
                      <div class="filebox"> <input class="upload-name" value="파일선택" disabled="disabled"><label for="ex_filename2">파일</label> <input type="file" id="ex_filename2" class="upload-hidden"></div>
                      <div class="filebox"> <input class="upload-name" value="파일선택" disabled="disabled"><label for="ex_filename3">파일</label> <input type="file" id="ex_filename3" class="upload-hidden"></div>
                      <div class="btn-group mt5 fr">
                        <button class="btn btn-xs btn-default" type="button"><i class="fa fa-plus"></i><span class="blind">추가</span></button>
                        <button class="btn btn-xs btn-default" type="button"><i class="fa fa-minus"></i><span class="blind">삭제</span></button>
                      </div>
                    </div> 
                    파일첨부 /
                  </td>
                </tr>
                <tr>
                  <th scope="row" class="vt">파일첨부</th>
                  <td>
                    <div class="filebox"> <input class="upload-name" value="파일선택" disabled="disabled"><label for="ex_filename">파일</label> <input type="file" id="ex_filename" name="file" class="upload-hidden"></div>
                    <div class="filebox"> <input class="upload-name" value="파일선택" disabled="disabled"><label for="ex_filename2">파일</label> <input type="file" id="ex_filename2" class="upload-hidden"></div>
                    <div class="filebox"> <input class="upload-name" value="파일선택" disabled="disabled"><label for="ex_filename3">파일</label> <input type="file" id="ex_filename3" class="upload-hidden"></div>
                    <div class="btn-group mt5 fr">
                      <button class="btn btn-xs btn-default" type="button"><i class="fa fa-plus"></i><span class="blind">추가</span></button>
                      <button class="btn btn-xs btn-default" type="button"><i class="fa fa-minus"></i><span class="blind">삭제</span></button>
                    </div>
                  </td>
                </tr> -->
              </tbody>
            </table>
         <div class="btn-wrap line pb20">
            <button type="button" class="btn btn-primary btn-lg w100p" style="background-color: #f09d4c; border-color: #f09d4c;" onClick="javascript:fn_reg();">신청하기</button>
          </div>
        <!-- </form> --><!-- .form-wrap /-->
        <!-- <div class="btn-wrap line bt bb pt10 pb10">
          <button type="button" class="btn btn-default" onclick="location.href='/gnoincoun/homepageMainList.do'">홈</button>
          <button type="button" class="fr btn btn-normal" onclick="location.href=/mgnoincounaddComfCnsInsert.do'">추가자료입력</button>
        </div> -->
            </form> <!-- 상담신청하기 form -->
       </div><!-- content -->
	</div>
</section> <!-- End section -->