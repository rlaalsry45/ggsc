<%--
  Class Name : AdmMainView.jsp
  Description : 관리자메인화면
  Modification Information

      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2011.08.31   JJY       경량환경 버전 생성

    author   : 실행환경개발팀 JJY
    since    : 2011.08.31
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import ="ggsc.adm.login.service.LoginVO" %>

<%@ page import="java.net.URL"%>
<%@ page import="java.net.URLConnection"%>
<%@ page import="java.io.BufferedReader"%>
<%@ page import="java.io.InputStreamReader"%>
<%@ page import="java.io.InputStream"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="org.springframework.util.FileCopyUtils"%>
<%@ page import="org.springframework.util.xml.DomUtils"%>
<%@ page import="org.springframework.web.util.HtmlUtils"%>
<%@ page import="org.jdom2.Attribute"%>
<%@ page import="org.jdom2.DocType"%>
<%@ page import="org.jdom2.Document"%>
<%@ page import="org.jdom2.Element"%>
<%@ page import="org.jdom2.JDOMException"%>
<%@ page import="org.jdom2.input.SAXBuilder"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
//URL url = new URL("http://www.kma.go.kr/XML/weather/sfc_web_map.xml");
/* URL url = new URL("http://www.google.co.kr/ig/api?weather=seoul");
String xml = FileCopyUtils.copyToString(new InputStreamReader(url.openConnection().getInputStream(), "EUC-KR"));
SAXBuilder builder = new SAXBuilder();
Document doc = builder.build(new InputStreamReader(url.openConnection().getInputStream(), "EUC-KR"));
Element root= doc.getRootElement();
Element weather = root.getChild("weather");
Element current_conditions = weather.getChild("current_conditions");
List list = current_conditions.getChildren();
HashMap<String, String> result = new HashMap<String, String>();
for(Object obj : list){
       Element ele = (Element)obj;
       result.put(ele.getName(), ele.getAttributeValue("data"));
}
request.setAttribute("xml", HtmlUtils.htmlEscape(xml));
request.setAttribute("result", result); */

// 상태 : ${result.condition}
// 온도 : ${result.temp_f} (Fahrenheit)
// 온도: ${result.temp_c} (Celsius)
// 습도 : ${result.humidity}
// 바람 : ${result.wind_condition}
// xml : ${xml}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <meta http-equiv="content-language" content="ko">


    <title>유정산업 ERP</title>

    <!-- Bootstrap -->
    <link href="/erp/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="/erp/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="/erp/vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- iCheck -->
    <link href="/erp/vendors/iCheck/skins/flat/green.css" rel="stylesheet">
    <!-- bootstrap-progressbar -->
    <link href="/erp/vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet">
    <!-- JQVMap -->
    <link href="/erp/vendors/jqvmap/dist/jqvmap.min.css" rel="stylesheet"/>
    <!-- bootstrap-daterangepicker -->
    <link href="/erp/vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="/erp/build/css/custom.min.css" rel="stylesheet">

    <script src="/js/jquery.min.js" ></script>
  </head>

  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
        <div class="col-md-3 left_col">
          <c:import url="/adm/mnu/AdmMenuLft.do" />
        </div>

        <!-- top navigation -->
        <div class="top_nav">
          <div class="nav_menu">
            <nav>
              <div class="nav toggle">
                <a id="menu_toggle"><i class="fa fa-bars"></i></a>
              </div>

              <ul class="nav navbar-nav navbar-right">
                <li class="">
                  <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                    <c:out value="${userVO.userNm}" />
                    <span class=" fa fa-angle-down"></span>
                  </a>
                  <ul class="dropdown-menu dropdown-usermenu pull-right">
                    <li><a href="/adm/lgn/actionLogout.do"><i class="fa fa-sign-out pull-right"></i> Log Out</a></li>
                  </ul>
                </li>

