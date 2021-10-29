<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>



    
	<section id="page-breadcrumb">
        <div class="vertical-center sun">
             <div class="container">
                <div class="row">
                    <div class="action">
                        <div class="col-sm-12">
                            <h1 class="title">회원가입</h1>
                            <p>고령자미래설계지원센터 방문을 환영합니다.</p>
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
               <div class="col-md-12 col-sm-12">
                    <div class="contact-form bottom">
                        <h2>회원정보입력</h2>
						<p>개인정보는 개인정보취급방침에 따라 안전하게 보호되면 회원님의 명백한 동의없이 공개 또는 제3자에게 제공되지 않습니다.</p>
                        <form id="jFrm" name="jFrm" method="post" >
							<span class="fl_L txtmy">이름</span><div class="form-group"><input type="text" id="name" name="name" value="" class="form-control wp90" placeholder="이름을 입력해 주세요"></div>
                            <span class="fl_L txtmy">아이디</span><div class="form-group"><input type="text" id="id" name="id" value="" class="form-control wp90" placeholder="아이디를 입력해 주세요"></div>
                            <span class="fl_L txtmy">비밀번호</span><div class="form-group"><input type="password" id="pwd" name="pwd" value="" class="form-control wp90" placeholder="비밀번호를 입력해 주세요"></div>
                            <span class="fl_L txtmy">생년월일</span><div class="form-group"><input type="text" id="birth_dt" name="birth_dt" value="" class="form-control wp90" placeholder="생연월일을 입력해 주세요(예 19760821)"></div>
                            <!-- <button type="button" class="btn btn-success mgL5">주소찾기</button> -->
							<span class="fl_L txtmy">주소</span><div class="form-group"><input type="text" id="basic_addr" name="basic_addr" value="" class="form-control wp90" placeholder="주소를 입력해 주세요"><div>
							<div class="mgL70 mgT10"><input type="text" id="dtl_addr" name="dtl_addr" value="" class="form-control wp90" placeholder="상세주소를 입력해 주세요"></div>
                            <span class="fl_L txtmy mgT10">전화번호</span><div class="form-group mgT10"><input type="text" id="tel" name="tel" value="" class="form-control wp90" placeholder="전화번호를 입력해 주세요(예 01012345678)('-' 포함하여 입력해주세요.)"></div>
                            <span class="fl_L txtmy">이메일</span><div class="form-group"><input type="text" id="email" name="email" value="" class="form-control wp90" placeholder="이메일을 입력해 주세요"></div>
                            <div class="bs-example mgT20 txtC">
								<button onclick="javascript:goinsert();" type="button" class="btn btn-primary">가입하기</button>
								<button onclick="goMemberRegCancel()" type="button" class="btn btn-danger">취소하기</button>
							</div>
                        </form>
                    </div>
				</div>
            </div>
        </div>
    </section>
	<!--/#services-->
	
	
    <!--/#action-->
    <script type="text/javaScript" language="javascript" defer="defer">
	    

    	
	    
    	function goinsert(){
    		
    		
    		//document.jFrm.action = "/goinsert.do";
    		document.jFrm.action = "/usrMngList.do";
    		//document.jFrm.action = "/insertMemberReg.do";
    		document.jFrm.submit();
            
          
    	}
    	
        
        
        
        //-->
    </script>

    