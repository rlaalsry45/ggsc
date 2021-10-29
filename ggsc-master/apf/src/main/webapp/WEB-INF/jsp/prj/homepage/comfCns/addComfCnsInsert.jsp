<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="file:///C|/Users/asdf/Documents/favicon.ico">
    <title>맘편한 상담</title>
    <!-- Bootstrap core CSS -->
    <link href="/gnoincoun/assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="/gnoincoun/assets/css/font-awesome.min.css" rel="stylesheet">
    <!--[if lt IE 9]><script src="assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="/gnoincoun/assets/js/ie-emulation-modes-warning.js"></script>
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="assets/js/html5shiv.min.js"></script>
      <script src="assets/js/respond.min.js"></script>
    <![endif]-->
    <!-- Custom styles for this template -->
    <link href="/gnoincoun/assets/css/theme.css" rel="stylesheet">
  </head>
  <script>
  function fn_reg() {
		if(confirm("등록 하시겠습니까?")){
			var phone1 = $("#phone1").val();
			var phone2 = $("#phone2").val();
			var phone3 = $("#phone3").val();
			var phone =  phone1+phone2+phone3;
			var emgcyPhone1 = $("#emgcyPhone1").val();
			var emgcyPhone2 = $("#emgcyPhone2").val();
			var emgcyPhone3 = $("#emgcyPhone3").val();
			var emgcyPhone =  emgcyPhone1+emgcyPhone2+emgcyPhone3;
			$("#phone").val(phone);
			$("#emgcyPhone").val(emgcyPhone);
			document.frm.action = "/gnoincoun/addComfCnsReg.do";
	       	document.frm.submit();
	       	alert("등록이 완료됐습니다.");
		}		
	}
  </script>
  <body>
    <!-- 헤더 ================================================== -->
    <div class="navbar-wrapper">
      <div class="container">

        <nav class="navbar navbar-static-top">
          <div class="container">
            <div class="navbar-header">
              <a class="navbar-brand" href="/gnoincoun/homepageMainList.do"><img src="/gnoincoun/assets/img/logo.png" alt="경기도노인종합상담센터" /></a>
              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">전체메뉴</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
            </div>
            <div id="navbar" class="navbar-collapse collapse mobile">
              <ul class="nav navbar-nav">
              	<li><a href="/gnoincoun/psyCnsIntro.do">이렇게 이용하세요<i class="fa fa-caret-right"></i></a></li>
                <li><a href="/gnoincoun/psyCnsList.do">간편한 심리검사<i class="fa fa-caret-right"></i></a></li>
                <li class="active"><a href="/gnoincoun/comfCnsInsert.do">맘편한 상담<i class="fa fa-caret-right"></i></a></li>
                <li><a href="/gnoincoun/mypageView.do">마이 페이지<i class="fa fa-caret-right"></i></a></li>
                <li><a href="/gnoincoun/freeBbsList.do">알려드려요 &amp; 자유게시판<i class="fa fa-caret-right"></i></a></li>
                <li><a href="/gnoincoun/careLibraryList.do">마음돌봄 자료실<i class="fa fa-caret-right"></i></a></li>
                <li><a href="/gnoincoun/cnsAskList.do">상담문의하기<i class="fa fa-caret-right"></i></a></li>                
              </ul>
            </div>
          </div>
        </nav>

      </div>
    </div>
    <!-- 컨텐츠  ================================================== -->
    <div class="container content-wrapper">
      <div class="page-header">
        <h1 class="title"><i class="fa fa-comments-o"></i>맘편한 상담</h1>
        <ol class="breadcrumb">
          <li><a href="/gnoincoun/">Home</a></li>
          <!--<li><a href="#">센터소개</a></li>-->
          <li class="active">맘편한 상담</li>
        </ol>
      </div>
      <h2 class="title">추가자료 입력</h2>
 	<form id="frm" name="frm" method="post">
 	  <input type="hidden" id="phone" name="phone" />
 	  <input type="hidden" id="emgcyPhone" name="emgcyPhone" />
      <div class="form-wrap">
        <div class="form-group">
          <label class="control-label" for="">Case No.</label>
          <input type="text" class="form-control" id="">
        </div>
        <div class="form-group">
          <label class="control-label" for="">상담자 구분<i class="cr">*</i></label>
          <div class="select">
            <select class="form-control" id="cnsrGb" name="cnsrGb">
				<c:forEach items="${cnsrGbCode }" var="code">
					<option value="${code.odr }">${code.mclassNm }</option>
				</c:forEach>
			</select>
          </div>
        </div>
        <div class="form-group">
          <label class="control-label" for="">상담자 성명</label>
          <input type="text" class="form-control" id="cnsrNm" name="cnsrNm">
        </div>
        <div class="form-group">
          <label class="control-label" for="">상담일<i class="cr">*</i></label>
          <div class="input-group">
            <input type="text" id="cnsDt" name="cnsDt" class="form-control" value="2020-05-22">
            <span class="input-group-btn">
              <button class="btn btn-default ico"><i class="fa fa-calendar"></i></button>
            </span>
          </div>
        </div>
        <div class="form-group">
          <label class="control-label" for="">시간</label>
          <div class="input-group">
            <!-- <input type="text" id="" name="" class="form-control ib w80p line" maxlength="2" style="width: 42px;"><span style="float: left;">시</span>
            <input type="text" id="" name="" class="form-control ib w80p line" maxlength="2" style="width: 42px;"><span style="float: left;">분</span>
            ~
            <input type="text" id="" name="" class="form-control ib w80p line" maxlength="2" style="width: 42px;"><span style="float: left;">시</span>
            <input type="text" id="" name="" class="form-control ib w80p line" maxlength="2" style="width: 42px;"><span style="float: left;">분</span>
            (<input type="text" id="" name="" class="form-control ib w80p line" maxlength="2" style="width: 42px;">분) -->
            <input type="text" id="cnsDtStdHour" name="cnsDtStdHour" class="form-control" maxlength="2" style="width: 42px;" oninput="this.value = this.value.replace(/[^0-9]/g, ''); $('tel').val(this.value);"><span style="float: left; line-height: 33px;">시</span>
            <input type="text" id="cnsDtStdMin" name="cnsDtStdMin" class="form-control" maxlength="2" style="width: 42px;" oninput="this.value = this.value.replace(/[^0-9]/g, ''); $('tel').val(this.value);"><span style="float: left; line-height: 33px;">분</span>
            <span style="float: left; line-height: 33px;">&nbsp;&nbsp;~&nbsp;&nbsp;</span>
            <input type="text" id="cnsDtEndHour" name="cnsDtEndHour" class="form-control" maxlength="2" style="width: 42px;" oninput="this.value = this.value.replace(/[^0-9]/g, ''); $('tel').val(this.value);"><span style="float: left; line-height: 33px;">시</span>
            <input type="text" id="cnsDtEndMin" name="cnsDtEndMin" class="form-control" maxlength="2" style="width: 42px;" oninput="this.value = this.value.replace(/[^0-9]/g, ''); $('tel').val(this.value);"><span style="float: left; line-height: 33px;">분 &nbsp;&nbsp;(</span>
            <input type="text" id="cnsDtTotMin" name="cnsDtTotMin" class="form-control" maxlength="2" style="width: 42px;" oninput="this.value = this.value.replace(/[^0-9]/g, ''); $('tel').val(this.value);"><span style="float: left; line-height: 33px;">분)</span>
            <!-- <span class="input-group-btn">
              <button class="btn btn-default ico"><i class="fa fa-calendar"></i></button>
            </span> -->
          </div>
        </div>
        <hr class="divider" />
        <h3 class="title">상담형태</h3>
        <div class="form-group">
          <label class="control-label" for="">상담경위<i class="cr">*</i></label>
          <div class="select">
            <select class="form-control" id="cnsDtl" name="cnsDtl">
				<c:forEach items="${cnsDtlCode }" var="code">
					<option value="${code.odr }">${code.mclassNm }</option>
				</c:forEach>
			</select>
          </div>
        </div>
        
        <hr class="divider" />
        <div class="panel panel-default">
          <div class="panel-heading">
            내담자 인적사항
          </div>
          <div class="panel-body">
            <div class="form-group">
              <label class="control-label" for="">노인과의 관계<i class="cr">*</i></label>
              <div class="select">
                <select class="form-control" id="olderRel" name="olderRel">
					<c:forEach items="${olderRelCode }" var="code">
						<option value="${code.odr }">${code.mclassNm }</option>
					</c:forEach>
				</select>
              </div>
            </div>
            <div class="form-group">
              <label class="control-label" for="">성명<i class="cr">*</i></label>
              <input type="text" class="form-control" id="cnsleNm" name="cnsleNm">
            </div>
            <div class="form-group line bb pb10">
              <label class="control-label" for="">성별<i class="cr">*</i></label>
              <div class="fr">
                <span class="radio-custom"><input type="radio" name="gender" id="gender1" value="M" checked="checked"><label for="gender1"><i></i><span>남</span></label></span>
                <span class="radio-custom"><input type="radio" name="gender" id="gender2" value="F" ><label for="gender2"><i></i><span>여</span></label></span>
              </div>
            </div>
            <div class="form-group">
              <label class="control-label" for="">출생년도<i class="cr">*</i></label>
              <div class="input-group">
                <input type="text" id="birthDt" name="birthDt" class="form-control" value="2020-05-22">
                <span class="input-group-btn">
                  <button class="btn btn-default ico"><i class="fa fa-calendar"></i></button>
                </span>
              </div>
            </div>
            <div class="form-group">
              <label class="control-label" for="">연락처<i class="cr">*</i></label>
              <div class="row">
                <div class="col-xs-4 pr0">
                  <div class="input-group">
                    <input type="text" class="form-control" id="phone1" name="phone1" oninput="this.value = this.value.replace(/[^0-9]/g, ''); $('phone1').val(this.value);">
                    <span class="input-group-addon">-</span>
                  </div>
                </div>
                <div class="col-xs-4 pr0 pl0">
                  <div class="input-group">
                    <input type="text" class="form-control" id="phone2" name="phone2" oninput="this.value = this.value.replace(/[^0-9]/g, ''); $('phone2').val(this.value);">
                    <span class="input-group-addon">-</span>
                  </div>
                </div>
                <div class="col-xs-4 pl0"><input type="text" class="form-control" id="phone3" name="phone3" oninput="this.value = this.value.replace(/[^0-9]/g, ''); $('phone3').val(this.value);"></div>
              </div>
            </div>
            <div class="form-group">
              <label class="control-label" for="">긴급 연락처<i class="cr">*</i></label>
              <div class="row">
                <div class="col-xs-4 pr0">
                  <div class="input-group">
                    <input type="text" class="form-control" id="emgcyPhone1" name="emgcyPhone1" oninput="this.value = this.value.replace(/[^0-9]/g, ''); $('phone1').val(this.value);">
                    <span class="input-group-addon">-</span>
                  </div>
                </div>
                <div class="col-xs-4 pr0 pl0">
                  <div class="input-group">
                    <input type="text" class="form-control" id="emgcyPhone2" name="emgcyPhone2" oninput="this.value = this.value.replace(/[^0-9]/g, ''); $('phone2').val(this.value);">
                    <span class="input-group-addon">-</span>
                  </div>
                </div>
                <div class="col-xs-4 pl0"><input type="text" class="form-control" id="emgcyPhone3" name="emgcyPhone3" oninput="this.value = this.value.replace(/[^0-9]/g, ''); $('phone3').val(this.value);"></div>
              </div>
              <br/> ( 관계: <input type="text" class="form-control ib w80p line" id="relation" name="relation"> )
            </div>
            <div class="form-group">
              <label class="control-label" for="">주소<i class="cr">*</i></label>
              <input type="text" class="form-control" id="address" name="address">
              <!-- <input type="text" class="form-control mt5" id="" name=""> -->
            </div>
            <div class="form-group">
              <label class="control-label" for="">학력<i class="cr">*</i></label>
              <div class="select">
                <select class="form-control" id="edu" name="edu">
				<c:forEach items="${eduCode }" var="code">
					<option value="${code.odr }">${code.mclassNm }</option>
				</c:forEach>
			</select>
              </div>
              <%-- <div class="select">
                <select class="form-control" id="cnsReqGb" name="cnsReqGb">
					<c:forEach items="${cnsReqCode }" var="code">
						<option value="${code.odr }">${code.mclassNm }</option>
					</c:forEach>
				</select>
              </div> --%>
            </div>
            <div class="form-group">
              <label class="control-label" for="">종교<i class="cr">*</i></label>
              <div class="select">
				<select class="form-control" id="relg" name="relg">
                  <option value="1">무교</option>
                  <option value="2">기독교</option>
                  <option value="3">천주교</option>
                  <option value="4">불교</option>
                  <option value="5">원불교</option>
                  <option value="6">기타</option>
                </select>
              </div>
            </div>
            <div class="form-group">
              <label class="control-label" for="">주거형태<i class="cr">*</i></label>
              <div class="select">
				<select class="form-control" id="livgForm" name="livgForm">
					<c:forEach items="${livgCode }" var="code">
						<option value="${code.odr }">${code.mclassNm }</option>
					</c:forEach>
				</select>
              </div>
            </div>
            <div class="form-group">
              <label class="control-label" for="">주택형태<i class="cr">*</i></label>
              <div class="select">
				<select class="form-control" id="houseForm" name="houseForm">
					<c:forEach items="${houseCode }" var="code">
						<option value="${code.odr }">${code.mclassNm }</option>
					</c:forEach>
				</select>
              </div>
            </div>
            <div class="form-group">
              <label class="control-label" for="">결혼상태<i class="cr">*</i></label>
              <div class="select">
				<select class="form-control" id="merrStat" name="merrStat">
					<c:forEach items="${merrStatCode }" var="code">
						<option value="${code.odr }">${code.mclassNm }</option>
					</c:forEach>
				</select>
              </div>
            </div>
            <div class="form-group">
              <label class="control-label" for="">동거형태<i class="cr">*</i></label>
              <div class="select">
				<select class="form-control" id="liveForm" name="liveForm">
					<c:forEach items="${liveCode }" var="code">
						<option value="${code.odr }">${code.mclassNm }</option>
					</c:forEach>
				</select>
              </div>
            </div>
          </div>
        </div><!-- .panel -->
        <div class="form-group">
          <label class="control-label" for="">주요문제<i class="cr">*</i></label>
          <div class="select">
			<select class="form-control" id="majorProb" name="majorProb">
				<c:forEach items="${majorProbCode }" var="code">
					<option value="${code.odr }">${code.mclassNm }</option>
				</c:forEach>
			</select>
          </div>
        </div>
        <div class="form-group">
          <label class="control-label" for="">상담내용</label>
          <textarea rows="5" class="form-control" id="cnsCntn" name="cnsCntn"></textarea>
        </div>
        <div class="form-group">
          <label class="control-label" for="">심리검사</label>
          <textarea rows="5" class="form-control" id="psyExam" name="psyExam" ></textarea>
        </div>
      </div>
      <div class="btn-wrap line bt pt20">
        <button type="button" onclick="javascript:fn_reg();" class="btn btn-primary btn-lg w100p">신청하기</button>
      </div>
    </form>
    </div><!-- .container.content-wrapper /-->
    <!-- FOOTER -->
    <footer>
      <div class="copyaddress">
        <ul>
          <li><b>경기도노인종합상담센터</b></li>
          <li><span>주소 : </span><a href="javascript:top_address()">경기도 수원시 장안구 경수대로 1150, 도서관 3층</a></li>
          <li><span>사업자등록번호 : </span>722-82-00367<span class="ml10">대표 : </span>김미나</li>
          <li><span> TEL : </span> <a href="javascript:top_tel()">031-222-1360</a></li>
          <li><span> FAX : </span><a href="javascript:top_fax()">070-4832-6366</a></li>
          <li><span>E-mail : </span><a href="javascript:top_email()">ggnoincoun@gmail.com</a></li>
          <li><span>개인정보담당자 : </span>김지원  </li>
          <li class="copyright">COPYRIGHT(c) <b>GNOIN</b> ALL RIGHT RESERVED</li>
        </ul>
      </div>
    </footer>
    <script src="/gnoincoun/assets/js/jquery.min.js"></script>
    <script src="/gnoincoun/assets/js/bootstrap.min.js"></script>
    <!--<script src="assets/js/docs.min.js"></script>-->
    <script src="/gnoincoun/assets/js/ie10-viewport-bug-workaround.js"></script>
    <script>
      $(document).ready(function(){ 
          // 로그인 회원가입 관리자 메뉴  
        $('.navbar-toggle').on('click', function() {
          $('.social-icons').fadeToggle(200);
        });
      });
		</script>
  </body>
</html>