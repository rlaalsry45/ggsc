<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>    
    <script>
	  $(document).ready(function() {
			
		  $('input:radio[name=gender]:input[value="${sessionScope.LoginVO.gender}"]').attr("checked", true);
		  $("#cnsleNm").val("${sessionScope.LoginVO.userNm}");
		  $("#telNo").val("${sessionScope.LoginVO.mobile}");
		  $("#age").val("${sessionScope.LoginVO.age}");
		  //$("#sumCnt").val(3);
		  
		  
	  });
	  
	  /* function fn_reg() {
		  if(confirm("등록 하시겠습니까?")){
		    var total = 0;
		    var no;
		    for(i=1; i<16; i++) {
		   	    no = $('input[name="no'+i+'"]:checked').val();
		   	    if(no  == "Y") {
		   		    total++;
		   	    }
		    }
		    $("#sumCnt").val(total);
			var param = $("#frm").serialize(); 
			$.ajax({
				type : "POST",
				url : "/psyGdsDocRegAjax.do",
				data : param,
				dataType : "json",
				success : function(json) {
					alert("심리검사 결과 점수는"+json.sumCnt+"점 입니다.");
				},
				error : function(e) {
					alert("서버와 통신 오류입니다.");
				}
			});
		  }
		} */
	  
	  function fn_reg() {
		  var total = 0; // 단축형노인우울척도(S-GDS) 총점
		  var total2 = 0; // 자살사고 총점
		  var sumCnt = $("#sumCnt").val();
		  if(sumCnt != "") {
			  if(confirm("자가진단을 다시 하시겠습니까?")){
				  location.href="/gnoincoun/psyGdsDoc.do";
				  return false;
			  }
			  return false;
		  }
		  if(confirm("자가진단 작성을 완료하셨습니까?")){
		    var no;
		    var no2;
		    for(i=1; i<16; i++) {
		   	    no = $('input[name="no'+i+'"]:checked').val();
		   	    if(no=="N") {
		   	    	total = total+1;
		   	    }
		   		// total = total+parseInt(no);
		    }
		    
		    for(i=16; i<20; i++) {
		   	    no2 = $('input[name="no'+i+'"]:checked').val();
		   	    total2 = total2+parseInt(no2);
		   	    
		    }
		    
		    $("#sumCnt").val(total);
		    $("#sumCnt2").val(total2);
			var param = $("#frm").serialize(); 
			$.ajax({
				type : "POST",
				url : "/gnoincoun/psyDukeDocRegAjax.do",
				data : param,
				dataType : "json",
				success : function(json) {
					alert("GDS-SI 심리검사 결과 점수는"+total+"점 입니다.");
					alert("자살사고 심리검사 결과 점수는"+total2+"점 입니다.");
				},
				error : function(e) {
					alert("서버와 통신 오류입니다.");
				}
			});
		  }
		}	  
  </script>
<style>
	#wrap {width: 70%; margin: auto;}
