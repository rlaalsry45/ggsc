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
	  
	  /* function fn_reg() {
		  if(confirm("등록 하시겠습니까?")){
			var total = 0;
			var no;
			for(i=1; i<26; i++) {
				no = $('input[name="no'+i+'"]:checked').val();
				if(no  == "Y") {
					total++;
				}
			}
			$("#sumCnt").val(total);
			var param = $("#frm").serialize(); 
			$.ajax({
				type : "POST",
				url : "/psyPerRelDocRegAjax.do",
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
		  var total = 0;
		  var sumCnt = $("#sumCnt").val();
		  if(sumCnt != "") {
			  if(confirm("자가진단을 다시 하시겠습니까?")){
				  location.href="/gnoincoun/psyPerRelDoc.do";
				  return false;
			  }
			  return false;
		  }
		  if(confirm("자가진단 작성을 완료하셨습니까?")){
		    var no;
		    for(i=1; i<26; i++) {
		   	    no = $('input[name="no'+i+'"]:checked').val();
		   		total = total+parseInt(no);
		    }
			$("#sumCnt").val(total);
			var param = $("#frm").serialize(); 
			$.ajax({
				type : "POST",
				url : "/gnoincoun/psyDukeDocRegAjax.do",
				data : param,
				dataType : "json",
				success : function(json) {
					alert("대인관계변화척도 심리검사 결과 점수는"+total+"점 입니다.");
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
        <h2 class="title">대인관계변화척도</h2>
      	<form id="frm" name="frm" method="post">
      	   <input type="hidden" id="cnsleId" name="cnsleId" value="${sessionScope.LoginVO.userId}" >
           <table class="table table-condensed">
                <caption>대인관계변화척도</caption>
                <colgroup>
                    <col width="50px"/>
	       			<col width="90px"/>
	       			<col width="60px"/>
	       			<col width="100px"/>
	       			<col width="60px"/>
	       			<col width="80px"/>
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
                ※ 아래의 문항은 여러분과 여러분의 주변 사람들과의 관계에 대해 묻는 질문입니다. 평소 자신의 모습에 비추어 볼 때, 일반적으로 그렇다고 생각되는 곳에 √표 해주십시오.
            </div>
            <table class="table table-condensed">
                <caption>대인관계변화척도</caption>
                <colgroup>
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col" colspan="4" class="txt-left txtIn20 bgG bRight-none">1. 나는 나 자신에 대하여</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no11" name="no1" value="4" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no11">매우 불만족스럽다.</label></td>
                        <td>2.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no12" name="no1" value="3" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no12">약간 불만족스럽다.</label></td>
                    </tr>
                    <tr>
                        <td>3.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no13" name="no1" value="2" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no13">그저 그렇다.</label></td>
                        <td>4.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no14" name="no1" value="1" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no14">약간 만족한다.</label></td>
                    </tr>
                    <tr class="bBottom">
                        <td>5.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no15" name="no1" value="0" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no15">매우 만족한다.</label></td>
                        <td></td>
                        <td class="txt-left txtIn40 bRight-none"></td>
                    </tr>
                </tbody>
            </table>
            <table class="table table-condensed">
                <caption>대인관계변화척도</caption>
                <colgroup>
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col" colspan="4" class="txt-left txtIn20 bgG bRight-none">2. 나는 다른 사람에 대하여</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no21" name="no2" value="4" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no21">매우 불만족스럽다.</label></td>
                        <td>2.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no22" name="no2" value="3" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no22">약간 불만족스럽다.</label></td>
                    </tr>
                    <tr>
                        <td>3.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no23" name="no2" value="2" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no23">그저 그렇다.</label></td>
                        <td>4.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no24" name="no2" value="1" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no124">약간 만족한다.</label></td>
                    </tr>
                    <tr class="bBottom">
                        <td>5.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no25" name="no2" value="0" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no25">매우 만족한다.</label></td>
                        <td></td>
                        <td class="txt-left txtIn40 bRight-none"></td>
                    </tr>
                </tbody>
            </table>
            <table class="table table-condensed">
                <caption>대인관계변화척도</caption>
                <colgroup>
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col" colspan="4" class="txt-left txtIn20 bgG bRight-none">
                            3. 다른 사람들은 나를 (<input type="text" class="inp w30 bgG">) 사람으로 볼 것이라고 생각한다.
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no31" name="no3" value="4" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no31">매우 불만족스러운</label></td>
                        <td>2.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no32" name="no3" value="3" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no32">약간 불만족스러운</label></td>
                    </tr>
                    <tr>
                        <td>3.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no33" name="no3" value="2" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no33">그저 그런</label></td>
                        <td>4.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no34" name="no3" value="1" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no34">약간 만족스러운</label></td>
                    </tr>
                    <tr class="bBottom">
                        <td>5.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no35" name="no3" value="0" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no35">매우 만족스러운</label></td>
                        <td></td>
                        <td class="txt-left txtIn40 bRight-none"></td>
                    </tr>
                </tbody>
            </table>
            <table class="table table-condensed">
                <caption>대인관계변화척도</caption>
                <colgroup>
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col" colspan="4" class="txt-left txtIn20 bgG bRight-none">
                            4. 다른 사람들은 그 자신에 대하여 (<input type="text" class="inp w30 bgG">) 사람으로 본다.
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no41" name="no4" value="4" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no41">매우 불만족스러운</label></td>
                        <td>2.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no42" name="no4" value="3" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no42">약간 불만족스러운</label></td>
                    </tr>
                    <tr>
                        <td>3.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no43" name="no4" value="2" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no43">그저 그런</label></td>
                        <td>4.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no44" name="no4" value="1" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no44">약간 만족스러운</label></td>
                    </tr>
                    <tr class="bBottom">
                        <td>5.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no45" name="no4" value="0" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no45">매우 만족스러운</label></td>
                        <td></td>
                        <td class="txt-left txtIn40 bRight-none"></td>
                    </tr>
                </tbody>
            </table>
            <table class="table table-condensed">
                <caption>대인관계변화척도</caption>
                <colgroup>
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col" colspan="4" class="txt-left txtIn20 bgG bRight-none">5. 다른 사람과 나의 관계는</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no51" name="no5" value="4" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no51">매우 원만하지 못하다.</label></td>
                        <td>2.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no52" name="no5" value="3" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no52">약간 원만하지 못하다.</label></td>
                    </tr>
                    <tr>
                        <td>3.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no53" name="no5" value="2" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no53">그저 그렇다.</label></td>
                        <td>4.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no54" name="no5" value="1" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no54">약간 원만하다.</label></td>
                    </tr>
                    <tr class="bBottom">
                        <td>5.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no55" name="no5" value="0" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no55">매우 원만하다.</label></td>
                        <td></td>
                        <td class="txt-left txtIn40 bRight-none"></td>
                    </tr>
                </tbody>
            </table>
            <table class="table table-condensed">
                <caption>대인관계변화척도</caption>
                <colgroup>
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col" colspan="4" class="txt-left txtIn20 bgG bRight-none">6. 나는 다른 사람이 바라는 욕구를</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no61" name="no6" value="4" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no61">거의 알지 못한다.</label></td>
                        <td>2.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no62" name="no6" value="3" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no62">약간 알지 못한다.</label></td>
                    </tr>
                    <tr>
                        <td>3.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no63" name="no6" value="2" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no63">그저 그렇다.</label></td>
                        <td>4.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no64" name="no6" value="1" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no64">약간 아는 편이다.</label></td>
                    </tr>
                    <tr class="bBottom">
                        <td>5.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no65" name="no6" value="0" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no65">매우 아는 편이다.</label></td>
                        <td></td>
                        <td class="txt-left txtIn40 bRight-none"></td>
                    </tr>
                </tbody>
            </table>
            <table class="table table-condensed">
                <caption>대인관계변화척도</caption>
                <colgroup>
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col" colspan="4" class="txt-left txtIn20 bgG bRight-none">7. 나는 나 자신의 감정을</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no71" name="no7" value="4" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no71">거의 이해하지 못한다.</label></td>
                        <td>2.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no72" name="no7" value="3" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no72">약간 이해하지 못한다.</label></td>
                    </tr>
                    <tr>
                        <td>3.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no73" name="no7" value="2" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no73">그저 그렇다.</label></td>
                        <td>4.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no74" name="no7" value="1" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no74">약간 이해한다.</label></td>
                    </tr>
                    <tr class="bBottom">
                        <td>5.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no75" name="no7" value="0" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no75">매우 이해한다.</label></td>
                        <td></td>
                        <td class="txt-left txtIn40 bRight-none"></td>
                    </tr>
                </tbody>
            </table>
            <table class="table table-condensed">
                <caption>대인관계변화척도</caption>
                <colgroup>
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col" colspan="4" class="txt-left txtIn20 bgG bRight-none">8. 나는 다른 사람의 감정을</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no81" name="no8" value="4" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no81">거의 이해하지 못한다.</label></td>
                        <td>2.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no82" name="no8" value="3" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no82">약간 이해하지 못한다.</label></td>
                    </tr>
                    <tr>
                        <td>3.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no83" name="no8" value="2" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no83">그저 그렇다.</label></td>
                        <td>4.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no84" name="no8" value="1" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no84">약간 이해한다.</label></td>
                    </tr>
                    <tr class="bBottom">
                        <td>5.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no85" name="no8" value="0" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no85">매우 이해한다.</label></td>
                        <td></td>
                        <td class="txt-left txtIn40 bRight-none"></td>
                    </tr>
                </tbody>
            </table>
            <table class="table table-condensed">
                <caption>대인관계변화척도</caption>
                <colgroup>
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col" colspan="4" class="txt-left txtIn20 bgG bRight-none">9. 나는 다른 사람과 이야기를 하는 것에 대하여</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no91" name="no9" value="4" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no91">매우 어려움을 느낀다.</label></td>
                        <td>2.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no92" name="no9" value="3" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no92">약간 어려움을 느낀다.</label></td>
                    </tr>
                    <tr>
                        <td>3.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no93" name="no9" value="2" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no93">그저 그렇다.</label></td>
                        <td>4.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no94" name="no9" value="1" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no94">약간 쉽게 느낀다.</label></td>
                    </tr>
                    <tr class="bBottom">
                        <td>5.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no95" name="no9" value="0" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no95">매우 쉽게 느낀다.</label></td>
                        <td></td>
                        <td class="txt-left txtIn40 bRight-none"></td>
                    </tr>
                </tbody>
            </table>
            <table class="table table-condensed">
                <caption>대인관계변화척도</caption>
                <colgroup>
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col" colspan="4" class="txt-left txtIn20 bgG bRight-none">10. 다른 사람에 대한 나의 감수성은</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no101" name="no10" value="4" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no101">매우 느리다.</label></td>
                        <td>2.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no102" name="no10" value="3" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no102">약간 느리다.</label></td>
                    </tr>
                    <tr>
                        <td>3.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no103" name="no10" value="2" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no103">그저 그렇다.</label></td>
                        <td>4.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no104" name="no10" value="1" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no104">약간 빠르다.</label></td>
                    </tr>
                    <tr class="bBottom">
                        <td>5.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no105" name="no10" value="0" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no105">매우 빠르다.</label></td>
                        <td></td>
                        <td class="txt-left txtIn40 bRight-none"></td>
                    </tr>
                </tbody>
            </table>
            <table class="table table-condensed">
                <caption>대인관계변화척도</caption>
                <colgroup>
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col" colspan="4" class="txt-left txtIn20 bgG bRight-none">11. 다른 삶에 대한 나의 온정적인 태도는</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no111" name="no11" value="4" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no111">매우 적다.</label></td>
                        <td>2.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no112" name="no11" value="3" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no112">약간 적다.</label></td>
                    </tr>
                    <tr>
                        <td>3.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no113" name="no11" value="32" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no113">그저 그렇다.</label></td>
                        <td>4.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no114" name="no11" value="1" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no114">약간 많다.</label></td>
                    </tr>
                    <tr class="bBottom">
                        <td>5.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no115" name="no11" value="0" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no115">매우 많다.</label></td>
                        <td></td>
                        <td class="txt-left txtIn40 bRight-none"></td>
                    </tr>
                </tbody>
            </table>
            <table class="table table-condensed">
                <caption>대인관계변화척도</caption>
                <colgroup>
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col" colspan="4" class="txt-left txtIn20 bgG bRight-none">12. 다른 사람에 대한 나의 표현이나 개방성 정도는</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no121" name="no12" value="4" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no121">매우 적다.</label></td>
                        <td>2.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no122" name="no12" value="3" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no122">약간 적다.</label></td>
                    </tr>
                    <tr>
                        <td>3.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no123" name="no12" value="2" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no123">그저 그렇다.</label></td>
                        <td>4.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no124" name="no12" value="1" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no124">약간 많다.</label></td>
                    </tr>
                    <tr class="bBottom">
                        <td>5.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no125" name="no12" value="0" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no125">매우 많다.</label></td>
                        <td></td>
                        <td class="txt-left txtIn40 bRight-none"></td>
                    </tr>
                </tbody>
            </table>
            <table class="table table-condensed">
                <caption>대인관계변화척도</caption>
                <colgroup>
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col" colspan="4" class="txt-left txtIn20 bgG bRight-none">13. 나는 다른 사람의 느낌을 이해하는 것이</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no131" name="no13" value="4" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no131">매우 어렵다.</label></td>
                        <td>2.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no132" name="no13" value="3" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no132">약간 어렵다.</label></td>
                    </tr>
                    <tr>
                        <td>3.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no133" name="no13" value="2" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no133">그저 그렇다.</label></td>
                        <td>4.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no134" name="no13" value="1" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no134">약간 쉽다.</label></td>
                    </tr>
                    <tr class="bBottom">
                        <td>5.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no135" name="no13" value="0" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no135">매우 쉽다.</label></td>
                        <td></td>
                        <td class="txt-left txtIn40 bRight-none"></td>
                    </tr>
                </tbody>
            </table>
            <table class="table table-condensed">
                <caption>대인관계변화척도</caption>
                <colgroup>
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col" colspan="4" class="txt-left txtIn20 bgG bRight-none">14. 나는 다른 사람의 이야기를 듣는 것이</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no141" name="no14" value="4" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no141">매우 어렵다.</label></td>
                        <td>2.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no142" name="no14" value="3" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no142">약간 어렵다.</label></td>
                    </tr>
                    <tr>
                        <td>3.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no143" name="no14" value="2" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no143">그저 그렇다.</label></td>
                        <td>4.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no144" name="no14" value="1" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no144">약간 쉽다.</label></td>
                    </tr>
                    <tr class="bBottom">
                        <td>5.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no145" name="no14" value="0" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no145">매우 쉽다.</label></td>
                        <td></td>
                        <td class="txt-left txtIn40 bRight-none"></td>
                    </tr>
                </tbody>
            </table>
            <table class="table table-condensed">
                <caption>대인관계변화척도</caption>
                <colgroup>
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col" colspan="4" class="txt-left txtIn20 bgG bRight-none">15. 나는 다른 사람을</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no151" name="no15" value="4" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no151">거의 믿지 않는다.</label></td>
                        <td>2.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no152" name="no15" value="3" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no152">약간 믿지 않는 편이다.</label></td>
                    </tr>
                    <tr>
                        <td>3.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no153" name="no15" value="2" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no153">그저 그렇다.</label></td>
                        <td>4.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no154" name="no15" value="1" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no154">약간 믿는다.</label></td>
                    </tr>
                    <tr class="bBottom">
                        <td>5.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no155" name="no15" value="0" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no155">매우 믿는다.</label></td>
                        <td></td>
                        <td class="txt-left txtIn40 bRight-none"></td>
                    </tr>
                </tbody>
            </table>
            <table class="table table-condensed">
                <caption>대인관계변화척도</caption>
                <colgroup>
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col" colspan="4" class="txt-left txtIn20 bgG bRight-none">16. 나는 다른 사람에 대하여</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no161" name="no16" value="4" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no161">매우 거리감을 느낀다.</label></td>
                        <td>2.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no162" name="no16" value="3" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no162">약간 거리감을 느낀다.</label></td>
                    </tr>
                    <tr>
                        <td>3.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no163" name="no16" value="2" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no163">그저 그렇다.</label></td>
                        <td>4.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no164" name="no16" value="1" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no164">약간 친근감을 느낀다.</label></td>
                    </tr>
                    <tr class="bBottom">
                        <td>5.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no165" name="no16" value="0" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no165">매우 친근감을 느낀다.</label></td>
                        <td></td>
                        <td class="txt-left txtIn40 bRight-none"></td>
                    </tr>
                </tbody>
            </table>
            <table class="table table-condensed">
                <caption>대인관계변화척도</caption>
                <colgroup>
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col" colspan="4" class="txt-left txtIn20 bgG bRight-none">17. 나는 인간관계(사람들과 만나는데) 있어서 자신감이</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no171" name="no17" value="4" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no171">매우 적다.</label></td>
                        <td>2.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no172" name="no17" value="3" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no172">약간 적다.</label></td>
                    </tr>
                    <tr>
                        <td>3.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no173" name="no17" value="2" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no173">그저 그렇다.</label></td>
                        <td>4.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no174" name="no17" value="1" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no174">약간 많다.</label></td>
                    </tr>
                    <tr class="bBottom">
                        <td>5.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no175" name="no17" value="0" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no175">매우 많다.</label></td>
                        <td></td>
                        <td class="txt-left txtIn40 bRight-none"></td>
                    </tr>
                </tbody>
            </table>
            <table class="table table-condensed">
                <caption>대인관계변화척도</caption>
                <colgroup>
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col" colspan="4" class="txt-left txtIn20 bgG bRight-none">
                            18. 나는 다른 사람과 의견이 맞지 않을 경우 그것을 건설적으로(좋게)
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no181" name="no18" value="4" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no181">매우 못 다룬다.</label></td>
                        <td>2.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no182" name="no18" value="3" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no182">약간 못 다룬다.</label></td>
                    </tr>
                    <tr>
                        <td>3.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no183" name="no18" value="2" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no183">그저 그렇다.</label></td>
                        <td>4.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no184" name="no18" value="1" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no184">약간 잘 다룬다.</label></td>
                    </tr>
                    <tr class="bBottom">
                        <td>5.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no185" name="no18" value="0" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no185">매우 잘 다룬다.</label></td>
                        <td></td>
                        <td class="txt-left txtIn40 bRight-none"></td>
                    </tr>
                </tbody>
            </table>
            <table class="table table-condensed">
                <caption>대인관계변화척도</caption>
                <colgroup>
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col" colspan="4" class="txt-left txtIn20 bgG bRight-none">19. 나는 다른 사람과 이야기를 할 경우 어려움을</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no191" name="no19" value="4" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no191">매우 많이 느낀다.</label></td>
                        <td>2.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no192" name="no19" value="3" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no192">약간 많이 느낀다.</label></td>
                    </tr>
                    <tr>
                        <td>3.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no193" name="no19" value="2" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no193">그저 그렇다.</label></td>
                        <td>4.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no194" name="no19" value="1" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no194">약간 안 느낀다.</label></td>
                    </tr>
                    <tr class="bBottom">
                        <td>5.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no195" name="no19" value="0" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no195">거의 안 느낀다.</label></td>
                        <td></td>
                        <td class="txt-left txtIn40 bRight-none"></td>
                    </tr>
                </tbody>
            </table>
            <table class="table table-condensed">
                <caption>대인관계변화척도</caption>
                <colgroup>
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col" colspan="4" class="txt-left txtIn20 bgG bRight-none">20. 나는 다른 사람에 대한 긍정적인 느낌을</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no201" name="no20" value="4" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no201">거의 표현하지 못한다.</label></td>
                        <td>2.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no202" name="no20" value="3" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no202">약간 많이 느낀다.</label></td>
                    </tr>
                    <tr>
                        <td>3.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no203" name="no20" value="2" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no203">그저 그렇다.</label></td>
                        <td>4.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no204" name="no20" value="1" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no204">약간 안 느낀다.</label></td>
                    </tr>
                    <tr class="bBottom">
                        <td>5.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no205" name="no20" value="0" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no205">거의 안 느낀다.</label></td>
                        <td></td>
                        <td class="txt-left txtIn40 bRight-none"></td>
                    </tr>
                </tbody>
            </table>
            <table class="table table-condensed">
                <caption>대인관계변화척도</caption>
                <colgroup>
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col" colspan="4" class="txt-left txtIn20 bgG bRight-none">21. 나는 다른 사람에 대한 부정적인 느낌을 (건설적으로)</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no211" name="no21" value="4" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no211">거의 표현하지 못한다.</label></td>
                        <td>2.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no212" name="no21" value="3" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no212">약간 많이 느낀다.</label></td>
                    </tr>
                    <tr>
                        <td>3.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no213" name="no21" value="2" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no213">그저 그렇다.</label></td>
                        <td>4.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no214" name="no21" value="1" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no214">약간 안 느낀다.</label></td>
                    </tr>
                    <tr class="bBottom">
                        <td>5.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no215" name="no21" value="0" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no215">거의 안 느낀다.</label></td>
                        <td></td>
                        <td class="txt-left txtIn40 bRight-none"></td>
                    </tr>
                </tbody>
            </table>
            <table class="table table-condensed">
                <caption>대인관계변화척도</caption>
                <colgroup>
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col" colspan="4" class="txt-left txtIn20 bgG bRight-none">22. 나는 나의 개인적인 관심사에 대하여 다른 사람들과</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no221" name="no22" value="4" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no221">거의 나누지 않는다.</label></td>
                        <td>2.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no222" name="no22" value="3" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no222">약간 나누지 않는다.</label></td>
                    </tr>
                    <tr>
                        <td>3.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no223" name="no22" value="2" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no223">그저 그렇다.</label></td>
                        <td>4.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no224" name="no22" value="1" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no224">약간 나눈다.</label></td>
                    </tr>
                    <tr class="bBottom">
                        <td>5.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no225" name="no22" value="0" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no225">매우 나눈다.</label></td>
                        <td></td>
                        <td class="txt-left txtIn40 bRight-none"></td>
                    </tr>
                </tbody>
            </table>
            <table class="table table-condensed">
                <caption>대인관계변화척도</caption>
                <colgroup>
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col" colspan="4" class="txt-left txtIn20 bgG bRight-none">
                            23. 다른 사람이 나에 대한 느낌을 표현할 경우 그것을 믿고 받아들이는 정도는
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no231" name="no23" value="4" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no231">매우 적다.</label></td>
                        <td>2.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no232" name="no23" value="3" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no232">약간 적다.</label></td>
                    </tr>
                    <tr>
                        <td>3.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no233" name="no23" value="2" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no233">그저 그렇다.</label></td>
                        <td>4.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no234" name="no23" value="1" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no234">약간 많다.</label></td>
                    </tr>
                    <tr class="bBottom">
                        <td>5.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no235" name="no23" value="0" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no235">매우 많다.</label></td>
                        <td></td>
                        <td class="txt-left txtIn40 bRight-none"></td>
                    </tr>
                </tbody>
            </table>
            <table class="table table-condensed">
                <caption>대인관계변화척도</caption>
                <colgroup>
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col" colspan="4" class="txt-left txtIn20 bgG bRight-none">
                            24. 다른 사람이 나에 대한 부정적인 느낌을 표현할 때 내가 건설적으로 대하는 정도
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no241" name="no24" value="4" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no241">매우 적다.</label></td>
                        <td>2.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no242" name="no24" value="3" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no242">약간 적다.</label></td>
                    </tr>
                    <tr>
                        <td>3.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no243" name="no24" value="2" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no243">그저 그렇다.</label></td>
                        <td>4.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no244" name="no24" value="1" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no244">약간 많다.</label></td>
                    </tr>
                    <tr class="bBottom">
                        <td>5.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no245" name="no24" value="0" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no245">매우 많다.</label></td>
                        <td></td>
                        <td class="txt-left txtIn40 bRight-none"></td>
                    </tr>
                </tbody>
            </table>
            <table class="table table-condensed">
                <caption>대인관계변화척도</caption>
                <colgroup>
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col" colspan="4" class="txt-left txtIn20 bgG bRight-none">25. 나는 다른 사람과 앞으로 대인관계를 어떻게 해야 할 지를</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no251" name="no25" value="4" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no251">거의 이해하지 못한다.</label></td>
                        <td>2.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no252" name="no25" value="3" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no252">약간 이해하지 못한다.</label></td>
                    </tr>
                    <tr>
                        <td>3.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no253" name="no25" value="2" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no253">그저 그렇다.</label></td>
                        <td>4.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no254" name="no25" value="1" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no254">약간 잘 이해한다.</label></td>
                    </tr>
                    <tr class="bBottom">
                        <td>5.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no255" name="no25" value="0" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no255">매우 잘 이해한다.</label></td>
                        <td></td>
                        <td class="txt-left txtIn40 bRight-none"></td>
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