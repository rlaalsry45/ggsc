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
					<div class="txtC"><h2 class="post-title bold">고령자미래설계지원센터 가입을 축하 드립니다.</h2></div>
					<div class="col-sm-12">
                        <div class="feature-inner">
							<div class="mgT30 mgB30"><img src="images/sub/moniter.jpg" alt="회원가입완료"></div>
                        </div>
                    </div> 
				</div>
			    <p class="txtC">
					회원가입을 진심으로 축하드립니다.<br />
					로그인 후 서비스와 정보를 확인해 보세요 감사합니다.
				<p/>
				<div class="bs-example mgT20 txtC">
                    <button onclick="javascript:login();" type="button" class="btn btn-primary">로그인하기</button>
					<button onclick="javascript:main();" type="button" class="btn btn-primary">메인페이지로 이동</button>
                </div>
            </div>
        </div>
    </section>
	<!--/#services-->
	
	
    <!--/#action-->
    <script type="text/javaScript" language="javascript" defer="defer">
    
    	function login() {
	     	document.notFrm.action = "/loginProc.do";
	   		document.notFrm.submit(); 
    	}
    	
    	function main() {
	     	document.notFrm.action = "/egovMainList.do";
	   		document.notFrm.submit(); 
    	}
        
        //-->
    </script>