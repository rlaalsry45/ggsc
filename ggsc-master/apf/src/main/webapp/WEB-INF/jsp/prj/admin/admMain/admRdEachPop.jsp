<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<head>


</head>
	
	
<form id="regRdPopFrm" name="regRdPopFrm" method="post">	
	<fieldset>
		<div class="search_group mgT5">
			아이디    <input type="text" id="sch" name="sch">
			<a href="javascript:fn_sch();" class="btn_big"><strong>검색</strong></a>
	</fieldset>   
	
	<div style="height:10px;">
		
	</div>
	<div style="text-align:left;bold;">
		<p3> <strong>더블 클릭하시면 값이 선택됩니다.</strong></p>
	</div>
	<table class="notice_tbl" border="0" cellspacing="0" summary="요양지시서관리입니다."> 
	<caption></caption> 
	<colgroup> 
		<col width="25%"></col>
		<col width="25%"></col>
		<col width="50%"></col>
	</colgroup> 
	<thead> 
	<tr> 
		<th scope="col">아이디</th> 
		<th scope="col">성명</th> 
		<th scope="col">전화</th> 
	</tr> 
	</thead> 
	<tbody> 
	
	<input type="hidden" id="selectedId" name="selectedId" value=""/>
	<input type="hidden" id="sch" name="sch" value=""/>
	
	
	<c:forEach var="result" items="${popList}" varStatus="status">
		<tr style="cursor:pointer;" ondblclick="javascript:fn_choose('<c:out value="${result.usrId}"/>','<c:out value="${result.name}"/>');" onmouseover="this.style.backgroundColor='#f1f1f1'" onmouseout="this.style.backgroundColor='#ffffff'"> 
			<td><c:out value="${result.usrId}"/></td> 
			<td><c:out value="${result.name}"/></td> 
			<td><c:out value="${result.tel}"/></td>
		</tr>
	</c:forEach>
	
	</tbody>
	</table>

	<div class="fl_R mgT10">
		<a href="javascript:fn_close();" class="btn_big"><strong>닫기</strong></a>
	</div>
</form>	
	
	<script type="text/javaScript" language="javascript" defer="defer">
        
    	
	    function fn_close() {
	    	
	       	self.close();
	    }
	    function fn_sch() {
	    	document.regRdPopFrm.action = "/admRdEachPop.do";
	       	document.regRdPopFrm.submit();
	    }
	    
	    function fn_choose(obj,obj2){ 
	    	opener.document.getElementById("id").value = obj;
	    	opener.document.getElementById("name").value = obj2;
			fn_close();
        	
        } 

       
        <!--
        /* 글 등록 화면 function */
        function fn_egov_addView() {
           	document.listForm.action = "<c:url value='/addSample.do'/>";
           	document.listForm.submit();
        }
        
        /* 글 목록 화면 function */
        function fn_egov_selectList() {
        	document.listForm.action = "<c:url value='/egovSampleList.do'/>";
           	document.listForm.submit();
        }
        
        /* pagination 페이지 링크 function */
        function fn_egov_link_page(pageNo){
        	document.listForm.pageIndex.value = pageNo;
        	document.listForm.action = "<c:url value='/egovSampleList.do'/>";
           	document.listForm.submit();
        }
        
        //-->
    </script>