<!--                 <li class=""> -->
<!--                   <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false"> -->
<!--                     <span class=" fa fa-angle-down"></span> -->
<!--                   </a> -->
<!--                   <ul class="dropdown-menu dropdown-usermenu pull-right"> -->
<!--                     <li><a href="/adm/lgn/actionLogout.do"><i class="fa fa-sign-out pull-right"></i> Log Out</a></li> -->
<!--                   </ul> -->
<!--                 </li> -->
<!-- 				<li> -->
<!--                   <a href=""> -->
<!--                   	<button type="button" onclick="/adm/lgn/actionLogout.do" class="btn btn-round btn-warning"><strong>로그아웃</strong></button> -->
<!--                   </a> -->
<!--                 </li> -->
              </ul>
            </nav>
          </div>
        </div>
        <!-- /top navigation -->
		<!-- page content -->
        <div class="right_col" role="main">
          <!-- top tiles -->
          <div class="row tile_count">
            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><i class="fa fa-user"></i> 여주공장</span>
              <div class="count blue"><c:out value="${pbProd10.prodhCnt}" /></div>
              <span class="count_bottom"><i class="red"><strong>생산수량</strong> </i></span>
            </div>
            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><i class="fa fa-user"></i> 원주공장</span>
              <div class="count purple"><c:out value="${pbProd11.prodhCnt}" /></div>
              <span class="count_bottom"><i class="red"><strong>생산수량</strong> </i></span>
            </div>
            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><i class="fa fa-user"></i> 안성공장</span>
              <div class="count green"><c:out value="${pbProd12.prodhCnt}" /></div>
              <span class="count_bottom"><i class="red"><strong>생산수량</strong> </i></span>
            </div>
            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><i class="fa fa-user"></i> 여주공장</span>
              <div class="count"><c:out value="${pbRels10.relCnt}" /></div>
              <span class="count_bottom"><i class="blue"><strong>출고수량</strong> </i></span>
            </div>
            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><i class="fa fa-user"></i> 원주공장</span>
              <div class="count"><c:out value="${pbRels11.relCnt}" /></div>
              <span class="count_bottom"><i class="blue"><strong>출고수량</strong> </i></span>
            </div>
            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><i class="fa fa-user"></i> 안성공장</span>
              <div class="count"><c:out value="${pbRels12.relCnt}" /></div>
              <span class="count_bottom"><i class="blue"><strong>출고수량</strong> </i></span>
            </div>
          </div>
          <!-- /top tiles -->

		  <!-- div class="row mgT30">
            <div class="col-md-12 col-sm-12 col-xs-12">
              <div class="dashboard_graph">
				<div class="row x_title">
                  <div class="col-md-6">
                    <h3>유정개발 월별 생산현황</h3>
                  </div>
                  <div class="filter">
					  <div id="reportrange" class="pull-right" style="background: #fff; cursor: pointer; padding: 5px 10px; border: 1px solid #ccc">
						<i class="glyphicon glyphicon-calendar fa fa-calendar"></i>
						<span>December 30, 2014 - January 28, 2015</span> <b class="caret"></b>
					  </div>
				  </div>
                </div>
				<div class="col-md-12 col-sm-12 col-xs-12">
				  <div class="demo-container" style="height:280px">
					<div id="placeholder34x" class="demo-placeholder"></div>
				  </div>
                </div>
			  </div>
            </div>
		  </div>
		  <div class="row mgT30">
            <div class="col-md-12 col-sm-12 col-xs-12">
              <div class="dashboard_graph">
				<div class="row x_title">
                  <div class="col-md-6">
                    <h3>유정레지콘 월별 생산현황</h3>
                  </div>
                  <div class="filter">
					  <div id="reportrange" class="pull-right" style="background: #fff; cursor: pointer; padding: 5px 10px; border: 1px solid #ccc">
						<i class="glyphicon glyphicon-calendar fa fa-calendar"></i>
						<span>December 30, 2014 - January 28, 2015</span> <b class="caret"></b>
					  </div>
				  </div>
                </div>
				<div class="col-md-12 col-sm-12 col-xs-12">
				  <div class="demo-container" style="height:280px">
					<div id="placeholder35x" class="demo-placeholder"></div>
				  </div>
                </div>
			  </div>
            </div>
		  </div-->
		  <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
              <div class="dashboard_graph overflow">
				<div class="row x_title">
                  <div class="col-md-6">
                    <h3>유정산업 월별 생산현황</h3>
                  </div>
                  <!-- form id="" class="form-horizontal">
					<div class="form-group">
						<div class="col-md-1 col-sm-1 col-xs-12 fr_div">
						  <select class="form-control">
							<option>1월</option>
							<option>2월</option>
							<option>3월</option>
						  </select>
						</div>
					</div>
				  </form-->
                </div>
				<div class="col-md-12 col-sm-12 col-xs-12">
				  <div class="demo-container" style="height:280px">
					<div id="placeholder33x" class="demo-placeholder"></div>
				  </div>
                </div>
			  </div>
            </div>
		  </div>
		  <div class="mgT20"></div>

		  <!-- row 막대그래프-->
		  <div class="row">
		  	  <!--  여주공장 인원현황  Start 총원과 결근 값 셋팅은 Script는 없고  style의 width 값으로 표현  -->
              <c:forEach var="man" items="${mainTotal}" varStatus="status">
              <div class="col-md-4 col-sm-4 col-xs-12">
                <div class="x_panel fixed_height_120">
                  <div class="x_title">
                    <h2><c:out value="${man.pbNm}" /><small>인원현황</small></h2>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    <h4><c:out value="${man.pbNm}" /></h4>
                    <div class="widget_summary">
                      <div class="w_left w_25">
                        <span>총원</span>
                      </div>
                      <div class="w_center w_55">
                        <div class="progress">
                          <div class="progress-bar bg-green" role="progressbar" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100" style="width: 100%;">
                            <span class="sr-only">10% Complete</span>
                          </div>
                        </div>
                      </div>
                      <div class="w_right w_20">
                        <span><c:out value="${man.tot}" />명</span>
                      </div>
                      <div class="clearfix"></div>
                    </div>

                    <div class="widget_summary">
                      <div class="w_left w_25">
                        <span>출근</span>
                      </div>
                      <div class="w_center w_55">
                        <div class="progress">
                          <div class="progress-bar bg-blue" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: <c:out value="${man.gwRate}" />%;">
                            <span class="sr-only">60% Complete</span>
                          </div>
                        </div>
                      </div>
                      <div class="w_right w_20">
                        <span><c:out value="${man.gw}" />명</span>
                      </div>
                      <div class="clearfix"></div>
                    </div>

                    <div class="widget_summary">
                      <div class="w_left w_25">
                        <span>결근</span>
                      </div>
                      <div class="w_center w_55">
                        <div class="progress">
                          <div class="progress-bar bg-red" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: <c:out value="${man.absentRate}" />%;">
                            <span class="sr-only">60% Complete</span>
                          </div>
                        </div>
                      </div>
                      <div class="w_right w_20">
                        <span><c:out value="${man.absentTot}" />명</span>
                      </div>
                      <div class="clearfix"></div>
                    </div>
                  </div>
                </div>
              </div>
              <!--  여주공장 인원현황  End   -->
              </c:forEach>


          </div>
		  <!-- //row 막대그리프 -->
          <div class="clearfix"></div>
          <!-- row 점그래프-->
		  <div class="row">
             <div class="col-md-4 col-sm-4 col-xs-12">
              <div class="x_panel tile fixed_height_260">
                <div class="x_title">
                  <h2>출고현황</h2>
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                  <table class="" style="width:100%">
                    <tr>
                      <th style="width:37%;">
                        <p>여주공장 일일출고</p>
                      </th>
                      <th>
                        <div class="col-lg-7 col-md-7 col-sm-7 col-xs-7">
                          <!-- p class="">분류</p-->
                        </div>
                      </th>
                    </tr>
                    <tr>
                      <td>
                        <canvas id="canvas1" height="140" width="140" style="margin: 15px 10px 10px 0"></canvas>
                      </td>
                      <td>
                        <!-- table class="tile_info">
                          <tr>
                            <td><p><i class="fa fa-square blue"></i>여주공장 </p></td>
                          </tr>
                          <tr>
                            <td><p><i class="fa fa-square purple"></i>원주공장 </p></td>
                          </tr>
                          <tr>
                            <td><p><i class="fa fa-square green"></i>안성공장 </p></td>
                          </tr>
                        </table-->
                      </td>
                    </tr>
                  </table>
                </div>
              </div>
            </div>

            <div class="col-md-4 col-sm-4 col-xs-12">
              <div class="x_panel tile fixed_height_260">
                <div class="x_title">
                  <h2>출고현황</h2>
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                  <table class="" style="width:100%">
                    <tr>
                      <th style="width:37%;">
                        <p>원주공장 일일출고</p>
                      </th>
                      <th>
                        <div class="col-lg-7 col-md-7 col-sm-7 col-xs-7">
                          <!-- p class="">분류</p-->
                        </div>
                      </th>
                    </tr>
                    <tr>
                      <td>
                        <canvas id="canvas2" height="140" width="140" style="margin: 15px 10px 10px 0"></canvas>
                      </td>
                      <td>
                        <!-- table class="tile_info">
                          <tr>
                            <td><p><i class="fa fa-square blue"></i>여주공장 </p></td>
                          </tr>
                          <tr>
                            <td><p><i class="fa fa-square purple"></i>원주공장 </p></td>
                          </tr>
                          <tr>
                            <td><p><i class="fa fa-square green"></i>안성공장 </p></td>
                          </tr>
                        </table-->
                      </td>
                    </tr>
                  </table>
                </div>
              </div>
            </div>

            <div class="col-md-4 col-sm-4 col-xs-12">
              <div class="x_panel tile fixed_height_260">
                <div class="x_title">
                  <h2>출고현황</h2>
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                  <table class="" style="width:100%">
                    <tr>
                      <th style="width:37%;">
                        <p>안성공장 일일출고</p>
                      </th>
                      <th>
                        <div class="col-lg-7 col-md-7 col-sm-7 col-xs-7">
                          <!-- p class="">분류</p-->
                        </div>
                      </th>
                    </tr>
                    <tr>
                      <td>
                        <canvas id="canvas3" height="140" width="140" style="margin: 15px 10px 10px 0"></canvas>
                      </td>
                      <td>
                        <!-- table class="tile_info">
                          <tr>
                            <td><p><i class="fa fa-square blue"></i>여주공장 </p></td>
                          </tr>
                          <tr>
                            <td><p><i class="fa fa-square purple"></i>원주공장 </p></td>
                          </tr>
                          <tr>
                            <td><p><i class="fa fa-square green"></i>안성공장 </p></td>
                          </tr>
                        </table-->
                      </td>
                    </tr>
                  </table>
                </div>
              </div>
            </div>
          </div>
		  <!-- //row 점그리프 -->
          <div class="clearfix"></div>
          <!-- row 원그래프-->
		  <div class="row">
            <div class="col-md-4 col-sm-4 col-xs-12">
              <div class="x_panel tile fixed_height_260">
                <div class="x_title">
                  <h2>결제현황</h2>
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                  <div class="dashboard-widget-content">

                    <div class="sidebar-widget_g txtC">
                      <h4>회장님 일일전자결제현황</h4>
                      <canvas width="150" height="80" id="foo1" class="" style="width: 160px; height: 100px;"></canvas>
                      <div class="goal-wrapper">
                        <span class="gauge-value pull-left"></span>
                        <span id="gauge-text1" class="gauge-value pull-left"><c:out value="${presTotal.signCnt}" /></span>
                        <span id="goal-text" class="goal-value pull-right"><c:out value="${presTotal.docTot}" /></span>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>

			<div class="col-md-4 col-sm-4 col-xs-12">
              <div class="x_panel tile fixed_height_260">
                <div class="x_title">
                  <h2>결제현황</h2>
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                  <div class="dashboard-widget-content">

                    <div class="sidebar-widget_g txtC">
                      <h4>대표이사 일일전자결제현황</h4>
                      <canvas width="150" height="80" id="foo2" class="" style="width: 160px; height: 100px;"></canvas>
                      <div class="goal-wrapper">
                        <span class="gauge-value pull-left"></span>
                        <span id="gauge-text2" class="gauge-value pull-left"><c:out value="${ceoSignTotal.signCnt}" /></span>
                        <span id="goal-text" class="goal-value pull-right"><c:out value="${ceoSignTotal.docTot}" /></span>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>

			<div class="col-md-4 col-sm-4 col-xs-12">
              <div class="x_panel tile fixed_height_260">
                <div class="x_title">
                  <h2>결제현황</h2>
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                  <div class="dashboard-widget-content">

                    <div class="sidebar-widget_g txtC">
                      <h4>일일전자결제현황</h4>
                      <canvas width="150" height="80" id="foo3" class="" style="width: 160px; height: 100px;"></canvas>
                      <div class="goal-wrapper">
                        <span class="gauge-value pull-left"></span>
                        <span id="gauge-text3" class="gauge-value pull-left"><c:out value="${userSignTotal.signCnt}" /></span>
                        <span id="goal-text" class="goal-value pull-right"><c:out value="${userSignTotal.docTot}" /></span>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
		  </div>
		  <!-- //row 원그래프-->
		</div>
        <!-- /page content -->


		<!-- footer content -->
        <footer>
          <div class="pull-right">
            <img src="/images/b_yj_logo.jpg">
          </div>
          <div class="clearfix"></div>
        </footer>
        <!-- /footer content -->
      </div>
    </div>

    <!-- jQuery -->
    <script src="/erp/vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="/erp/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="/erp/vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="/erp/vendors/nprogress/nprogress.js"></script>
    <!-- Chart.js -->
    <script src="/erp/vendors/Chart.js/dist/Chart.min.js"></script>
    <!-- gauge.js -->
    <script src="/erp/vendors/gauge.js/dist/gauge.min.js"></script>
    <!-- bootstrap-progressbar -->
    <script src="/erp/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
    <!-- iCheck -->
    <script src="/erp/vendors/iCheck/icheck.min.js"></script>
    <!-- Skycons -->
    <script src="/erp/vendors/skycons/skycons.js"></script>
    <!-- Flot -->
    <script src="/erp/vendors/Flot/jquery.flot.js"></script>
    <script src="/erp/vendors/Flot/jquery.flot.pie.js"></script>
    <script src="/erp/vendors/Flot/jquery.flot.time.js"></script>
    <script src="/erp/vendors/Flot/jquery.flot.stack.js"></script>
    <script src="/erp/vendors/Flot/jquery.flot.resize.js"></script>
    <!-- Flot plugins -->
    <script src="/erp/vendors/flot.orderbars/js/jquery.flot.orderBars.js"></script>
    <script src="/erp/vendors/flot-spline/js/jquery.flot.spline.min.js"></script>
    <script src="/erp/vendors/flot.curvedlines/curvedLines.js"></script>
    <!-- DateJS -->
    <script src="/erp/vendors/DateJS/build/date.js"></script>
    <!-- JQVMap -->
    <script src="/erp/vendors/jqvmap/dist/jquery.vmap.js"></script>
    <script src="/erp/vendors/jqvmap/dist/maps/jquery.vmap.world.js"></script>
    <script src="/erp/vendors/jqvmap/examples/js/jquery.vmap.sampledata.js"></script>
    <!-- bootstrap-daterangepicker -->
    <script src="/erp/vendors/moment/min/moment.min.js"></script>
    <script src="/erp/vendors/bootstrap-daterangepicker/daterangepicker.js"></script>

    <!-- Custom Theme Scripts -->
    <script src="/erp/build/js/custom.min.js"></script>
    <script src="/erp/vendors/raphael/raphael.min.js"></script>
    <script src="/erp/vendors/morris.js/morris.min.js"></script>

    <!-- Flot -->
    <script>
      $(document).ready(function() {
        //define chart clolors ( you maybe add more colors if you want or flot will add it automatic )
        var chartColours = ['#96CA59', '#3F97EB', '#72c380', '#6f7a8a', '#f7cb38', '#5a8022', '#2c7282'];

        //generate random number for charts
        randNum = function() {
          return (Math.floor(Math.random() * (1 + 40 - 20))) + 20;
        };

        var d1 = [];
        //var d2 = [];

        //here we generate data for chart
        //for (var i = 0; i < 30; i++) {
          //d1.push([new Date(Date.today().add(i).days()).getTime(), randNum() + i + i + 10]);
          //    d2.push([new Date(Date.today().add(i).days()).getTime(), randNum()]);
        //}

        <c:forEach var="prod" items="${pbProdMonth11}" varStatus="status">
        	d1.push([new Date(Date.today().add(<c:out value="${status.index}" />).days()).getTime(), <c:out value="${prod.prodCnt}" />]);
        </c:forEach>

        var chartMinDate = d1[0][0]; //first day
        var chartMaxDate = d1[30][0]; //last day

        var tickSize = [1, "day"];
        var tformat = "%y-%m-%d";

        //graph options
        var options = {
          grid: {
            show: true,
            aboveData: true,
            color: "#3f3f3f",
            labelMargin: 10,
            axisMargin: 0,
            borderWidth: 0,
            borderColor: null,
            minBorderMargin: 5,
            clickable: true,
            hoverable: true,
            autoHighlight: true,
            mouseActiveRadius: 100
          },
          series: {
            lines: {
              show: true,
              fill: true,
              lineWidth: 2,
              steps: false
            },
            points: {
              show: true,
              radius: 4.5,
              symbol: "circle",
              lineWidth: 3.0
            }
          },
          legend: {
            position: "ne",
            margin: [0, -25],
            noColumns: 0,
            labelBoxBorderColor: null,
            labelFormatter: function(label, series) {
              // just add some space to labes
              return label + '&nbsp;&nbsp;';
            },
            width: 40,
            height: 1
          },
          colors: chartColours,
          shadowSize: 0,
          tooltip: true, //activate tooltip
          tooltipOpts: {
            content: "%s: %y.0",
            xDateFormat: "%d/%m",
            shifts: {
              x: -30,
              y: -50
            },
            defaultTheme: false
          },
          yaxis: {
            min: 0
          },
          xaxis: {
            mode: "time",
            minTickSize: tickSize,
            timeformat: tformat,
            min: chartMinDate,
            max: chartMaxDate
          }
        };
        var plot = $.plot($("#placeholder33x"), [{
          label: "",
          data: d1,
          lines: {
            fillColor: "rgba(150, 202, 89, 0.12)"
          }, //#96CA59 rgba(150, 202, 89, 0.42)
          points: {
            fillColor: "#fff"
          }
        }], options);
      });
    </script>
    <!-- /Flot -->

    <!-- JQVMap -->
    <script>
      $(document).ready(function(){
        $('#world-map-gdp').vectorMap({
            map: 'world_en',
            backgroundColor: null,
            color: '#ffffff',
            hoverOpacity: 0.7,
            selectedColor: '#666666',
            enableZoom: true,
            showTooltip: true,
            values: sample_data,
            scaleColors: ['#E6F2F0', '#149B7E'],
            normalizeFunction: 'polynomial'
        });
      });
    </script>
    <!-- /JQVMap -->

    <!-- Skycons -->
    <script>
      $(document).ready(function() {
        var icons = new Skycons({
            "color": "#73879C"
          }),
          list = [
            "clear-day", "clear-night", "partly-cloudy-day",
            "partly-cloudy-night", "cloudy", "rain", "sleet", "snow", "wind",
            "fog"
          ],
          i;

        for (i = list.length; i--;)
          icons.set(list[i], list[i]);

        icons.play();
      });
    </script>
    <!-- /Skycons -->

    <!-- Doughnut Chart -->
    <script>
    var itemArr10 = new Array();
    var rateArr10 = new Array();

    var itemArr11 = new Array();
    var rateArr11 = new Array();

    var itemArr12 = new Array();
    var rateArr12 = new Array();

      $(document).ready(function(){
        var options = {
          legend: false,
          responsive: false
        };
		$.ajax({
	        type:"POST",
	        url:"/adm/main/dayRelStat.do",
	        dataType:"json",
	        contentType: "application/json; charset=utf-8",
	        success:function(json){

	        	if (json.rels10.length > 0) {
	        		$.each(json.rels10,function(i,d){
	        			itemArr10.push(d.itemNm);
	        			rateArr10.push(d.itemRate);
	        		});
	        	}

	        	if (json.rels11.length > 0) {
	        		$.each(json.rels11,function(i,d){
	        			itemArr11.push(d.itemNm);
	        			rateArr11.push(d.itemRate);
	        		});
	        	}

	        	if (json.rels12.length > 0) {
	        		$.each(json.rels12,function(i,d){
	        			itemArr12.push(d.itemNm);
	        			rateArr12.push(d.itemRate);
	        		});
	        	}

		        new Chart(document.getElementById("canvas1"), {
		          type: 'doughnut',
		          tooltipFillColor: "rgba(51, 51, 51, 0.55)",
		          data: {
		            labels: itemArr11,
		            datasets: [{
		              data: rateArr11,
		              backgroundColor: [
		                                "#1abb9c",
		                                "#9b59b6",
		                                "#3498db"
		              ],
		              hoverBackgroundColor: [
		                                     "#28c8a9",
		                                     "#ac6cc6",
		                                     "#49A9EA"
		              ]
		            }]
		          },
		          options: options
		        });

		        new Chart(document.getElementById("canvas2"), {
			          type: 'doughnut',
			          tooltipFillColor: "rgba(51, 51, 51, 0.55)",
			          data: {
			            labels: itemArr10,
			            datasets: [{
			              data: rateArr10,
			              backgroundColor: [
			                                "#1abb9c",
			                                "#9b59b6",
			                                "#3498db"
			              ],
			              hoverBackgroundColor: [
			                                     "#28c8a9",
			                                     "#ac6cc6",
			                                     "#49A9EA"
			              ]
			            }]
			          },
			          options: options
			    });

		        new Chart(document.getElementById("canvas3"), {
			          type: 'doughnut',
			          tooltipFillColor: "rgba(51, 51, 51, 0.55)",
			          data: {
			            labels: itemArr12,
			            datasets: [{
			              data: rateArr12,
			              backgroundColor: [
			                                "#1abb9c",
			                                "#9b59b6",
			                                "#3498db"
			              ],
			              hoverBackgroundColor: [
			                                     "#28c8a9",
			                                     "#ac6cc6",
			                                     "#49A9EA"
			              ]
			            }]
			          },
			          options: options
			    });

		    },
        	error:function(e){
        		alert("서버와 통신 오류입니다.");
		    }
		});  //end ajax

      });

    </script>
    <!-- /Doughnut Chart -->
    <!-- Doughnut Chart>
    <script>
      $(document).ready(function(){
        var options = {
          legend: false,
          responsive: false
        };

        new Chart(document.getElementById("canvas1"), {
          type: 'doughnut',
          tooltipFillColor: "rgba(51, 51, 51, 0.55)",
          data: {
            labels: [
              "안성공장",
              "원주공장",
              "여주공장"
            ],
            datasets: [{
              data: [40, 30, 30],
              backgroundColor: [
                "#1abb9c",
                "#9b59b6",
                "#3498db"
              ],
              hoverBackgroundColor: [
                "#28c8a9",
                "#ac6cc6",
                "#49A9EA"
              ]
            }]
          },
          options: options
        });
      });
    </script>
    <!-- /Doughnut Chart -->

    <!-- bootstrap-daterangepicker -->
    <script>
      $(document).ready(function() {

        var cb = function(start, end, label) {
          console.log(start.toISOString(), end.toISOString(), label);
          $('#reportrange span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
        };

        var optionSet1 = {
          startDate: moment().subtract(29, 'days'),
          endDate: moment(),
          minDate: '01/01/2012',
          maxDate: '12/31/2015',
          dateLimit: {
            days: 60
          },
          showDropdowns: true,
          showWeekNumbers: true,
          timePicker: false,
          timePickerIncrement: 1,
          timePicker12Hour: true,
          ranges: {
            'Today': [moment(), moment()],
            'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
            'Last 7 Days': [moment().subtract(6, 'days'), moment()],
            'Last 30 Days': [moment().subtract(29, 'days'), moment()],
            'This Month': [moment().startOf('month'), moment().endOf('month')],
            'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
          },
          opens: 'left',
          buttonClasses: ['btn btn-default'],
          applyClass: 'btn-small btn-primary',
          cancelClass: 'btn-small',
          format: 'YYYY-MM-DD',
          separator: ' to ',
          locale: {
            applyLabel: 'Submit',
            cancelLabel: 'Clear',
            fromLabel: 'From',
            toLabel: 'To',
            customRangeLabel: 'Custom',
            daysOfWeek: ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa'],
            monthNames: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
            firstDay: 1
          }
        };
        $('#reportrange span').html(moment().subtract(29, 'days').format('MMMM D, YYYY') + ' - ' + moment().format('MMMM D, YYYY'));
        $('#reportrange').daterangepicker(optionSet1, cb);
        $('#reportrange').on('show.daterangepicker', function() {
          console.log("show event fired");
        });
        $('#reportrange').on('hide.daterangepicker', function() {
          console.log("hide event fired");
        });
        $('#reportrange').on('apply.daterangepicker', function(ev, picker) {
          console.log("apply event fired, start/end dates are " + picker.startDate.format('MMMM D, YYYY') + " to " + picker.endDate.format('MMMM D, YYYY'));
        });
        $('#reportrange').on('cancel.daterangepicker', function(ev, picker) {
          console.log("cancel event fired");
        });
        $('#options1').click(function() {
          $('#reportrange').data('daterangepicker').setOptions(optionSet1, cb);
        });
        $('#options2').click(function() {
          $('#reportrange').data('daterangepicker').setOptions(optionSet2, cb);
        });
        $('#destroy').click(function() {
          $('#reportrange').data('daterangepicker').remove();
        });
      });
    </script>
    <!-- /bootstrap-daterangepicker -->

    <!-- gauge.js -->
    <script>
      var opts = {
          lines: 12,
          angle: 0,
          lineWidth: 0.4,
          pointer: {
              length: 0.75,
              strokeWidth: 0.042,
              color: '#1D212A'
          },
          limitMax: 'false',
          colorStart: '#1ABC9C',
          colorStop: '#1ABC9C',
          strokeColor: '#F0F3F3',
          generateGradient: true
      };
      var target = document.getElementById('foo1'),
          gauge = new Gauge(target).setOptions(opts);

      gauge.maxValue = <c:out value="${presTotal.docTot}" />;
      gauge.animationSpeed = 32;
      gauge.set(<c:out value="${presTotal.signCnt}" />);
      gauge.setTextField(document.getElementById("gauge-text1"));
    </script>
    <!-- /gauge.js -->

    <!-- gauge.js -->
    <script>
      var opts = {
          lines: 12,
          angle: 0,
          lineWidth: 0.4,
          pointer: {
              length: 0.75,
              strokeWidth: 0.042,
              color: '#1D212A'
          },
          limitMax: 'false',
          colorStart: '#1ABC9C',
          colorStop: '#1ABC9C',
          strokeColor: '#F0F3F3',
          generateGradient: true
      };
      var target = document.getElementById('foo2'),
      gauge = new Gauge(target).setOptions(opts);

	  gauge.maxValue = <c:out value="${ceoSignTotal.docTot}" />;
	  gauge.animationSpeed = 32;
	  gauge.set(<c:out value="${ceoSignTotal.signCnt}" />);
	  gauge.setTextField(document.getElementById("gauge-text2"));
    </script>
    <!-- /gauge.js -->

    <!-- gauge.js -->
    <script>
      var opts = {
          lines: 12,
          angle: 0,
          lineWidth: 0.4,
          pointer: {
              length: 0.75,
              strokeWidth: 0.042,
              color: '#1D212A'
          },
          limitMax: 'false',
          colorStart: '#1ABC9C',
          colorStop: '#1ABC9C',
          strokeColor: '#F0F3F3',
          generateGradient: true
      };
      var target = document.getElementById('foo3'),
      gauge = new Gauge(target).setOptions(opts);

	  gauge.maxValue = <c:out value="${userSignTotal.docTot}" />;
	  gauge.animationSpeed = 32;
	  gauge.set(<c:out value="${userSignTotal.signCnt}" />);
	  gauge.setTextField(document.getElementById("gauge-text3"));
    </script>
    <!-- /gauge.js -->
  </body>
</html>
