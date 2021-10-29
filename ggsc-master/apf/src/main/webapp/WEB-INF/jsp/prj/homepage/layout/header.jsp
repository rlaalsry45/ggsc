<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<head>
<title>경기도노인종합상담센터</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<!-- <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script> -->

<link href="/gnoincoun/assets/css/bootstrap.min.css" rel="stylesheet">
<link href="/gnoincoun/assets/css/font-awesome.min.css" rel="stylesheet">
<!--[if lt IE 9]><script src="assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<script src="/gnoincoun/js/jquery-1.11.2.min.js" ></script>
<script src="/gnoincoun/assets/js/ie-emulation-modes-warning.js"></script>
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
  <script src="assets/js/html5shiv.min.js"></script>
  <script src="assets/js/respond.min.js"></script>
<![endif]-->
<!-- Custom styles for this template -->
<link href="/gnoincoun/assets/css/theme.css" rel="stylesheet">
<link href="/gnoincoun/css/ggsc-main.css" rel="stylesheet">

<script>
$(function(){
	$('.banner-box-01 li').hover(function(){
		$('.banner-box-01 img').each(function(){
			$(this).attr('src', $(this).attr('src').replace('_hover',''));
		});
		$(this).find('img')[0].src = $(this).find('img').attr('src').replace('.png','_hover.png');
	});

	$(".board-list > ul").hover(function(){
		const parent = $(this);
		$(".board-list > ul .board-text").removeClass('hover');
		parent.find('.board-text').addClass('hover');
	});
});
</script>
</head>
<body>
