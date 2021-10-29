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
                            <h1 class="title">사전의료·요양지시서</h1>
                            <p>정보를 등록합니다.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--/#page-breadcrumb-->

	<form id="regCdFrm" name="regCdFrm" method="post">
	    <section id="" class="padding">
	        <div class="container">
	            <div class="row">
					<div class="col-md-12 col-sm-12">
					<h2 class="title" align="center">고령자 사전의료·요양지시서</h2>
					
						<!-- view  start -->
						<h3 class="title"><b>[필수사항] Ⅰ. 작성자 및 증인의 서명 </b></h3>
						<table class="notice_view" border="1" cellspacing="0" summary=""> 
						<caption>의료요양지시서 등록</caption> 
						<colgroup> 
						<col width="15%"></col>
						<col width="35%"></col> 
						<col width="20%"></col>
						<col width="30%"></col>
						</colgroup> 
							<thead> 
							</thead> 
							<tbody> 
								<tr> 
									<th scope="row"><font color="red">*</font>  작성자 성명</th> 
									<td><input type="text" id="witr_name" name="witr_name" value="" ></td> 
									<th scope="row"><font color="red">*</font>  작성자 생년월일</th> 
									<td><input type="text" id="witr_birth_dt" name="witr_birth_dt" value="" ></td>
								</tr> 
								<tr> 
									<th scope="row"><font color="red">*</font>  작성자 전화</th>
									<td><input type="text" id="witr_tel" name="witr_tel" value="" ></td>
									<th scope="row"><font color="red">*</font>  작성자 이메일</th> 
									<td><input type="text" id="witr_email" name="witr_email" value="" ></td> 
								</tr>
								<tr> 
									<th scope="row"><font color="red">*</font>  작성자 주소</th>
									<td colspan="3"><input type="text" id="witr_addr" name="witr_addr" value="" style="width :90%"  ></td>
								</tr>
								<tr> 
									<th scope="row"><font color="red">*</font>  시행일자</th>
									<td colspan="3"><input type="text" id="exe_dt" name="exe_dt" value="" style="width :90%" ></td>
								</tr>
								
							</tbody> 
						</table>
						
						
						<!-- 제1대리인 -->
						<table class="notice_view" border="1" cellspacing="0" summary=""> 
						<caption>의료요양지시서 등록</caption> 
						<colgroup> 
						<col width="15%"></col>
						<col width="35%"></col> 
						<col width="20%"></col>
						<col width="30%"></col>
						</colgroup> 
							<thead> 
							</thead> 
							<tbody> 
								<tr> 
									<th scope="row"><font color="red">*</font>  제1대리인 아이디</th>
									<td colspan="3"><input type="text" id="rpt1_id" name="rpt1_id" value="" size="20%" ></td>
								</tr>
								<tr> 
									<th scope="row"><font color="red">*</font>  제1대리인 성명</th> 
									<td><input type="text" id="rpt1_name" name="rpt1_name" value="" ></td> 
									<th scope="row"><font color="red">*</font>  제1대리인 생년월일</th> 
									<td><input type="text" id="rpt1_birth_dt" name="rpt1_birth_dt" value="" ></td>
								</tr> 
								<tr> 
									<th scope="row"><font color="red">*</font>  제1대리인 전화</th>
									<td><input type="text" id="rpt1_tel" name="rpt1_tel" value="" ></td>
									<th scope="row"><font color="red">*</font>  제1대리인 이메일</th> 
									<td><input type="text" id="rpt1_email" name="rpt1_email" value="" ></td> 
								</tr>
								<tr> 
									<th scope="row"><font color="red">*</font>  제1대리인 주소</th>
									<td colspan="3"><input type="text" id="rpt1_addr" name="rpt1_addr" value="" ></td>
								</tr>
							</tbody> 
						</table>
						
						
						
						<!-- 제2대리인 -->
						<table class="notice_view" border="1" cellspacing="0" summary=""> 
						<caption>의료요양지시서 등록</caption> 
						<colgroup> 
						<col width="15%"></col>
						<col width="35%"></col> 
						<col width="20%"></col>
						<col width="30%"></col>
						</colgroup> 
							<thead> 
							</thead> 
							<tbody> 
								<tr> 
									<th scope="row">  제2대리인 아이디</th>
									<td colspan="3"><input type="text" id="rpt2_id" name="rpt2_id" value="" size="20%" ></td>
								</tr>
								<tr> 
									<th scope="row">  제2대리인 성명</th> 
									<td><input type="text" id="rpt2_name" name="rpt2_name" value="" ></td> 
									<th scope="row">  제2대리인 생년월일</th> 
									<td><input type="text" id="rpt2_birth_dt" name="rpt2_birth_dt" value="" ></td>
								</tr> 
								<tr> 
									<th scope="row">  제2대리인 전화</th>
									<td><input type="text" id="rpt2_tel" name="rpt2_tel" value="" ></td>
									<th scope="row">  제2대리인 이메일</th> 
									<td><input type="text" id="rpt2_email" name="rpt2_email" value="" ></td> 
								</tr>
								<tr> 
									<th scope="row">  제2대리인 주소</th>
									<td colspan="3"><input type="text" id="rpt2_addr" name="rpt2_addr" value="" ></td>
								</tr>
							</tbody> 
						</table>
						
						<!-- 증인 -->
						<table class="notice_view" border="1" cellspacing="0" summary=""> 
						<caption>의료요양지시서 등록</caption> 
						<colgroup> 
						<col width="15%"></col>
						<col width="35%"></col> 
						<col width="20%"></col>
						<col width="30%"></col>
						</colgroup> 
							<thead> 
							</thead> 
							<tbody> 
								<tr> 
									<th scope="row"><font color="red">*</font>  증인 성명</th> 
									<td><input type="text" id="wit_name" name="wit_name" value="" ></td> 
									<th scope="row"><font color="red">*</font>  증인 생년월일</th> 
									<td><input type="text" id="wit_birth_dt" name="wit_birth_dt" value="" ></td>
								</tr> 
								<tr> 
									<th scope="row"><font color="red">*</font>  증인 전화</th>
									<td><input type="text" id="wit_tel" name="wit_tel" value="" ></td>
									<th scope="row"><font color="red">*</font>  증인 이메일</th> 
									<td><input type="text" id="wit_email" name="wit_email" value="" ></td> 
								</tr>
								<tr> 
									<th scope="row"><font color="red">*</font>  증인 주소</th>
									<td colspan="3"><input type="text" id="wit_addr" name="wit_addr" value="" ></td>
								</tr>
							</tbody> 
						</table>
						
						<!-- 작성일자 -->
						<input type="hidden" id="tmp_write_dt" name="tmp_write_dt" value="">
						<table class="notice_view" border="1" cellspacing="0" summary=""> 
						<caption>의료요양지시서 등록</caption> 
						<colgroup> 
							<col width="15%"></col>
							<col width="85%"></col>
						</colgroup> 
							<thead> 
							</thead> 
							<tbody> 
								<tr> 
									<th scope="row"><font color="red">*</font>  작성일자</th> 
									<td>
										<select id="make_year" name="make_year" style="width:10%;" >
											<option value="2019">2019년</option>
											<option value="2020">2020년</option>
										    <option value="2021">2021년</option>
										    <option value="2022">2022년</option>
										</select>년&nbsp;&nbsp;&nbsp;
										<select id="make_month" name="make_month" style="width:10%;" >
											<option value="01" >1월</option>
											<option value="02" >2월</option>
										    <option value="03" >3월</option>
										    <option value="04" >4월</option>
										    <option value="05" >5월</option>
										    <option value="06" >6월</option>
										    <option value="07" >7월</option>
										    <option value="08" >8월</option>
										    <option value="09" >9월</option>
										    <option value="10" >10월</option>
										    <option value="11" >11월</option>
										    <option value="12" >12월</option>
										</select>월&nbsp;&nbsp;&nbsp;
										<select id="make_day" name="make_day" style="width:10%;" >
											<option value="01" >1일</option>
											<option value="02" >2일</option>
										    <option value="03" >3일</option>
										    <option value="04" >4일</option>
										    <option value="05" >5일</option>
										    <option value="06" >6일</option>
										    <option value="07" >7일</option>
										    <option value="08" >8일</option>
										    <option value="09" >9일</option>
										    <option value="10" >10일</option>
										    <option value="11" >11일</option>
										    <option value="12" >12일</option>
										    <option value="13" >13일</option>
										    <option value="14" >14일</option>
										    <option value="15" >15일</option>
										    <option value="16" >16일</option>
										    <option value="17" >17일</option>
										    <option value="18" >18일</option>
										    <option value="19" >19일</option>
										    <option value="20" >20일</option>
										    <option value="21" >21일</option>
										    <option value="22" >22일</option>
										    <option value="23" >23일</option>
										    <option value="24" >24일</option>
										    <option value="25" >25일</option>
										    <option value="26" >26일</option>
										    <option value="27" >27일</option>
										    <option value="28" >28일</option>
										    <option value="29" >29일</option>
										    <option value="30" >30일</option>
										    <option value="31" >31일</option>
										</select>일
									
										
									</td> 
								</tr> 
								
							</tbody> 
						</table>
						</br></br></br>
						
						
						<!-- 2 적용시기 -->
						<h3 class="title"><b><font color="red">*</font> [필수사항] Ⅱ. 적용 시기</b></h3>
						<table class="notice_view" border="1" cellspacing="0" summary=""> 
						<caption>의료요양지시서 등록</caption> 
							<colgroup> 
								<col width="50%"></col>
								<col width="50%"></col> 
							</colgroup> 
							<thead> 
								<th scope="row">시점</th> 
								<th scope="row">기타시점</th> 
							</thead> 
							<tbody> 
								<tr> 
									<td>입원 치료가 필요하거나 요양시설 입소가 필요한 시점부터 </td> 
									<td>직접 기재 (가령 추가적인 조건을 붙이고자 할 경우. ex. 의사결정지원자(대리인)이 입원 치료가 필요하다고 판단하는 시점)</td> 
								</tr>
								<tr> 
									<td>
										예 : &nbsp;&nbsp;<input type="radio" id="aply_point" name="aply_point" value="Y" onclick="javascript:fn_setting1();"/>
										아니오 : &nbsp;&nbsp;<input type="radio" id="aply_point" name="aply_point" value="N" onclick="javascript:fn_setting1();"/>			
									</td> 
									<td><input type="text" id="aply_etc" name="aply_etc" value=""></td> 
								</tr> 
							</tbody> 
						</table>
						</br></br></br>
						
						
						<!-- [필수사항] 제1대리인의 권한 -->
						<h3 class="title"><b><font color="red">*</font> [필수사항] 제1대리인의 권한</b></h3>
						<table class="notice_view" border="1" cellspacing="0" summary=""> 
						<caption>의료요양지시서 등록</caption> 
							<colgroup> 
								<col width="85%"></col>
								<col width="15%"></col> 
							</colgroup> 
							<thead> 
								<th scope="row">항목</th> 
								<th scope="row">권한 유무</th> 
							</thead> 
							<tbody> 
								<tr> 
									<td>병원 치료에 관한 동의 유무(단 치료행위가 직접 생명 상실, 또는 신체에 중대한 손상을 가할 위험이 있는 경우는 제외)</td> 
									<td>
										예 : &nbsp;&nbsp;<input type="radio" id="rpt1_auth_1" name="rpt1_auth_1" value="Y" />
										아니오 : &nbsp;&nbsp;<input type="radio" id="rpt1_auth_1" name="rpt1_auth_1" value="N" />
									</td> 
								</tr>
								<tr> 
									<td>요양시설 입소계약 및 입소에 관한 동의 </td> 
									<td>
										예 : &nbsp;&nbsp;<input type="radio" id="rpt1_auth_2" name="rpt1_auth_2" value="Y" />
										아니오 : &nbsp;&nbsp;<input type="radio" id="rpt1_auth_2" name="rpt1_auth_2" value="N"  />	
									</td> 
								</tr>
								<tr> 
									<td>요양시설에서 중대한 자해, 타해의 위험을 방지하기 위한 신체 자유의 제한 조치에 대한 동의</td> 
									<td>
										예 : &nbsp;&nbsp;<input type="radio" id="rpt1_auth_3" name="rpt1_auth_3" value="Y" />
										아니오 : &nbsp;&nbsp;<input type="radio" id="rpt1_auth_3" name="rpt1_auth_3" value="N"  />	
									</td> 
								</tr>
								<tr> 
									<td>치료비 및 요양비 지급을 위한 예금계좌(아래에 기재)의 관리, 예금인출, 송금, 갱신, 해지, 해지 후의 신규계좌 개설 등의 법률행위</td> 
									<td rowspan="2">
										예 : &nbsp;&nbsp;<input type="radio" id="rpt1_auth_4" name="rpt1_auth_4" value="Y" onclick="javascript:fn_setting2();"/>
										아니오 : &nbsp;&nbsp;<input type="radio" id="rpt1_auth_4" name="rpt1_auth_4" value="N" onclick="javascript:fn_setting2();"/>	
									</td> 
								</tr>
								<tr> 
									<td>
										은행명   : <input type="text" id="rpt1_auth_5" name="rpt1_auth_5" value="" style="width :20%" > &nbsp;&nbsp;
										계좌번호 : <input type="text" id="rpt1_auth_6" name="rpt1_auth_6" value="" style="width :20%" > &nbsp;&nbsp;
										예금주   : <input type="text" id="rpt1_auth_7" name="rpt1_auth_7" value="" style="width :20%" >
									</td> 
								</tr>
								<tr> 
									<td>요양시설 입소를 위해 기존 주거하던 임차주택의 임대차보증금 반환에 관한 권리의 행사를 위한 법률행위 및 수령 후 위 예금계좌에 입금에 관한 사항</td> 
									<td>
										예 : &nbsp;&nbsp;<input type="radio" id="rpt1_auth_8" name="rpt1_auth_8" value="Y" />
										아니오 : &nbsp;&nbsp;<input type="radio" id="rpt1_auth_8" name="rpt1_auth_8" value="N" />	
									</td> 
								</tr>
								<tr> 
									<td>요양시설 입소 후 기존 소유주택을 임차하는 것과 관련된 법률행위, 수령한 임대료를 위 예금계좌에 입금하는 사항</td> 
									<td>
										예 : &nbsp;&nbsp;<input type="radio" id="rpt1_auth_9" name="rpt1_auth_9" value="Y" />
										아니오 : &nbsp;&nbsp;<input type="radio" id="rpt1_auth_9" name="rpt1_auth_9" value="N" />	
									</td> 
								</tr>
								<tr> 
									<td>사회보장급여의 신청</td> 
									<td>
										예 : &nbsp;&nbsp;<input type="radio" id="rpt1_auth_10" name="rpt1_auth_10" value="Y" />
										아니오 : &nbsp;&nbsp;<input type="radio" id="rpt1_auth_10" name="rpt1_auth_10" value="N" />	
									</td> 
								</tr>
								<tr> 
									<td>위 권한의 행사와 관련하여 주민등록등·초본, 인감증명서, 가족관계증명서 등의 발급을 위한 공법상의 신청행위</td> 
									<td>
										예 : &nbsp;&nbsp;<input type="radio" id="rpt1_auth_11" name="rpt1_auth_11" value="Y" />
										아니오 : &nbsp;&nbsp;<input type="radio" id="rpt1_auth_11" name="rpt1_auth_11" value="N" />	
									</td> 
								</tr>
								
							</tbody> 
						</table>
						</br></br></br>
						
						<!-- 제2대리인권한 -->
						<h4 class="title"><b><font color="red">*</font> [필수사항] 제2대리인의 권한</b></h4>
						<table class="notice_view" border="1" cellspacing="0" summary=""> 
						<caption>의료요양지시서 등록</caption> 
							<colgroup> 
								<col width="85%"></col>
								<col width="15%"></col> 
							</colgroup> 
							<thead> 
								<th scope="row">항목</th> 
								<th scope="row">권한 유무</th> 
							</thead> 
							<tbody> 
								<tr> 
									<td>나를 대신하여 제1대리인으로부터 보고를 요구하는 법률행위</td> 
									<td>
										예 : &nbsp;&nbsp;<input type="radio" id="rpt2_auth_1" name="rpt2_auth_1" value="Y" />
										아니오 : &nbsp;&nbsp;<input type="radio" id="rpt2_auth_1" name="rpt2_auth_1" value="N" />		
									</td> 
								</tr>
								<tr> 
									<td>나를 대리하여 제1대리인을 해임할 수 있는 법률행위</td> 
									<td>
										예 : &nbsp;&nbsp;<input type="radio" id="rpt2_auth_2" name="rpt2_auth_2" value="Y" />
										아니오 : &nbsp;&nbsp;<input type="radio" id="rpt2_auth_2" name="rpt2_auth_2" value="N" />
									</td> 
								</tr>
								<tr> 
									<td>나를 대신하여 제1대리인에게 손해배상청구를 하는 데 필요한 법률행위</td> 
									<td>
										예 : &nbsp;&nbsp;<input type="radio" id="rpt2_auth_3" name="rpt2_auth_3" value="Y" />
										아니오 : &nbsp;&nbsp;<input type="radio" id="rpt2_auth_3" name="rpt2_auth_3" value="N" />	
									</td> 
								</tr>
								<tr> 
									<td>제1대리인이 부득이한 사유로 사임할 경우, 동일한 권한을 가진 제1대리인을 선임하는 법률행위. 
									    단, 이 때에는 제1대리인 선임을 제외한 나머지 사항은 동일한 내용으로 사전의료·요양 지시서를 재작성하여야 한다.</td> 
									<td rowspan="2">
										예 : &nbsp;&nbsp;<input type="radio" id="rpt2_auth_4" name="rpt2_auth_4" value="Y" />
										아니오 : &nbsp;&nbsp;<input type="radio" id="rpt2_auth_4" name="rpt2_auth_4" value="N" />	
									</td> 
								</tr>
							</tbody> 
						</table>
						</br></br>
						
						
						
						<!--------------------------     필수사항 등록하기  End      ------------------------------------->
						
						
						
						
						<!--------------------------     선택사항 등록하기  Start    ------------------------------------->
						
						<div style="height:100px;">
						</br></br></br></br></br></br></br></br>
						</div>
						
						<!-- [선택사항] 입원 및 요양시설 입소에 관한 나의 의사 -->
						<h3 class="title"><b>[선택사항] 입원 및 요양시설 입소에 관한 나의 의사</b></h3>
						<table class="notice_view" border="1" cellspacing="0" summary=""> 
						<caption>의료요양지시서 등록</caption> 
							<colgroup> 
								<col width="85%"></col>
								<col width="15%"></col> 
							</colgroup> 
							<thead> 
								<th scope="row">사  항</th> 
								<th scope="row">해 당  여 부</th> 
							</thead> 
							<tbody> 
								<tr> 
									<td>병원 입원에서는 (<input type="text" id="my_thik_1_room" name="my_thik_1_room" value="" style="width :5%" >)인실 병실에 입원하게 해 달라.</td> 
									<td>
										예 : &nbsp;&nbsp;<input type="radio" id="my_thik_1" name="my_thik_1" value="Y" onclick="javascript:fn_setting3();"/>
										아니오 : &nbsp;&nbsp;<input type="radio" id="my_thik_1" name="my_thik_1" value="N" onclick="javascript:fn_setting3();"/>		
									</td> 
								</tr>
								<tr> 
									<td>와상상태가 지속되지 않는 한 요양시설에 입소시켜서는 안 된다. 내가 보유한 재산을 활용하여 거주하는 곳에 최대한 오랫동안 지낼 수 있는 조치를 취하도록 해 달라. </td> 
									<td>
										예 : &nbsp;&nbsp;<input type="radio" id="my_thik_2" name="my_thik_2" value="Y" />
										아니오 : &nbsp;&nbsp;<input type="radio" id="my_thik_2" name="my_thik_2" value="N" />	
									</td> 
								</tr>
								<tr> 
									<td>요양시설에 입소할 때에는 (<input type="text" id="my_thik_3_area" name="my_thik_3_area" value="" style="width :10%"" >) 
									    지역에 있는 요양시설로 (<input type="text" id="my_thik_3_room" name="my_thik_3_room" value="" style="width :5%" >)실에
									    입소하게 해 달라.</td> 
									<td>
										예 : &nbsp;&nbsp;<input type="radio" id="my_thik_3" name="my_thik_3" value="Y" onclick="javascript:fn_setting4();"/>
										아니오 : &nbsp;&nbsp;<input type="radio" id="my_thik_3" name="my_thik_3" value="N" onclick="javascript:fn_setting4();"/>	
									</td> 
								</tr>
								<tr> 
									<td>의사소통이 되지 않는다는 이유로 나의 신체를 구속하거나 활동을 제한하는 행위를 해서는 안 된다. 
									    다만 현존하거나 임박한 중대한 자해, 타해의 위험이 있는 경우에는 나를 진정시키는 방법을 먼저 
									    사용해 달라. 그 방법으로 나는 (예: 신체의 자유를 제한하는 것은 5분 이내로 한정하고, 그 이전에 
									    반드시 편안한 분위기에서 나의 욕구를 경청하는 것)을 선호한다.</td> 
									<td>
										예 : &nbsp;&nbsp;<input type="radio" id="my_thik_4" name="my_thik_4" value="Y" />
										아니오 : &nbsp;&nbsp;<input type="radio" id="my_thik_4" name="my_thik_4" value="N" />
									</td> 
								</tr>
								<tr> 
									<td>치료목적의 결박 등 신체자유제한조치는 대리인이 동의한 것에 따른다.</td> 
									<td>
										예 : &nbsp;&nbsp;<input type="radio" id="my_thik_5" name="my_thik_5" value="Y" />
										아니오 : &nbsp;&nbsp;<input type="radio" id="my_thik_5" name="my_thik_5" value="N" />	
									</td> 
								</tr>
								<tr> 
									<td>기타</br>
										<input type="text" id="my_thik_6_cntn" name="my_thik_6_cntn" value="" style="width :80%" >
									</td> 
									<td>
										예 : &nbsp;&nbsp;<input type="radio" id="my_thik_6" name="my_thik_6" value="Y" onclick="javascript:fn_setting5();"/>
										아니오 : &nbsp;&nbsp;<input type="radio" id="my_thik_6" name="my_thik_6" value="N" onclick="javascript:fn_setting5();"/>		
									</td> 
								</tr>
								
							</tbody> 
						</table>
						
						
						<!-- [선택사항] 입소할 요양시설에 대한 나의 의사 -->
						<h3 class="title"><b>[선택사항] 입소할 요양시설에 대한 나의 의사</b></h3>
						<table class="notice_view" border="1" cellspacing="0" summary=""> 
						<caption>의료요양지시서 등록</caption> 
						<colgroup> 
						<col width="20%"></col>
						<col width="40%"></col> 
						<col width="40%"></col>
						</colgroup> 
							<thead> 
							</thead> 
							<tbody> 		
								<tr> 
									<th scope="row" rowspan="2"  style="vertical-align:middle;">1순위 요양시설</th> 
									<td>요양시설명 : <input type="text" id="no1_buid_cntn" name="no1_buid_cntn" value="" style="width :60%"></td> 
									<td>전화번호 : <input type="text" id="no1_buid_tel" name="no1_buid_tel" value="" style="width :50%"></td>
								</tr> 
								<tr> 
									<td colspan="2">주소 : <input type="text" id="no1_buid_addr" name="no1_buid_addr" value="" style="width :80%"></td> 
								</tr> 
							</tbody> 
						</table>
						
						<!-- [선택사항] 입소할 요양시설에 대한 나의 의사 -->
						<table class="notice_view" border="1" cellspacing="0" summary=""> 
						<caption>의료요양지시서 등록</caption> 
						<colgroup> 
						<col width="20%"></col>
						<col width="40%"></col> 
						<col width="40%"></col>
						</colgroup> 
							<thead> 
							</thead> 
							<tbody> 		
								<tr> 
									<th scope="row" rowspan="2"  style="vertical-align:middle;">2순위 요양시설</th> 
									<td>요양시설명 : <input type="text" id="no2_buid_cntn" name="no2_buid_cntn" value="" style="width :60%"></td> 
									<td>전화번호 : <input type="text" id="no2_buid_tel" name="no2_buid_tel" value="" style="width :50%"></td>
								</tr> 
								<tr> 
									<td colspan="2">주소 : <input type="text" id="no2_buid_addr" name="no2_buid_addr" value="" style="width :80%"></td> 
								</tr> 
							</tbody> 
						</table>
						
						<table class="notice_view" border="1" cellspacing="0" summary=""> 
						<caption>의료요양지시서 등록</caption> 
						<colgroup> 
						<col width="10%"></col>
						<col width="40%"></col> 
						<col width="40%"></col>
						</colgroup> 
							<thead> 
							</thead> 
							<tbody> 
								<tr>  
									<th scope="row"  style="vertical-align:middle;">3순위 요양시설</th> 
									<td colspan="2">(대리인이지정하는시설)</br>
										<input type="text" id="no3_buid_cntn" name="no3_buid_cntn" value="" style="width :80%" >
									</td> 
									
								</tr> 
							</tbody> 
						</table>
						
						
						<!-- 선택사항 -->
						<h3 class="title"><b>[선택사항] 어떤 사유로 병원에 입원하거나 요양시설에 입소하더라도 
						                     아래 기록된 특성을 존중해 주기바랍니다. 여기 표시된 나의 의사는 
						                     대리인의 의사보다 우선합니다.</b></h3>
						<table class="notice_view" border="1" cellspacing="0" summary=""> 
						<caption>의료요양지시서 등록</caption> 
							<colgroup> 
								<col width="15%"></col>
								<col width="15%"></col> 
								<col width="70%"></col> 
							</colgroup> 
							<thead> 
								<th scope="row">특  성</th> 
								<th scope="row">동 의  여 부</th> 
								<th scope="row">설  명</th>
							</thead> 
							<tbody> 
								<tr> 
									<td>사생활의 보장</td> 
									<td>
										<label>예 : &nbsp;&nbsp;<input type="checkbox" id="my_req_1" name="my_req_1" value="Y"></label>&nbsp;&nbsp;&nbsp;&nbsp;
										<label>아니오 : &nbsp;&nbsp;<input type="checkbox" id="my_req_1" name="my_req_1" value="N"></label>	
									</td> 
									<td>나의 개인 소지품을 소유하고 보관할 수 있으며 사생활을 보장받을 수 있는 공간 또는 장소가 있을 것.</td> 
								</tr>
								<tr> 
									<td>통신·외출의 자유</td> 
									<td>
										<label>예 : &nbsp;&nbsp;<input type="checkbox" id="my_req_2" name="my_req_2" value="Y"></label>&nbsp;&nbsp;&nbsp;&nbsp;
										<label>아니오 : &nbsp;&nbsp;<input type="checkbox" id="my_req_2" name="my_req_2" value="N"></label>	
									</td> 
									<td>병원 내 자유롭게 나의 필요에 따라 휴대전화를 사용할 수 있으며 외출을 원할 경우 외부로 나갈 수 있을 것.</td> 
								</tr>
								<tr> 
									<td>진료 시간의 충분함</td> 
									<td>
										<label>예 : &nbsp;&nbsp;<input type="checkbox" id="my_req_3" name="my_req_3" value="Y"></label>&nbsp;&nbsp;&nbsp;&nbsp;
										<label>아니오 : &nbsp;&nbsp;<input type="checkbox" id="my_req_3" name="my_req_3" value="N"></label>	
									</td> 
									<td>진료 및 상담에 있어서 최소 30분 이상의 시간적 충분함을 가지고 치료적 조치들이 이루어질 수 있을 것.</td> 
								</tr>
								<tr> 
									<td>치료 정보에 대한 제공</td> 
									<td>
										<label>예 : &nbsp;&nbsp;<input type="checkbox" id="my_req_4" name="my_req_4" value="Y"></label>&nbsp;&nbsp;&nbsp;&nbsp;
										<label>아니오 : &nbsp;&nbsp;<input type="checkbox" id="my_req_4" name="my_req_4" value="N"></label>	
									</td> 
									<td>나에 대한 정신과적 진료 및 약물 처방과 관련하여 내가 이해할 수 있는 언어와 방법으로 충분한 설명을 제공해줄 수 있을 것.</td> 
								</tr>
								<tr> 
									<td>프로그램 참여의 자유</td> 
									<td>
										<label>예 : &nbsp;&nbsp;<input type="checkbox" id="my_req_5" name="my_req_5" value="Y"></label>&nbsp;&nbsp;&nbsp;&nbsp;
										<label>아니오 : &nbsp;&nbsp;<input type="checkbox" id="my_req_5" name="my_req_5" value="N"></label>	
									</td> 
									<td>정신과적 치료를 위한 프로그램 참여에 있어서 나의 선호나 취향에 따라 참여 결정이 자유로울 수 있을 것.</td> 
								</tr>
							</tbody> 
						</table>
						
						
						
						<!-- 선택사항 4 -->
						<h3 class="title"><b>[선택사항] 내가 병원 또는 요양시설 있더라도 아래에 기록된 사람은 나를 자유롭게 
											 만날 수 있게 해주십시오. 여기 표시된 나의 의사는 대리인의 의사보다 우선합니다.</b></h3>
						<table class="notice_view" border="1" cellspacing="0" summary=""> 
						<caption>의료요양지시서 등록</caption> 
							<colgroup> 
								<col width="25%"></col>
								<col width="35%"></col> 
								<col width="40%"></col> 
							</colgroup> 
							<thead> 
								<th scope="row">성    명</th> 
								<th scope="row">관    계</th> 
								<th scope="row">연 락 처</th>
							</thead> 
							<tbody> 		
								<tr> 
									<td><input type="text" id="free_vist_1_name" name="free_vist_1_name" value="" style="width :80%; align-conten :center"></td> 
									<td><input type="text" id="free_vist_1_rel" name="free_vist_1_rel" value="" style="width :80%; align-conten :center"></td> 
									<td><input type="text" id="free_vist_1_tel" name="free_vist_1_tel" value="" style="width :80%; align-conten :center"></td> 
								</tr>
								<tr> 
									<td><input type="text" id="free_vist_2_name" name="free_vist_2_name" value="" style="width :80%; align-conten :center"></td> 
									<td><input type="text" id="free_vist_2_rel" name="free_vist_2_rel" value="" style="width :80%; align-conten :center"></td> 
									<td><input type="text" id="free_vist_2_tel" name="free_vist_2_tel" value="" style="width :80%; align-conten :center"></td> 
								</tr>
								<tr> 
									<td><input type="text" id="free_vist_3_name" name="free_vist_3_name" value="" style="width :80%; align-conten :center"></td> 
									<td><input type="text" id="free_vist_3_rel" name="free_vist_3_rel" value="" style="width :80%; align-conten :center"></td> 
									<td><input type="text" id="free_vist_3_tel" name="free_vist_3_tel" value="" style="width :80%; align-conten :center"></td> 
								</tr>								
							</tbody> 
						</table>
						
						
						<!-- 선택사항 5 -->
						<h3 class="title"><b>[선택사항] 나는 다음과 같은 개성이 있으니 이를 존중해 주기 바랍니다. 대리인도 
											 여기 표시된 나의 의사를 존중하기 바랍니다. 그렇지 않을 경우 대리인의 의무를 위반한 
											 것으로 간주해야 합니다.</b></h3>
						<table class="notice_view" border="1" cellspacing="0" summary=""> 
						<caption>의료요양지시서 등록</caption> 
							<colgroup> 
								<col width="20%"></col>
								<col width="80%"></col> 
							</colgroup> 
							<thead> 
								<th scope="row">정    보</th> 
								<th scope="row">내    용</th> 
							</thead> 
							<tbody> 
								<tr> 
									<td>나를 화 나게 하는 언어 및 태도</td> 
									<td><input type="text" id="my_indv_1" name="my_indv_1" value="" style="width :80%"></td> 
								</tr>
								<tr> 
									<td>종교적 취향</td> 
									<td><input type="text" id="my_indv_2" name="my_indv_2" value="" style="width :80%"></td> 
								</tr>
								<tr> 
									<td>식이요법</td> 
									<td><input type="text" id="my_indv_3" name="my_indv_3" value="" style="width :80%"></td> 
								</tr>								
								<tr> 
									<td>기타</td> 
									<td><input type="text" id="my_indv_4" name="my_indv_4" value="" style="width :80%"></td> 
								</tr>
							</tbody> 
						</table>
						</br>
						
						<!-- 정보등록 -->
						<div class="fl_R" style="height:50px;">
							<a href="javascript:fn_witr_Reg();" class="btn_big"><strong>등록하기</strong></a></div>
						<div>
						
						<!-- view  end -->
					</div>
	            </div>
	        </div>
	    </section>
	    
	   
	<!--/#services-->
	</form>
	
	<!-- file 업로드 form -->
	<form id="cdFileFrm" name="cdFileFrm" method="post" enctype="multipart/form-data">
		<section id="" class="padding">
	        <div class="container">
	            <div class="row">
					<div class="col-md-12 col-sm-12">
	
						<h3 class="title"><b>첨부파일 업로드</b></h3>
						<!-- view  start -->
						<div class="form_table">
							<table class="notice_view" border="1" cellspacing="0" summary=""> 
								<caption>첨부파일 업로드</caption> 
								<colgroup> 
								<col width="150">
								<col width="*">
								</colgroup> 
								<tbody> 
								
								<tr> 
									<th colspan="2">사전의료요양지시서를 작성하지 못할 경우 첨부파일을 올려주세요.</th> 
								</tr> 
								<tr> 
									<th>첨부파일 업로드</th> 
									<td>
										<div class="item">
											<input type="file" id="cdFile" name="cdFile" value="" class="i_text wp95" >
										</div>
									</td> 
								</tr>  
								</tbody> 
							</table>
							
						</div>
						</br>
						<!-- 첨부파일 업로드 end -->
						
						<!-- 첨부파일 업로드 버튼 -->
						<div class="fl_R" style="height:50px;">
							<a href="javascript:fn_cdFile_Upload();" class="btn_big"><strong>첨부파일 업로드</strong></a></div>
						<div>
						
						
					</div>
	            </div>
	        </div>
	    </section>
    </form>
    <!-- file 업로드 form end -->
	
	
    <!--/#action-->
    <script type="text/javaScript" language="javascript" defer="defer">
        
  		//필수사항- 적용시기  클릭 이벤트 처리
	    function fn_setting1(){
	        
	        if($("input:radio[name=aply_point]:checked").val()=='Y'){
	        	//input box 입력가능처리
	        	$("input:text[name=aply_etc]").attr("disabled",true);
	        }else{
	        	//input box 입력불가처리
	        	$("input:text[name=aply_etc]").attr("disabled",false);
	        }
  		}
 
	    
	    
  		//필수사항 - 제1대리인의 권한 클릭 이벤트 처리
  		function fn_setting2(){
  			
	    	if($("input:radio[name=rpt1_auth_4]:checked").val()=='Y'){
	        	//input box 입력가능처리
	        	$("input:text[name=rpt1_auth_5]").attr("disabled",false);
	        	$("input:text[name=rpt1_auth_6]").attr("disabled",false);
	        	$("input:text[name=rpt1_auth_7]").attr("disabled",false);
	        }else{
	        	//input box 입력불가처리
	        	$("input:text[name=rpt1_auth_5]").attr("disabled",true);
	        	$("input:text[name=rpt1_auth_6]").attr("disabled",true);
	        	$("input:text[name=rpt1_auth_7]").attr("disabled",true);
	        }
	    	
  		}
  		
  		//선택사항 - 입원및요양시설 입소에 관한 나의의사 클릭 이벤트 처리1
  		function fn_setting3(){
  			
  			//이벤트 처리 
	    	if($("input:radio[name=my_thik_1]:checked").val()=='Y'){
	        	//input box 입력가능처리
	        	$("input:text[name=my_thik_1_room]").attr("disabled",false);
	        }else{
	        	//input box 입력불가처리
	        	$("input:text[name=my_thik_1_room]").attr("disabled",true);
	        }
	    	
  		}
  		
  		//선택사항 - 입원및요양시설 입소에 관한 나의의사 클릭 이벤트 처리2
  		function fn_setting4(){
  			 
  			//이벤트 처리 
	    	if($("input:radio[name=my_thik_3]:checked").val()=='Y'){
	        	//input box 입력가능처리
	        	$("input:text[name=my_thik_3_area]").attr("disabled",false);
	        	$("input:text[name=my_thik_3_room]").attr("disabled",false);
	        }else{
	        	//input box 입력불가처리
	        	$("input:text[name=my_thik_3_area]").attr("disabled",true);
	        	$("input:text[name=my_thik_3_room]").attr("disabled",true);
	        }
	    	
  		}

  		//선택사항 - 입원및요양시설 입소에 관한 나의의사 클릭 이벤트 처리3
  		function fn_setting5(){
  			 
  			//이벤트 처리 
	    	if($("input:radio[name=my_thik_6]:checked").val()=='Y'){
	        	//input box 입력가능처리
	        	$("input:text[name=my_thik_6_cntn]").attr("disabled",false);
	        }else{
	        	//input box 입력불가처리
	        	$("input:text[name=my_thik_6_cntn]").attr("disabled",true);
	        }
	    	
  		}
  		
  		
        
      	//필수정보등록
	    function fn_witr_Reg() {
      		
			var tmpYear = $("#make_year option:selected").val();
			var tmpMonth = $("#make_month option:selected").val();
			var tmpDay = $("#make_day option:selected").val();			
			var tmpAplyPoint = $('input[name=aply_point]:checked').val();
			
			//[필수사항] 제1대리인의 권한
			var tmpRpt1_auth_1 = $('input[name=rpt1_auth_1]:checked').val();
			var tmpRpt1_auth_2 = $('input[name=rpt1_auth_2]:checked').val();
			var tmpRpt1_auth_3 = $('input[name=rpt1_auth_3]:checked').val();
			var tmpRpt1_auth_4 = $('input[name=rpt1_auth_4]:checked').val();
			var tmpRpt1_auth_8 = $('input[name=rpt1_auth_8]:checked').val();
			var tmpRpt1_auth_9 = $('input[name=rpt1_auth_9]:checked').val();
			var tmpRpt1_auth_10 = $('input[name=rpt1_auth_10]:checked').val();
			var tmpRpt1_auth_11 = $('input[name=rpt1_auth_11]:checked').val();
			
			//[필수사항] 제2대리인의 권한
			var tmpRpt2_auth_1 = $('input[name=rpt2_auth_1]:checked').val();
			var tmpRpt2_auth_2 = $('input[name=rpt2_auth_2]:checked').val();
			var tmpRpt2_auth_3 = $('input[name=rpt2_auth_3]:checked').val();
			var tmpRpt2_auth_4 = $('input[name=rpt2_auth_4]:checked').val();
			
			//[선택사항] 입원 및 요양시설 입소에 관한 나의 의사
			var tmpMy_thik_1 = $('input[name=my_thik_1]:checked').val();
			if(tmpMy_thik_1 == undefined){
				tmpMy_thik_1 = "";
			}
			var tmpMy_thik_2 = $('input[name=my_thik_2]:checked').val();
			if(tmpMy_thik_2 == undefined){
				tmpMy_thik_2 = "";
			}					
			var tmpMy_thik_3 = $('input[name=my_thik_3]:checked').val();
			if(tmpMy_thik_3 == undefined){
				tmpMy_thik_3 = "";
			}	
			var tmpMy_thik_4 = $('input[name=my_thik_4]:checked').val();
			if(tmpMy_thik_4 == undefined){
				tmpMy_thik_4 = "";
			}	
			var tmpMy_thik_5 = $('input[name=my_thik_5]:checked').val();
			if(tmpMy_thik_5 == undefined){
				tmpMy_thik_5 = "";
			}	
			var tmpMy_thik_6 = $('input[name=my_thik_6]:checked').val();
			if(tmpMy_thik_6 == undefined){
				tmpMy_thik_6 = "";
			}	
			
			//[선택사항] 어떤 사유로 병원에 입원하거나 요양시설에 입소하더라도 아래 기록된 특성을 존중해 주기바랍니다. 여기 표시된 나의 의사는 대리인의 의사보다 우선합니다.
			var my_req_1 = $('input[name=my_req_1]:checked').val();
			if(my_req_1 == undefined){
				my_req_1 = "";
			}
			
			var my_req_2 = $('input[name=my_req_2]:checked').val();
			if(my_req_2 == undefined){
				my_req_2 = "";
			}
			
			var my_req_3 = $('input[name=my_req_3]:checked').val();
			if(my_req_3 == undefined){
				my_req_3 = "";
			}
			
			var my_req_4 = $('input[name=my_req_4]:checked').val();
			if(my_req_4 == undefined){
				my_req_4 = "";
			}
			
			var my_req_5 = $('input[name=my_req_5]:checked').val();
			if(my_req_5 == undefined){
				my_req_5 = "";
			}
			
			
			
			
			
			//alert(document.regCdFrm.aply_etc.value);
			//return;
      		
	    	var data=new FormData();
	    	
	 	  	//작성자
	    	if(document.regCdFrm.witr_name.value =="" ){
	    		alert("작성자명을 입력하셔야 합니다.");
	    		document.regCdFrm.witr_name.focus();
	    		return;
	    	}else{
	    		data.append("witr_name",document.regCdFrm.witr_name.value);
	    	}
	 	  	
	    	if(document.regCdFrm.exe_dt.value =="" ){
	    		alert("시행일자를 입력하셔야 합니다.");
	    		document.regCdFrm.exe_dt.focus();
	    		return;
	    	}else{
	    		data.append("exe_dt",document.regCdFrm.exe_dt.value);
	    	}
	    	
			if(document.regCdFrm.witr_birth_dt.value==""){
				alert("작성자 생년월일을 입력하셔야 합니다.");
	    		document.regCdFrm.witr_birth_dt.focus();
	    		return;
			}else{
				data.append("witr_birth_dt",document.regCdFrm.witr_birth_dt.value);
			}
			
			if(document.regCdFrm.witr_tel.value==""){
				alert("작성자 전화번호를 입력하셔야 합니다.");
	    		document.regCdFrm.witr_tel.focus();
	    		return;
			}else{
				data.append("witr_tel",document.regCdFrm.witr_tel.value);
			}
			
			if(document.regCdFrm.witr_email.value==""){
				alert("작성자 이메일을 입력하셔야 합니다.");
	    		document.regCdFrm.witr_email.focus();
	    		return;
			}else{
				data.append("witr_email",document.regCdFrm.witr_email.value);
			}
			
			if(document.regCdFrm.witr_addr.value==""){
				alert("작성자 주소를 입력하셔야 합니다.");
	    		document.regCdFrm.witr_addr.focus();
	    		return;
			}else{
				data.append("witr_addr",document.regCdFrm.witr_addr.value);
			}
			
			
			//제1대리인
			if(document.regCdFrm.rpt1_id.value==""){
				alert("제1대리인 아이디를 입력하셔야 합니다.");
	    		document.regCdFrm.rpt1_id.focus();
	    		return;
			}else{
				data.append("rpt1_id",document.regCdFrm.rpt1_id.value);
			}
			
			if(document.regCdFrm.rpt1_name.value==""){
				alert("제1대리인 성명을 입력하셔야 합니다.");
	    		document.regCdFrm.rpt1_name.focus();
	    		return;
			}else{
				data.append("rpt1_name",document.regCdFrm.rpt1_name.value);
			}
			
			if(document.regCdFrm.rpt1_birth_dt.value==""){
				alert("제1대리인 생년월일을 입력하셔야 합니다.");
	    		document.regCdFrm.rpt1_birth_dt.focus();
	    		return;
			}else{
				data.append("rpt1_birth_dt",document.regCdFrm.rpt1_birth_dt.value);
			}
			
			if(document.regCdFrm.rpt1_tel.value==""){
				alert("제1대리인 전화번호를 입력하셔야 합니다.");
	    		document.regCdFrm.rpt1_tel.focus();
	    		return;
			}else{
				data.append("rpt1_tel",document.regCdFrm.rpt1_tel.value);
			}
			
			if(document.regCdFrm.rpt1_email.value==""){
				alert("제1대리인 이메일을 입력하셔야 합니다.");
	    		document.regCdFrm.rpt1_email.focus();
	    		return;
			}else{
				data.append("rpt1_email",document.regCdFrm.rpt1_email.value);
			}
			
			if(document.regCdFrm.rpt1_addr.value==""){
				alert("제1대리인 주소를 입력하셔야 합니다.");
	    		document.regCdFrm.rpt1_addr.focus();
	    		return;
			}else{
				data.append("rpt1_addr",document.regCdFrm.rpt1_addr.value);
			}
			
			//제2대리인
			if(document.regCdFrm.rpt2_id.value=="" && document.regCdFrm.rpt2_name.value != ""){
				alert("제2대리인 아이디를 입력하셔야 합니다.");
	    		document.regCdFrm.rpt2_id.focus();
	    		return;
			}
			
			if(document.regCdFrm.rpt2_id.value=="" && document.regCdFrm.rpt2_birth_dt.value != ""){
				alert("제2대리인 아이디를 입력하셔야 합니다.");
	    		document.regCdFrm.rpt2_id.focus();
	    		return;
			}
			
			if(document.regCdFrm.rpt2_id.value=="" && document.regCdFrm.rpt2_tel.value != ""){
				alert("제2대리인 아이디를 입력하셔야 합니다.");
	    		document.regCdFrm.rpt2_tel.focus();
	    		return;
			}
			
			if(document.regCdFrm.rpt2_id.value=="" && document.regCdFrm.rpt2_email.value != ""){
				alert("제2대리인 아이디를 입력하셔야 합니다.");
	    		document.regCdFrm.rpt2_email.focus();
	    		return;
			}
			
			if(document.regCdFrm.rpt2_id.value=="" && document.regCdFrm.rpt2_addr.value != ""){
				alert("제2대리인 아이디를 입력하셔야 합니다.");
	    		document.regCdFrm.rpt2_addr.focus();
	    		return;
			}
			
			data.append("rpt2_id",document.regCdFrm.rpt2_id.value);
			data.append("rpt2_name",document.regCdFrm.rpt2_name.value);
			data.append("rpt2_birth_dt",document.regCdFrm.rpt2_birth_dt.value);
			data.append("rpt2_tel",document.regCdFrm.rpt2_tel.value);
			data.append("rpt2_email",document.regCdFrm.rpt2_email.value);
			data.append("rpt2_addr",document.regCdFrm.rpt2_addr.value);
			
			//증인
			if(document.regCdFrm.wit_name.value==""){
				alert("증인 성명을 입력하셔야 합니다.");
	    		document.regCdFrm.wit_name.focus();
	    		return;
			}else{
				data.append("wit_name",document.regCdFrm.wit_name.value);
			}
			
			if(document.regCdFrm.wit_birth_dt.value==""){
				alert("증인 생년월일을 입력하셔야 합니다.");
	    		document.regCdFrm.wit_birth_dt.focus();
	    		return;
			}else{
				data.append("wit_birth_dt",document.regCdFrm.wit_birth_dt.value);
			}
			
			if(document.regCdFrm.wit_tel.value==""){
				alert("증인 전화번호를 입력하셔야 합니다.");
	    		document.regCdFrm.wit_tel.focus();
	    		return;
			}else{
				data.append("wit_tel",document.regCdFrm.wit_tel.value);
			}
			
			if(document.regCdFrm.wit_email.value==""){
				alert("증인 이메일을 입력하셔야 합니다.");
	    		document.regCdFrm.wit_email.focus();
	    		return;
			}else{
				data.append("wit_email",document.regCdFrm.wit_email.value);
			}
			
			if(document.regCdFrm.wit_addr.value==""){
				alert("증인 주소를 입력하셔야 합니다.");
	    		document.regCdFrm.wit_addr.focus();
	    		return;
			}else{
				data.append("wit_addr",document.regCdFrm.wit_addr.value);
			}
			
			//작성일자
			//alert("작성일자를 확인하세요 : "+tmpYear+'년'+tmpMonth+'월'+tmpDay+'일');
			
			data.append("make_year",tmpYear);
			data.append("make_month",tmpMonth);
			data.append("make_day",tmpDay);
			
			//적용시기
			if(tmpAplyPoint==undefined){
				alert("적용시기를 선택하셔야 합니다.");
	    		document.regCdFrm.wit_addr.focus();
	    		return;
			}else{
				data.append("aply_point",tmpAplyPoint);
			}
			
			data.append("aply_etc",document.regCdFrm.aply_etc.value);
			
			
		
			//제1대리인의 권한
			if(tmpRpt1_auth_1 == undefined){
				alert("첫번째 제1대리인의 권한을 선택 하세요.");
	    		return;
			}else{
				data.append("rpt1_auth_1",tmpRpt1_auth_1);
			}
			
			if(tmpRpt1_auth_2==undefined){
				alert("두번째 제1대리인의 권한을 선택 하세요.");
	    		return;
			}else{
				data.append("rpt1_auth_2",tmpRpt1_auth_2);
			}
			
			if(tmpRpt1_auth_3==undefined){
				alert("세번째 제1대리인의 권한을 선택 하세요.");
	    		return;
			}else{
				data.append("rpt1_auth_3",tmpRpt1_auth_3);
			}
			
			if(tmpRpt1_auth_4==undefined){
				alert("네번째 제1대리인의 권한을 선택 하세요.");
	    		return;
			}else{
				data.append("rpt1_auth_4",tmpRpt1_auth_4);
			}
			
			data.append("rpt1_auth_5",document.regCdFrm.rpt1_auth_5.value);
			data.append("rpt1_auth_6",document.regCdFrm.rpt1_auth_6.value);
			data.append("rpt1_auth_7",document.regCdFrm.rpt1_auth_7.value);
			
			if(tmpRpt1_auth_8==undefined){
				alert("다섯번째 제1대리인의 권한을 선택 하세요.");
	    		return;
			}else{
				data.append("rpt1_auth_8",tmpRpt1_auth_8);
			}
			
			if(tmpRpt1_auth_9==undefined){
				alert("여섯번째 제1대리인의 권한을 선택 하세요.");
	    		return;
			}else{
				data.append("rpt1_auth_9",tmpRpt1_auth_9);
			}
			
			if(tmpRpt1_auth_10==undefined){
				alert("일곱번째 제1대리인의 권한을 선택 하세요.");
	    		return;
			}else{
				data.append("rpt1_auth_10",tmpRpt1_auth_10);
			}
			
			if(tmpRpt1_auth_11==undefined){
				alert("마지막 제1대리인의 권한을 선택 하세요.");
	    		return;
			}else{
				data.append("rpt1_auth_11",tmpRpt1_auth_11);
			}
			
					
			
			//제2대리인의 권한
			if(tmpRpt2_auth_1 == undefined){
				alert("첫번째 제2대리인의 권한을 선택 하세요.");
	    		return;
			}else{
				data.append("rpt2_auth_1",tmpRpt2_auth_1);
			}
			
			if(tmpRpt2_auth_2 == undefined){
				alert("두번째 제2대리인의 권한을 선택 하세요.");
	    		return;
			}else{
				data.append("rpt2_auth_2",tmpRpt2_auth_2);
			}
			
			if(tmpRpt2_auth_3 == undefined){
				alert("세번째 제2대리인의 권한을 선택 하세요.");
	    		return;
			}else{
				data.append("rpt2_auth_3",tmpRpt2_auth_3);
			}
			
			if(tmpRpt2_auth_4 == undefined){
				alert("네번째 제2대리인의 권한을 선택 하세요.");
	    		return;
			}else{
				data.append("rpt2_auth_4",tmpRpt2_auth_4);
			}
			
			
			
			
			//선택사항 1
			data.append("my_thik_1",tmpMy_thik_1);
			data.append("my_thik_1_room",document.regCdFrm.my_thik_1_room.value);
			data.append("my_thik_2",tmpMy_thik_2);
			data.append("my_thik_3",tmpMy_thik_3);
			data.append("my_thik_3_area",document.regCdFrm.my_thik_3_area.value);
			data.append("my_thik_3_room",document.regCdFrm.my_thik_3_room.value);
			data.append("my_thik_4",tmpMy_thik_4);
			data.append("my_thik_5",tmpMy_thik_5);
			data.append("my_thik_6",tmpMy_thik_6);
			data.append("my_thik_6_cntn",document.regCdFrm.my_thik_6_cntn.value);
			
			//[선택사항] 2
			data.append("no1_buid_cntn",document.regCdFrm.no1_buid_cntn.value);
			data.append("no1_buid_tel",document.regCdFrm.no1_buid_tel.value);
			data.append("no1_buid_addr",document.regCdFrm.no1_buid_addr.value);
			data.append("no2_buid_cntn",document.regCdFrm.no2_buid_cntn.value);
			data.append("no2_buid_tel",document.regCdFrm.no2_buid_tel.value);
			data.append("no2_buid_addr",document.regCdFrm.no2_buid_addr.value);
			data.append("no3_buid_cntn",document.regCdFrm.no3_buid_cntn.value);
			
			//[선택사항] 3
			data.append("my_req_1",my_req_1);
			data.append("my_req_2",my_req_2);
			data.append("my_req_3",my_req_3);
			data.append("my_req_4",my_req_4);
			data.append("my_req_5",my_req_5);
			
			//[선택사항] 4
			data.append("free_vist_1_name",document.regCdFrm.free_vist_1_name.value);
			data.append("free_vist_1_rel",document.regCdFrm.free_vist_1_rel.value);
			data.append("free_vist_1_tel",document.regCdFrm.free_vist_1_tel.value);
			data.append("free_vist_2_name",document.regCdFrm.free_vist_2_name.value);
			data.append("free_vist_2_rel",document.regCdFrm.free_vist_2_rel.value);
			data.append("free_vist_2_tel",document.regCdFrm.free_vist_2_tel.value);
			data.append("free_vist_3_name",document.regCdFrm.free_vist_3_name.value);
			data.append("free_vist_3_rel",document.regCdFrm.free_vist_3_rel.value);
			data.append("free_vist_3_tel",document.regCdFrm.free_vist_3_tel.value);
			
			
			
			//[선택사항] 5  
			data.append("my_indv_1",document.regCdFrm.my_indv_1.value);
			data.append("my_indv_2",document.regCdFrm.my_indv_2.value);
			data.append("my_indv_3",document.regCdFrm.my_indv_3.value);
			data.append("my_indv_4",document.regCdFrm.my_indv_4.value);
			
			
			
	    	$.ajax({
		        data: data ,
		        type: "POST",
		        url: "/fn_witr_Reg.do",
		        cache: false,
		        contentType: false,
		        processData: false,
		        dataType:"json",	        
		        success: function(json) {
		        	alert("등록되었습니다.");
		        	document.regCdFrm.action = "/egovMainList.do";
		           	document.regCdFrm.submit();
		        }     
		    });
	    }
        
        
	  	
	    //첨부파일 업로드
	    function fn_cdFile_Upload() {
	    	
	    	document.cdFileFrm.action = "/cdFileUpload.do";
	       	document.cdFileFrm.submit();
	    
	    }
        
        
        
    </script>

    