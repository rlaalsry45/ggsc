<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


    
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
                        	<input type="hidden" id="idCheck" name="idCheck" value="N"/>
                        
							<span class="fl_L txtmy">이름</span><div class="form-group"><input type="text" id="name" name="name" value="" class="form-control wp90" placeholder="이름을 입력해 주세요"></div>
                            <span class="fl_L txtmy">아이디</span>
                            	<div class="form-group">
                            		<input type="text" id="id" name="id" value="" class="form-control wp90" placeholder="아이디를 입력해 주세요">
                            		
                            	</div>
                            	<button onclick="javascript:goIdCheck();" type="button" class="btn btn-primary">아이디중복체크</button>
                            	<div class="form-group">
                            		
                            	</div>
                            <span class="fl_L txtmy">비밀번호</span><div class="form-group"><input type="password" id="pwd" name="pwd" value="" class="form-control wp90" placeholder="비밀번호를 입력해 주세요"></div>
                            <span class="fl_L txtmy">생년월일</span><div class="form-group"><input type="text" id="birth_dt" name="birth_dt" value="" class="form-control wp90" placeholder="생연월일을 입력해 주세요(예 19760821)"></div>
                            <!-- <button type="button" class="btn btn-success mgL5">주소찾기</button> -->
							<span class="fl_L txtmy">주소</span><div class="form-group"><input type="text" id="basic_addr" name="basic_addr" value="" class="form-control wp90" placeholder="주소를 입력해 주세요"><div>
							<div class="mgL70 mgT10"><input type="text" id="dtl_addr" name="dtl_addr" value="" class="form-control wp90" placeholder="상세주소를 입력해 주세요"></div>
                            <span class="fl_L txtmy mgT10">전화번호</span><div class="form-group mgT10"><input type="text" id="tel" name="tel" value="" class="form-control wp90" placeholder="전화번호를 입력해 주세요(예 010-1234-5678)('-' 포함하여 입력해주세요.)"></div>
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
	    
		function goIdCheck(){
			var data=new FormData();
			data.append("id",document.jFrm.id.value);
			
			
			
			if(document.jFrm.id.value == ""){
				alert("아이디를 입력하세요!");
				return;
			}
			
			$.ajax({
		        data: data ,
		        type: "POST",
		        url: "/joinIdCheck.do",
		        cache: false,
		        contentType: false,
		        processData: false,
		        dataType:"json",	        
		        success: function(json) {
		        	//alert("json.url =========== "+json.url);
		        	if(json.success=="true"){
		        		alert("사용할 수 있는 아이디입니다.");
		        		document.jFrm.idCheck.value = "Y";
		        	}else{
		        		alert("아이디를 사용할 수 없습니다.");
		        		document.jFrm.id.value = "";
		        		document.jFrm.idCheck.value = "N";
		        		return;
		        	}
		        	
		        }
		    });
		}
    	
	    
    	function goinsert(){
    		
    		if(document.jFrm.idCheck.value == "N") {
    			alert("아이디 중복체크를 하셔야 합니다.");
    			return;
    		}
    		
    		if(document.jFrm.name.value == "") {
    			alert("이름을 입력 하셔야 합니다.");
    			return;
    		}
    		if(document.jFrm.id.value == "") {
    			alert("아이디를 입력 하셔야 합니다.");
    			return;
    		}
    		if(document.jFrm.pwd.value == "") {
    			alert("비밀번호를 입력 하셔야 합니다.");
    			return;
    		}
    		if(document.jFrm.birth_dt.value == "") {
    			alert("생년월일을 입력 하셔야 합니다.");
    			return;
    		}
    		if(document.jFrm.basic_addr.value == "") {
    			alert("주소를 입력 하셔야 합니다.");
    			return;
    		}
    		if(document.jFrm.tel.value == "") {
    			alert("전화번호를 입력 하셔야 합니다.");
    			return;
    		}
    		if(document.jFrm.email.value == "") {
    			alert("이메일을 입력 하셔야 합니다.");
    			return;
    		}
    		
    		document.jFrm.action = "/goinsert.do";
    		//document.jFrm.action = "/insertMemberReg.do";
    		document.jFrm.submit();
            
          
    	}
    	
        
        
        
        //-->
    </script>

    