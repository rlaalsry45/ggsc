<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>    
    <script>
	  	$(document).ready(function() {
		  	var message = "${message}";
		  	if(message.length > 0) {
		  		alert(message);
		  	}
		});
	  	
		function login(){
			if(confirm("로그인 하시겠습니까?")) {
				var frm = document.loginForm;
				frm.action = "/gnoincoun/actionLogin.do";
				frm.submit();			
			}
		}
  </script>
<style>
	#wrap {width: 50%; margin: auto; height: 594px;}
</style>
<section class="service-2 section">
	<div id="wrap">
	  	<table  class="table table-condensed">
          <col width="100px" />
          <col />
          <tbody>
          	<c:if test="${recCns.size() == 0 }">
				<tr>
					<td colspan="2"><strong>상담 내역이 없습니다.</strong></td>
				</tr>
			</c:if>
			<c:if test="${recCns.size() > 0 }">
	            <tr>
	              <th scope="row">상담센터</th>
	              <td><strong><c:out value="${recCns.centerNm }"/></strong></td>
	            </tr>
	            <tr>
	              <th scope="row">상담구분</th>
	              <td>
	              	<c:out value="${recCns.cnsGbNm }"/>
		          </td>
	            </tr>
	            <tr>
	              <th scope="row">이름</th>
	              <td><c:out value="${recCns.cnsleNm }"/></td>
	            </tr>
	            <tr>
	              <th scope="row">신청일자</th>
	              <td><c:out value="${fn:substring(recCns.writeDt,0,4) }"/>-<c:out value="${fn:substring(recCns.writeDt,4,6) }"/>-<c:out value="${fn:substring(recCns.writeDt,6,8) }"/></td>
	            </tr>
	            <tr>
	              <th scope="row">상담상태</th>
	              <td>
	              	<c:out value="${recCns.cnsStatNm }"/>
				  </td>
	            </tr>
	            <tr>
	              <th scope="row" rowspan="2">다음예약일자</th>
	              <td class=""><c:out value="${fn:substring(recCns.cnsRsvtDt,0,4) }"/>-<c:out value="${fn:substring(recCns.cnsRsvtDt,5,7) }"/>-<c:out value="${fn:substring(recCns.cnsRsvtDt,8,10) }"/> <c:out value="${recCns.cnsRsvtStrtHour }"/>시 <c:out value="${recCns.cnsRsvtStrtMin }"/>분</td>
	            </tr>
	            <!-- <tr>
	              <td class=""><button type="button" class="btn btn-normal btn-xs">예약변경하기</button>
	              	<input type="text" id="datepicker1" />
	              </td>
	            </tr> -->
	            <tr>
	              <td scope="row" colspan="2"><button type="button" onclick="javascript:fn_mypageDtl('${recCns.caseNo}')" class="btn btn-primary btn-xs fr">상세보기<i class="fa fa-caret-right cw ml5"></i></button></td>
	            </tr>
            </c:if>
          </tbody>
        </table>
      <h2 class="title">상담이력</h2>
      <c:if test="${cnsHisList.size() == 0 }">
      	<div class="table-wrap">
	        <table  class="table table-condensed">
	          <col width="80px" />
	          <col />
	          <tbody>
	            <tr>
	              <td colspan="2"><strong>상담이력이 없습니다.</strong></td>
	            </tr>
	          </tbody>
	        </table>
	      </div>
      </c:if>
      <c:if test="${cnsHisList.size() > 0 }">
	      <c:forEach items="${cnsHisList }" var="list">
		      <div class="table-wrap">
		        <table  class="table table-condensed">
		          <col width="80px" />
		          <col />
		          <tbody>
		            <tr>
		              <th scope="row">상담센터</th>
		              <td><strong><c:out value="${list.centerNm }" /></strong></td>
		            </tr>
		            <tr>
		              <th scope="row">상담구분</th>
		              <td>
		              	<c:out value="${list.cnsGbNm }" />
		              </td>
		            </tr>
		            <tr>
		              <th scope="row">이름</th>
		              <td><c:out value="${list.cnsleNm }" /></td>
		            </tr>
		            <tr>
		              <th scope="row">신청일자</th>
		              <td><c:out value="${fn:substring(list.writeDt,0,4) }"/>-<c:out value="${fn:substring(list.writeDt,4,6) }"/>-<c:out value="${fn:substring(list.writeDt,6,8) }"/></td>
		            </tr>
		            <tr>
		              <th scope="row">종결일자</th>
		              <td><c:out value="${list.cnsEndDt }" /></td>
		            </tr>
		            <tr>
		              <th scope="row">상담상태</th>
		              <td>
		              	<c:out value="${list.cnsStatNm }" />
		              </td>
		            </tr>
		            <tr>
		              <td scope="row" colspan="2"><button type="button" onclick="javascript:fn_mypageDtl('<c:out value="${list.caseNo}"/>')" class="btn btn-link btn-xs fr">상세보기<i class="fa fa-caret-right ml5"></i></button></td>
		            </tr>
		          </tbody>
		        </table>
		      </div>
	      </c:forEach>
      </c:if>
	</div>
</section> <!-- End section -->