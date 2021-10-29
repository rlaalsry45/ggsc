
/* top_navi */
$(document).ready(function() {
	$( '.dropdown' ).hover(
		function(){
			$(this).children('.sub-menu').slideDown(200);
		},
		function(){
			$(this).children('.sub-menu').slideUp(200);
		}
	);
});
	
/* sub_navi */	
$('li').click(function(){
	$(this).addClass('active')
	   .siblings()
	   .removeClass('active');
});


/* tab */	
jQuery(function($){
	var tab = $('.tab_line');
	tab.removeClass('js_off');
	function onSelectTab(){
		var t = $(this);
		var myclass = [];
		t.parentsUntil('.tab_line:first').filter('li').each(function(){
			myclass.push( $(this).attr('class') );
		});
		myclass = myclass.join(' ');
		if (!tab.hasClass(myclass)) tab.attr('class','tab_line').addClass(myclass);
	}
	tab.find('li>a').click(onSelectTab).focus(onSelectTab);
});

jQuery(function($){
	var tab = $('.tab_check');
	tab.removeClass('js_off');
	function onSelectTab(){
		var t = $(this);
		var myclass = [];
		t.parentsUntil('.tab_check:first').filter('li').each(function(){
			myclass.push( $(this).attr('class') );
		});
		myclass = myclass.join(' ');
		if (!tab.hasClass(myclass)) tab.attr('class','tab_check').addClass(myclass);
	}
	tab.find('li>a').click(onSelectTab).focus(onSelectTab);
});

jQuery(function($){
	var tab = $('.notice_tab');
	tab.removeClass('js_off');
	function onSelectTab(){
		var t = $(this);
		var myclass = [];
		t.parentsUntil('.notice_tab:first').filter('li').each(function(){
			myclass.push( $(this).attr('class') );
		});
		myclass = myclass.join(' ');
		if (!tab.hasClass(myclass)) tab.attr('class','notice_tab').addClass(myclass);
	}
	tab.find('li>a').click(onSelectTab).focus(onSelectTab);
});

/* form */	
jQuery(function(){
	$('.item>.i_help').click(function(){
		$(this).parent('.item').find('.i_dsc').toggleClass('hide');
	}); 
var i_text = $('.item>.i_label').next('.i_text'); 
$('.item>.i_label').css('position','absolute'); 
i_text 
.focus(function(){
		$(this).prev('.i_label').css('visibility','hidden');
	}) 
.blur(function(){
		if($(this).val() == ''){
			$(this).prev('.i_label').css('visibility','visible');
		}else {
			$(this).prev('.i_label').css('visibility','hidden');
		}
	}) 
.change(function(){
		if($(this).val() == ''){
			$(this).prev('.i_label').css('visibility','visible');
		}else {
			$(this).prev('.i_label').css('visibility','hidden');
		}
	}) 
.blur();
});

/* modal_popup */
var cc=0
function showHide(mw_check) {
    if (cc==0) {
        cc=1
        document.getElementById(mw_check).style.display="block";
    } else {
        cc=0
        document.getElementById(mw_check).style.display="none";
    }
}
 function closeLayer(mw_check){
  var pop = document.getElementById(mw_check);
  pop.style.display = "none";
 }
 


var slides_auto_time = 4000; //자동으로 다음이미지를 불러올시간
var slides_ani_time = 500; // 애니메이션 초
 
var slides;
var slides_pagination;
var slides_total = 0;
var slides_idx = 0;
var slides_time = null;
var slides_click_page = -1;
var slides_move_img = -1;
var slides_button_lock = 0;
 
$(document).ready(function () {
    slides_main();
});
 
function slides_main() {
    slides = $("#slides .main_img .content"); //슬라이드 컨텐츠 영역
    slides_pagination = $("#slides .btn_area p"); // 슬라이드 페이지 영역
 
    slides_total = slides.find("a").length;
 
    var btn_page_html = "";
    for(i=0;i<slides_total;i++) {
        btn_page_html += "<a href=\"javascript:slides_move_page('"+i+"');\" idx='"+i+"'><img src='' alt='"+(i+1)+"' /></a>\n";
    }
 
    slides_pagination.html(btn_page_html);
 
    slides_pagination.find("a img").eq(0).attr("src", ".png");
 
    slides_time = setTimeout("slides_prev()", slides_auto_time);
}
 
function slides_page_next() {
    if(slides_click_page == -1) {
        slides_idx--;
 
        if(slides_idx < 0) {
            slides_idx = slides_total-1;
        }
    } else {
        slides_idx = slides_click_page;
        slides_click_page = -1;
    }
    slides_pagination.find("a img").attr("src", ".png");
    slides_pagination.find("a img").eq(slides_idx).attr("src", "");
}
 
function slides_page_prev() {
    if(slides_click_page == -1) {
        slides_idx++;
 
        if(slides_idx >= slides_total) {
            slides_idx = 0;
        }
    } else {
        slides_idx = slides_click_page;
        slides_click_page = -1;
    }
    slides_pagination.find("a img").attr("src", "");
    slides_pagination.find("a img").eq(slides_idx).attr("src", "");
}
 
