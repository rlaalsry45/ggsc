<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <link href="../assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="../assets/css/font-awesome.min.css" rel="stylesheet">
    <!--[if lt IE 9]><script src="assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="../assets/js/ie-emulation-modes-warning.js"></script>
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="assets/js/html5shiv.min.js"></script>
      <script src="assets/js/respond.min.js"></script>
    <![endif]-->
    <!-- Custom styles for this template -->
    <link href="../assets/css/theme.css" rel="stylesheet">
  </head>
  <body>
    <!-- 헤더 ================================================== -->
    <header class="navbar-wrapper">
      <nav class="navbar navbar-static-top">
          <div class="container">
            <div class="navbar-header">
              <a class="navbar-brand" href="index.html"><img src="../assets/img/logo.png" alt="경기도노인종합상담센터" /></a>
              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">전체메뉴</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
              <ul class="nav navbar-nav">
                <li><a href="sub01.html">이렇게 이용하세요<i class="fa fa-caret-right"></i></a></li>
                <li><a href="sub02.html">간편한 심리검사<i class="fa fa-caret-right"></i></a></li>
                <li class="active"><a href="sub03.html">맘편한 상담<i class="fa fa-caret-right"></i></a></li>
                <li><a href="sub04.html">마이 페이지<i class="fa fa-caret-right"></i></a></li>
                <li><a href="sub05.html">알려드려요 &amp; 자유게시판<i class="fa fa-caret-right"></i></a></li>
                <li><a href="sub06.html">마음돌봄 자료실<i class="fa fa-caret-right"></i></a></li>
              </ul>
            </div>
          </div>
        </nav>
        <div class="social-icons pull-right">
          <ul class="nav nav-pills">
            <li><a href="index.html" class="btn btn-primary btn-xs"><i class="fa fa-home mr5"></i>홈</a></li>
            <li><a href="form_login.html" class="btn btn-primary btn-xs"><i class="fa fa-unlock-alt mr5"></i>로그인</a></li>
            <li><a href="form_signup.html" class="btn btn-primary  btn-xs"><i class="fa fa-user-plus mr5"></i>회원가입</a></li>
          </ul>
        </div>
    </header><!-- header.navbar-wrapper /-->
    <!-- 컨텐츠  ================================================== -->
    <div class="container content-wrapper">
      <div class="page-header">
        <h1 class="title"><i class="fa fa-comments-o"></i>맘편한 상담</h1>
        <ol class="breadcrumb">
          <li><a href="#">Home</a></li>
          <!--<li><a href="#">센터소개</a></li>-->
          <li class="active">맘편한 상담</li>
        </ol>
      </div>
      <div class="content">
        <div class="quick-tel pt5 pb5 line bt bb mb10">
          <button type="button" class="btn btn-default item01"><i class="fa fa-phone"></i>전화상담</button>
          <button type="button" class="btn btn-default item02"><i class="fa fa-phone"></i>내방상담</button>
          <button type="button" class="btn btn-default item03"><i class="fa fa-phone"></i>온라인상담</button>
        </div>
        <div class="panel panel-style01">
          <div class="panel-heading">
            쉿!<br />
            상담은 모두 비밀입니다.<br />
            <p class="text">아래 사항은 귀하의 상담을 원활하게 지원하고자 최소한의 정보만 수집합니다.<br />마음 편히 이용하세요.</p>
          </div>
        </div>
        <h2 class="title">상담신청</h2>
        <form class="form-wrap">
          <div class="form-group">
            <label class="control-label" for="">성명<i class="cr">*</i></label>
            <input type="text" class="form-control" id="">
          </div>
          <div class="form-group line bb pb10">
            <label class="control-label" for="">성별<i class="cr">*</i></label>
            <div class="fr">
              <span class="radio-custom"><input type="radio" name="" id="" value="" checked="checked"><label for=""><i></i><span>남</span></label></span>
              <span class="radio-custom"><input type="radio" name="" id="" value="" ><label for=""><i></i><span>여</span></label></span>
            </div>
          </div>
          <div class="form-group">
            <label class="control-label" for="">출생년도<i class="cr">*</i></label>
            <div class="input-group">
              <input type="text" id="" class="form-control" value="2020-05-22">
              <span class="input-group-btn">
                <button class="btn btn-default ico"><i class="fa fa-calendar"></i></button>
              </span>
            </div>
          </div>
          <div class="form-group">
            <label class="control-label" for="">연락처<i class="cr">*</i></label>
            <input type="text" class="form-control" id="">
          </div>
          <div class="form-group">
            <label class="control-label" for="">지역<i class="cr">*</i></label>
            <input type="text" class="form-control" id="">
          </div>
          <div class="form-group line bb pb10">
            <label class="control-label" for="">상담방법<i class="cr">*</i></label>
            <div class="block">
              <span class="radio-custom block mb5"><input type="radio" name="" id="" value="" checked="checked"><label for=""><i></i><span>전화상담</span></label></span>
              <span class="radio-custom block mb5"><input type="radio" name="" id="" value="" ><label for=""><i></i><span>카카오톡 상담</span></label></span>
              <span class="radio-custom block mb5"><input type="radio" name="" id="" value="" ><label for=""><i></i><span>대면 상담</span></label></span>
            </div>
          </div>
        </form><!-- .form-wrap /-->
        <div class="text-center mt30 mb50">
          상담을 진행하기 위해<br />개인정보제공에 동의함
          <span class="radio-custom ml5"><input type="radio" name="" id="" value="" ><label for=""><i></i><span class="sr-only">개인정보제공에 동의</span></label></span>
        </div>
        <!-- 이전버전 내용  -->
        <div class="form-wrap">
          <div class="form-group line bb pb10">
            <label class="control-label" for="">성별<i class="cr">*</i></label>
            <div class="fr">
              <span class="radio-custom"><input type="radio" name="" id="" value="" checked="checked"><label for=""><i></i><span>남</span></label></span>
              <span class="radio-custom"><input type="radio" name="" id="" value="" ><label for=""><i></i><span>여</span></label></span>
            </div>
          </div>
          <div class="form-group">
            <label class="control-label" for="">제목</label>
            <input type="text" class="form-control" id="">
          </div>
          <div class="form-group">
            <label class="control-label" for="">비밀번호</label>
            <input type="text" class="form-control" id="">
          </div>
          <div class="form-group">
            <label class="control-label" for="">문의내용</label>
            <textarea rows="5" class="form-control" id=""  ></textarea>
          </div>
          <div class="form-group">
            <label class="control-label" for="">작성일자</label>
            <div class="input-group">
              <input type="text" id="" class="form-control" value="2020-05-22">
              <span class="input-group-btn">
                <button class="btn btn-default ico"><i class="fa fa-calendar"></i></button>
              </span>
            </div>
          </div>
        </div>
        <h2 class="title">상담신청2</h2>
        <form class="form-wrap">
          <div class="table-wrap write row">
            <table  class="table table-condensed line bb">
              <col width="70px" />
              <col />
              <tbody>
                <tr>
                  <th scope="row">상담신청<br />구분</th>
                  <td>
                    <div class="select">
                      <select class="form-control">
                        <option>심리정서</option>
                        <option>대인관계</option>
                        <option>건강</option>
                        <option>자살</option>
                        <option>경제</option>
                        <option>치매</option>
                        <option>성</option>
                        <option>역할상실</option>
                        <option>가족</option>
                        <option>기타</option>
                      </select>
                    </div>
                  </td>
                </tr>
                <tr>
                  <th scope="row">상담구분</th>
                  <td>
                    <div class="select">
                      <select class="form-control">
                        <option>노인상담</option>
                      </select>
                    </div>
                  </td>
                </tr>
                <tr>
                  <th scope="row">권역</th>
                  <td>
                    <div class="select">
                      <select class="form-control">
                        <option>선택</option>
                      </select>
                    </div>
                  </td>
                </tr>
                <tr>
                  <th scope="row">센터</th>
                  <td>
                    <div class="select">
                      <select class="form-control">
                        <option>선택</option>
                      </select>
                    </div>
                  </td>
                </tr>
                <tr>
                  <th scope="row">이름<i class="cr">*</i></th>
                  <td><input type="text" class="form-control" id="" placeholder=""></td>
                </tr>
                <tr>
                  <th scope="row">성별<i class="cr">*</i></th>
                  <td>
                    <span class="radio-custom"><input type="radio" name="" id="" value="" checked="checked"><label for=""><i></i><span>남</span></label></span>
                    <span class="radio-custom"><input type="radio" name="" id="" value="" ><label for=""><i></i><span>여</span></label></span>
                  </td>
                </tr>
                <tr>
                  <th scope="row">생년월일<i class="cr">*</i></th>
                  <td>
                    <div class="input-group">
                        <input type="text" id="" class="form-control" value="2020-05-22">
                        <span class="input-group-btn">
                          <button class="btn btn-default ico"><i class="fa fa-calendar"></i></button>
                        </span>
                      </div>
                  </td>
                </tr>
                <tr>
                  <th scope="row">이메일</th>
                  <td><input type="text" class="form-control" id="" placeholder=""></td>
                </tr>
                <tr>
                  <th scope="row" >전화번호</th>
                  <td><input type="text" class="form-control" id="" placeholder=""></td>
                </tr>
                <tr>
                  <td colspan="2">
                    <label class="control-label" for="">핸드폰<i class="cr">*</i></label>
                      <div class="row">
                        <div class="col-xs-4 pr0">
                          <div class="input-group">
                            <input type="text" class="form-control" id="" placeholder="">
                            <span class="input-group-addon">-</span>
                          </div>
                        </div>
                        <div class="col-xs-4 pr0 pl0">
                          <div class="input-group">
                            <input type="text" class="form-control" id="" placeholder="">
                            <span class="input-group-addon">-</span>
                          </div>
                        </div>
                        <div class="col-xs-4 pl0"><input type="text" class="form-control" id="" placeholder=""></div>
                      </div>
                  </td>
                </tr>
                <tr>
                  <th scope="row" class="vt">핸드폰<i class="cr">*</i></th>
                  <td>
                    <div class="row">
                      <div class="col-xs-4 pr0">
                        <div class="input-group">
                          <input type="text" class="form-control" id="" placeholder="">
                          <span class="input-group-addon">-</span>
                        </div>
                      </div>
                      <div class="col-xs-4 pr0 pl0">
                        <div class="input-group">
                          <input type="text" class="form-control" id="" placeholder="">
                          <span class="input-group-addon">-</span>
                        </div>
                      </div>
                      <div class="col-xs-4 pl0"><input type="text" class="form-control" id="" placeholder=""></div>
                    </div>
                  </td>
                </tr>
                <tr>
                  <td colspan="2">
                    <!--<div class="form-group">
                      <label for="user_id">주소<i class="cr">*</i></label>
                      <div class="input-group">
                        <input name="user_id" id="user_id" type="text" class="form-control" placeholder="Your ID">
                        <span class="input-group-btn"><button type="button" class="btn btn-primary ">중복확인</button></span>
                      </div>
                    </div>-->
                    <div class="form-group">
                      <label class="control-label" for="">주소<i class="cr">*</i></label>
                      <div class="input-group w100p">
                        <input name="" id="" type="text" class="form-control" placeholder="0000-0000">
                        <span class="input-group-btn"><button type="button" class="btn btn-primary ">우편번호</button></span>
                      </div>
                      <input type="text" class="form-control mt5" id="">
                      <input type="text" class="form-control mt5" id="">
                    </div>
                  </td>
                </tr>
                <tr>
                  <th scope="row" rowspan="3" class="vt">주소<i class="cr">*</i></th>
                  <td>
                    <div class="input-group">
                        <input name="" id="" type="text" class="form-control" placeholder="0000-0000">
                        <span class="input-group-btn"><button type="button" class="btn btn-primary ">우편번호</button></span>
                      </div>
                  </td>
                </tr>
                <tr>
                  <td><input type="text" class="form-control" id="" placeholder=""></td>
                </tr>
                <tr>
                  <td><input type="text" class="form-control" id="" placeholder=""></td>
                </tr>
                <tr>
                  <th scope="row" class="vt">상담이력</th>
                  <td>
                    <span class="radio-custom"><input type="radio" name="" id="" value="" checked="checked"><label for=""><i></i><span>유</span></label></span>
                    <span class="radio-custom"><input type="radio" name="" id="" value="" ><label for=""><i></i><span>무</span></label></span>
                  </td>
                </tr>
                <tr>
                  <td colspan="2">
                    <div class="form-group">
                      <label class="control-label" for="">주상담 희망내용</label>
                      <textarea rows="5" class="form-control" id=""></textarea>
                    </div>
                  </td>
                </tr>
                <tr>
                  <th scope="row" class="vt">주상담<br />희망내용</th>
                  <td>
                      <textarea rows="5" class="form-control" id=""  ></textarea>
                  </td>
                </tr>
                <tr>
                  <td colspan="2">
                    <!-- 파일첨부 /-->
                    <div class="form-group">
                      <label class="control-label" for="">첨부파일</label>
                      <div class="filebox"> <input class="upload-name" value="파일선택" disabled="disabled"><label for="ex_filename">파일</label> <input type="file" id="ex_filename" class="upload-hidden"></div>
                      <div class="filebox"> <input class="upload-name" value="파일선택" disabled="disabled"><label for="ex_filename2">파일</label> <input type="file" id="ex_filename2" class="upload-hidden"></div>
                      <div class="filebox"> <input class="upload-name" value="파일선택" disabled="disabled"><label for="ex_filename3">파일</label> <input type="file" id="ex_filename3" class="upload-hidden"></div>
                      <div class="btn-group mt5 fr">
                        <button class="btn btn-xs btn-default" type="button"><i class="fa fa-plus"></i><span class="blind">추가</span></button>
                        <button class="btn btn-xs btn-default" type="button"><i class="fa fa-minus"></i><span class="blind">삭제</span></button>
                      </div>
                    </div>
                    <!-- 파일첨부 /-->
                  </td>
                </tr>
                <tr>
                  <th scope="row" class="vt">파일첨부</th>
                  <td>
                    <div class="filebox"> <input class="upload-name" value="파일선택" disabled="disabled"><label for="ex_filename">파일</label> <input type="file" id="ex_filename" class="upload-hidden"></div>
                    <div class="filebox"> <input class="upload-name" value="파일선택" disabled="disabled"><label for="ex_filename2">파일</label> <input type="file" id="ex_filename2" class="upload-hidden"></div>
                    <div class="filebox"> <input class="upload-name" value="파일선택" disabled="disabled"><label for="ex_filename3">파일</label> <input type="file" id="ex_filename3" class="upload-hidden"></div>
                    <div class="btn-group mt5 fr">
                      <button class="btn btn-xs btn-default" type="button"><i class="fa fa-plus"></i><span class="blind">추가</span></button>
                      <button class="btn btn-xs btn-default" type="button"><i class="fa fa-minus"></i><span class="blind">삭제</span></button>
                    </div>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>

          <div class="btn-wrap line pb20">
            <button type="button" class="btn btn-primary btn-lg w100p">신청하기</button>
          </div>
        </form><!-- .form-wrap /-->
        <div class="btn-wrap line bt bb pt10 pb10">
          <button type="button" class="btn btn-default">홈</button>
          <button type="button" class="fr btn btn-normal" onclick="location.href='form.html'">추가자료입력</button>
        </div>
      </div><!-- .content /-->
    </div><!-- .container.content-wrapper /-->
    <!-- FOOTER -->
    <footer>
      <div class="copyaddress">
        <ul>
          <li><b>경기도노인종합상담센터</b></li>
          <li><span>주소 : </span><a href="javascript:top_address()">경기도 수원시 장안구 경수대로 1150, 도서관 3층</a></li>
          <li><span>사업자등록번호 : </span>136-82-61243<span class="ml10">대표 : </span>김미나</li>
          <li><span> TEL : </span> <a href="javascript:top_tel()">031-222-1360</a></li>
          <li><span> FAX : </span><a href="javascript:top_fax()">070-4832-6366</a></li>
          <li><span>E-mail : </span><a href="javascript:top_email()">ggnoincoun@gmail.com</a></li>
          <li><span>개인정보담당자 : </span>김지원  </li>
          <li class="copyright">COPYRIGHT(c) <b>GNOIN</b> ALL RIGHT RESERVED</li>
        </ul>
      </div>
    </footer>

    <script src="../assets/js/jquery.min.js"></script>
    <script src="../assets/js/bootstrap.min.js"></script>
    <!--<script src="assets/js/docs.min.js"></script>-->
    <script src="../assets/js/ie10-viewport-bug-workaround.js"></script>
    <script>
      $(document).ready(function(){ 
        // 로그인 회원가입 관리자 메뉴  
          $('.navbar-toggle').on('click', function() {
            $('.social-icons').fadeToggle(200);
          });
        
        // 첨부파일 
        var fileTarget = $('.filebox .upload-hidden'); 
        fileTarget.on('change', function(){  // 값이 변경되면 
          if(window.FileReader){ // modern browser 
            var filename = $(this)[0].files[0].name; 
          } 
          else {  // old IE 
              var filename = $(this).val().split('/').pop().split('\\').pop();  // 파일명만 추출 
          } 
          // 추출한 파일명 삽입 
          $(this).siblings('.upload-name').val(filename); 
          }); 
        
        
        });
		</script>
  </body>
</html>