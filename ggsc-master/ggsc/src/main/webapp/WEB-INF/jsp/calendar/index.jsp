<%@ page import="egovframework.rte.psl.dataaccess.util.EgovMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today"/>

<link type="text/css" rel="stylesheet" href="/css/calendar2/main.css"/>
<script src='/gnoincoundb/js/calendar2/main.js'></script>
<script src='/gnoincoundb/js/calendar2/locales/ko.js'></script>
<script>
var calendar, calendarItems;
$(function(){
	var calendarEl = document.getElementById('calendar');
    calendar = new FullCalendar.Calendar(calendarEl, {
      locale : 'ko',
      headerToolbar: {
        left: 'prevYear,prev,next,nextYear today',
        center: 'title',
        right: 'dayGridMonth,dayGridWeek,dayGridDay'
      },
      initialDate: '<c:out value="${today}"/>',
      navLinks: true, // can click day/week names to navigate views
      editable: true,
      dayMaxEvents: true, // allow "more" link when too many events
      events: [],
      dateClick: function(e) {
    	    $("#popup").show();
    	    $(".btn-calendar-delete").hide();
    	    setCalendarForm(0,'','',e.dateStr,'00:00',e.dateStr,'00:00','','','101');
      },
      eventClick : function(e){
    	  var id = e.event.id;
    	  $("#popup").show();
    	  $(".btn-calendar-delete").show();
    	  var obj = calendarItems[calendarItems.findIndex(e=>e.num==id)];
    	  setCalendarForm(obj.num,obj.cFlag,obj.cTitle,obj.cStartdate,obj.cStarttime,obj.cEnddate,obj.cEndtime,obj.cContent,obj.userNm,obj.cRoom);
      }
    });

    calendar.render();
    
    getEvents();
    
});

$(document).on('click','body',function(e){
	var ele = e.target;
	if(!$(ele).is("#popup-content") && $(ele).parents("#popup-content").length == 0 && $(ele).parents(".fc-daygrid-day-events").length == 0){
		$("#popup").hide();
	}
});

$(document).on('click','.btn-calendar-proc',function(){
	var token = $("meta[name='_csrf']").attr("th:content");
	var header = $("meta[name='_csrf_header']").attr("th:content");
	var frm = document.calendarForm;
	if(frm.c_title.value.length < 1){
		alert('[제목]을 입력해주세요.');
		return false; 
	}
	
	if (!isValidDate(frm.c_startdate.value)){
	    alert('[시작 일자] 형식이 옳지 않습니다.');
	    return false;
	}else if(!isValidDate(frm.c_enddate.value)){
	    alert('[종료 일자] 형식이 옳지 않습니다.');
	    return false;
	}
	
	var timeFormat = /^([01][0-9]|2[0-3]):([0-5][0-9])$/; // 시간형식 체크 정규화 hh:mm
	if(!timeFormat.test(frm.c_starttime.value)){
		frm.c_starttime.value = "00:00";
	}
	if(!timeFormat.test(frm.c_endtime.value)){
		frm.c_endtime.value = "00:00";
	}
	
	if(frm.c_starttime.value == frm.c_endtime.value){
		 alert('[시작 시간]과 [종료 시간]이 같을 수 없습니다.');
		 return false;
	}
	
	frm.c_flag.checked = true;
	frm.c_enddate.value = frm.c_startdate.value;
	
	
	
	$.ajax({
		  url : "/gnoincoundb/set_calendar_ajax.do",
		  type : "post",
		  data : $(frm).serialize(),
		  dataType : "json",
		  beforeSend : function(xhr){
			xhr.setRequestHeader(header, token);
		  }
	  }).done(function(e){
		  if(e.result){
			alert('등록(수정) 이 완료되었습니다.');  
		  }else{
			alert('오류가 발생하였습니다.\r\n' + e.resultMessage);  
		  }
		  
		  $("#popup").hide();
		  getEvents();
	  }).fail(function(e){
		 alert('서버 오류로 캘린더 등록(수정)에 실패하였습니다. ');  
	  });
});

