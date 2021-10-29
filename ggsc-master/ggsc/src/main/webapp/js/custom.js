$(document).on("keydown keyup keypress input","[onlyNumber]",function(){
	$(this).val(onlynumber($(this).val()));
});

$(document).on("keypress","[onlyKorean]",function(){
	$(this).val(onlyKorean($(this).val()));
});

$(document).on("keydown keyup","[onlyEnglish]",function(){
	$(this).val(onlyEnglish($(this).val()));
});

$(document).on('keydown','[enterSearch]',function(e){
	if(event.keyCode==13){$(this).data('button')==undefined?$(this)[0].form.submit():$($(this).data('button')).click();}
});

$(function(){
	/*
	if(complete.find(e=>e==getQueryString('mnuCd')) != undefined){
		$("#content .h2-title").append("<span style='color:red'>(완료)</span>");
	}
	*/
	
	$("[data-pattern='mobile']").each(function(){
		$(this).text(phoneFormatter($(this).text()));
	});
	
	$("[data-pattern='birth']").each(function(){
		$(this).text(birthFormatter($(this).text()));
	});
	
	$("[data-pattern='datetime']").each(function(){
		$(this).text(datetimeFormatter($(this).text()));
	});
});

function fn_pdfDownload(number, idx){
	if(Number(number).toString() != 'NaN'){
       $("#tmpFrame").remove();
        $('body').append("<iframe id='tmpFrame' name='tmpFrame' style='display:none'></iframe>");
		var frm = document.createElement('form');
		frm.method = 'post';
		frm.action = 'pdfDownload.do?test=0';
		frm.target = 'tmpFrame';
		frm.name='pdfForm';
		frm.style.display = 'none';
		frm.appendChild($("input[name='_csrf']")[0]);
		frm.appendChild($("<input type='hidden' name='Number' value='" + number + "' />")[0]);
		frm.appendChild($("<input type='hidden' name='num' value='" + idx + "' />")[0]);
		$('body').append(frm);
		frm.submit();
	}else{
		alert('파일을 다운로드 할 수 없습니다.');
	}
}

function fn_excelDownload(number, schForm){
	document.tmpForm.method = 'POST';
	document.tmpForm.number.value = number;
	document.tmpForm.action = '/gnoincoundb/excelDownLoad.do';
	if(schForm){
		document.tmpForm.schCnsGb.value = schForm.schCnsGb ?  schForm.schCnsGb.value : '';
		document.tmpForm.schCenterGb.value = schForm.schCenterGb ?  schForm.schCenterGb.value : '';
		document.tmpForm.schCnsleNm.value = schForm.schCnsleNm ?  schForm.schCnsleNm.value : '';
		document.tmpForm.schDateGb.value = schForm.schDateGb ?  schForm.schDateGb.value : '';
		document.tmpForm.schText.value = schForm.schText ?  schForm.schText.value : '';
		
		document.tmpForm.schCnsrGb.value = schForm.schCnsrGb ?  schForm.schCnsrGb.value : '';
		document.tmpForm.schCnsrNm.value = schForm.schCnsrNm ?  schForm.schCnsrNm.value : '';
		document.tmpForm.schZoneGb.value = schForm.schZoneGb ?  schForm.schZoneGb.value : '';
		document.tmpForm.schSigunNm.value = schForm.schSigunNm ?  schForm.schSigunNm.value : '';
		
		document.tmpForm.schHclassNm.value = schForm.schHclassNm ?  schForm.schHclassNm.value : '';
		document.tmpForm.schMclassNm.value = schForm.schMclassNm ?  schForm.schMclassNm.value : '';
		document.tmpForm.schSclassNm.value = schForm.schSclassNm ?  schForm.schSclassNm.value : '';
		
		document.tmpForm.schLocalGb.value = schForm.schLocalGb ?  schForm.schLocalGb.value : '';
		document.tmpForm.schorganGb.value = schForm.schorganGb ?  schForm.schorganGb.value : '';
		
		document.tmpForm.schStartDate.value = schForm.schStartDate ?  schForm.schStartDate.value : '';
		document.tmpForm.schEndDate.value = schForm.schEndDate ?  schForm.schEndDate.value : '';
		document.tmpForm.schWriteYn.value = schForm.schWriteYn ?  schForm.schWriteYn.value : '';
		document.tmpForm.schLeaderNm.value = schForm.schLeaderNm ?  schForm.schLeaderNm.value : '';
		document.tmpForm.schPgrmNm.value = schForm.schPgrmNm ?  schForm.schPgrmNm.value : '';
		document.tmpForm.schAcptNm.value = schForm.schAcptNm ?  schForm.schAcptNm.value : ''; // 신청자
		document.tmpForm.schLinkReqGb.value = schForm.schLinkReqGb ?  schForm.schLinkReqGb.value : ''; // 연계의뢰서구분
		document.tmpForm.schJoinOrgCd.value = schForm.schJoinOrgCd ?  schForm.schJoinOrgCd.value : ''; // 회의구분
		document.tmpForm.schEduManGb.value = schForm.schEduManGb ?  schForm.schEduManGb.value : ''; // 교육활동보고서 대상자
		document.tmpForm.schPromotionGb.value = schForm.schPromotionGb ?  schForm.schPromotionGb.value : ''; // 교육활동보고서 홍보구분
		document.tmpForm.schVisitOrgGb.value = schForm.schVisitOrgGb ?  schForm.schVisitOrgGb.value : ''; // 연계기관방문보고서 기관구분
		
	}
	
	document.tmpForm.submit();
}

