<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%-- <%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
 --%>


	<!-- wrap --> 
	<div class="wrap"> 
		
		<!-- container --> 
		<div class="container">
			<!-- snb --> 
			<div class="snb">
				<div class="left_title">
					<h1>신탁계약등록</h1>
				</div>
				<div class="nav-container">
					<ul class="left_nav">
						<li>
							<a href="/admRdCntList.do">차수관리</a>
						</li>
						<li class="active">
							<a href="/admRdBdList.do">신탁계약등록</a>
						</li>
						<li>
							<a href="/admRdBdRstList.do">신탁계약결과</a>
						</li>
						<li>
							<a href="/admRdDirList.do">요양지시서등록</a>
						</li>
						<li>
							<a href="/admRdDirRstList.do">요양지시서결과</a>
						</li>
						<li>
							<a href="/admRdEachList.do">개별등록</a>
						</li>
					</ul>
				</div>
			</div> 
			<!-- //snb --> 
			<!-- content --> 
			<div class="content"> 
				<div class="paT40 paB25">
					<h1>신탁계약 일괄등록</h1>
				</div>
				
				<!-- view  start -->
				<div class="form_table">
					<form id="regRdFrm" name="regRdFrm" method="post" enctype="multipart/form-data">
							<table class="notice_view" border="1" cellspacing="0" summary=""> 
								<caption>요양지시서관리 내용입니다.</caption> 
								<colgroup> 
								<col width="150">
								<col width="*">
								</colgroup> 
								<tbody> 
								
								<tr> 
									<th>제목</th> 
									<td>
										<div class="item">
										<input id="title" name="title" value="" class="i_text wp95" type="text">
										</div>
									</td> 
								</tr> 
								<tr> 
									<th>년도</th> 
									<td>
										<select name="year" style="width:30%;" >
											<option value="2019" >2021년</option>
											<option value="2019" >2020년</option>
										    <option value="2019" >2019년</option>
										    <option value="2018">2018년</option>
										</select>
									</td> 
								</tr>
								<tr> 
									<th>월</th> 
									<td>
										<select name="month" style="width:30%;" >
											<option value="01" >1월</option>
											<option value="02" >2월</option>
										    <option value="03" >3월</option>
										    <option value="04" >4월</option>
										    <option value="05" >5월</option>
										    <option value="06" >6월</option>
										    <option value="07" >7월</option>
										    <option value="08" >8월</option>
										    <option value="09" >9월</option>
										    <option value="10" >10월</option>
										    <option value="11" >11월</option>
										    <option value="12" >12월</option>
										</select>
									</td> 
								</tr>
								<tr> 
									<th>차수</th> 
									<td>
										<select name="cnt" style="width:30%;" >
											<option value="1" >1차</option>
											<option value="2" >2차</option>
										    <option value="3" >3차</option>
										    <option value="4" >4차</option>
										    <option value="5" >5차</option>
										</select>
									</td> 
								</tr>
								<tr> 
									<th>Excel파일 업로드</th> 
									<td>
										<div class="item">
											<input type="file" id="excelFile" name="excelFile" value="" class="i_text wp95" >
										</div>
									</td> 
								</tr>  
								</tbody> 
							</table>
					</form>
				</div>
				<div class="fl_R mgT10">
					<a href="javascript:fn_reg();" class="btn_big"><strong>저장하기</strong></a>
					<a href="javascript:fn_list();" class="btn_big"><strong>목록보기</strong></a>
				</div>
				<!-- view  end -->
			</div> 
			<!-- //content --> 
		</div> 
		<!-- //container -->
		
	</div>
	<!-- /wrap --> 

	
	<!--/#action-->
    <script type="text/javaScript" language="javascript" defer="defer">
        
        // 요양지시서 등록하기
        function fn_reg() {
        	
        	document.regRdFrm.action = "/admRdBdReg.do";
           	document.regRdFrm.submit();
        }
        
        //Excel 파일 체크하기
        function checkFileType(filePath) {
            var fileFormat = filePath.split(".");
            if (fileFormat.indexOf("xlsx") > -1) {
                return true;
            } else {
                return false;
            }

        }

        /* function fn_reg() {
            var file = $("#excelFile").val();
            if (file == "" || file == null) {
                alert("파일을 선택해주세요.");
                return false;
            } else if (!checkFileType(file)) {
                alert("엑셀 파일만 업로드 가능합니다.");
                return false;
            }

            if (confirm("업로드 하시겠습니까?")) {
            	
            	//var data = new FormData();
                $.ajax({
                   enctype:"multipart/form-data",
                   method:"POST",
                   url: '/admRdBdReg.do',
                   processData: false,   
                   contentType: false,
                   cache: false,
                   data: data,
                   success: function(result){  
                       alert("업로드하였습니다.");
                   }
                });
        	}
        } */

        
        
        // 요양지시서 목록
        function fn_list() {
        	
        	document.regRdFrm.action = "/admRdBdList.do";
           	document.regRdFrm.submit();
        }
        
        
        
        //-->
    </script>
	
	
	<!-- footer --> 
	<div class="footer"> 
		<p>All Rights Reserved.</p>
	</div> 
	<!-- //footer --> 