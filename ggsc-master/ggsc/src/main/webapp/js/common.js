var GV_USER_LIST = {};

$(document).ready(function(){

	// mobile menu toggling
	$("#menu-icon").click(function(){
		$("#left-box").toggleClass("leftmenu-hide");
		$("#container").toggleClass("container-hide");
		return false;
	});

	$("#menu-icon-mobile").click(function(){
		$("#left-box").toggleClass("leftmenu-view");
		$("#container").toggleClass("container-view");
		return false;
	});

	//부서 초기화 버튼 클릭 이벤트
	$('#clearSchBtn').click(function() {
		/*$('select').each(function() {
			$(this).find('option:first').attr('selected', 'true');
		});*/

		//상위부서, 부서 초기화
		$("#schDeptId1").find('option:first').attr('selected', 'true');
		$("#schDeptId2 option").not("[value='']").remove();
		$("#schDeptId3 option").not("[value='']").remove();

		$("#schUserId").val("");	//근무자 아이디 초기화
		$("#schUserName").val("");	//근무자 이름 초기화

		//근무자 레이어 숨김
		$('#layer-popup-place').hide();
	});

	/**근무자 레이어 포커스 아웃*/
	/*$('#schUserDiv, #layer-popup-place').focusout(function(e){
		$('#layer-popup-place').hide();
	});*/
});
	/*curCSS에러 버그*/
	jQuery.curCSS = jQuery.css;

	// ���ڵ�� �޴�
	jQuery(document).ready(function () {
		jQuery("#jquery-accordion-menu").jqueryAccordionMenu();

	});

	$(function(){
		$("#demo-list li").click(function(){
			$("#demo-list li.active").removeClass("active")
			$(this).addClass("active");
		})
	});

	// datepicker
	  $( function() {
			$( "#datepicker1" ).datepicker({
			  showOn: "button",
			  buttonImage: "/gnoincoundb/images/calendar.gif",
			  buttonImageOnly: true,
			  buttonText: "Select date",
			  showMonthAfterYear: true ,
			  dateFormat: 'yy.mm.dd',
			  monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			  dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
			  changeYear: true,
			  changeMonth: true,
			  beforeShowDay: function(date){
				  var day = date.getDay();
				  if(day != 1 && day != 2 && day != 3 && day != 4 && day != 5 && day != 0){			//토요일
					  return [true, "Highlighted_sat", ''];
				  }else if(day != 1 && day != 2 && day != 3 && day != 4 && day != 5 && day != 6){	//일요일
					  return [true, "Highlighted_sun", ''];
				  }
				  return [true, '', ''];
			  }
			});
	  } );

	  $( function() {
			$( "#datepicker2" ).datepicker({
			  showOn: "button",
			  buttonImage: "/gnoincoundb/images/calendar.gif",
			  buttonImageOnly: true,
			  buttonText: "Select date",
			  showMonthAfterYear: true ,
			  dateFormat: 'yy.mm.dd',
			  monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			  dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
			  changeYear: true,
			  changeMonth: true,
			  beforeShowDay: function(date){
				  var day = date.getDay();
				  if(day != 1 && day != 2 && day != 3 && day != 4 && day != 5 && day != 0){			//토요일
					  return [true, "Highlighted_sat", ''];
				  }else if(day != 1 && day != 2 && day != 3 && day != 4 && day != 5 && day != 6){	//일요일
					  return [true, "Highlighted_sun", ''];
				  }
				  return [true, '', ''];
			  }
			});
	  } );

	 $( function() {
			$( "#datepicker3" ).datepicker({
			  showOn: "button",
			  buttonImage: "/gnoincoundb/images/calendar.gif",
			  buttonImageOnly: true,
			  buttonText: "Select date",
			  showMonthAfterYear: true ,
			  dateFormat: 'yy.mm.dd',
			  monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			  ddayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
			  changeYear: true,
			  changeMonth: true,
			  beforeShowDay: function(date){
				  var day = date.getDay();
				  if(day != 1 && day != 2 && day != 3 && day != 4 && day != 5 && day != 0){			//토요일
					  return [true, "Highlighted_sat", ''];
				  }else if(day != 1 && day != 2 && day != 3 && day != 4 && day != 5 && day != 6){	//일요일
					  return [true, "Highlighted_sun", ''];
				  }
				  return [true, '', ''];
			  }
			});
	  } );

    $( function() {
	  	$( "#datepicker4" ).datepicker({
	  	  showOn: "button",
	  	  buttonImage: "/gnoincoundb/images/calendar.gif",
	  	  buttonImageOnly: true,
	  	  buttonText: "Select date",
	  	  showMonthAfterYear: true ,
	  	  dateFormat: 'yy.mm.dd',
	  	  monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	  	  dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	  	  changeYear: true,
	  	  changeMonth: true,
		  beforeShowDay: function(date){
			  var day = date.getDay();
			  if(day != 1 && day != 2 && day != 3 && day != 4 && day != 5 && day != 0){			//토요일
				  return [true, "Highlighted_sat", ''];
			  }else if(day != 1 && day != 2 && day != 3 && day != 4 && day != 5 && day != 6){	//일요일
				  return [true, "Highlighted_sun", ''];
			  }
			  return [true, '', ''];
		  }
	  	});
    } );
    
	// datepicker
	  $( function() {
			$( "#datepicker5" ).datepicker({
			  showOn: "button",
			  buttonImage: "/gnoincoundb/images/calendar.gif",
			  buttonImageOnly: true,
			  buttonText: "Select date",
			  showMonthAfterYear: true ,
			  dateFormat: 'yy.mm.dd',
			  monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			  dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
			  changeYear: true,
			  changeMonth: true,
			  beforeShowDay: function(date){
				  var day = date.getDay();
				  if(day != 1 && day != 2 && day != 3 && day != 4 && day != 5 && day != 0){			//토요일
					  return [true, "Highlighted_sat", ''];
				  }else if(day != 1 && day != 2 && day != 3 && day != 4 && day != 5 && day != 6){	//일요일
					  return [true, "Highlighted_sun", ''];
				  }
				  return [true, '', ''];
			  }
			});
	  } );
	  
		// datepicker
	  $( function() {
			$( "#datepicker6" ).datepicker({
			  showOn: "button",
			  buttonImage: "/gnoincoundb/images/calendar.gif",
			  buttonImageOnly: true,
			  buttonText: "Select date",
			  showMonthAfterYear: true ,
			  dateFormat: 'yy.mm.dd',
			  monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			  dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
			  changeYear: true,
			  changeMonth: true,
			  beforeShowDay: function(date){
				  var day = date.getDay();
				  if(day != 1 && day != 2 && day != 3 && day != 4 && day != 5 && day != 0){			//토요일
					  return [true, "Highlighted_sat", ''];
				  }else if(day != 1 && day != 2 && day != 3 && day != 4 && day != 5 && day != 6){	//일요일
					  return [true, "Highlighted_sun", ''];
				  }
				  return [true, '', ''];
			  }
			});
	  } );
	  
		// datepicker
	  $( function() {
			$( "#datepicker7" ).datepicker({
			  showOn: "button",
			  buttonImage: "/gnoincoundb/images/calendar.gif",
			  buttonImageOnly: true,
			  buttonText: "Select date",
			  showMonthAfterYear: true ,
			  dateFormat: 'yy.mm.dd',
			  monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			  dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
			  changeYear: true,
			  changeMonth: true,
			  beforeShowDay: function(date){
				  var day = date.getDay();
				  if(day != 1 && day != 2 && day != 3 && day != 4 && day != 5 && day != 0){			//토요일
					  return [true, "Highlighted_sat", ''];
				  }else if(day != 1 && day != 2 && day != 3 && day != 4 && day != 5 && day != 6){	//일요일
					  return [true, "Highlighted_sun", ''];
				  }
				  return [true, '', ''];
			  }
			});
	  } );
	  
		// datepicker
	  $( function() {
			$( "#datepicker8" ).datepicker({
			  showOn: "button",
			  buttonImage: "/gnoincoundb/images/calendar.gif",
			  buttonImageOnly: true,
			  buttonText: "Select date",
			  showMonthAfterYear: true ,
			  dateFormat: 'yy.mm.dd',
			  monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			  dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
			  changeYear: true,
			  changeMonth: true,
			  beforeShowDay: function(date){
				  var day = date.getDay();
				  if(day != 1 && day != 2 && day != 3 && day != 4 && day != 5 && day != 0){			//토요일
					  return [true, "Highlighted_sat", ''];
				  }else if(day != 1 && day != 2 && day != 3 && day != 4 && day != 5 && day != 6){	//일요일
					  return [true, "Highlighted_sun", ''];
				  }
				  return [true, '', ''];
			  }
			});
	  } );
	  
		// datepicker
	  $( function() {
			$( "#datepicker9" ).datepicker({
			  showOn: "button",
			  buttonImage: "/gnoincoundb/images/calendar.gif",
			  buttonImageOnly: true,
			  buttonText: "Select date",
			  showMonthAfterYear: true ,
			  dateFormat: 'yy.mm.dd',
			  monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			  dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
			  changeYear: true,
			  changeMonth: true,
			  beforeShowDay: function(date){
				  var day = date.getDay();
				  if(day != 1 && day != 2 && day != 3 && day != 4 && day != 5 && day != 0){			//토요일
					  return [true, "Highlighted_sat", ''];
				  }else if(day != 1 && day != 2 && day != 3 && day != 4 && day != 5 && day != 6){	//일요일
					  return [true, "Highlighted_sun", ''];
				  }
				  return [true, '', ''];
			  }
			});
	  } );
    $(function(){
    	$('.input-datepicker1').keypress(function(event) {
    	    if(event.which && (event.which < 48 || event.which > 57) ) {
    	    	event.preventDefault();
    	    }
        }).keyup(function(){
        	if( $(this).val() != null && $(this).val() != '' ) {
        		$(this).val( $(this).val().replace(/[^0-9]/g, '') );
        		$(this).val( addDash($(this).val() ) );
        	}
        });

        $('.input-datepicker2').keypress(function(event) {
    	    if(event.which && (event.which < 48 || event.which > 57) ) {
    	    	event.preventDefault();
    	    }
        }).keyup(function(){
        	if( $(this).val() != null && $(this).val() != '' ) {
        		$(this).val( $(this).val().replace(/[^0-9]/g, '') );
        		$(this).val( addDash($(this).val() ) );
        	}
        });

        /*$('.input-datepicker3').keypress(function(event) {
    	    if(event.which && (event.which < 48 || event.which > 57) ) {
    	    	event.preventDefault();
    	    }
        }).keyup(function(){
        	if( $(this).val() != null && $(this).val() != '' ) {
        		$(this).val( $(this).val().replace(/[^0-9]/g, '') );
        		$(this).val( addDash($(this).val() ) );
        	}
        });*/

       $('.input-datepicker4').keypress(function(event) {
	    if(event.which && (event.which < 48 || event.which > 57) ) {
	    	event.preventDefault();
	    }
	    }).keyup(function(){
	    	if( $(this).val() != null && $(this).val() != '' ) {
	    		$(this).val( $(this).val().replace(/[^0-9]/g, '') );
	    		$(this).val( addDash($(this).val() ) );
	    	}
	    });

    });

    $(document).on('keypress','.input-datepicker3',function(event) {
	    if(event.which && (event.which < 48 || event.which > 57) ) {
	    	event.preventDefault();
	    }
    });

    $(document).on('keyup','.input-datepicker3',function(event) {
    	if( $(this).val() != null && $(this).val() != '' ) {
    		$(this).val( $(this).val().replace(/[^0-9]/g, '') );
    		$(this).val( addDash($(this).val() ) );
    	}
    });