$(document).on('click','.btn-calendar-delete',function(){
	var token = $("meta[name='_csrf']").attr("th:content");
	var header = $("meta[name='_csrf_header']").attr("th:content");
	var frm = document.calendarForm;
	if(confirm('정말 일정을 삭제하시겠습니까?')){
		$.ajax({
			  url : "/gnoincoundb/del_calendar_ajax.do",
			  type : "post",
			  data : $(frm).serialize(),
			  dataType : "json",
			  beforeSend : function(xhr){
				xhr.setRequestHeader(header, token);
			  }
		  }).done(function(e){
			  alert('삭제 처리가 완료되었습니다.');
			  $("#popup").hide();
			  getEvents();
		  }).fail(function(e){
			 alert('서버 오류로 캘린더 삭제에 실패하였습니다. ');  
		  });
	}
});

$(document).on('change','#cFlag',function(e){
	//setFlag($(this).prop("checked"));
	setFlag(true);
});

function setFlag(checked){
	var frm = document.calendarForm;
	if(!frm){
		alert('달력 엘리먼트가 존재하지 않습니다.');
		return false;
	}
	
	if(checked){
		frm.c_starttime.readOnly = false;
		frm.c_endtime.readOnly = false;
	}else{
		frm.c_starttime.readOnly = true;
		frm.c_endtime.readOnly = true;
	}
}

function setCalendarForm(id, cFlag, cTitle, cStartdate, cStarttime, cEnddate, cEndtime, cContent, userNm, cRoom){
	var frm = document.calendarForm;
	if(!frm){
		alert('달력 엘리먼트가 존재하지 않습니다.');
		return false;
	}
	
	frm.num.value = id;
	frm.c_title.value = cTitle;
	frm.c_startdate.value = cStartdate;
	frm.c_starttime.value = cStarttime;
	frm.c_enddate.value = cEnddate;
	frm.c_endtime.value = cEndtime;
	frm.c_content.value = cContent;
	frm.c_room.value = cRoom;
	
	/*
	if(cFlag=='T'){
		frm.c_flag.checked = true;
	}else{
		frm.c_flag.checked = false;
	}
	setFlag(frm.c_flag.checked);
	*/

	if(userNm.length > 1){
		$("#userNm").text("작성자 : " + userNm);
	}else{$("#userNm").text(''); }
	
	
}

 function getEvents(){
  var token = $("meta[name='_csrf']").attr("th:content");
  var header = $("meta[name='_csrf_header']").attr("th:content");
	
  var date = calendar.getDate().getFullYear() + '-' + ( (calendar.getDate().getMonth()+1)<9 ? '0' + (calendar.getDate().getMonth()+1) : (calendar.getDate().getMonth()+1) ) + '-' + '01';
  $.ajax({
	  url : "/gnoincoundb/get_calendar_list_ajax.do",
	  type : "post",
	  data : { schDate : date, NUM : 0},
	  dataType : "json",
	  beforeSend : function(xhr){
		xhr.setRequestHeader(header, token);
	  }
  }).done(function(e){
	  calendar.removeAllEvents();
	  calendarItems = [];
	  var data = e.list;
	  for(var i=0;i<data.length;i++){
		  var d = data[i];
		  var obj = {};
		  obj.id = d.num;
		  obj.title = "[" + d.cRoom + "] " + d.cTitle;
		  obj.start = d.cStartdate;
		  if(d.cStartdate != d.cEnddate){
			  obj.end = d.cEnddate;
		  }
		  if(d.cFlag=='T'){
			  obj.start = d.cStartdate + 'T' + d.cStarttime;
			  if(d.cStartdate != d.cEnddate){ obj.end = d.cEnddate + 'T' + d.cEndtime; }
		  }
		  
		  calendarItems.push(d);
		  
		  calendar.addEvent(obj);
	  }
	  
  }).fail(function(e){
	alert('서버 오류로 캘린더를 불러올 수 없습니다.');  
  });
 
 }
 function isValidDate(param) {
     try
     {
         param = param.replace(/-/g,'');

         // 자리수가 맞지않을때
         if( isNaN(param) || param.length!=8 ) {
             return false;
         }
          
         var year = Number(param.substring(0, 4));
         var month = Number(param.substring(4, 6));
         var day = Number(param.substring(6, 8));

         var dd = day / 0;

          
         if( month<1 || month>12 ) {
             return false;
         }
          
         var maxDaysInMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
         var maxDay = maxDaysInMonth[month-1];
          
         // 윤년 체크
         if( month==2 && ( year%4==0 && year%100!=0 || year%400==0 ) ) {
             maxDay = 29;
         }
          
         if( day<=0 || day>maxDay ) {
             return false;
         }
         return true;

     }catch (err) {
         return false;
     }                      
 }