</style>
<section class="service-2 section">
	<div id="wrap">
        <h2 class="title">노인우울 및 자살사고 척도</h2>
	      <form id="frm" name="frm" method="post">
	      <input type="hidden" id="cnsleId" name="cnsleId" value="${sessionScope.LoginVO.userId}" >
            <table class="table table-condensed">
                <caption>노인우울및자살사고척도</caption>
                <colgroup>
                    <col width="30px"/>
          			<col width="70px"/>
          			<col width="30px"/>
          			<col width="70px"/>
          			<col width="30px"/>
          			<col width="30px"/>
          			<col width="40px"/>
          			<col width="80px"/>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="col" style="vertical-align: middle; text-align: center;">이름</th>
                        <td>
                            <input type="text" id="cnsleNm" class="form-control" name="cnsleNm" readonly="readonly">
                        </td>
                        <th scope="col" style="vertical-align: middle; text-align: center;">성별</th>
                        <td style="vertical-align: middle;">
                            <label for="gender1" style="margin-right: 10px;">남</label><input type="radio" id="gender1" name="gender" value="M" style="margin-bottom: 5px;"/> /
                            <label for="gender2" style="margin-right: 10px;">여</label><input type="radio" id="gender2" name="gender" value="F" style="margin-bottom: 5px;"/>
                        </td>
                        <th scope="col" style="vertical-align: middle; text-align: center;">나이</th>
                        <td>
                            <input type="text" id="age" name="age" class="form-control" readonly="readonly" oninput="this.value = this.value.replace(/[^0-9]/g, '');">
                        </td>
                        <th scope="col" style="vertical-align: middle; text-align: center;">연락처</th>
                        <td>
                            <input type="text" id="telNo" name="telNo" class="form-control" readonly="readonly" oninput="this.value = this.value.replace(/[^0-9]/g, '');">
                        </td>
                    </tr>
                </tbody>
            </table>
            <div class="tbl-title mt20">
                ◉ 단축형노인우울척도(S-GDS)
            </div>
            <div class="table-wrap">
	            <table class="table table-condensed">
	                <caption>노인상담선별척도지</caption>
	                <colgroup>
	                    <col style="width: 5%;" />
	                    <col style="width: 60%;" />
	                    <col style="width: 10%;" />
	                    <col style="width: 10%;" />
	                </colgroup>
	                <thead>
	                    <tr>
	                        <th scope="col"></th>
	                        <th scope="col">지난 한 주 동안의 느낌</th>
	                        <th scope="col">예</th>
	                        <th scope="col">아니요</th>
	                    </tr>
	                </thead>
	                <tbody>
	                    <tr>
	                        <td>1</td>
	                        <td class="txt-left">현재의 생활에 대체적으로 만족하십니까?</td>
	                        <td><input type="radio" id="no11" name="no1" value="Y" /></td>
	                        <td class="bRight-none"><input type="radio" id="no12" name="no1" value="N" /></td>
	                    </tr>
	                    <tr>
	                        <td>2</td>
	                        <td class="txt-left">요즈음 들어 활동량이나 의욕이 많이 떨어지셨습니까?</td>
	                        <td><input type="radio" id="no21" name="no2" value="Y" /></td>
	                        <td class="bRight-none"><input type="radio" id="no22" name="no2" value="N" /></td>
	                    </tr>
	                    <tr>
	                        <td class="bgG">3</td>
	                        <td class="txt-left">자신이 헛되이 살고 있다고 느끼십니까?</td>
	                        <td><input type="radio" id="no31" name="no3" value="Y" /></td>
	                        <td class="bRight-none"><input type="radio" id="no32" name="no3" value="N" /></td>
	                    </tr>
	                    <tr>
	                        <td>4</td>
	                        <td class="txt-left">생활이 지루하게 느껴질 때가 많습니까?</td>
	                        <td><input type="radio" id="no41" name="no4" value="Y" /></td>
	                        <td class="bRight-none"><input type="radio" id="no42" name="no4" value="N" /></td>
	                    </tr>
	                    <tr>
	                        <td>5</td>
	                        <td class="txt-left">평소에 기분은 상쾌한 편이십니까?</td>
	                        <td><input type="radio" id="no51" name="no5" value="Y" /></td>
	                        <td class="bRight-none"><input type="radio" id="no52" name="no5" value="N" /></td>
	                    </tr>
	                    <tr>
	                        <td class="bgG">6</td>
	                        <td class="txt-left">자신에게 불길한 일이 닥칠 것 같아 불안하십니까?</td>
	                        <td><input type="radio" id="no61" name="no6" value="Y" /></td>
	                        <td class="bRight-none"><input type="radio" id="no62" name="no6" value="N" /></td>
	                    </tr>
	                    <tr>
	                        <td>7</td>
	                        <td class="txt-left">대체로 마음이 즐거운 편이십니까?</td>
	                        <td><input type="radio" id="no71" name="no7" value="Y" /></td>
	                        <td class="bRight-none"><input type="radio" id="no72" name="no7" value="N" /></td>
	                    </tr>
	                    <tr>
	                        <td>8</td>
	                        <td class="txt-left">절망적이라는 느낌이 자주 드십니까?</td>
	                        <td><input type="radio" id="no81" name="no8" value="Y" /></td>
	                        <td class="bRight-none"><input type="radio" id="no82" name="no8" value="N" /></td>
	                    </tr>
	                    <tr>
	                        <td>9</td>
	                        <td class="txt-left">바깥에 나가기가 싫고 집에만 있고 싶습니까?</td>
	                        <td><input type="radio" id="no91" name="no9" value="Y" /></td>
	                        <td class="bRight-none"><input type="radio" id="no92" name="no9" value="N" /></td>
	                    </tr>
	                    <tr>
	                        <td>10</td>
	                        <td class="txt-left">비슷한 나이의 다른 노인들 보다 기억력이 더 나쁘다고 느끼십니까?</td>
	                        <td><input type="radio" id="no101" name="no10" value="Y" /></td>
	                        <td class="bRight-none"><input type="radio" id="no102" name="no10" value="N" /></td>
	                    </tr>
	                    <tr>
	                        <td class="bgG">11</td>
	                        <td class="txt-left">현재 살아 있다는 것이 즐겁게 생각되십니까?</td>
	                        <td><input type="radio" id="no111" name="no11" value="Y" /></td>
	                        <td class="bRight-none"><input type="radio" id="no112" name="no11" value="N" /></td>
	                    </tr>
	                    <tr>
	                        <td class="bgG">12</td>
	                        <td class="txt-left">지금의 내 자신이 아무 쓸모없는 사람이라고 느끼십니까?</td>
	                        <td><input type="radio" id="no121" name="no12" value="Y" /></td>
	                        <td class="bRight-none"><input type="radio" id="no122" name="no12" value="N" /></td>
	                    </tr>
	                    <tr>
	                        <td>13</td>
	                        <td class="txt-left">기력이 좋은 편이십니까?</td>
	                        <td><input type="radio" id="no131" name="no13" value="Y" /></td>
	                        <td class="bRight-none"><input type="radio" id="no132" name="no13" value="N" /></td>
	                    </tr>
	                    <tr>
	                        <td class="bgG">14</td>
	                        <td class="txt-left">지금 자신의 처지가 아무런 희망도 없다고 느끼십니까?</td>
	                        <td><input type="radio" id="no141" name="no14" value="Y" /></td>
	                        <td class="bRight-none"><input type="radio" id="no142" name="no14" value="N" /></td>
	                    </tr>
	                    <tr>
	                        <td>15</td>
	                        <td class="txt-left">자신이 다른 사람들의 처지보다 더 못하다고 생각하십니까?</td>
	                        <td><input type="radio" id="no151" name="no15" value="Y" /></td>
	                        <td class="bRight-none"><input type="radio" id="no152" name="no15" value="N" /></td>
	                    </tr>
	                    <tr>
	                        <td colspan="2">총점</td>
	                        <td colspan="2"><input type="text" id="sumCnt" name="sumCnt" maxlength="2" readonly="readonly" style="width: 50px; text-align: right; margin-bottom: 2px;"> / 15</td>
	                    </tr>
	                </tbody>
	            </table>
	          </div>
            <div class="tbl-title mt30">
                ◉ 자살사고
            </div>
            <div class="table-wrap">
	            <table class="table table-condensed">
	                <caption>노인상담선별척도지</caption>
	                <colgroup>
	                    <col style="width: 5%;" />
	                    <col style="width: 53%;" />
	                    <col style="width: 10%;" />
	                    <col style="width: 12%;" />
	                    <col style="width: 10%;" />
	                    <col style="width: 10%;" />
	                </colgroup>
	                <thead>
	                    <tr>
	                        <th scope="col"></th>
	                        <th scope="col">질문사항</th>
	                        <th scope="col">전혀 없다</th>
	                        <th scope="col">한두번있다</th>
	                        <th scope="col">가끔있다</th>
	                        <th scope="col">자주 있다</th>
	                    </tr>
	                </thead>
	                <tbody>
	                    <tr>
	                        <td>1</td>
	                        <td class="txt-left">과거에 스스로 목숨을 끊으려고 시도한 적이 있다</td>
	                        <td><input type="radio" class="inp txt-center" id="no161" name="no16" value="0" /></td>
	                        <td><input type="radio" class="inp txt-center" id="no162" name="no16" value="1" /></td>
	                        <td><input type="radio" class="inp txt-center" id="no163" name="no16" value="2" /></td>
	                        <td><input type="radio" class="inp txt-center" id="no164" name="no16" value="3" /></td>
	                    </tr>
	                    <tr>
	                        <td>2</td>
	                        <td class="txt-left">최근에 스스로 목숨을 끊고 싶다는 생각을 해 본 적이 있다</td>
	                        <td><input type="radio" class="inp txt-center" id="no171" name="no17" value="0" /></td>
	                        <td><input type="radio" class="inp txt-center" id="no172" name="no17" value="1" /></td>
	                        <td><input type="radio" class="inp txt-center" id="no173" name="no17" value="2" /></td>
	                        <td><input type="radio" class="inp txt-center" id="no174" name="no17" value="3" /></td>
	                    </tr>
	                    <tr>
	                        <td>3</td>
	                        <td class="txt-left">누군가에게 죽고 싶다는 말을 해 본 적이 있다</td>
	                        <td><input type="radio" class="inp txt-center" id="no181" name="no18" value="0" /></td>
	                        <td><input type="radio" class="inp txt-center" id="no182" name="no18" value="1" /></td>
	                        <td><input type="radio" class="inp txt-center" id="no183" name="no18" value="2" /></td>
	                        <td><input type="radio" class="inp txt-center" id="no184" name="no18" value="3" /></td>
	                    </tr>
	                    <tr>
	                        <td>4</td>
	                        <td class="txt-left">최근 들어 스스로 목숨을 끊고 싶다는 생각이 들었다면 구체적인 방법까지 계획했다</td>
	                        <td colspan="4">
	                            예(<input type="radio" class="inp month txt-center" id="no191" name="no19" value="1" />)&nbsp;&nbsp;&nbsp;&nbsp;
	                            아니오(<input type="radio" class="inp month txt-center" id="no192" name="no19" value="0" />)
	                        </td>
	                    </tr>
	                </tbody>
	            </table>
	        </div>
	       </form>
	  <div class="btn-wrap line pb20">
        <button type="button" class="btn btn-primary btn-lg w100p" onClick="javascript:fn_reg();">자가진단</button>
        <!-- <button type="button" class="btn btn-primary btn-lg w100p" id="save" onclick="location.href='/gnoincoun/psyCnsList.do'" style="color: #fff; background-color: #78849E; border-color: #78849E;">목록</button> -->
        <button type="button" class="btn btn-primary btn-lg w100p" id="save" onclick="javascript: history.back();" style="color: #fff; background-color: #78849E; border-color: #78849E;">목록</button>
      </div>
      <div style="height: 50px;">
           <div class="total fr mt15">
               <div style="float: left; line-height: 30px; margin-right: 10px;">
                   총 점
               </div>
               <div style="float: left;">
                   <input type="text" class="inp num2" id="sumCnt2" name="sumCnt2" readonly="readonly" style="border:1px solid black; margin-top: 5px; width: 60px;">
          	 	</div>
           </div>
      </div>
	</div>
</section> <!-- End section -->