function getQueryString(key) {
 
    // 전체 Url을 가져온다.
    var str = location.href;
 
    // QueryString의 값을 가져오기 위해서, ? 이후 첫번째 index값을 가져온다.
    var index = str.indexOf("?") + 1;
 
    // Url에 #이 포함되어 있을 수 있으므로 경우의 수를 나눴다.
    var lastIndex = str.indexOf("#") > -1 ? str.indexOf("#") + 1 : str.length;
 
    // index 값이 0이라는 것은 QueryString이 없다는 것을 의미하기에 종료
    if (index == 0) {
        return "";
    }
 
    // str의 값은 a=1&b=first&c=true
    str = str.substring(index, lastIndex); 
 
    // key/value로 이뤄진 쌍을 배열로 나눠서 넣는다.
    str = str.split("&");
 
    // 결과값
    var rst = "";
 
    for (var i = 0; i < str.length; i++) {
 
        // key/value로 나눈다.
        // arr[0] = key
        // arr[1] = value
        var arr = str[i].split("=");
 
        // arr의 length가 2가 아니면 종료
        if (arr.length != 2) {
            break;
        }
 
        // 매개변수 key과 일치하면 결과값에 셋팅
        if (arr[0] == key) {
            rst = arr[1];
            break;
        }
    }
    return rst;
}


function onlyKorean(str){
  var pattern = /[a-z0-9]|[ \[\]{}()<>?|`~!@#$%^&*-_+=,.;:\"'\\]/g;
  return str.replace(pattern, '');
};

function datetimeFormatter(num){
	num = onlynumber(num);
	if(num.length == 14){
		formatNum = num.replace(/(\d{4})(\d{2})(\d{2})(\d{2})(\d{2})(\d{2})/, '$1-$2-$3 $4:$5:$6');
	}else{
		formatNum = num;
	}
	return formatNum;
}


function birthFormatter(num){
	num = onlynumber(num);
	if(num.length==8){
		formatNum = num.replace(/(\d{4})(\d{2})(\d{2})/, '$1.$2.$3');
	}else if(num.length==6){
		formatNum = num.replace(/(\d{2})(\d{2})(\d{2})/, '$1.$2.$3');
	}else{
		formatNum = num;
	}
	return formatNum;
}
function phoneFormatter(num,type){
    var formatNum = '';
    if(num.length==11){
        if(type==0){
            formatNum = num.replace(/(\d{3})(\d{4})(\d{4})/, '$1-****-$3');
        }else{
            formatNum = num.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
        }
    }else if(num.length==8){
        formatNum = num.replace(/(\d{4})(\d{4})/, '$1-$2');
    }else{
        if(num.indexOf('02')==0){
            if(type==0){
                formatNum = num.replace(/(\d{2})(\d{4})(\d{4})/, '$1-****-$3');
            }else{

                formatNum = num.replace(/(\d{2})(\d{4})(\d{4})/, '$1-$2-$3');

            }

        }else{

            if(type==0){

                formatNum = num.replace(/(\d{3})(\d{3})(\d{4})/, '$1-***-$3');

            }else{

                formatNum = num.replace(/(\d{3})(\d{3})(\d{4})/, '$1-$2-$3');

            }

        }

    }

    return formatNum;

    

}

function onlyEnglish(str) {
    return str.replace(/[0-9]|[^\!-z\s]/gi,'');
}


function onlynumber(str){
	str = str.replace(/[^0-9]/g, '');
	return str;
}


function ssnCheck(_ssn1, _ssn2)
{
    var ssn1    = _ssn1,
        ssn2    = _ssn2,
        ssn     = ssn1+''+ssn2,
        arr_ssn = [],
        compare = [2,3,4,5,6,7,8,9,2,3,4,5],
        sum     = 0;
 
    // 입력여부 체크
    if (ssn1 == '')
    {
        alert('주민등록번호를 기입해주세요.');
        return false;
    }
 
    if (ssn2 == '')
    {
        alert('주민등록번호를 기입해주세요.');
        return false;
    }    
 
    // 입력값 체크
    if (ssn1.match('[^0-9]'))
    {
        alert("주민등록번호는 숫자만 입력하셔야 합니다."); 
        return false; 
    }
    if (ssn2.match('[^0-9]'))
    {
        alert("주민등록번호는 숫자만 입력하셔야 합니다."); 
        return false; 
    }
 
    // 자리수 체크
    if (ssn.length != 13)
    {
        alert("올바른 주민등록 번호를 입력하여 주세요.");return false;
    }    
 
 
    // 공식: M = (11 - ((2×A + 3×B + 4×C + 5×D + 6×E + 7×F + 8×G + 9×H + 2×I + 3×J + 4×K + 5×L) % 11)) % 11
    for (var i = 0; i<13; i++) 
    { 
        arr_ssn[i] = ssn.substring(i,i+1); 
    }
     
    for (var i = 0; i<12; i++)
    {
        sum = sum + (arr_ssn[i] * compare[i]); 
    }
 
    sum = (11 - (sum % 11)) % 10;
     
    if (sum != arr_ssn[12])
    { 
        alert("올바른 주민등록 번호를 입력하여 주세요.");
        return false; 
    }
 
    return true;
}
function isValidTime(param){
	var timeFormat = /^([01][0-9]|2[0-3]):([0-5][0-9])$/; // 시간형식 체크 정규화 hh:mm
	if(!timeFormat.test(param)){
		return false;
	}
	return true;
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

