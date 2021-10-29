<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
	<section id="page-breadcrumb">
        <div class="vertical-center sun">
             <div class="container">
                <div class="row">
                    <div class="action">
                        <div class="col-sm-12">
                            <h1 class="title">회원가입</h1>
                            <p>회원가입에 실패하였습니다.</p>
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
					<div class="txtC"><h2 class="post-title bold">회원가입 중 에러가 발생하였습니다.</h2></div>
					<div class="col-sm-12">
                        <div class="feature-inner">
							<div class="mgT30 mgB30"><img src="images/sub/error.jpg" alt="회원가입실패"></div>
                        </div>
                    </div> 
				</div>
			    <p class="txtC">
					안녕하세요 고령자미래설계지원센터입니다.<br />
					회원가입 중 오류가 발생하였습니다. 다시 회원가입을 진행해 주시기 바랍니다.
				<p/>
				<div class="bs-example mgT20 txtC">
                    <button onclick="javascript:join();" type="button" class="btn btn-primary">회원가입하기</button>
					<button onclick="javascript:main();" type="button" class="btn btn-primary">메인페이지로 이동</button>
                </div>
            </div>
        </div>
    </section>
	<!--/#services-->
	
	
    <!--/#action-->
    <script type="text/javaScript" language="javascript" defer="defer">
    
    	
	    function join() {
	     	document.notFrm.action = "/memberMove.do";
	   		document.notFrm.submit(); 
		}
		
		function main() {
	     	document.notFrm.action = "/egovMainList.do";
	   		document.notFrm.submit(); 
		}
        
        //-->
    </script>