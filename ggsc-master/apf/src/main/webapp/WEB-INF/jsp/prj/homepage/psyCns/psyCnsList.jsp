<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>    
  <script>
	  $(document).ready(function() {
		  $('input:radio[name=gender]:input[value="${vo.gender}"]').attr("checked", true);
		  $("#cnsleNm").val("${vo.cnsleNm}");
		  $("#telNo").val("${vo.telNo}");
	  });

	  function fn_reg() {
		  var total = 0;
		  var sumCnt = $("#sumCnt").val();
		  if(sumCnt != "") {
			  if(confirm("자가진단을 다시 하시겠습니까?")){
				  location.href="/gnoincoun/psyDukeDoc.do";
				  return false;
			  }
			  return false;
		  }
		  if(confirm("자가진단 작성을 완료하셨습니까?")){
		    var no;
		    for(i=1; i<8; i++) {
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
					alert("DUKE-AD 심리검사 결과 점수는"+total+"점 입니다.");
				},
				error : function(e) {
					alert("서버와 통신 오류입니다.");
				}
			});
		  }
		}
	  
	  function fn_move(url) {
		  var loginYn = "${loginYn}";
		  if(loginYn == "Y") {
			  location.href=url;			  
		  } else if(loginYn == "N") {
			  alert("로그인 후에 간편한 심리검사를 하실 수 있습니다.");
			  // location.href="/login.do";
		  }
	  }
	  
  </script>
<style>
	#wrap {width: 50%; margin: auto; height: 594px;}
</style>
<section class="service-2 section">
	<div id="wrap">
        <h2 class="title">간편한 심리검사</h2>
	  	<div class="quick-question">
        <ul>
          <li class="col-xs-12 col-sm-6 col-md-6">
            <h2 class="title">듀크 불안-우울 척도</h2>
            <a href="javascript:fn_move('/gnoincoun/psyDukeDoc.do')" class="btn btn-default btn-sm">바로가기<i class="fa fa-caret-right ml5"></i></a>
          </li>
          <li class="col-xs-12 col-sm-6 col-md-6">
            <h2 class="title">노인우울 및 자살사고 척도</h2>
            <a href="javascript:fn_move('/gnoincoun/psyGdsDoc.do')" class="btn btn-default btn-sm">바로가기<i class="fa fa-caret-right ml5"></i></a>
          </li>
          <li class="col-xs-12 col-sm-6 col-md-4">
            <h2 class="title">불안척도</h2>
            <a href="javascript:fn_move('/gnoincoun/psyAnxiDoc.do')" class="btn btn-default btn-sm">바로가기<i class="fa fa-caret-right ml5"></i></a>
          </li>
          <li class="col-xs-12 col-sm-6 col-md-4">
            <h2 class="title">스트레스척도</h2>
            <a href="javascript:fn_move('/gnoincoun/psyStressDoc.do')" class="btn btn-default btn-sm">바로가기<i class="fa fa-caret-right ml5"></i></a>
          </li>
          <li class="col-xs-12 col-sm-6 col-md-4">
            <h2 class="title">사별스트레스척도</h2>
            <a href="javascript:fn_move('/gnoincoun/psyBereavDoc.do')" class="btn btn-default btn-sm">바로가기<i class="fa fa-caret-right ml5"></i></a>
          </li>
        </ul>
      </div>
	</div>
</section> <!-- End section -->