//tabs
  $( function() {
    $( "#tabs" ).tabs();
  } );

  //날짜 키입력 변경시 날짜포맷 세팅
  function dateKeyPressFormat(obj, e){
	if(e.which && ((e.which < 48) || (e.which > 57)) ) {
    	e.preventDefault();
    }

	if( $(obj).val() != null && $(obj).val() != '' ) {
  		$(obj).val( $(obj).val().replace(/[^0-9]/g, '') );
  		$(obj).val( addDash($(obj).val() ) );
	}
  }

  /* - 추가 함수 */
  function addDash(num){
    if(num<10000){
     return num;
    }
       var str;

       num = num + "";

       if(num.length == 5)
       {
         str  = num.substring(0, 4);
         str += ".";
         str += num.substring(4, 5);
       }
       else
       if(num.length == 6)
       {
         str  = num.substring(0, 4);
         str += ".";
         str += num.substring(4, 6);
       }
       else
       if(num.length == 7)
       {
         str  = num.substring(0, 4);
         str += ".";
         str += num.substring(4, 6);
         str += ".";
         str += num.substring(6, 7);
       }
       else
       {
         str  = num.substring(0, 4);
         str += ".";
         str += num.substring(4, 6);
         str += ".";
         str += num.substring(6, 8);
       }

       return str;
   };

  function getScrollBarWidth () {
	  var parent, child, width;

	  if(width===undefined) {
		  parent = $('<div style="width:50px;height:50px;overflow:auto"><div/></div>').appendTo('body');
		  child=parent.children();
		  width=child.innerWidth()-child.height(99).innerWidth();
		  parent.remove();
	  }

	  return width;
  };

  function isNull(obj){
	var rtnFlag = true;

	if (obj == "null" || obj == null || obj == "" || obj == "undefined") {
		rtnFlag = true;
	}else{
		rtnFlag = false;
	}
	return rtnFlag;
  }

  function isNullCheck(obj){
		if (obj == "null" || obj == null || obj == undefined || obj == "undefined") {
			obj = "";
		}
		return obj;
	}

  /**
	 * nvl 기능을 제공한다.
	 * @param str
	 * @param str2
	 * @return
	 */
  function nvl(str, str2) {
      var rtnVal = "";
      if (isNull(str)) {
      	rtnVal = str2;
      } else {
      	rtnVal = str;
      }
      return rtnVal;
  }

  //요일을 구한다.
  function getWeekDay(date){
	  var dateSplit = date.split(".");
	  var getDay = new Date(dateSplit[0]+"-"+dateSplit[1]+"-"+dateSplit[2]);  // ex) 2017-12-30
	  var week = new Array('일', '월', '화', '수', '목', '금', '토');
	  var getWeekDay = week[getDay.getDay()];  // 날짜 기준으로 요일을 구한다.
	  return getWeekDay;
  }

  function screenBlock(flag){
	  if(flag == true){
		  $("#modal_block").css("display", "block");
	  }else{
		  $("#modal_block").css("display", "none");
	  }
  }

  /**
   * 숫자만 입력할수 있게 체크(문자가 들어오면 alert창을 발생)
   * @param loc
   * @return
   */
  function numberCheck(loc){
     if(/[^0123456789]/g.test(loc.value)) {
       alert("숫자만 입력해 주세요.");
       $(loc).val('');
       loc.focus();
     }
   }

  /**
   * 날짜형식인지 검증
   * @param val
   * @returns {Boolean}
   */
  function isValid_Date(val)
	{
	    if(val.replace(/[^(0-9)]/gi, "").length != 8){
	    	return false;
	    }

	    try{
	        $.datepicker.parseDate('yy.mm.dd', val, null);
	        return true;
	    }
	    catch(error){
	        return false;
	    }
	}

  //선택된 입력폼의 사용자 리스트를 가져와서 targetnames 값을 조합
  function getTargetnames(){
	  var targetnames;
	  var keyFinalObjs  = $('input[name=userIdArr]', $("#regForm"));		//선택완료된 사용자 리스트
	  var userNameArr = $('input[name=userNameArr]', $("#regForm"));		//사용자명
	  var deptNameArr = $('input[name=deptNameArr]', $("#regForm"));		//부서명
	  var jicwiNameArr = $('input[name=jicwiNameArr]', $("#regForm"));		//직위명

	  if(keyFinalObjs.length > 1){
		  targetnames = combiUserName(deptNameArr[0].value , jicwiNameArr[0].value, userNameArr[0].value) + " 외 " + (userNameArr.length-1) + "명";
	  }else{
		  targetnames = combiUserName(deptNameArr[0].value , jicwiNameArr[0].value, userNameArr[0].value);
	  }

	  return targetnames;
  }

  //이름,직위,부서명을 조합
  function combiUserName(reqDeptName, reqPosName, reqUserName){
		var wPos = reqPosName;
	    var wDept = reqDeptName;

	    if (!isNull(wPos)) wPos = " " + wPos;
	    if (!isNull(wDept)) wDept = " (" + wDept + ")";

	    return reqUserName + wPos + wDept;
  }

  // 시/분 표시
  function getTimeMin(reqValue)
  {
	  var wTmp = reqValue;

	  if(!isNull(wTmp)){
		  wTmp = parseInt((parseInt(wTmp) / 60)) + " 시 " + parseInt((parseInt(wTmp) % 60)) + " 분";
	  }

	  return wTmp;
  }

  function addDayCss(reqValue){
	  var wTmp = reqValue;
	  if(!isNull(wTmp)){
		  if(wTmp == '일'){
			  wTmp = '<font color="red">'+wTmp+'</font>';
		  }else if(wTmp == '토'){
			  wTmp = '<font color="blue">'+wTmp+'</font>';
		  }
	  }
	  return wTmp;
  }

  /**========================================================================================
   *                      		부서검색, 사원선택, 모달팝업
   *                                    스크립트 영역
   *=========================================================================================**/
  /**에디터 데이터 가져오기*/
  function getPageEditData(pid,mid){
	  $.ajax({
			type:"POST",
			url:"/cmm/pageData.do",
			data:{pageId:pid,menuId:mid},
			dataType:"json",
			success:function(json) {
				$('#pageDetail').empty();
        		$('#pageDetail').html(json.pageData.content);
				$('#summernote').html(json.pageData.content);
			},
			error : function(e) {
				alert("서버와 통신 오류입니다.");
			}
		});
  }

  function editChange(cont,edit){
		var a=3;
		a+=3;
  }

  /**페이지 상세설명 에디터 수정하기*/
  function editSave(pid, mid, cont){
	  	var data=new FormData();
	  	data.append("pageId",pid);
	  	data.append("menuId",mid);
	  	data.append("content",cont);
	      $.ajax({
	          data: data,
	          type: "POST",
	          url: "/cmm/mergePageData.do",
	          cache: false,
	          contentType: false,
	          processData: false,
	       	dataType:"json",
	          success: function(json) {
	          	if(json.result=="SUCCESS"){
	          		$('#pageDetail').empty();
	          		$('#pageDetail').html(cont);
	          		$('#summernote').html(cont);
	          		showHide('mw_temp')
	          	}
	          }
	      });
  }

  /**에디터 스크립트*/
  function editJs(){
	  	$('#summernote').summernote({
	  		  lang: 'ko-KR'
	  		  ,height: 265                 // set editor height
	  		  ,minHeight: 265             // set minimum height of editor
	  		  ,maxHeight: 265             // set maximum height of editor
	  		  ,focus: true                 // set focus to editable area after initializing summernote
	  		  ,toolbar: [
	  		            [ 'style', [ 'style' ] ],
	  		            [ 'font', [ 'bold', 'italic', 'underline', 'strikethrough', 'superscript', 'subscript', 'clear'] ],
	  		            [ 'fontname', [ 'fontname' ] ],
	  		            [ 'fontsize', [ 'fontsize' ] ],
	  		            [ 'color', [ 'color' ] ],
	  		            [ 'para', [ 'ol', 'ul', 'paragraph', 'height' ] ],
	  		            [ 'table', [ 'table' ] ],
	  		            [ 'insert', [ 'link'] ],
	  		            [ 'view', [ 'undo', 'redo', 'fullscreen', 'codeview', 'help' ] ]
	  		        ]
	  		  ,callbacks: {
	  			    onChange: function(contents, $editable) {
	  			    	editChange(contents,$editable);
	  			    }
	  		  }
	  	});
  }



  //최상위부서 변경 이벤트(LEVEL1)
  function deptLevel1(deptId, formId, url){
  	if(isNull(deptId)){
  		$("#schUserName").val("");	//근무자 이름 초기화
  		if(formId == "searchForm"){
  			//검색폼 최상위부서 [전체] 선택시 하위부서 전체로 초기화
  			$("#schDeptId2 option", "#"+formId).not("[value='']").remove();
  			$("#schDeptId3 option", "#"+formId).not("[value='']").remove();
  			$('#layer-popup-place').hide();	//근무자 레이어 숨김
  			//setUserList("", "searchForm");	//근무자 [전체]로 검색
  		}else if(formId == "empForm"){
  			//등록폼 최상위부서 [전체] 선택시 하위부서 전체로 초기화
  			$("#schDeptId2 option", "#"+formId).not("[value='']").remove();
  			$("#schDeptId3 option", "#"+formId).not("[value='']").remove();
  		}
  	}else if(formId == "schModalForm" || formId == "schModalForm1" || formId == "schModalForm2"|| formId == "schModalForm3"){
  		getDeptLevel2(formId);
  		$('#layer-popup-place').hide();			//근무자 레이어 숨김
  		$("#schDeptId2 option", "#"+formId).not("[value='']").remove();
		$("#schDeptId3 option", "#"+formId).not("[value='']").remove();
		console.log("deptId="+deptId);
		console.log("deptId="+formId);
		console.log("deptId="+url);
		setUserList(deptId, formId, url);	    //근무자 검색
  	}else{
  		$("#schUserName").val("");	//근무자 이름 초기화
  		getDeptLevel2(formId);					//상위부서코드 가져오기
  		$('#layer-popup-place').hide();			//근무자 레이어 숨김
  		if(formId != "searchForm"){
  			setUserList(deptId, formId, url);	//근무자 검색
		}
  	}
  }

  //상위 부서 코드 불러오기
  function getDeptLevel2(formId) {
  	$.ajax({
  		type:"POST",
  		url:"/com/dept_up_list.do",
  		dataType:"json",
  		success:function(json) {
  			var html = '<option value="">상위부서선택</option>';
  			$.each(json.list, function(i, d) {
  				html += '<option value="'+d.deptId+'">'+d.deptName+'</option>';
  			});

  			$("#schDeptId2", "#"+formId).html(html);
  		},
  		error : function(e) {
  			alert("서버와 통신 오류입니다.");
  		}
  	});
  }

  //상위부서 변경 이벤트(LEVEL2)
  function deptLevel2(deptId, formId, url) {
	$("#schUserName").val("");	//근무자 이름 초기화

  	var param = {deptId : deptId};

  	$.ajax({
  		type:"POST",
  		url:"/com/dept_list.do",
  		data:param,
  		dataType:"json",
  		success:function(json) {
  			var html = '<option value="">부서선택</option>';
  			$.each(json.list, function(i, d) {
  				html += '<option value="'+d.deptId+'">'+d.deptName+'</option>';
  			});

  			$("#schDeptId3", "#"+formId).html(html);
  			$('#layer-popup-place').hide();	//근무자 레이어 숨김

  			if(formId != "searchForm"){
  				setUserList(deptId, formId, url);	//근무자 검색
  			}
  		},
  		error : function(e) {
  			alert("서버와 통신 오류입니다.");
  		}
  	});
  }

  //부서 변경 이벤트(LEVEL3)
  function deptLevel3(deptId, formId, url){
	$("#schUserName").val("");	//근무자 이름 초기화
	$('#layer-popup-place').hide();	//근무자 레이어 숨김

	if(formId != "searchForm"){
		setUserList(deptId, formId, url);	//근무자 검색
	}
  }

  //부서선택 팝업 좌측 리스트
  function schLeftDeptList(){
  	$.ajax({
  		type:"POST",
  		url:'/com/pop_dept_list.do',
  		dataType:"json",
  		success:function(json) {
  			var ulObj2 = $("#userLeftArea_box2", $("#deptForm"));
  			var ulObj3 = $("#userLeftArea_box3", $("#deptForm"));

  			var html2 = "<li>";
  			var html3 = "<li>";
  			$.each(json.list, function(i, d) {
  				if(!isNull(d.parName)){
  					html2 += addLeftDeptHtml(d.deptId, d.deptName, d.deptCode);
  				}else{
	  				html3 += addLeftDeptHtml(d.deptId, d.deptName, d.deptCode);
  				}
  			});
  			html2 += "</li>";
  			html3 += "</li>";

  			ulObj2.html(html2);
  			ulObj3.html(html3);

			$('#layer-popup-place').show();
  		},
  		error : function(e) {
  			alert("서버와 통신 오류입니다.");
  		}
  	});
  }

  //사원리스트 조회
  function setUserList(deptId, formId, url) {
	if(formId != "searchForm"){
	  	if(isNull(deptId)){		//부서
	  		deptId = $("#schDeptId3 option:selected", "#"+formId).val();
	  	}
	  	if(isNull(deptId)){		//상위부서
	  		deptId = $("#schDeptId2 option:selected", "#"+formId).val();
	  	}
	  	if(isNull(deptId)){		//최상위부서
	  		deptId = $("#schDeptId1 option:selected", "#"+formId).val();
	  	}
	}

  	var param = {deptId : deptId};

  	if(url != '' && url != undefined ){
  		url = url;
  		param.reqYear = $('#reqYear', '#'+formId).val();
  	}else{
  		url = '/com/user_list.do';
  	}
console.log("url="+url);
  	$.ajax({
  		type:"POST",
  		url:url,
  		data:param,
  		dataType:"json",
  		success:function(json) {
  			if(formId == "searchForm"){
  				var html = '';
  				$.each(json.list, function(i, d) {
  					html += '<tr onClick="selectComboUser(\''+d.userId+'\', \''+d.userName+'\', \''+d.deptName+'\', \''+d.jicwiName+'\')">';
  					html += '<td>' + d.deptName + "&nbsp;" + d.userName + "(" + d.jicwiName + ")" + '</td>';
  					html += '</tr>';
  				});

  				$("#tby5").html(html);

  				$('#tby5 tr').hide();
	  			$("#tby5 tr:contains('"+getSchFilterValue()+"')").show();

  				$('#layer-popup-place').show();

  				GV_USER_LIST = json.list;
  			}else if(formId == "empForm"){
  				var html = '';
  				var ulObj = $("#userLeftArea", $("#empForm"));

  				$.each(json.list, function(i, d) {
  					html += addLeftUserHtml(d.userName, d.jicwiName, d.deptName, d.userId);
  				});

  				ulObj.html(html);
  			}else if(formId == "schModalForm" || formId == "schModalForm1" || formId == "schModalForm2"|| formId == "schModalForm3"){
  				modalUserGrid(formId, json.list);
  			}
  		},
  		error : function(e) {
  			alert("서버와 통신 오류입니다.");
  		}
  	});
  }

  //부서, 근무자 검색시 값 세팅
  function setDeptSchValue(){
	 var searchForm = $("#searchForm");
	 var deptId = $("#schDeptId3 option:selected", searchForm).val();

	 if(isNull(deptId)){		//상위부서
		 deptId = $("#schDeptId2 option:selected", searchForm).val();
	 }
	 if(isNull(deptId)){		//최상위부서
		 deptId = $("#schDeptId1 option:selected", searchForm).val();
	 }

	 $("#schDeptId", searchForm).val(deptId);

	 if(isNull($("#schUserName", searchForm).val())){
		 $("#schUserId", searchForm).val("");		//유저ID 초기화
	 }else{
		 $("#schDeptId", searchForm).val("");		//부서ID 초기화
	 }
  }

  //검색영역 근무자 리스트 선택
  function selectComboUser(id, nm, dept, jicwi) {
  	$('#layer-popup-place').hide();
  	$('#schUserId').val(id);
  	$('#schUserName').val(nm + "("+jicwi+")");

  	list(0);
  }

  //사원선택 팝업 검색
  function schLeftUserList(){
  	var schType = $("#schType", $("#empForm")).val();
  	var schText = $("#schText", $("#empForm")).val();

  	var param = {schType : schType
  				, schText : schText};

  	$.ajax({
  		type:"POST",
  		url:"/com/user_list.do",
  		data:param,
  		dataType:"json",
  		success:function(json) {
  			var ulObj = $("#userLeftArea", $("#empForm"));
  			var html = "";

  			$.each(json.list, function(i, d) {
  				html += addLeftUserHtml(d.userName, d.jicwiName, d.deptName, d.userId);
  			});

  			ulObj.html(html);
  		},
  		error : function(e) {
  			alert("서버와 통신 오류입니다.");
  		}
  	});
  }

  /**메뉴 별 팝업 창 input 사원, 부서 검색 기능  */
  function schPopUpModalUserList(formId, url){

	  	var param = {reqYear : $('#reqYear', '#'+formId).val()};

  		param.schText = $('#schText', '#'+formId).val();
  		param.schType = $('#schType', '#'+formId).val();

	  	$.ajax({
	  		type:"POST",
	  		url:url,
	  		data:param,
	  		dataType:"json",
	  		success:function(json) {
	  			modalUserGrid(formId, json.list);
	  		},
	  		error : function(e) {
	  			alert("서버와 통신 오류입니다.");
	  		}
	  	});
  }

  function modalUserGrid(formId, list){
		if(formId == "schModalForm" || formId == "schModalForm1" || formId == "schModalForm2"|| formId == "schModalForm3"){
			var html = '';
			var ulObj = $('#modalTb',$('#'+formId));
			html += addPopUpHtml(list);
			ulObj.html(html);
			showModalDatePicker();
		}
  }

  //사원선택 레이어 검색시 HTML 추가
  function addLeftUserHtml(userName, jicwiName, deptName, userId){
  	var html = "";

  	html += '<li id="trLeft_' + userId + '">';
  	html += '<label>';
  	html += '<input type="checkbox" name="chkTempUser" value="' + userId + '">';
  	html += '<span class="Name" name="tempUserName" id="tempUserName_' + userId +  '">' + userName + '</span>';
  	html += '<span class="Per" name="tempJicwiName" id="tempJicwiName_' + userId +  '">'  + jicwiName + '</span>';
  	html += '<span class="Temp" name="tempDeptName" id="tempDeptName_' + userId +  '">' + deptName + '</span>';
  	html += '</label>';
  	html += '</li>';

  	return html;
  }

  //사원선택 레이어 팝업 [삭제]
  function delSelUser(userId){
      $('#trRight_'+ userId).remove();
  }

  //부서선택 레이어 검색시 HTML 추가
  function addLeftDeptHtml(deptId, deptName, deptCode){
  	var html = "";

  	//html += '<li id="trLeft_' + deptId + '">';
  	html += '<label>';
  	html += '<input type="checkbox" name="chkTempDept" value="' + deptId + '">';
  	html += '<span class="Temp" name="tempDeptName" id="tempDeptName_' + deptId +  '">' + deptName + '</span>';
  	html += '<input type="hidden" name="tempDeptCode" value="' + deptCode + '">';
  	html += '<input type="hidden" name="tempDeptId" value="' + deptId + '">';
  	html += '</label>';

  	//html += '</li>';
  	html += '<br/>';

  	return html;
  }