function slides_next() {
    if(slides_button_lock) return ;
    slides_button_lock = 1;
 
    if(slides_time != null) {
        clearTimeout(slides_time);
        slides_time = null;
    }
 
    slides.find("a").last().css({"margin-left":"-546px"});
    var tmp = slides.find("a").last();
    slides.prepend(tmp);
 
    slides.find("a").eq(0).animate({ marginLeft: "+=546" }, slides_ani_time, function () {
        slides.find("a").css("margin-left","0");
        slides_page_next();
 
        if(slides_move_img > -1) sortSlides();
 
        slides_button_lock = 0;
 
        slides_time = setTimeout("slides_prev()", slides_auto_time);
    });
}
 
function slides_prev() {
    if(slides_button_lock) return ;
    slides_button_lock = 1;
 
    if(slides_time != null) {
        clearTimeout(slides_time);
        slides_time = null;
    }
 
    slides.find("a").eq(0).animate({ marginLeft: "-=546" }, slides_ani_time, function () {
        var tmp = slides.find("a").first();
        slides.append(tmp);
        slides.find("a").css("margin-left","0");
        slides_page_prev();
 
        if(slides_move_img > -1) sortSlides();
 
        slides_button_lock = 0;
 
        slides_time = setTimeout("slides_prev()", slides_auto_time);
    });
}
 
function slides_move_page(idx) {
    var tmp;
    slides.find("a").each(function () {
        if(idx == $(this).attr("idx")) {
            tmp = $(this);
        }
    });
 
    slides_click_page = idx;
    slides_move_img = idx;
 
    if(slides_idx > idx && idx > -1) {
        slides.append(tmp);
        slides_next();
    } else if(slides_idx < idx && idx < slides_total) {
        slides.find("a").eq(0).after(tmp)
        slides_prev();
    } else {
        slides_click_page = -1;
        slides_move_img = -1;
    }
}
 
function sortSlides() {
    var tmp = new Array();
 
    slides_move_img = slides.find("a").eq(0).attr("idx");
 
    slides.find("a").each(function () {
        var idx = $(this).attr("idx");
        tmp[idx] = $(this);
    });
 
    var i = 0;
    while(i < slides_total) {
        slides.append(tmp[slides_move_img]);
 
        slides_move_img++;
        if(slides_move_img >= slides_total) {
            slides_move_img = 0;
        }
 
        i++;
    }
 
    slides_move_img = -1;
}

$(document).ready(function(){
	var slider = $('.bxslider').bxSlider({
			auto: true, mode:'fade',
		});
	var slider_01 =	$('.bxslider_01').bxSlider({
			auto: true,autoControls: true, mode:'vertical',
		});
	var slider_02 =	$('.bxslider_02').bxSlider({
			auto: true,controls:false,pagerCustom: '#bx-pager1'
		});
	var slider_03 =	$('.bxslider_03').bxSlider({
			auto: true,controls:false,pager:false,maxSlides: 3,moveSlides:1,  slideWidth: 100,slideMargin:0,autoHover:true,
		});
		// 클릭시 멈춤 현상 해결 //
		$(document).on('click','.bx-next, .bx-prev',function() {
		slider.stopAuto();
		slider.startAuto();
//		slider_01.stopAuto();
//		slider_01.startAuto();
		});
		$(document).on('mouseover','.bx-pager, #bx-pager1',function() {
		slider.stopAuto();
		slider.startAuto();
//		slider_01.stopAuto();
//		slider_01.startAuto();
//		slider_02.stopAuto();
//		slider_02.startAuto();
		});	
});

$('.bxslider').bxSlider({
  mode:'horizontal', //default : 'horizontal', options: 'horizontal', 'vertical', 'fade'
  speed:1000, //default:500 이미지변환 속도
  auto: true, //default:false 자동 시작
  captions: true, // 이미지의 title 속성이 노출된다.
  autoControls: true, //default:false 정지,시작 콘트롤 노출, css 수정이 필요
});

var dd = 0;
function consult_showHide(mw_check) {
	var agree1 = $('input:radio[name="agree1"]:checked').val();
	var agree2 = $('input:radio[name="agree2"]:checked').val();
	    if(agree1!='Y' || agree2!='Y'){
	    	alert("정보 공개 및 개인정보 수집·이용에 동의하셔야 컨설팅 신청이 가능합니다.");
	    	return;
	    }
	if (dd == 0) {
		dd = 1;
		document.getElementById(mw_check).style.display = "block";
		for(var i = 1;i<5;i++){
			if(i==1){
				$("#step"+i+"Div").show();
			}else{
				$("#step"+i+"Div").hide();
			}
		}
	} else {
		dd = 0;
		document.getElementById(mw_check).style.display = "none";
		for(var i = 1;i<4;i++){
				$("#step"+i+"Div").hide();
		}
	}
} 
 













