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
                            <h1 class="title">공문</h1>
                            <p></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--/#page-breadcrumb-->

	<form id="trstFrm" name="trstFrm" method="post">
	    <section id="" class="padding">
	        <div class="container">
	            <div class="row">
					<div class="col-md-12 col-sm-12">
					
					
					<div style="text-align:center;">
					<img src="../images/Gongmun_Logo.png" style="width:500px;"/>
					</div>
					</br>
					
					<div style="text-align:center;">
					<img src="../images/Gongmun_cntn.PNG" style="width:1200px;"/>
					</div>
					
					</br>
						<h2 class="title"><b>문서번호 :  </b></h2>
					</br>
					</br>
						<h2 class="title"><b>시행일자 :  </b></h2>
					</br>
					</br>	
						<h2 class="title"><b>수    신 :  </b></h2>
					</br>
					</br>	
						<h2 class="title"><b>참    조 :  </b></h2>
					</br>
					</br>	
						<h2 class="title"><b>제    목     사전의료·요양지시서 등록 증명  </b></h2>
						
					<div style="text-align:left;margin-left:1px;">
					<img src="../images/Gongmun_line.PNG" style="width:1200px;"/>
					</div>
					
					<h2 class="title"><b>사전의료·요양지시서 등록기관 (사)한국후견협회에서는 다음과 같이 작성된 사전의료·요양지시서가 협회에 등록된 원본과 일치함을 증명합니다.</b></h2> 
					</br></br></br></br> 
					
					<h1 class="title" style="text-align:center;"><b>다&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;음</b></h1>
					
					
						
						
					</br>
					</br>	
						<h2 class="title"><b>* 작 성 일 자 :  </b></h2>
					</br>
					</br>	
						<h2 class="title"><b>* 작   성  자 :  </b></h2>
					</br>
					</br>	
						<h2 class="title"><b>* 제 1 대리인 :  </b></h2>		
					</br>
					</br>	
						<h2 class="title"><b>* 제 2 대리인 :  </b></h2>
					</br>
					</br>	
						<h2 class="title"><b>* 증       인 :  </b></h2>		
					</br>
					</br>	
						<h2 class="title"><b>※ 상세내용은 후면 [불임]사전의료·요양지시서 참조.</b></h2>	
					</br>
					</br>	
						<h2 class="title"><b>붙임  사전의료·요양지시서 1부.  끝. </b></h2>			
						
						
					</br></br></br></br>
					<div style="text-align:center;">
					<img src="../images/Gongmun_footer.PNG" style="width:500px;"/>
					</div>
						
						
						<!-- view  end -->
					</div>
	            </div>
	        </div>
	    </section>
	    
	   
	<!--/#services-->
	</form>
	
	
    <!--/#action-->
    <script type="text/javaScript" language="javascript" defer="defer">
        
  	
    
    //필수정보등록
    function fn_trst_Reg() {
  		
    	
    	var data=new FormData();
    	
 	  	//위탁자
    	if(document.trstFrm.clent_nm.value =="" ){
    		alert("위탁자 성명을 입력하셔야 합니다.");
    		document.trstFrm.clent_nm.focus();
    		return;
    	}else{
    		data.append("clent_nm",document.trstFrm.clent_nm.value);
    	}
    	
    	if(document.trstFrm.clent_birth_dt.value =="" ){
    		alert("위탁자 생년월일을 입력하셔야 합니다.");
    		document.trstFrm.clent_birth_dt.focus();
    		return;
    	}else{
    		data.append("clent_birth_dt",document.trstFrm.clent_birth_dt.value);
    	}
    	
    	if(document.trstFrm.clent_tel.value =="" ){
    		alert("위탁자 전화번호를 입력하셔야 합니다.");
    		document.trstFrm.clent_tel.focus();
    		return;
    	}else{
    		data.append("clent_tel",document.trstFrm.clent_tel.value);
    	}
    	
    	if(document.trstFrm.clent_email.value =="" ){
    		alert("위탁자 이메일을 입력하셔야 합니다.");
    		document.trstFrm.clent_email.focus();
    		return;
    	}else{
    		data.append("clent_email",document.trstFrm.clent_email.value);
    	}
    	
    	if(document.trstFrm.clent_addr.value =="" ){
    		alert("위탁자 주소를 입력하셔야 합니다.");
    		document.trstFrm.clent_addr.focus();
    		return;
    	}else{
    		data.append("clent_addr",document.trstFrm.clent_addr.value);
    	}
    	
    	//수탁자           
    	if(document.trstFrm.csmt_nm.value =="" ){
    		alert("수탁자 성명을 입력하셔야 합니다.");
    		document.trstFrm.csmt_nm.focus();
    		return;
    	}else{
    		data.append("csmt_nm",document.trstFrm.csmt_nm.value);
    	}
		
    	if(document.trstFrm.csmt_birth_dt.value =="" ){
    		alert("수탁자 생년월일을 입력하셔야 합니다.");
    		document.trstFrm.csmt_birth_dt.focus();
    		return;
    	}else{
    		data.append("csmt_birth_dt",document.trstFrm.csmt_birth_dt.value);
    	}
    	
    	if(document.trstFrm.csmt_tel.value =="" ){
    		alert("수탁자 전화번호를 입력하셔야 합니다.");
    		document.trstFrm.csmt_tel.focus();
    		return;
    	}else{
    		data.append("csmt_tel",document.trstFrm.csmt_tel.value);
    	}
    	
    	if(document.trstFrm.csmt_email.value =="" ){
    		alert("수탁자 이메일을 입력하셔야 합니다.");
    		document.trstFrm.csmt_email.focus();
    		return;
    	}else{
    		data.append("csmt_email",document.trstFrm.csmt_email.value);
    	}
    	
    	if(document.trstFrm.csmt_addr.value =="" ){
    		alert("수탁자 주소를 입력하셔야 합니다.");
    		document.trstFrm.csmt_addr.focus();
    		return;
    	}else{
    		data.append("csmt_addr",document.trstFrm.csmt_addr.value);
    	}
		
    	
    	//수익자            
    	if(document.trstFrm.bnft_nm.value =="" ){
    		alert("수익자 성명을 입력하셔야 합니다.");
    		document.trstFrm.bnft_nm.focus();
    		return;
    	}else{
    		data.append("bnft_nm",document.trstFrm.bnft_nm.value);
    	}
		
    	if(document.trstFrm.bnft_birth_dt.value =="" ){
    		alert("수익자 생년월일을 입력하셔야 합니다.");
    		document.trstFrm.bnft_birth_dt.focus();
    		return;
    	}else{
    		data.append("bnft_birth_dt",document.trstFrm.bnft_birth_dt.value);
    	}
    	
    	if(document.trstFrm.bnft_tel.value =="" ){
    		alert("수익자 전화번호를 입력하셔야 합니다.");
    		document.trstFrm.bnft_tel.focus();
    		return;
    	}else{
    		data.append("bnft_tel",document.trstFrm.bnft_tel.value);
    	}
    	
    	if(document.trstFrm.bnft_email.value =="" ){
    		alert("수익자 이메일을 입력하셔야 합니다.");
    		document.trstFrm.bnft_email.focus();
    		return;
    	}else{
    		data.append("bnft_email",document.trstFrm.bnft_email.value);
    	}
    	
    	if(document.trstFrm.bnft_addr.value =="" ){
    		alert("수익자 주소를 입력하셔야 합니다.");
    		document.trstFrm.bnft_addr.focus();
    		return;
    	}else{
    		data.append("bnft_addr",document.trstFrm.bnft_addr.value);
    	}
    	
    	//연속수익자
    	if(document.trstFrm.go_bnft_nm.value =="" ){
    		alert("연속수익자 성명을 입력하셔야 합니다.");
    		document.trstFrm.go_bnft_nm.focus();
    		return;
    	}else{
    		data.append("go_bnft_nm",document.trstFrm.go_bnft_nm.value);
    	}
    	
    	if(document.trstFrm.go_bnft_birth_dt.value =="" ){
    		alert("연속수익자 생년월일을 입력하셔야 합니다.");
    		document.trstFrm.go_bnft_birth_dt.focus();
    		return;
    	}else{
    		data.append("go_bnft_birth_dt",document.trstFrm.go_bnft_birth_dt.value);
    	}
    	
    	if(document.trstFrm.go_bnft_tel.value =="" ){
    		alert("연속수익자 전화번호를 입력하셔야 합니다.");
    		document.trstFrm.go_bnft_tel.focus();
    		return;
    	}else{
    		data.append("go_bnft_tel",document.trstFrm.go_bnft_tel.value);
    	}
    	
    	if(document.trstFrm.go_bnft_email.value =="" ){
    		alert("연속수익자 이메일을 입력하셔야 합니다.");
    		document.trstFrm.go_bnft_email.focus();
    		return;
    	}else{
    		data.append("go_bnft_email",document.trstFrm.go_bnft_email.value);
    	}
    	
    	if(document.trstFrm.go_bnft_addr.value =="" ){
    		alert("연속수익자 주소를 입력하셔야 합니다.");
    		document.trstFrm.go_bnft_addr.focus();
    		return;
    	}else{
    		data.append("go_bnft_addr",document.trstFrm.go_bnft_addr.value);
    	}
    	
    	//개별지원자
    	if(document.trstFrm.per_give_nm.value =="" ){
    		alert("개별지원자 성명을 입력하셔야 합니다.");
    		document.trstFrm.per_give_nm.focus();
    		return;
    	}else{
    		data.append("per_give_nm",document.trstFrm.per_give_nm.value);
    	}
    	
    	if(document.trstFrm.per_give_birth_dt.value =="" ){
    		alert("개별지원자 생년월일을 입력하셔야 합니다.");
    		document.trstFrm.per_give_birth_dt.focus();
    		return;
    	}else{
    		data.append("per_give_birth_dt",document.trstFrm.per_give_birth_dt.value);
    	}
    	
    	if(document.trstFrm.per_give_tel.value =="" ){
    		alert("개별지원자 전화번호를 입력하셔야 합니다.");
    		document.trstFrm.per_give_tel.focus();
    		return;
    	}else{
    		data.append("per_give_tel",document.trstFrm.per_give_tel.value);
    	}
    	
    	if(document.trstFrm.per_give_rel.value =="" ){
    		alert("개별지원자와의 관계를 입력하셔야 합니다.");
    		document.trstFrm.per_give_rel.focus();
    		return;
    	}else{
    		data.append("per_give_rel",document.trstFrm.per_give_rel.value);
    	}
    	
    	if(document.trstFrm.per_give_email.value =="" ){
    		alert("개별지원자 이메일을 입력하셔야 합니다.");
    		document.trstFrm.per_give_email.focus();
    		return;
    	}else{
    		data.append("per_give_email",document.trstFrm.per_give_email.value);
    	}
    	
    	if(document.trstFrm.per_give_addr.value =="" ){
    		alert("개별지원자 주소를 입력하셔야 합니다.");
    		document.trstFrm.per_give_addr.focus();
    		return;
    	}else{
    		data.append("per_give_addr",document.trstFrm.per_give_addr.value);
    	}
    	  
    	//금액
    	var str11 = document.trstFrm.contct_dt.value; 
    	var pattern = /[0-9]{4}-[0-9]{2}-[0-9]{2}/;
    	if(pattern.test(str11)) {
    		if(document.trstFrm.contct_dt.value =="" ){
        		alert("계약일자를 입력하셔야 합니다.");
        		document.trstFrm.contct_dt.focus();
        		return;
        	}else{
        		data.append("contct_dt",document.trstFrm.contct_dt.value);
        	}
    	} else {
    	    alert("날짜형식으로 입력하셔야 합니다.");
    	    return;
    	}
    	
    	
    	var str12 = document.trstFrm.open_dt.value; 
    	var pattern = /[0-9]{4}-[0-9]{2}-[0-9]{2}/;
    	if(pattern.test(str12)) {
    		if(document.trstFrm.open_dt.value =="" ){
          		alert("게시일자를 입력하셔야 합니다.");
          		document.trstFrm.open_dt.focus();
          		return;
          	}else{
          		data.append("open_dt",document.trstFrm.open_dt.value);
          	}
    	} else {
    	    alert("날짜형식으로 입력하셔야 합니다.");
    	    return;
    	}
    	
    	data.append("tot_amt",document.trstFrm.tot_amt.value);
    	data.append("sevr_amt",document.trstFrm.sevr_amt.value);
    	
    	var str13 = document.trstFrm.sevr_dt.value; 
    	var pattern = /[0-9]{4}-[0-9]{2}-[0-9]{2}/;
    	if(str13 != ""){
	    	if(pattern.test(str13)) {
	    		if(document.trstFrm.sevr_dt.value =="" ){
	          		alert("게시일자를 입력하셔야 합니다.");
	          		document.trstFrm.sevr_dt.focus();
	          		return;
	          	}else{
	          		data.append("sevr_dt",document.trstFrm.sevr_dt.value);
	          	}
	    	} else {
	    	    alert("날짜형식으로 입력하셔야 합니다.");
	    	    return;
	    	}
    	}else{
    		data.append("sevr_dt",document.trstFrm.sevr_dt.value);
    	}
    	
    	
    	//선택사항 1     
    	var use11 = $('input[name=use11]:checked').val();
		if(use11 == undefined){
			use11 = "";
		}
		
		var use12 = $('input[name=use12]:checked').val();
		if(use12 == undefined){
			use12 = "";
		}
		
		var use13 = $('input[name=use13]:checked').val();
		if(use13 == undefined){
			use13 = "";
		}
		
		var use14 = $('input[name=use14]:checked').val();
		if(use14 == undefined){
			use14 = "";
		}
		
		var use15 = $('input[name=use15]:checked').val();
		if(use15 == undefined){
			use15 = "";
		}
		
		var use16 = $('input[name=use16]:checked').val();
		if(use16 == undefined){
			use16 = "";
		}
		
		var use17 = $('input[name=use17]:checked').val();
		if(use17 == undefined){
			use17 = "";
		}
		
		var use18 = $('input[name=use18]:checked').val();
		if(use18 == undefined){
			use18 = "";
		}
		
		var use19 = $('input[name=use19]:checked').val();
		if(use19 == undefined){
			use19 = "";
		}
		
		data.append("use11",use11);
		data.append("use12",use12);
		data.append("use13",use13);
		data.append("use14",use14);
		data.append("use15",use15);
		data.append("use16",use16);
		data.append("use17",use17);
		data.append("use18",use18);
		data.append("use19",use19);
		data.append("pokt_mony_bank",document.trstFrm.pokt_mony_bank.value);
		data.append("pokt_mony_name",document.trstFrm.pokt_mony_name.value);
		data.append("pokt_mony_acont",document.trstFrm.pokt_mony_acont.value);
    	
		//alert(document.trstFrm.csmt_tel.value);
		//return;
		
		//선택사항 1
		//data.append("my_thik_1",tmpMy_thik_1);
		
		
		alert(use11);
		
		//return;
		
    	$.ajax({
	        data: data ,
	        type: "POST",
	        url: "/fn_trst_Reg.do", 
	        cache: false,
	        contentType: false,
	        processData: false,
	        dataType:"json",	        
	        success: function(json) {
	        	alert("등록되었습니다.");
	        	//document.regCdFrm.action = "/egovMainList.do";
	           	//document.regCdFrm.submit();
	        }     
	    });
    }
    
    </script>

    