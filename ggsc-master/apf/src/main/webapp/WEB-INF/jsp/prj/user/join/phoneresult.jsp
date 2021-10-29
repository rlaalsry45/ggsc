<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
	<section id="page-breadcrumb">
        <div class="vertical-center sun">
             <div class="container">
                <div class="row">
                    <div class="action">
                        <div class="col-sm-12">
                            <h1 class="title">회원가입</h1>
                            <p>회원가입이 완료되었습니다.</p>
                        </div>
                     </div>
                </div>
            </div>
        </div>
    </section>
    <!--/#page-breadcrumb-->

    <section id="" class="padding">
        <div class="container">
			<div class="row">
                <div class="post-content overflow">
					<div class="txtC"><h2 class="post-title bold">휴대폰 본인 확인.</h2></div>
					<div class="col-sm-12">
                        <div class="feature-inner">
							<div class="mgT30 mgB30"><img src="images/sub/moniter.jpg" alt="회원가입완료"></div>
                        </div>
                    </div> 
				</div>
			    <p class="txtC">
					휴대폰 본인인증이 정상적으로 처리되었습니다.<br />
					회원가입 페이지로 이동하여 회원가입을 해 주세요.
				<p/>
				<div class="bs-example mgT20 txtC">
					<button onclick="javascript:goJoin();" type="button" class="btn btn-primary">회원가입 페이지 가기</button>
                </div>
            </div>
        </div>
    </section>
	<!--/#services-->
	 
	  <form id="pForm" name="pForm" method="post" action="">
	  </form>
    
    <!--/#action-->
    
    
    
    <script type="text/javaScript" language="javascript" defer="defer">
    
    
	    function goJoin(){
	    	
			//document.pForm.action = "/insertMove.do";
			document.pForm.action = "/gojoin.do";
			document.pForm.submit();
	    		
		}
    
    
    </script>
    
    