//조직도팝업 스크립트
  function showHide(id, url) {
  	var objDsp = $("#"+id);
console.log("id="+id);
  	if(id == "org_place"){		//사원선택 팝업
  		if(objDsp.css("display") == "none"){
  			//전체 체크박스 해제
  			$("input[name=chkTempUser]:checkbox").each(function() {
  				$(this).attr("checked", false);
  			});
  			
  			$(objDsp).css("display", "block");

  			var lenLeftArea = $("#userLeftArea").find("li").length;
  			//팝업 좌측영역에 조회결과가 없고 직원이름 검색란에 값이 없을경우 조회
  			if(lenLeftArea == 0 && isNull($("#schText", $("#empForm")).val())){
  				deptLevel1("000000101", "empForm");		//사원선택 레이어 오픈시 서울여성가족재단 기본 조회
  			}
  			$("#userRightArea > li").remove();
  			$("body").css({overflow:'hidden'}).bind('touchmove', function(e){e.preventDefault()});
  		}else{
  			$(objDsp).hide();
			document.getElementById(id).style.display="none";
			$("body").css({overflow:'auto'}).unbind('touchmove', function(e){e.preventDefault()});
  		}
  	}else if(id == 'mw_time' || id == 'mw_time1' || id == 'mw_time2' || id == 'mw_late'|| id=='mw_time3'){
  		if(objDsp.css("display") == "none"){
  			$(objDsp).css("display", "block");
  			var formId = objDsp.find("form").attr("id");
          	deptLevel1("000000101", formId, url);
  		}else{
  			$(objDsp).hide();
  			document.getElementById(id).style.display="none";
  		}
  	}else if(id == "dept_place"){	//부서선택 팝업
  		if(objDsp.css("display") == "none"){
  			//전체 선택박스 해제
  			$("input[name=chkTempDept]:checkbox").each(function() {
  				$(this).attr("checked", false);
  			});

  			$(objDsp).css("display", "block");

  			schLeftDeptList();
  			$("#deptRightArea > li").remove();

  		}else{
  			$(objDsp).hide();
  		}
  	}else{

  		/**에디터 스크립트 호출*/
  		if(id == 'mw_temp'){
  			editJs();
  		}

  		if(objDsp.css("display") == "none"){
  			$(objDsp).css("display", "block");
  			$("body").css({overflow:'hidden'}).bind('touchmove', function(e){e.preventDefault()});
  		}else{
  			$(objDsp).hide();

  			document.getElementById(id).style.display="none";
  			$("body").css({overflow:'auto'}).unbind('touchmove', function(e){e.preventDefault()});
  		}
  	}
  }

  /**모달 창 데이터 그리드 datepicker 적용하기*/
  function showModalDatePicker(){
	  	$( ".modalDatePicker" ).datepicker({
	  	  showOn: "button",
	  	  buttonImage: "../images/calendar.gif",
	  	  buttonImageOnly: true,
	  	  buttonText: "Select date",
	  	  showMonthAfterYear: true ,
	  	  dateFormat: 'yy.mm.dd',
	  	  monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	  	  dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'],
	  	  changeYear: true,
	  	  changeMonth: true
	  	});
  }

  /**팝업창 저장*/
  function modalDataSave(formId, url, saveUrl){
	  if(confirm("저장하시겠습니까?")){
		  var paramList = $('#'+formId).serialize();
			console.log("saveUrl="+saveUrl);
		  $.ajax({
	  		type:"POST",
	  		url:saveUrl,
	  		data:paramList,
	  		dataType:"json",
	  		success:function(json) {
	  			/*if($('#schText','#'+formId).val() != ''){
	  				schPopUpModalUserList(formId, url);
	  			}else if($('#schDeptId2','#'+formId).val() == ''){
	  				deptLevel1('000000101', formId, url);
	  			}else if($('#schDeptId3','#'+formId).val() == '' && $('#schDeptId2','#'+formId).val() != ''){
	  				deptLevel2($('#schDeptId2','#'+formId).val(), formId, url);
	  			}else{
	  				deptLevel3($('#schDeptId3','#'+formId).val(), formId, url);
	  			}*/
	  			alert("저장되었습니다.");
	  		},
	  		error : function(e) {
	  			alert("서버와 통신 오류입니다.");
	  		}
	  	  });
	  }
  }
  /**근무자 레이어 키보드 이동 함수*/
  function employeeSearch(eventCode){
		var eqIndex = $('#tby5 tr.active', '#searchForm').index();
		var schUserList = $('#tby5 tr:visible', '#searchForm');
		var indexArr = [];
		var curIndex = {};
		$.each(schUserList, function(i,d){
			var schUserListIndex = schUserList.eq(i).index()
			indexArr.push(schUserListIndex);
			if(schUserListIndex == eqIndex){
				curIndex = {index:i, eq:schUserListIndex} ;
			}
		});
		var index = parseInt(curIndex.index);
		if(eventCode == 'up'){
			if(eqIndex != -1 || eqIndex != 1){
				if(curIndex.index == 0){
					schUserList.eq(0).removeClass("active");
				}else if(curIndex.index > 0){
					schUserList.eq(index).removeClass("active");
					schUserList.eq(index-1).addClass("active");

					$("#layer-popup-place").scrollTop(0);

					try{
						$("#layer-popup-place").scrollTop($('#layer-popup-place .active:first').offset().top-$("#layer-popup-place").height());
					}catch(e){

					}
				}
			}
		}else if(eventCode == 'down'){
			if(eqIndex == -1 ){
				schUserList.eq(0).addClass("active");
			}else{
				schUserList.eq(index).removeClass("active");
				schUserList.eq(index+1).addClass("active");

				$("#layer-popup-place").scrollTop(0);
				try{
					$("#layer-popup-place").scrollTop($('#layer-popup-place .active:first').offset().top-$("#layer-popup-place").height());
				}catch(e){

				}
			}
		}else if(eventCode == 'enter'){
			schUserList.eq(index).trigger('click');
		}
	}

	$(document).ready(function() {
	  	//근무자 +아이콘 클릭 이벤트
	  	$('#toggle').click(function () {
	  		if($("#layer-popup-place").css("display") == "none"){
	  			if(GV_USER_LIST.length > 0){
	  				$('#tby5 tr').hide();
		  			$("#tby5 tr:contains('"+getSchFilterValue()+"')").show();
		  			$('#layer-popup-place').show();
		  		}else{
		  			setUserList("", "searchForm");
		  		}
	  		} else {
	  			$('#layer-popup-place').hide();
	  		}
	  	});

	  	//근무자 클릭 이벤트
	  	$('#schUserName').click(function () {
	  		if($("#layer-popup-place").css("display") == "none"){
	  			if(GV_USER_LIST.length > 0){
	  				$('#tby5 tr').removeClass('active');
	  				$("#layer-popup-place").scrollTop(0);

	  				$('#tby5 tr').hide();
		  			$("#tby5 tr:contains('"+getSchFilterValue()+"')").show();
		  			$('#layer-popup-place').show();
		  		}else{
		  			setUserList("", "searchForm");
		  		}
	  		}
	  	});

	  	//근무자 입력 이벤트
	  	$("#schUserName").keyup(function(event) {
	  		if(event.keyCode == "13"){
	  			return false;
	  		}

	  		var val = $(this).val();

	  		if(GV_USER_LIST.length > 0){
	  			if(event.keyCode!=38 && event.keyCode!=40){
	  				$('#tby5 tr').removeClass('active');
	  				$("#layer-popup-place").scrollTop(0);
	  			}

	  			$('#tby5 tr').hide();

	  			if (val == "") {
		  			$("#tby5 tr:contains('"+getSchFilterValue()+"')").show();
		  		}else{
		  			$("#tby5 tr:contains('"+val+"')").show();
		  		}
	  		}else{
	  			setUserList("", "searchForm");
	  		}

	  		$('#layer-popup-place').show();
	  	});
	  	/**근무자 up down enter action*/
	  	$('#schUserName').keydown(function(event){
	  		/**up arrow*/
			if(event.keyCode==38){
				employeeSearch('up');
			/**down arrow*/
			}else if(event.keyCode==40){
				employeeSearch('down');
			/**enter*/
			}else if(event.keyCode==13){
				employeeSearch('enter');
			}
	  	});
	  	//사원 레이어 팝업 [추가 버튼]
	  	$("#userAdd").click(function(){
	  		var empForm = $('#empForm');
	  	    var keyObjs  = $('input[name=chkTempUser]:checked', empForm);		//팝업 좌측 선택 리스트
	  	    var keyRightObjs  = $('input[name=selUser]', empForm);			//팝업 우측 선택 리스트
	  	    var ulObj = $("#userRightArea", empForm);							//팝업 우측 UL
	  	    var html = "";

	  	    if (keyObjs.length == 0) {
	          	alert("선택된 사용자가 없습니다.");
	          	return false;
	        	}

	  	    for(var i = 0 ; i < keyObjs.length ; i++)
	  	    {
	  	    	var dupFlag = false;

	  	    	var userId = $(keyObjs[i]).val();
	  	    	for(var j=0; j < keyRightObjs.length; j++){
	  				if($(keyRightObjs[j]).val() == userId){
	  					dupFlag = true;
	  				}
	  	    	}

	  	    	if(dupFlag == true){
	  	    		continue;
	  	    	}

	  		    html += '<li id="trRight_' + userId + '">';
	  			html += '<label>';
	  			//html += '<input type="checkbox" name="selUser" value="' + userId + '">';
	  			html += '<input type="hidden" name="selUser" value="' + userId + '">';
	  			html += '<button type="button" class="Del" alt="삭제" onclick="delSelUser(\''+userId+'\')"><i class="fa fa-trash-o"></i></button>';
	  			html += '<span class="Name" name="selUserName" id="selUserName_' + userId +'">' + $("#tempUserName_"+userId).text() + '</span>';
	  			html += '<span class="Per" name="selJicwiName" id="selJicwiName_' + userId +'">'  + $("#tempJicwiName_"+userId).text() + '</span>';
	  			html += '<span class="Temp" name="selDeptName" id="selDeptName_' + userId +'">' + $("#tempDeptName_"+userId).text() + '</span>';
	  			html += '</label>';
	  			html += '</li>';
	  	    }

	  	    ulObj.append(html);
	  	});

	  //부서선택 레이어 팝업 [추가 버튼]
	  	$("#deptAdd").click(function(){
	  		var deptForm = $('#deptForm');
	  	    var keyObjs  = $('input[name=chkTempDept]:checked', deptForm);		//팝업 좌측 선택 리스트
	  	    var keyRightObjs  = $('input[name=selDept]', deptForm);				//팝업 우측 선택 리스트
	  	    var ulObj = $("#deptRightArea", deptForm);							//팝업 우측 UL
	  	    var html = "";

	  	    if (keyObjs.length == 0) {
	          	alert("선택된 부서가 없습니다.");
	          	return false;
	        }

	  	    for(var i = 0 ; i < keyObjs.length ; i++)
	  	    {
	  	    	var dupFlag = false;

	  	    	var deptId = $(keyObjs[i]).val();
	  	    	for(var j=0; j < keyRightObjs.length; j++){
	  				if($(keyRightObjs[j]).val() == deptId){
	  					dupFlag = true;
	  				}
	  	    	}

	  	    	if(dupFlag == true){
	  	    		continue;
	  	    	}

	  		    html += '<li id="trRight_' + deptId + '">';
	  			html += '<label>';
	  			html += '<input type="hidden" name="selDept" value="' + deptId + '">';
	  			html += '<button type="button" class="Del" alt="삭제" onclick="delSelUser(\''+deptId+'\')"><i class="fa fa-trash-o"></i></button>';
	  			html += '<span class="Temp" name="selDeptName" id="selDeptName_' + deptId +'">' + $("#tempDeptName_"+deptId).text() + '</span>';
	  			html += '</label>';
	  			html += '</li>';
	  	    }

	  	    ulObj.append(html);
	  	});
	  });

	//화면 최초로딩시 근무자값을 본인으로 기본 셋팅
	function setSchDefUserName(authGrpCd){
		if(authGrpCd == "ADMIN" || authGrpCd == "WORK_ADMIN"){
			$("#schUserId").val(GV_USER_ID);	//근무자 아이디
			$("#schUserName").val(GV_USER_NM+"("+ GV_JICWI_NM +")");	//근무자 이름
		}
	}

	function getSchFilterValue(){
		var rtnVal = "";
		var deptNm = "";

		if(isNull(deptNm)){		//부서
			var deptId = $("#schDeptId3 option:selected", "#searchForm").val();
			if(!isNull(deptId)){
				deptNm = $("#schDeptId3 option:selected", "#searchForm").text();
			}
		}
		if(isNull(deptNm)){		//상위부서
			var deptId = $("#schDeptId2 option:selected", "#searchForm").val();
			if(!isNull(deptId)){
				deptNm = $("#schDeptId2 option:selected", "#searchForm").text();
			}
		}
		if(isNull(deptNm)){		//최상위부서
			var deptId = $("#schDeptId1 option:selected", "#searchForm").val();
			if(!isNull(deptId)){
				deptNm = $("#schDeptId1 option:selected", "#searchForm").text();
			}
		}

		if(!isNull(deptNm)){
			rtnVal = deptNm;
		}else{
			rtnVal = $("#schUserName", "#searchForm").val();
		}

		return rtnVal;
	}

	//LPAD 기능 (값, 자릿수, 문자)
	function lpad(val, padLength, padString){
	    while((""+val).length < padLength){
	        val = padString + val;
	    }
	    return val;
	}