</script>
<style>
div, p, span, td, th { color:inherit }


  #calendar {
    max-width: 1300px;
    margin: 0 auto;
    font-size:.9em;
  }

#popup {position:absolute;z-index: 999999999999999999999999999999990;flex:1;display:flex;background-color:rgba(0,0,0,0.5);width: 100%;height: 100%;left: 0;top: 0; display:none}
#popup > div { position:relative; width:100%; height:100%;}
#popup > div > #popup-content { position:absolute; left:50%; top:50%; transform:translate(-50%,-50%); width:550px; height:410px; background-color:#fff; border-radius:10px; }
#popup > div > #popup-content > #popup-calendar-subject { width:100%;  text-align:center; padding:20px; font-weight:bold; background-color:#eee; border-top-left-radius:10px; border-top-right-radius:10px; position:relative;  }
.d-flex { display:Flex; flex-direction:column; }
.calendar-row { flex:1; display:flex; padding:10px 20px; }
.calendar-row > .s { width:100px; font-weight:bold; text-align:center;  }
.calendar-row > .c { flex:1 }
#popup > div > #popup-content > #popup-calendar-content input {background-color:#fff;border:1px solid #eee;padding:10px 5px;font-size: 12px;height: 30px;}
#popup > div > #popup-content > #popup-calendar-content input[readonly] { background-color:#eee; }
.btn-calendar-delete { display:none }
#userNm { float:right; font-size:.9em; letter-spacing:-1px; }
</style>
<div id="popup"><div><div id="popup-content">
	<div id='popup-calendar-subject'>일정 등록(수정)<span id='userNm'></span></div>
	<div id='popup-calendar-content'>
		<form name='calendarForm'>
			<input type='hidden' name='num' />
			<input type='hidden' id='cFlag' name='c_flag' value='T'>
			<div class='d-flex'>
				<div class='calendar-row'>
					<div class='s'>제목</div>
					<div class='c'><input type='text' name='c_title' maxlength=100></div>
					<!--  <div class='s'><input type='checkbox' id='cFlag' name='c_flag' value='T'>&nbsp;&nbsp;시간 사용</div>-->
				</div>
				<div class='calendar-row'>
					<div class='s'>시작일자</div>
					<div class='c'><input type='text' name='c_startdate' maxlength=10 /></div>
					<div class='s'>시작시간</div>
					<div class='c'><input type='text' name='c_starttime' maxlength=10 /></div>
				</div>
				<div class='calendar-row'>
					<div class='s'>호실</div>
					<div class='c'><select name='c_room'>
									<option value='101' >101호</option>
									<option value='102'>102호</option>
									<option value='103'>103호</option>
									<option value='104'>104호</option>
									</select>
									
								<input type='text' name='c_enddate' maxlength=10 readOnly style='display:none'/></div>
					<div class='s'>종료시간</div>
					<div class='c'><input type='text' name='c_endtime' maxlength=10  /></div>
				</div>
				
				<div class='calendar-row'>
					<div class='s'>내용</div>
					<div class='c'><textarea name='c_content'></textarea></div>
				</div>
				<div class='calendar-row'>
					<div class='c' style='margin:0 10px'>
						<button type='button' class='btn btn-primary form-control btn-calendar-proc'>등록</button>					
					</div>
					<div class='c' style='margin:0 10px'>
						<button type='button' class='btn btn-danger form-control' onClick="$('#popup').hide()">닫기</button>
					</div>
					<div class='c' style='margin:0 10px'>
						<button type='button' class='btn btn-danger form-control btn-calendar-delete'>삭제</button>
					</div>
				</div>
			</div>
		</form>
	</div>
</div></div></div>
<section id="content">
	<div id='calendar'></div>
</section>
