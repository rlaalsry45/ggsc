<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>    
  <script>
	  $(document).ready(function() {
			
		  $('input:radio[name=gender]:input[value="${sessionScope.LoginVO.gender}"]').attr("checked", true);
		  $("#cnsleNm").val("${sessionScope.LoginVO.userNm}");
		  $("#telNo").val("${sessionScope.LoginVO.mobile}");
		  
		  let today = new Date();
		  var year = today.getFullYear(); // 년도
		  var month = today.getMonth()+1;  // 월
		  var date = today.getDate();  // 날짜
		  var nowDate = year+"."+month+"."+date;
		  $("#writeDt").val(nowDate);
	  });
	  
/* 	  function fn_reg() {
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
				url : "/psyBereavDocRegAjax.do",
				data : param,
				dataType : "json",
				success : function(json) {
					alert(json.message);
				},
				error : function(e) {
					alert("서버와 통신 오류입니다.");
				}
			});
		  }
		} */
	  
	  function fn_reg() {
		  var total = 0;
		  var sumCnt = $("#sumCnt").val();
		  if(sumCnt != "") {
			  if(confirm("자가진단을 다시 하시겠습니까?")){
				  location.href="/gnoincoun/psyAnxiDoc.do";
				  return false;
			  }
			  return false;
		  }
		  if(confirm("자가진단 작성을 완료하셨습니까?")){
		    var no;
		    for(i=1; i<20; i++) {
		   	    no = $('input[name="no'+i+'"]:checked').val();
		   		total = total+parseInt(no);
		    }
			$("#sumCnt").val(total);
			alert(total);
			return false;
			var param = $("#frm").serialize(); 
			$.ajax({
				type : "POST",
				url : "/gnoincoun/psyDukeDocRegAjax.do",
				data : param,
				dataType : "json",
				success : function(json) {
					alert("사별스트레스척도 심리검사 결과 점수는"+total+"점 입니다.");
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
        <h2 class="title">사별스트레스척도</h2>
      	<form id="frm" name="frm" method="post">
      	   <input type="hidden" id="cnsleId" name="cnsleId" value="${sessionScope.LoginVO.userId}" >
           <table class="table table-condensed">
                <caption>사별스트레스척도</caption>
                <colgroup>
                    <col width="50px"/>
	       			<col width="90px"/>
	       			<col width="60px"/>
	       			<col width="100px"/>
	       			<col width="60px"/>
	       			<col width="100px"/>
                </colgroup>
                <tbody>
                    <tr>
                      <th scope="col" style="vertical-align: middle; text-align: center;">이&nbsp;&nbsp;&nbsp;&nbsp;름</th>
                      <td>
                          <input type="text" id="cnsleNm" name="cnsleNm" class="form-control" readonly="readonly">
                      </td>
                      <th scope="col" style="vertical-align: middle; text-align: center;">연락처</th>
                      <td>
                          <input type="text" id="telNo" name="telNo" class="form-control" readonly="readonly" oninput="this.value = this.value.replace(/[^0-9]/g, '');">
                      </td>
                      <th scope="col" style="vertical-align: middle; text-align: center;">검사일</th>
                      <td>
                          <input type="text" id="writeDt" name="writeDt" class="form-control" readonly="readonly">
                      </td>
                    </tr>
                </tbody>
            </table>
            <div class="txt mt15">
                ※ 다음은 어르신께서 배우자와 사별하고 혼자 살면서 경험할 수 있는 여러 가지 스트레스에 관한 질문입니다. 잘 읽고 해당되는 곳에 ‘√’표시 해 주시길 바랍니다.
            </div>
            <table class="table table-condensed">
                <caption>사별스트레스척도</caption>
                <colgroup>
                    <col style="width: 5%;" />
                    <col style="width: 50%;" />
                    <col style="width: 8%;" />
                    <col style="width: 8%;" />
                    <col style="width: 8%;" />
                    <col style="width: 8%;" />
                    <col style="width: 8%;" />
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col" colspan="2">내&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;용</th>
                        <th scope="col">전혀<br>그렇지<br>않다</th>
                        <th scope="col">그렇지<br>않다</th>
                        <th scope="col">보통<br>이다</th>
                        <th scope="col">그렇다</th>
                        <th scope="col" class="bRight-none">매우<br>그렇다</th>
                    </tr>
                </thead>
                <tbody>
                    <tr class="bBottom2">
                        <td class="bRight-none">1.</td>
                        <td class="txt-left">배우자가 없어서 외롭다고 느낄 때가 많다.</td>
                        <td><input type="radio" id="no11" name="no1" value="0" /></td>
                        <td><input type="radio" id="no12" name="no1" value="1" /></td>
                        <td><input type="radio" id="no13" name="no1" value="2" /></td>
                        <td><input type="radio" id="no14" name="no1" value="3" /></td>
                        <td class="bRight-none"><input type="radio" id="no15" name="no1" value="4" /></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="bRight-none">2.</td>
                        <td class="txt-left">부부동반 모임에 가야할 때 어려움을 느낀다.</td>
                        <td><input type="radio" id="no21" name="no2" value="0" /></td>
                        <td><input type="radio" id="no22" name="no2" value="1" /></td>
                        <td><input type="radio" id="no23" name="no2" value="2" /></td>
                        <td><input type="radio" id="no24" name="no2" value="3" /></td>
                        <td class="bRight-none"><input type="radio" id="no25" name="no2" value="4" /></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="bRight-none">3.</td>
                        <td class="txt-left">배우자와 사별하고 경제적으로 어려웠다.</td>
                        <td><input type="radio" id="no31" name="no3" value="0" /></td>
                        <td><input type="radio" id="no32" name="no3" value="1" /></td>
                        <td><input type="radio" id="no33" name="no3" value="2" /></td>
                        <td><input type="radio" id="no34" name="no3" value="3" /></td>
                        <td class="bRight-none"><input type="radio" id="no35" name="no3" value="4" /></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="bRight-none">4.</td>
                        <td class="txt-left">중요한 결정을 할 때 상의할 대상이 없어서 힘들다.</td>
                        <td><input type="radio" id="no41" name="no4" value="0" /></td>
                        <td><input type="radio" id="no42" name="no4" value="1" /></td>
                        <td><input type="radio" id="no43" name="no4" value="2" /></td>
                        <td><input type="radio" id="no44" name="no4" value="3" /></td>
                        <td class="bRight-none"><input type="radio" id="no45" name="no4" value="4" /></td>
                    </tr>
                    <tr class="bBottom">
                        <td class="bRight-none">5.</td>
                        <td class="txt-left">혼자 있어서 자주 쓸쓸한 마음이 든다.</td>
                        <td><input type="radio" id="no51" name="no5" value="0" /></td>
                        <td><input type="radio" id="no52" name="no5" value="1" /></td>
                        <td><input type="radio" id="no53" name="no5" value="2" /></td>
                        <td><input type="radio" id="no54" name="no5" value="3" /></td>
                        <td class="bRight-none"><input type="radio" id="no55" name="no5" value="4" /></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="bRight-none">6.</td>
                        <td class="txt-left">혼자라고 무시하는 눈초리가 느껴진다.</td>
                        <td><input type="radio" id="no61" name="no6" value="0" /></td>
                        <td><input type="radio" id="no62" name="no6" value="1" /></td>
                        <td><input type="radio" id="no63" name="no6" value="2" /></td>
                        <td><input type="radio" id="no64" name="no6" value="3" /></td>
                        <td class="bRight-none"><input type="radio" id="no65" name="no6" value="4" /></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="bRight-none">7.</td>
                        <td class="txt-left">생계가 막막하다.</td>
                        <td><input type="radio" id="no71" name="no7" value="0" /></td>
                        <td><input type="radio" id="no72" name="no7" value="1" /></td>
                        <td><input type="radio" id="no73" name="no7" value="2" /></td>
                        <td><input type="radio" id="no74" name="no7" value="3" /></td>
                        <td class="bRight-none"><input type="radio" id="no75" name="no7" value="4" /></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="bRight-none">8.</td>
                        <td class="txt-left">배우자가 없어서 자녀들과 소통이 안될 때 힘들다.</td>
                        <td><input type="radio" id="no81" name="no8" value="0" /></td>
                        <td><input type="radio" id="no82" name="no8" value="1" /></td>
                        <td><input type="radio" id="no83" name="no8" value="2" /></td>
                        <td><input type="radio" id="no84" name="no8" value="3" /></td>
                        <td class="bRight-none"><input type="radio" id="no85" name="no8" value="4" /></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="bRight-none">9.</td>
                        <td class="txt-left">혼자 있을 때 배우자 생각이 나서 허무할 때가 있다.</td>
                        <td><input type="radio" id="no91" name="no9" value="0" /></td>
                        <td><input type="radio" id="no92" name="no9" value="1" /></td>
                        <td><input type="radio" id="no93" name="no9" value="2" /></td>
                        <td><input type="radio" id="no94" name="no9" value="3" /></td>
                        <td class="bRight-none"><input type="radio" id="no95" name="no9" value="4" /></td>
                    </tr>
                    <tr class="bBottom">
                        <td class="bRight-none">10.</td>
                        <td class="txt-left">주위사람들의 시선이 신경 쓰여 불편하다.</td>
                        <td><input type="radio" id="no101" name="no10" value="0" /></td>
                        <td><input type="radio" id="no102" name="no10" value="1" /></td>
                        <td><input type="radio" id="no103" name="no10" value="2" /></td>
                        <td><input type="radio" id="no104" name="no10" value="3" /></td>
                        <td class="bRight-none"><input type="radio" id="no105" name="no10" value="4" /></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="bRight-none">11.</td>
                        <td class="txt-left">자녀들에게 경제적으로 부담을 주고 있다.</td>
                        <td><input type="radio" id="no111" name="no11" value="0" /></td>
                        <td><input type="radio" id="no112" name="no11" value="1" /></td>
                        <td><input type="radio" id="no113" name="no11" value="2" /></td>
                        <td><input type="radio" id="no114" name="no11" value="3" /></td>
                        <td class="bRight-none"><input type="radio" id="no115" name="no11" value="4" /></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="bRight-none">12.</td>
                        <td class="txt-left">집안일을 배우자 몫까지 내가 해야만 하는 것이 힘들다.</td>
                        <td><input type="radio" id="no121" name="no12" value="0" /></td>
                        <td><input type="radio" id="no122" name="no12" value="1" /></td>
                        <td><input type="radio" id="no123" name="no12" value="2" /></td>
                        <td><input type="radio" id="no124" name="no12" value="3" /></td>
                        <td class="bRight-none"><input type="radio" id="no125" name="no12" value="4" /></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="bRight-none">13.</td>
                        <td class="txt-left">사랑을 주고받으며 살고 싶은 마음이 간절하다.</td>
                        <td><input type="radio" id="no131" name="no13" value="0" /></td>
                        <td><input type="radio" id="no132" name="no13" value="1" /></td>
                        <td><input type="radio" id="no133" name="no13" value="2" /></td>
                        <td><input type="radio" id="no134" name="no13" value="3" /></td>
                        <td class="bRight-none"><input type="radio" id="no135" name="no13" value="4" /></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="bRight-none">14.</td>
                        <td class="txt-left">배우자가 없어서 사람들을 만나는 것이 꺼려진다.</td>
                        <td><input type="radio" id="no141" name="no14" value="0" /></td>
                        <td><input type="radio" id="no142" name="no14" value="1" /></td>
                        <td><input type="radio" id="no143" name="no14" value="2" /></td>
                        <td><input type="radio" id="no144" name="no14" value="3" /></td>
                        <td class="bRight-none"><input type="radio" id="no145" name="no14" value="4" /></td>
                    </tr>
                    <tr class="bBottom">
                        <td class="bRight-none">15.</td>
                        <td class="txt-left">앞으로 살아가는데 경제적으로 더 어려울 것이다.</td>
                        <td><input type="radio" id="no151" name="no15" value="0" /></td>
                        <td><input type="radio" id="no152" name="no15" value="1" /></td>
                        <td><input type="radio" id="no153" name="no15" value="2" /></td>
                        <td><input type="radio" id="no154" name="no15" value="3" /></td>
                        <td class="bRight-none"><input type="radio" id="no155" name="no15" value="4" /></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="bRight-none">16.</td>
                        <td class="txt-left">생활고 때문에 싫어도 돈을 벌어야 하는 것이 힘들다.</td>
                        <td><input type="radio" id="no161" name="no16" value="0" /></td>
                        <td><input type="radio" id="no162" name="no16" value="1" /></td>
                        <td><input type="radio" id="no163" name="no16" value="2" /></td>
                        <td><input type="radio" id="no164" name="no16" value="3" /></td>
                        <td class="bRight-none"><input type="radio" id="no165" name="no16" value="4" /></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="bRight-none">17.</td>
                        <td class="txt-left">혼자서 잠자리에 누웠을 때 배우자가 그립다.</td>
                        <td><input type="radio" id="no171" name="no17" value="0" /></td>
                        <td><input type="radio" id="no172" name="no17" value="1" /></td>
                        <td><input type="radio" id="no173" name="no17" value="2" /></td>
                        <td><input type="radio" id="no174" name="no17" value="3" /></td>
                        <td class="bRight-none"><input type="radio" id="no175" name="no17" value="4" /></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="bRight-none">18.</td>
                        <td class="txt-left">주위의 유혹이 있을 때 힘이 든다.</td>
                        <td><input type="radio" id="no181" name="no18" value="0" /></td>
                        <td><input type="radio" id="no182" name="no18" value="1" /></td>
                        <td><input type="radio" id="no183" name="no18" value="2" /></td>
                        <td><input type="radio" id="no184" name="no18" value="3" /></td>
                        <td class="bRight-none"><input type="radio" id="no185" name="no18" value="4" /></td>
                    </tr>
                    <tr class="bBottom">
                        <td class="bRight-none">19.</td>
                        <td class="txt-left">집안의 큰 행사가 있을 때 배우자의 빈자리가 느껴진다.</td>
                        <td><input type="radio" id="no191" name="no19" value="0" /></td>
                        <td><input type="radio" id="no192" name="no19" value="1" /></td>
                        <td><input type="radio" id="no193" name="no19" value="2" /></td>
                        <td><input type="radio" id="no194" name="no19" value="3" /></td>
                        <td class="bRight-none"><input type="radio" id="no195" name="no19" value="4" /></td>
                    </tr>
                </tbody>
            </table>
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
                   <input type="text" class="inp num2" id="sumCnt" name="sumCnt" readonly="readonly" style="border:1px solid black; margin-top: 5px; width: 60px;">
          	 	</div>
           </div>
      </div> 
	</div>
</section> <!-- End section -->