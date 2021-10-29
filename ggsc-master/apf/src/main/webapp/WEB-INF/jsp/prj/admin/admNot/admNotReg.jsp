<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@ page import="java.net.URLEncoder"%>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>




<!-- <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet"/>  -->
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<!-- include summernote css/js--> 
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.1/summernote.css" rel="stylesheet"/>
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.1/summernote.js"></script>


<link href="/editor/css/bootstrap_3.3.5.css" rel="stylesheet">

<script type="text/javascript">
	
	
	$(document).ready(function() {	
	    $('#summernote').summernote({
		height : 300 // 에디터의 높이 
		,minHeight : null
		,maxHeight : null
		,focus : true
		,lang : 'ko-KR' // 기본 메뉴언어 US->KR로 변경
		,callbacks: {
			onImageUpload: function(files, editor, welEditable) {
	            	save_file(files,this);
	        }

		}
	    });
	
	});
	
	
	
	function save_file(files,el){
		var data=new FormData();
	    for(var i=0;i<files.length;i++){
			data.append("file",files[i]);
	    }
	    if($("#tmp_file_num").val()!="" && parseInt($("#tmp_file_num").val())>0){
			data.append("file_num",$("#tmp_file_num").val());
	    }
	    
	    //alert("$(#tmp_file_num).val()  ====   "  + $("#tmp_file_num").val());
	    
	    $.ajax({
	        data: data,
	        type: "POST",
	        url: "/admNot/upload_tmp_file.do",
	        cache: false,
	        contentType: false,
	        processData: false,
	        dataType:"json",	        
	        success: function(json) {
	        	//alert("json.url =========== "+json.url);
	        	if(json.success=="true"){
	        		$(el).summernote('editor.insertImage', json.url);
	                $('#imageBoard > ul').append('<li><img src="'+json.url+'" width="480" height="auto"/></li>');

	        		
	        		$("#tmp_file_num").val(json.file_num);
	        	}else{
	        		alert("임시파일 저장에 실패하였습니다.");
	        	}
	        	
	        }
	    });
	}
	
	//저장하기
	function save(){
		
		var data=new FormData($("#regFrm")[0]);
				
		//var bd_id = $("#bd_id").val().trim();
		//if(bd_id!="" && (parseInt(bd_id) > 0 || parseInt(bd_id)<4)){
		//	data.append("bd_id",$("#bd_id").val());
		//}
		data.append("bd_title",$("#bd_title").val());
		//data.append("file",$("#file")[0].files[0]);
		
		data.append("file_num",$("#tmp_file_num").val());
		
		var cont = $('#summernote').summernote('code');
		
		var trCont = cont.replace(/\/files\/tmp\//g,"/files/");
		data.append("cont",trCont);
	    $.ajax({
	        data: data,
	        type: "POST",
	        url: "/admNot/admNot_save.do",
	        cache: false,
	        contentType: false,
	        processData: false,
	        dataType:"json",
	        success: function(json) {
	        	if(json.success=="true"){
	        		alert("저장되었습니다.");
	        		fn_list();
	        		//$('#summernote').code(json.vo.cont);
	        		
	        	}
	        }
	    });
	}


    
    
    // 공지사항 목록
    function fn_list() {
    	
    	document.regFrm.action = "/admNotList.do";
       	document.regFrm.submit();
    }
    
    
    
    
	
	
</script>
						

	<!-- wrap --> 
	<div class="wrap"> 
		
		<!-- container --> 
		<div class="container">
			<!-- snb -->  
			<div class="snb">
				<div class="left_title">
					<h1>소통마당</h1>
				</div>
				<div class="nav-container">
					<ul class="left_nav">
						<li class="active">
							<a href="/admNotList.do">공지사항관리</a>
						</li>
					</ul>
				</div>
			</div> 
			<!-- //snb --> 
			
			<!-- content --> 
			<div class="content"> 
				<div class="paT40 paB25">
					<h1>공지사항 등록</h1>
				</div>
				
				
				<!-- view  start -->
				<div class="form_table">
				
					<form id="insForm" method="post">
						
					</form>		
					
					<form id="regFrm" name="regFrm" method="post" enctype="multipart/form-data">
						<input type="text" id="tmp_file_num" name="file_num" value="${vo.file_num}"/>
						<br style="clear: both">
					
						<table class="notice_view" border="1" cellspacing="0" summary=""> 
						<caption>공지사항관리 내용입니다.</caption> 
						<colgroup> 
						<col width="150">
						<col width="*">
						</colgroup> 
							<tbody> 
								<%-- <input id="bd_id" name="bd_id" value="${admNotVO.bdId}" class="i_text wp95" type="hidden"> --%>
								<tr> 
									<th>제목</th> 
									<td>
										<div class="item">
										<input id="bd_title" name="bd_title" value="" class="i_text wp95" type="text">
										</div>
									</td> 
								</tr> 
								<tr> 
									<th>첨부파일</th> 
									<td>
										<div class="item">
										<input type="file" id="uploadFile" name="uploadFile" value="" class="i_text wp95" >
										</div>
									</td> 
								</tr> 
								<tr> 
									<td class="cont" colspan="2"> 
										<div class="form-group">
										<textarea class="form-control" id="summernote" name="content" placeholder="content" maxlength="140" rows="7"></textarea>
										</div>
									</td> 
								</tr> 
							</tbody> 
						</table>
					</form>
				
				</div>


				<div class="fl_R mgT10">
					<a href="javascript:save();" class="btn_big"><strong>저장하기</strong></a>
					<a href="javascript:fn_list();" class="btn_big"><strong>목록보기</strong></a>
				</div>
				<!-- view  end -->

			</div> 
			<!-- //content --> 
		</div> 
		<!-- //container -->
		
	</div>
	<!-- /wrap --> 

	
	
	
	
	<!-- footer --> 
	<div class="footer"> 
		<p>All Rights Reserved.</p>
	</div> 
	<!-- //footer --> 