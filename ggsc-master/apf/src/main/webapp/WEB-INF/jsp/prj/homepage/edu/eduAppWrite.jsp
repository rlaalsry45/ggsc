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
			
		});
		
		function fn_reg() {
			
			if($("#eduName").val()==""){
				alert("교육명을 입력해주세요.");
				$("#eduName").focus();
				return;
			}
			
			if($("#regDate").val()==""){
				alert("신청날짜를 입력해주세요.");
				$("#regDate").focus();
				return;
			}
			
			if($("#regDate").val().length != 8){
				alert("신청날짜를 8자리로 입력해주세요.");
				$("#regDate").focus();
				return;
			}
			
			if($("#userNm").val()==""){
				alert("이름을 입력해주세요.");
				$("#userNm").focus();
				return;
			}
			
			if($("#birth").val()==""){
				alert("생일을 입력해주세요.");
				$("#birth").focus();
				return;
			}
			
			if($("#phone").val()==""){
				alert("번호를 입력해주세요.");
				$("#phone").focus();
				return;
			}
			
			if($("#email").val()==""){
				alert("이메일을 입력해주세요.");
				$("#email").focus();
				return;
			}
			
			if($("#centerNm").val()==""){
				alert("기관명 입력해주세요.");
				$("#centerNm").focus();
				return;
			}
			
			if($("#depart").val()==""){ 
				alert("부서를 입력해주세요.");
				$("#depart").focus();
				return;
			}
			
			if($('input:radio[name="idvlInfoCntn1Yn"]').is(':checked')==false){
				alert("정보 수집에 대한 동의여부를 선택해주세요.");
				return;
			}
			
			if($('input:radio[name="idvlInfoCntn1Yn"]:checked').val() != 'Y'){
				alert("정보 수집에 동의해주세요.");
				return;
			}
			
			if(confirm("등록 하시겠습니까?")){
				document.frm.action = "/gnoincoun/eduAppReg.do";
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
		<section id="content">
			<div style="width: 800px; margin: auto;">
				<span style="float: left; margin-top: 20px; margin-bottom: 15px;font: bold; font-weight: 900;">개인정보 수집 및 이용에 대한 동의서</span>
			</div>
			<br/><br/>
			<div style="border-width: thin; width:100%; height: auto; padding: 10px 10px 10px 10px;">
				<form  method="post" enctype="multipart/form-data">
				<div style="border-style: solid; border-width: thin; width:700px; height: auto; padding: 30px 20px 20px 20px; margin: 10px 10px 10px 450px;">
						<font style="font-size: small;"> 경기도노인종합상담센터는 개인정보 보호법에 명기된
							관련 법률상의 개인정보처리자가 준수하여야 할 개인정보보호 규정을 준수하며, 관련 법령에 의거하여 교육 신청자
							권익보호에 최선을 다하고 있습니다. 아래 내용을 충분히 숙지하신 후 본인이 직접 동의란에 체크해 주시기 바랍니다.</font><br><br>
					<font style="font-size: medium; font-weight: bold;">1. 개인정보 수집항목</font><br>
					<font style="font-size: medium;">성명, 휴대전화, e-mail, 기관명, 소속/부서(직책) 등 교육신청서에 명기된 항목</font><br><br>
					<font style="font-size: medium; font-weight: bold;">2. 개인정보 수집 및 이용 목적</font><br><br>
						<ul> 
							<li>- 귀하의 소중한 개인정보를 아래와 같은 목적으로 수집 및 이용하고 있습니다.</li>
							<li>○ 시·군 노인상담센터 상담사 보수교육 신청자 관리 및 본인 확인 절차</li>
							<li>○ 시·군 노인상담센터 상담사 보수교육 참가확인서 배부</li>
						</ul>
					<font style="font-size: medium; font-weight: bold;">3. 개인정보의 보유 및 이용기간</font><br>
					<ul> 
						<li>○ 상기 내용은 개인정보 보호법을 근거로 작성하였습니다.</li>
						<li>○ 상기 개인정보의 이용목적이 소멸된 경우에도 교육 수료자 지원 등 이용목적이 분명한 경우는 개인정보를 보유할 수 있으며, 목적 달성 시 파기함을 안내드립니다.</li>
					</ul>
					<font style="font-size: medium; font-weight: bold;">4. 개인정보 제공 동의 거부 권리 및 동의 거부 따른 불이익 내용 또는 제한사항</font><br>
					<font style="font-size: medium;">귀하는 개인정보 제공 동의를 거부할 권리가 있으며, 동의거부에 따른 불이익은 없습니다. 다만, 그 경우 교육이수증에 해당사항이 기재가 되지 않음을 알려드립니다.</font><br/><br/>
					<font style="font-size: medium; font-weight: bold;">5. 참가자가 교육 참여로 알게된 개인 민감정보 사용의 제한 및 책임</font><br/>
					<ul> 
						<li>○ 참가자가 교육에 참여하여 알게 된 타인의 개인정보에 대하여 해당 교육 시간 이외에 사용하여서는 안 되며, 해당 교육이 끝난 이후에 모두 폐기하여야 합니다.</li>
						<li>○ 참가자의 고의 또는 과실에 의해 해당 개인정보가 유출되거나, 전항의 의무이행을 소홀히 하여 발생한 손해나 법적 책임에 대해서는, 해당 참가자가 모든 민·형상의 책임을 지고 손해 배상을 하여야 합니다.</li>
					</ul>
					<div style="border-bottom-style: dotted; border-top-style: dotted; border-width: thin; background-color: #D5D5D5; position: relative; left: -20px; width: 698px; text-align: center;">
						<font style="font-size: medium; font-weight: bold;">※ 아울러 본 동의서에 따라 기입한 개인정보는 교육진행 목적 외에는 사용하지 않을 것을 약속드리며, 철저히 비밀로 관리하여 타인에게 공개하거나 유출하지 않을 것임을 알려드립니다.</font> <br/><br/><br/>
						<font style="font-size: medium; font-weight: bold;"> “개인정보 보호법”에 명기된 관련 법률에 의거, 개인정보 수집 및 이용에 동의하십니까? </font><br/>
						<input type="radio" id="idvlInfoCntn1Y" name="idvlInfoCntn1Yn" value="Y" style="width: 15px; height: 15px;"/><label style="font-size: medium;" for="idvlInfoCntn1Y"> 동의함</label>
						<input type="radio" id="idvlInfoCntn1N" name="idvlInfoCntn1Yn" value="N" style="width: 15px; height: 15px;"/><label style="font-size: medium;" for="idvlInfoCntn1N"> 동의하지 않음(작성종료)</label>
					</div>
				</div>
				</form>
			</div>
		</div>
		
		<!-- end -->

	</section>
		<br/>
		<div style="width: 945px; margin: auto;">
			<span style="float: left; margin-top: 20px; margin-bottom: 15px;font: bold; font-weight: 900;">교육 참가 신청서</span>
		</div>
		<br/>
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
                  <th scope="row">교육명<i class="cr">*</i></th>
                  <td><input type="text" class="form-control" id="eduName" name="eduName"  ></td>
                </tr>
                <tr>
                  <th scope="row">신청날짜<i class="cr">*</i></th>
                  <td><input type="text" class="form-control" id="regDate" name="regDate"  ></td>
                </tr>
                <tr>
                  <th scope="row">이름<i class="cr">*</i></th>
                  <td><input type="text" class="form-control" id="userNm" name="userNm" maxlength="6" readonly value="${map.userNm }"></td>
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
                  <th scope="row" class="vt">휴대폰<i class="cr">*</i></th>
                  <td><input type="text" class="form-control" id="phone" name="phone" value="${map.mobile }" readonly /></td>
                </tr>
                <tr>
                  <th scope="row">이메일<i class="cr">*</i></th>
                  <td><input type="text" class="form-control" id="email" name="email" maxlength="30" placeholder="" value="${map.email }"></td>
                </tr>
                 <tr>
                  <th scope="row">기관명<i class="cr">*</i></th>
                  <td><input type="text" class="form-control" id="centerNm" name="centerNm" ></td>	
                </tr>
                 <tr>
                  <th scope="row">부서<i class="cr">*</i></th>
                  <td><input type="text" class="form-control" id="depart" name="depart" ></td>
                </tr>
                <%-- <tr>
                  <th scope="row" class="vt">주소<i class="cr">*</i></th>
                  <td>
                   <input name="address" id="address" type="text" maxlength="50" class="form-control" value="${map.addr }" readonly />
                  </td>
                <tr>
                  <th scope="row" class="vt">상담이력</th>
                  <td>
                    <span class="radio-custom"><input type="radio" name="cnsHistYn" id="cnsHistYn1" value="Y" checked="checked"><label for="cnsHistYn1"><i></i><span>유</span></label></span>
                    <span class="radio-custom"><input type="radio" name="cnsHistYn" id="cnsHistYn2" value="N" ><label for="cnsHistYn2"><i></i><span>무</span></label></span>
                  </td>
                </tr> --%>
              </tbody>
            </table>
         <div class="btn-wrap line pb20">
            <button type="button" class="btn btn-primary btn-lg w100p" style="background-color: #f09d4c; border-color: #f09d4c;" onClick="javascript:fn_reg();">신청하기</button>
          </div>
            </form> <!-- 상담신청하기 form -->
       </div><!-- content -->
	</div>
</section> <!-- End section -->