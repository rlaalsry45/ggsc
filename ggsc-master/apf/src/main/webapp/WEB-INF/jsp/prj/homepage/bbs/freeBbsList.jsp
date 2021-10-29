<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>    
  <script>
  
  	function fn_detail(num,save){
		document.location.href = "/gnoincoun/freeBbsView.do?num="+num+"&save="+save;
	}
  	
  	function fn_insert(param) {
  		document.location.href = "/gnoincoun/freeBbsInsert.do?save="+param;
  	}
  </script>
<style>
	#wrap {width: 50%; margin: auto; height: 594px;}
</style>
<section class="service-2 section">
	<div id="wrap">
        <h2 class="title">자유게시판</h2>
	  	   <div class="tab-content" id="myTabContent">
        <div class="tab-pane fade in active" id="notice" role="tabpanel" aria-labelledby="notice-tab">
         <!-- <h2 class="title">알려드려요</h2>-->
          <div class="article-list-area">
            <ul class="list_area">
              <c:if test="${freeBbsListA.size() == 0 }">
		        <table  class="table table-condensed">
		          <col width="100px" />
		          <col />
		          <tbody>
		            <tr>
		              <td colspan="2" style="text-align: center; padding-top: 15px;"><strong>게시글이 없습니다</strong></td>
		            </tr>
		          </tbody>
		        </table>
			  </c:if>
			  <c:if test="${freeBbsListA.size() > 0 }">
              	  <!-- loop -->
	              <c:forEach var="result" items="${freeBbsListA}" varStatus="status">
		              <li class="board_box" >
		                <a href="#" onclick="javascript:fn_detail('<c:out value="${result.num}"/>','A');" class="txt_area">   
		                  <!-- 새글알림 -->
		                  <span class="icon_new_txt">
		                    <span>•</span>
		                  </span>
		                  <!-- 새글알림 //-->
		                  <!-- 제목 -->
		                  <strong class="tit"><c:out value="${result.title}"/></strong>
		                  <!-- 제목 //-->
		                  <!-- 글등록정보 -->
		                  <div class="user_area">
		                    <span class="nick">
		                      <span class="ellip"><span class="ellip"><c:out value="${result.writer}"/></span></span>
		                      <span class="time"><c:out value="${result.dbInsTm}"/></span>
		                      <span class="no"><c:out value="${result.num}"/></span>
		                    </span>
		                  </div>
		                  <!-- 글등록정보 //-->
		                </a>
		              </li>
				  </c:forEach>
			  </c:if>
              <!-- loop //-->
            </ul><!-- .list_area -->
          </div><!-- .article-list-area -->
          <div class="btn-wrap p15">
            <button type="button" onclick="javascript:fn_insert('A');" class="btn btn-primary btn-lg w100p">글쓰기</button>
          </div>
        </div><!-- .tab-pane -->
        <div class="tab-pane fade" id="free" role="tabpanel" aria-labelledby="data-tab">
          <!--자유게시판-->
          <div class="article-list-area">
            <ul class="list_area">
              <c:if test="${freeBbsListB.size() == 0 }">
		        <table class="table table-condensed" style="margin-top: 15px;">
		          <col width="100px" />
		          <col />
		          <tbody>
		            <tr>
		              <td colspan="2" style="text-align: center; padding-top: 15px;"><strong>게시글이 없습니다</strong></td>
		            </tr>
		          </tbody>
		        </table>
			  </c:if>
			  <c:if test="${freeBbsListB.size() > 0 }">
              <!-- loop -->
	              <c:forEach var="result" items="${freeBbsListB}" varStatus="status">
		              <li class="board_box" >
		                <a href="#" onclick="javascript:fn_detail('<c:out value="${result.num}"/>','B');" class="txt_area">   
		                  <!-- 새글알림 -->
		                  <span class="icon_new_txt">
		                    <span>•</span>
		                  </span>
		                  <!-- 새글알림 //-->
		                  <!-- 제목 -->
		                  <strong class="tit"><c:out value="${result.title}"/></strong>
		                  <!-- 제목 //-->
		                  <!-- 글등록정보 -->
		                  <div class="user_area">
		                    <span class="nick">
		                      <span class="ellip"><span class="ellip"><c:out value="${result.writer}"/></span></span>
		                      <span class="time"><c:out value="${result.dbInsTm}"/></span>
		                      <span class="no"><c:out value="${result.num}"/></span>
		                    </span>
		                  </div>
		                  <!-- 글등록정보 //-->
		                </a>
		              </li>
				  </c:forEach>
			  </c:if>
              <!-- loop //-->
            </ul><!-- .list_area -->
          </div><!-- .article-list-area -->
          <div class="btn-wrap p15">
            <button type="button" onclick="javascript:fn_insert('B');" class="btn btn-primary btn-lg w100p">글쓰기</button>
          </div>
        </div><!-- .tab-pane /-->
      </div><!-- .tab-content /-->
	</div>
</section> <!-- End section -->