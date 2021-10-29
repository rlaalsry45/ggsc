<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<form id=trstFrm name="trstFrm" method="post">		
	<!-- wrap --> 
	<div class="wrap"> 
		
		<!-- container --> 
		<div class="container">
			<!-- snb --> 
			<div class="snb">
				<div class="left_title">
					<h1>회원관리</h1>
				</div>
				<div class="nav-container">
					<ul class="left_nav">
					<li>
						<a href="/admCdList.do">지시서관리</a>
					</li>
					<li class="active">
						<a href="/admTrstList.do">신탁계약서관리</a>
					</li>
					<li>
						<a href="/admCdFileList.do">요양지지서첨부파일</a>
					</li>
					<li>
						<a href="/admTrstFileList.do">신탁계약서첨부파일</a>
					</li>
				</ul>
				</div>
			</div> 
			<!-- //snb --> 
			<!-- content --> 
			<div class="content"> 
				<div class="paT40 paB25">
					<h1>금전신탁계약서</h1>
				</div>
				
				<!-- view  start -->
				<h3 class="title"><b>[필수사항] 1. 위탁자 </b></h3>
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
						<tr> 	<input type="hidden" id="clent_id" name="clent_id" value="${usrMngVO.clent_id}" >
								<input type="hidden" id="mng_no" name="mng_no" value="${usrMngVO.mng_no}" >
								<input type="hidden" id="clent_nm" name="clent_nm" value="${usrMngVO.clent_nm}" READONLY>
							<th scope="row">  성명</th> 
							<td>${usrMngVO.clent_nm}</td> 
							<th scope="row"><font color="red">*</font>  생년월일</th> 
							<td><input type="text" id="clent_birth_dt" name="clent_birth_dt" value="${usrMngVO.clent_birth_dt}" ></td>
						</tr> 
						<tr> 
							<th scope="row"><font color="red">*</font>  연락처</th>
							<td colspan="3"><input type="text" id="clent_tel" name="clent_tel" value="${usrMngVO.clent_tel}" ></td>
						</tr>
						<tr> 
							<th scope="row"><font color="red">*</font>  이메일</th>
							<td colspan="3"><input type="text" id="clent_email" name="clent_email" value="${usrMngVO.clent_email}" size="100%" ></td>
						</tr>
						<tr> 
							<th scope="row"><font color="red">*</font>  주소</th>
							<td colspan="3"><input type="text" id="clent_addr" name="clent_addr" value="${usrMngVO.clent_addr}" size="100%" ></td>
						</tr>
						
					</tbody> 
				</table>
				</br></br></br>
				
				<h3 class="title"><b>[필수사항] 2. 수탁자 </b></h3>
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
							<input type="hidden" id="csmt_nm" name="csmt_nm" value="${usrMngVO.csmt_nm}" >
							<th scope="row">  성명</th> 
							<td>${usrMngVO.csmt_nm}</td> 
							<th scope="row"><font color="red">*</font>  생년월일</th> 
							<td><input type="text" id="csmt_birth_dt" name="csmt_birth_dt" value="${usrMngVO.csmt_birth_dt}" ></td>
						</tr> 
						<tr> 
							<th scope="row"><font color="red">*</font>  연락처</th>
							<td colspan="3"><input type="text" id="csmt_tel" name="csmt_tel" value="${usrMngVO.csmt_tel}" ></td>
						</tr>
						<tr> 
							<th scope="row"><font color="red">*</font>  이메일</th>
							<td colspan="3"><input type="text" id="csmt_email" name="csmt_email" value="${usrMngVO.csmt_email}" size="100%" ></td>
						</tr>
						<tr> 
							<th scope="row"><font color="red">*</font>  주소</th>
							<td colspan="3"><input type="text" id="csmt_addr" name="csmt_addr" value="${usrMngVO.csmt_addr}" size="100%" ></td>
						</tr>
						
					</tbody> 
				</table>
				</br></br></br>
				
				<h3 class="title"><b>[필수사항] 3. 수익자 </b></h3>
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
							<th scope="row"><font color="red">*</font>  성명</th> 
							<td><input type="text" id="bnft_nm" name="bnft_nm" value="${usrMngVO.bnft_nm}" ></td> 
							<th scope="row"><font color="red">*</font>  생년월일</th> 
							<td><input type="text" id="bnft_birth_dt" name="bnft_birth_dt" value="${usrMngVO.bnft_birth_dt}" ></td>
						</tr> 
						<tr> 
							<th scope="row"><font color="red">*</font>  연락처</th>
							<td colspan="3"><input type="text" id="bnft_tel" name="bnft_tel" value="${usrMngVO.bnft_tel}" ></td>
						</tr>
						<tr> 
							<th scope="row"><font color="red">*</font>  이메일</th>
							<td colspan="3"><input type="text" id="bnft_email" name="bnft_email" value="${usrMngVO.bnft_email}" size="100%" ></td>
						</tr>
						<tr> 
							<th scope="row"><font color="red">*</font>  주소</th>
							<td colspan="3"><input type="text" id="bnft_addr" name="bnft_addr" value="${usrMngVO.bnft_addr}" size="100%" ></td>
						</tr>
						
					</tbody> 
				</table>
				</br></br></br>
				
				<h3 class="title"><b>[선택사항] 4. 연속수익자(수익자가 사망한 이후 이 신탁계약상의 수익자가 되는 고령자) </b></h3>
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
							<th scope="row">  성명</th> 
							<td><input type="text" id="go_bnft_nm" name="go_bnft_nm" value="${usrMngVO.go_bnft_nm}" ></td> 
							<th scope="row">  생년월일</th> 
							<td><input type="text" id="go_bnft_birth_dt" name="go_bnft_birth_dt" value="${usrMngVO.go_bnft_birth_dt}" ></td>
						</tr> 
						<tr> 
							<th scope="row">  연락처</th>
							<td colspan="3"><input type="text" id="go_bnft_tel" name="go_bnft_tel" value="${usrMngVO.go_bnft_tel}" ></td>
						</tr>
						<tr> 
							<th scope="row">  이메일</th>
							<td colspan="3"><input type="text" id="go_bnft_email" name="go_bnft_email" value="${usrMngVO.go_bnft_email}" size="100%" ></td>
						</tr>
						<tr> 
							<th scope="row">  주소</th>
							<td colspan="3"><input type="text" id="go_bnft_addr" name="go_bnft_addr" value="${usrMngVO.go_bnft_addr}" size="100%" ></td>
						</tr>
						
					</tbody> 
				</table>
				</br></br></br>
				
				
				<h3 class="title"><b>[선택사항] 5. 개별지원자 </b></h3>
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
							<th scope="row">  성명</th> 
							<td><input type="text" id="per_give_nm" name="per_give_nm" value="${usrMngVO.per_give_nm}" ></td> 
							<th scope="row">  생년월일</th> 
							<td><input type="text" id="per_give_birth_dt" name="per_give_birth_dt" value="${usrMngVO.per_give_birth_dt}" ></td>
						</tr> 
						<tr> 
							<th scope="row">  연락처</th>
							<td><input type="text" id="per_give_tel" name="per_give_tel" value="${usrMngVO.per_give_tel}" ></td>
							<th scope="row">  수익자와의 관계</th> 
							<td><input type="text" id="per_give_rel" name="per_give_rel" value="${usrMngVO.per_give_rel}" ></td>
						</tr>
						<tr> 
							<th scope="row">  이메일</th>
							<td colspan="3"><input type="text" id="per_give_email" name="per_give_email" value="${usrMngVO.per_give_email}" size="100%" ></td>
						</tr>
						<tr> 
							<th scope="row">  주소</th>
							<td colspan="3"><input type="text" id="per_give_addr" name="per_give_addr" value="${usrMngVO.per_give_addr}" size="100%" ></td>
						</tr>
						
					</tbody> 
				</table>
				</br></br></br>
						
				<h3 class="title"><b>[필수사항] 6. 금액 </b></h3>
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
							<th scope="row"><font color="red">*</font>  계약일자</th> 
							<td colspan="3"><input type="text" id="contct_dt" name="contct_dt" value="${usrMngVO.contct_dt}" size="40%">&nbsp;&nbsp;<font color="red">2019-12-12 형식으로 입력하세요.</font></td> 
						</tr> 
						<tr> 
							<th scope="row"><font color="red">*</font>  게시일자</th> 
							<td colspan="3"><input type="text" id="open_dt" name="open_dt" value="${usrMngVO.open_dt}" size="40%">&nbsp;&nbsp;<font color="red">2019-12-12 형식으로 입력하세요.</font></td> 
						</tr> 
						<tr> 
							<th scope="row">  일시불금액</th> 
							<td><input type="text" id="tot_amt" name="tot_amt" value="${usrMngVO.tot_amt}" size="40%"></td>
							<th scope="row">  지급일자</th> 
							<td><input type="text" id="tot_dt" name="tot_dt" value="${usrMngVO.tot_dt}" size="40%"></br><font color="red">2019-12-12 형식으로 입력하세요.</font></td>
						</tr> 
						<tr> 
							<th scope="row">  분할금액</th> 
							<td><input type="text" id="sevr_amt" name="sevr_amt" value="${usrMngVO.sevr_amt}" size="40%"></td>
							<th scope="row">  지급일자</th> 
							<td><input type="text" id="sevr_dt" name="sevr_dt" value="${usrMngVO.sevr_dt}" size="40%"></br><font color="red">2019-12-12 형식으로 입력하세요.</font></td>
						</tr> 
						
					</tbody> 
				</table>		
				</br></br></br>
				
				
				<!-- 선택사항 1 -->
				<h3 class="title"><b>[선택사항] 신탁재산 사용용도</b></h3>
				<table class="notice_view" border="1" cellspacing="0" summary=""> 
				<caption>의료요양지시서 등록</caption> 
					<colgroup> 
						<col width="20%"></col>
						<col width="40%"></col> 
						<col width="40%"></col> 
					</colgroup> 
					<thead> 
						<th scope="row">용    도</th> 
						<th scope="row">통상지출(수익자 또는 개별지원자가 수탁자의 사전승인 없이 계약체결이 가능한 범위)</th> 
						<th scope="row">특별지출(수탁자의 사전승인을 얻어 지출하여야 할 경우)</th> 
					</thead> 
					<tbody> 
						<tr> 
							<td>의료 및 요양</td> 
							<td style="text-align:center;"><input type="radio" name="use11" value="Y" <c:if test="${usrMngVO.use11=='Y'}"> checked </c:if> ></td>
							<td style="text-align:center;"><input type="radio" name="use11" value="N" <c:if test="${usrMngVO.use11=='N'}"> checked </c:if> ></td> 
						</tr>
						<tr> 
							<td>재활 관련 지출</td> 
							<td style="text-align:center;"><input type="radio" name="use12" value="Y" <c:if test="${usrMngVO.use12=='Y'}"> checked </c:if> ></td>
							<td style="text-align:center;"><input type="radio" name="use12" value="N" <c:if test="${usrMngVO.use12=='N'}"> checked </c:if> ></td> 
						</tr>
						<tr> 
							<td>정기적 여행 및 레크레이션</td> 
							<td style="text-align:center;"><input type="radio" name="use13" value="Y" <c:if test="${usrMngVO.use13=='Y'}"> checked </c:if> ></td>
							<td style="text-align:center;"><input type="radio" name="use13" value="N" <c:if test="${usrMngVO.use13=='N'}"> checked </c:if> ></td> 
						</tr>								
						<tr> 
							<td>일상생활의 질을 개선하기 위한 목적의 동산(컴퓨터, 휴대폰, 통신 등 포함)의 이용 및 구입</td> 
							<td style="text-align:center;"><input type="radio" name="use14" value="Y" <c:if test="${usrMngVO.use14=='Y'}"> checked </c:if> ></td>
							<td style="text-align:center;"><input type="radio" name="use14" value="N" <c:if test="${usrMngVO.use14=='N'}"> checked </c:if> ></td> 
						</tr>
						<tr> 
							<td>심리 치료 또는 상담, 세무 또는 법률 상담</td> 
							<td style="text-align:center;"><input type="radio" name="use15" value="Y" <c:if test="${usrMngVO.use15=='Y'}"> checked </c:if> ></td>
							<td style="text-align:center;"><input type="radio" name="use15" value="N" <c:if test="${usrMngVO.use15=='N'}"> checked </c:if> ></td> 
						</tr>
						<tr> 
							<td>주거생활 및 일상생활의 쾌적성을 증진시키기 위한 돌봄서비스(활동보조, 요양보조를 포함) 및 
							    기자재(사물인터넷, 치매 환자 맞춤형 실내시설등) 의 취득 또는 이용
							</td> 
							<td style="text-align:center;"><input type="radio" name="use16" value="Y" <c:if test="${usrMngVO.use16=='Y'}"> checked </c:if> ></td>
							<td style="text-align:center;"><input type="radio" name="use16" value="N" <c:if test="${usrMngVO.use16=='N'}"> checked </c:if> ></td> 
						</tr>
						<tr> 
							<td>수익자가 현금으로 직접 사용하기를 희망하는 용돈</td> 
							<td style="text-align:center;"><input type="radio" name="use17" value="Y" <c:if test="${usrMngVO.use17=='Y'}"> checked </c:if> ></td>
							<td style="text-align:center;"><input type="radio" name="use17" value="N" <c:if test="${usrMngVO.use17=='N'}"> checked </c:if> ></td> 
						</tr>
						<tr> 
							<td>수익자가 일상생활, 치료, 요양을 안전하게 받을 수 있도록 지원하는 데 소요되는 
							    경비(개인별 지원자 활동비용, 개인별 지원자의 손해배상책임 이행보증보험료 등)
							</td> 
							<td style="text-align:center;"><input type="radio" name="use18" value="Y" <c:if test="${usrMngVO.use18=='Y'}"> checked </c:if> ></td>
							<td style="text-align:center;"><input type="radio" name="use18" value="N" <c:if test="${usrMngVO.use18=='N'}"> checked </c:if> ></td> 
						</tr>
						<tr> 
							<td>기타 수익자의 삶의 질을 개선하기 위한 목적으로서 수탁자의 허가를 받은 경우</td> 
							<td style="text-align:center;"><input type="radio" name="use19" value="Y" <c:if test="${usrMngVO.use19=='Y'}"> checked </c:if> ></td>
							<td style="text-align:center;"><input type="radio" name="use19" value="N" <c:if test="${usrMngVO.use19=='N'}"> checked </c:if> ></td> 
						</tr>
						<tr> 
							<td>단, 위 용돈 지급일 경우 입금할 계좌</td> 
							<td>은행명 : <input type="text" id="pokt_mony_bank" name="pokt_mony_bank" value="${usrMngVO.pokt_mony_bank}" size="20%"> </br>
							    예금주 : <input type="text" id="pokt_mony_name" name="pokt_mony_name" value="${usrMngVO.pokt_mony_name}" size="20%"></td>
							<td>계좌 : <input type="text" id="pokt_mony_acont" name="pokt_mony_acont" value="${usrMngVO.pokt_mony_acont}" size="40%"></td> 
						</tr>
					</tbody> 
				</table> 
				</br></br></br>
				
				<!-- 선택사항 2 -->
				<h3 class="title"><b> [선택사항] 신탁금전의 입금 및 신탁재산교부 방법 </b></h3>
				<table class="notice_view" border="1" cellspacing="0" summary=""> 
				<caption>의료요양지시서 등록</caption> 
				<colgroup> 
				<col width="20%"></col>
				<col width="30%"></col> 
				<col width="20%"></col>
				<col width="30%"></col>
				</colgroup> 
					<thead> 
					</thead> 	
					<tbody> 
						<tr> 
							<th scope="row" rowspan="2"  style="vertical-align:middle;">목표금액</th> 
							<td rowspan="2"><input type="text" id="trst_goal_amt" name="trst_goal_amt" value="${usrMngVO.trst_goal_amt}" size="20%"></td>
							<th scope="row">일시금</th> 
							<td><input type="text" id="trst_tot_amt" name="trst_tot_amt" value="${usrMngVO.trst_tot_amt}" size="20%"></td> 
						</tr>
						<tr> 
							<th scope="row">수시입금</th> 
							<td><input type="text" id="trst_sevr_amt" name="trst_sevr_amt" value="${usrMngVO.trst_sevr_amt}" size="20%"></td> 
						</tr> 
						<tr> 
							<th scope="row" rowspan="2">지급일자</th> 
							<td colspan="3"><input type="text" id="trst_give_dt" name="trst_give_dt" value="${usrMngVO.trst_give_dt}" size="20%"></td>
						</tr>
						
					</tbody> 
				</table>
				</br></br></br>
				
				<!-- 선택사항 3 -->  
				<h3 class="title"><b> [선택사항] 입금할 수탁자의 계좌 </b></h3>
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
							<th scope="row">은행명</th> 
							<td><input type="text" id="csmt_bank" name="csmt_bank" value="${usrMngVO.csmt_bank}" size="100%"></td>
						</tr>
						<tr> 
							<th scope="row">예금주</th> 
							<td><input type="text" id="csmt_name" name="csmt_name" value="${usrMngVO.csmt_name}" size="100%"></td>
						</tr>
						<tr> 
							<th scope="row">계좌번호</th> 
							<td><input type="text" id="csmt_acont" name="csmt_acont" value="${usrMngVO.csmt_acont}" size="100%"></td>
						</tr>
					</tbody> 
				</table>
				</br></br></br>
				
				<!-- 선택사항 4 -->
				<h3 class="title"><b> [선택사항] 위탁자가 통지할 수탁자 연락처 </b></h3>
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
							<th scope="row">전화</th> 
							<td><input type="text" id="csmt_tel2" name="csmt_tel2" value="${usrMngVO.csmt_tel2}" size="100%"></td>
						</tr>
						<tr> 
							<th scope="row">팩스</th> 
							<td><input type="text" id="csmt_fax2" name="csmt_fax2" value="${usrMngVO.csmt_fax2}" size="100%"></td>
						</tr>
						<tr> 
							<th scope="row">이메일</th> 
							<td><input type="text" id="csmt_email2" name="csmt_email2" value="${usrMngVO.csmt_email2}" size="100%"></td>
						</tr>
					</tbody> 
				</table>
				</br></br></br>
				
				
				<!-- 선택사항 5 -->
				<h3 class="title"><b> [선택사항] 신탁재산교부의 시점</b></h3>
				<table class="notice_view" border="1" cellspacing="0" summary=""> 
				<caption>의료요양지시서 등록</caption> 
					<colgroup> 
						<col width="25%"></col>
						<col width="25%"></col> 
						<col width="50%"></col>
					</colgroup> 
					<thead> 
						<th scope="row" colspan="2">시점</th> 
						<th scope="row">기타시점</th> 
					</thead> 
					<tbody> 
						<tr> 
							<td>- 치매진단이 있는 때 </br>
								- 장기요양등급인정을 받은 때 </br>
								- 요양시설에 입소하여야 할 때 </br>
								- 요양병원에 입원하여야 할 때 
							</td>   
							<td>
								예 : &nbsp;&nbsp;<input type="radio" id="trst_give_sign1" name="trst_give_sign1" value="Y" <c:if test="${usrMngVO.trst_give_sign1=='Y'}"> checked </c:if>/>
								아니오 : &nbsp;&nbsp;<input type="radio" id="trst_give_sign1" name="trst_give_sign1" value="N" <c:if test="${usrMngVO.trst_give_sign1=='N'}"> checked </c:if>/>	
								</br>
								예 : &nbsp;&nbsp;<input type="radio" id="trst_give_sign2" name="trst_give_sign2" value="Y" <c:if test="${usrMngVO.trst_give_sign2=='Y'}"> checked </c:if>/>
								아니오 : &nbsp;&nbsp;<input type="radio" id="trst_give_sign2" name="trst_give_sign2" value="N" <c:if test="${usrMngVO.trst_give_sign2=='N'}"> checked </c:if>/>	
								</br>
								예 : &nbsp;&nbsp;<input type="radio" id="trst_give_sign3" name="trst_give_sign3" value="Y" <c:if test="${usrMngVO.trst_give_sign3=='Y'}"> checked </c:if>/>
								아니오 : &nbsp;&nbsp;<input type="radio" id="trst_give_sign3" name="trst_give_sign3" value="N" <c:if test="${usrMngVO.trst_give_sign3=='N'}"> checked </c:if>/>	
								</br>
								예 : &nbsp;&nbsp;<input type="radio" id="trst_give_sign4" name="trst_give_sign4" value="Y" <c:if test="${usrMngVO.trst_give_sign4=='Y'}"> checked </c:if>/>
								아니오 : &nbsp;&nbsp;<input type="radio" id="trst_give_sign4" name="trst_give_sign4" value="N" <c:if test="${usrMngVO.trst_give_sign4=='N'}"> checked </c:if>/>
							</td>
							<td>- 특&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;정&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;날&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;짜 
									: <input type="text" id="trst_give_etc1" name="trst_give_etc1" value="${usrMngVO.trst_give_etc1}" size="40%"></br>
								- 특정한 사건이 있는 때 : <input type="text" id="trst_give_etc2" name="trst_give_etc2" value="${usrMngVO.trst_give_etc2}" size="40%">
							</td> 
						</tr>
						
					</tbody> 
				</table>
				</br></br></br>
				
				
				<!-- 선택사항 6 -->
				<h3 class="title"><b> [선택사항] 신탁재산교부금 수령 계좌 </b></h3>
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
							<th scope="row">은행명</th> 
							<td><input type="text" id="trst_recv_bank" name="trst_recv_bank" value="${usrMngVO.trst_recv_bank}" size="100%"></td>
						</tr>
						<tr> 
							<th scope="row">예금주</th> 
							<td><input type="text" id="trst_recv_name" name="trst_recv_name" value="${usrMngVO.trst_recv_name}" size="100%"></td>
						</tr>
						<tr> 
							<th scope="row">계좌번호</th> 
							<td><input type="text" id="trst_recv_acont" name="trst_recv_acont" value="${usrMngVO.trst_recv_acont}" size="100%"></td>
						</tr>
					</tbody> 
				</table>
				</br></br></br>
				
				
				<!-- 선택사항 7 -->
				<h3 class="title"><b> [선택사항] 신탁계약상의 계약이행 목적 지급신청서 </b></h3>
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
							<th scope="row" rowspan="3"  style="vertical-align:middle;">지급신청사유</th> 
							<td rowspan="3">
								<label><input type="checkbox" id="give_paper_issue1" name="give_paper_issue1" value="1" <c:if test="${usrMngVO.give_paper_issue1=='1'}"> checked </c:if> >&nbsp;&nbsp;의료비</label></br>
								<label><input type="checkbox" id="give_paper_issue2" name="give_paper_issue2" value="2" <c:if test="${usrMngVO.give_paper_issue2=='2'}"> checked </c:if> >&nbsp;&nbsp;생활용품구입비</label></br>
								<label><input type="checkbox" id="give_paper_issue3" name="give_paper_issue3" value="3" <c:if test="${usrMngVO.give_paper_issue3=='3'}"> checked </c:if> >&nbsp;&nbsp;주거비</label></br>
								<label><input type="checkbox" id="give_paper_issue4" name="give_paper_issue4" value="4" <c:if test="${usrMngVO.give_paper_issue4=='4'}"> checked </c:if> >&nbsp;&nbsp;여행비</label></br>
								<label><input type="checkbox" id="give_paper_issue5" name="give_paper_issue5" value="5" <c:if test="${usrMngVO.give_paper_issue5=='5'}"> checked </c:if> >&nbsp;&nbsp;기타</label></br>
								
							</td>
							<th scope="row">지급신청금액</th> 
							<td><input type="text" id="give_paper_amt" name="give_paper_amt" value="${usrMngVO.give_paper_amt}" size="40%"></td> 
						</tr>
						<tr> 
							<th scope="row">수령인</th> 
							<td><input type="text" id="give_paper_recv_nm" name="give_paper_recv_nm" value="${usrMngVO.give_paper_recv_nm}" size="40%"></td> 
						</tr> 
						<tr> 
							<th scope="row">지급신청금액</br>계좌번호</th> 
							<td><input type="text" id="give_paper_acont" name="give_paper_acont" value="${usrMngVO.give_paper_acont}" size="40%"></td> 
						</tr>
						<tr> 
							<th scope="row">신청인 성명</th> 
							<td colspan="3"><input type="text" id="give_paper_req_nm" name="give_paper_req_nm" value="${usrMngVO.give_paper_req_nm}" size="40%"></td>
						</tr>
						<tr> 
							<th scope="row">신청인 개별지원자</th> 
							<td colspan="3"><input type="text" id="give_paper_per_nm" name="give_paper_per_nm" value="${usrMngVO.give_paper_per_nm}" size="40%"></td>
						</tr>
						<tr> 
							<th scope="row">신청일자</th> 
							<td colspan="3"><input type="text" id="give_paper_req_dt" name="give_paper_req_dt" value="${usrMngVO.give_paper_req_dt}" size="40%"></td>
						</tr>
						
					</tbody> 
				</table>
				</br></br></br>
				
				
				<!-- 선택사항 8 -->
				<h3 class="title"><b> [선택사항] 신탁재산배분금 정기 교부 신청(월 1회 또는 2회) </b></h3>
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
							<th scope="row" >신탁재산배분금</br> 정기 교부 신청</th> 
							<td>
								<label><input type="checkbox" id="intval_give_req1" name="intval_give_req1" value="1" <c:if test="${usrMngVO.intval_give_req1=='1'}"> checked </c:if> >&nbsp;&nbsp;5일</label></br>
								<label><input type="checkbox" id="intval_give_req2" name="intval_give_req2" value="2" <c:if test="${usrMngVO.intval_give_req2=='2'}"> checked </c:if> >&nbsp;&nbsp;10일</label></br>
								<label><input type="checkbox" id="intval_give_req3" name="intval_give_req3" value="3" <c:if test="${usrMngVO.intval_give_req3=='3'}"> checked </c:if> >&nbsp;&nbsp;15일</label></br>
								<label><input type="checkbox" id="intval_give_req4" name="intval_give_req4" value="4" <c:if test="${usrMngVO.intval_give_req4=='4'}"> checked </c:if> >&nbsp;&nbsp;20일</label></br>
								<label><input type="checkbox" id="intval_give_req5" name="intval_give_req5" value="5" <c:if test="${usrMngVO.intval_give_req5=='5'}"> checked </c:if> >&nbsp;&nbsp;25일</label></br>
								
							</td>
						</tr>
						
					</tbody> 
				</table>
				
				<!-- 선택사항 9 -->
				<h3 class="title"><b> [선택사항] 지원자결정방법</b></h3>
				<table class="notice_view" border="1" cellspacing="0" summary=""> 
				<caption>의료요양지시서 등록</caption> 
					<colgroup> 
						<col width="20%"></col>
						<col width="40%"></col> 
						<col width="40%"></col>
					</colgroup> 
					<thead> 
						<th scope="row">최초지원자</th> 
						<th scope="row"></th>
						<th scope="row"></th>   
					</thead> 
					<tbody> 
						<tr> 
							<td rowspan="2">최초 지원자가 활동을 중단하거나 부적당하게 된 때</td> 
							<td>희망 지원자 방법</br>
								<label>원    함 : &nbsp;&nbsp;<input type="radio" id="hope_supt_yn" name="hope_supt_yn" value="Y" <c:if test="${usrMngVO.hope_supt_yn=='Y'}"> checked </c:if> ></label>
								<label>원치않음 : &nbsp;&nbsp;<input type="radio" id="hope_supt_yn" name="hope_supt_yn" value="N" <c:if test="${usrMngVO.hope_supt_yn=='N'}"> checked </c:if> ></label></br>
							</td>
							<td>기타 결정 방법</br>
								<label>원    함 : &nbsp;&nbsp;<input type="radio" id="etc_dcsi_yn" name="etc_dcsi_yn" value="Y" <c:if test="${usrMngVO.etc_dcsi_yn=='Y'}"> checked </c:if> ></label>
								<label>원치않음 : &nbsp;&nbsp;<input type="radio" id="etc_dcsi_yn" name="etc_dcsi_yn" value="N" <c:if test="${usrMngVO.etc_dcsi_yn=='N'}"> checked </c:if> ></label></br>
							</td> 
						</tr>
						<tr>
							<td>1순위 성명 :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;		<input type="text" id="supt1_nm" name="supt1_nm" value="${usrMngVO.supt1_nm}" size="20%"></br>
							    수익자와의 관계 : 	<input type="text" id="supt1_rel" name="supt1_rel" value="${usrMngVO.supt1_rel}" size="20%"></br>
							    2순위 성명 :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 		<input type="text" id="supt2_nm" name="supt2_nm" value="${usrMngVO.supt2_nm}" size="20%"></br>
							    수익자와의 관계 :	<input type="text" id="supt2_rel" name="supt2_rel" value="${usrMngVO.supt2_rel}" size="20%">
							</td>
							<td>수탁자의 신탁관리위원회, 수익자, 후견인, 수익자의 친족, 장애인인권옹호기관 
							    기타 공익을 대변하는 자 등으로 구성된 회의체에서 정하는 방법 등. 회의체의 
							    구성은 수탁자의 책임
							</td>
						</tr>
						
					</tbody> 
				</table>
				</br>
				
				
				
				
				<div class="fl_R mgT10">
					<a href="javascript:fn_list();" class="btn_big"><strong>목록보기</strong></a>
					<a href="javascript:fn_update();" class="btn_big"><strong>수정하기</strong></a>					
					<a href="javascript:fn_delete();" class="btn_big"><strong>삭제하기</strong></a>
				</div>
				<!-- view  end -->
			</div> 
			<!-- //content --> 
		</div> 
		<!-- //container -->
		<!-- footer --> 
		<div class="footer"> 
			<p>All Rights Reserved.</p>
		</div> 
		<!-- //footer --> 
	</div>
	<!-- /wrap --> 
</form>	
	
    <!--/#action-->
    <script type="text/javaScript" language="javascript" defer="defer">
        
    	window.onload = function () {
    		
    	}
    
	    function fn_update() {
	    	

	    	var data=new FormData();
	    	data.append("clent_id",document.trstFrm.clent_id.value);
	    	data.append("mng_no",document.trstFrm.mng_no.value);
	    	
	    	
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
	    	data.append("go_bnft_nm",document.trstFrm.go_bnft_nm.value);
	    	data.append("go_bnft_birth_dt",document.trstFrm.go_bnft_birth_dt.value);
	    	data.append("go_bnft_tel",document.trstFrm.go_bnft_tel.value);
	    	data.append("go_bnft_email",document.trstFrm.go_bnft_email.value);
	    	data.append("go_bnft_addr",document.trstFrm.go_bnft_addr.value);
	    	
	    	
	    	//개별지원자
	    	data.append("per_give_nm",document.trstFrm.per_give_nm.value);
	    	data.append("per_give_birth_dt",document.trstFrm.per_give_birth_dt.value);
	    	data.append("per_give_tel",document.trstFrm.per_give_tel.value);
	    	data.append("per_give_rel",document.trstFrm.per_give_rel.value);
	    	data.append("per_give_email",document.trstFrm.per_give_email.value);
	    	data.append("per_give_addr",document.trstFrm.per_give_addr.value);
	    	  
	    	//금액
	    	data.append("contct_dt",document.trstFrm.contct_dt.value);
	    	data.append("open_dt",document.trstFrm.open_dt.value);
	    	data.append("tot_amt",document.trstFrm.tot_amt.value);
	    	data.append("tot_dt",document.trstFrm.tot_dt.value);
	    	data.append("sevr_amt",document.trstFrm.sevr_amt.value);
	    	data.append("sevr_dt",document.trstFrm.sevr_dt.value);
	    	
	    	/* var str11 = document.trstFrm.contct_dt.value; 
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
	    	} */
	    	
	    	
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
	    	
			
			//선택사항 2   
			data.append("trst_goal_amt",document.trstFrm.trst_goal_amt.value);
			data.append("trst_tot_amt",document.trstFrm.trst_tot_amt.value);
			data.append("trst_sevr_amt",document.trstFrm.trst_sevr_amt.value);
			data.append("trst_give_dt",document.trstFrm.trst_give_dt.value);
			
			//선택사항 3  
			data.append("csmt_bank",document.trstFrm.csmt_bank.value);
			data.append("csmt_name",document.trstFrm.csmt_name.value);
			data.append("csmt_acont",document.trstFrm.csmt_acont.value);
			
			//선택사항 4
			data.append("csmt_tel2",document.trstFrm.csmt_tel2.value);
			data.append("csmt_fax2",document.trstFrm.csmt_fax2.value);
			data.append("csmt_email2",document.trstFrm.csmt_email2.value);
			
			//선택사항 5
			var trst_give_sign1 = $('input[name=trst_give_sign1]:checked').val();
			if(trst_give_sign1 == undefined){
				trst_give_sign1 = "";
			}
			var trst_give_sign2 = $('input[name=trst_give_sign2]:checked').val();
			if(trst_give_sign2 == undefined){
				trst_give_sign2 = "";
			}
			var trst_give_sign3 = $('input[name=trst_give_sign3]:checked').val();
			if(trst_give_sign3 == undefined){
				trst_give_sign3 = "";
			}
			var trst_give_sign4 = $('input[name=trst_give_sign4]:checked').val();
			if(trst_give_sign4 == undefined){
				trst_give_sign4 = "";
			}
			data.append("trst_give_sign1",trst_give_sign1);
			data.append("trst_give_sign2",trst_give_sign2);
			data.append("trst_give_sign3",trst_give_sign3);
			data.append("trst_give_sign4",trst_give_sign4);
			data.append("trst_give_etc1",document.trstFrm.trst_give_etc1.value);
			data.append("trst_give_etc2",document.trstFrm.trst_give_etc2.value);
			
			//선택사항 6
			data.append("trst_recv_bank",document.trstFrm.trst_recv_bank.value);
			data.append("trst_recv_name",document.trstFrm.trst_recv_name.value);
			data.append("trst_recv_acont",document.trstFrm.trst_recv_acont.value);
			
			//선택사항 7
			var tmpT;
			var tmp1;
			var tmp2;
			var tmp3;
			var tmp4;
			var tmp5
			if(($('input:checkbox[id="give_paper_issue1"]').is(":checked") == true) == true){
				tmp1 = '1';
			}else{
				tmp1 = 'N';
			}
			if(($('input:checkbox[id="give_paper_issue2"]').is(":checked") == true) == true){
				tmp2 = '2';
			}else{
				tmp2 = 'N';
			}
			if(($('input:checkbox[id="give_paper_issue3"]').is(":checked") == true) == true){
				tmp3 = '3';
			}else{
				tmp3 = 'N';
			}
			if(($('input:checkbox[id="give_paper_issue4"]').is(":checked") == true) == true){
				tmp4 = '4';
			}else{
				tmp4 = 'N';
			}
			if(($('input:checkbox[id="give_paper_issue5"]').is(":checked") == true) == true){
				tmp5 = '5';
			}else{
				tmp5 = 'N';
			}
			tmpT = tmp1 + ',' + tmp2 +  ',' + tmp3 +  ',' + tmp4 +  ',' + tmp5;
			
			data.append("give_paper_issue1",tmp1);
			data.append("give_paper_issue2",tmp2);
			data.append("give_paper_issue3",tmp3);
			data.append("give_paper_issue4",tmp4);
			data.append("give_paper_issue5",tmp5);
			data.append("give_paper_amt",document.trstFrm.give_paper_amt.value);
			data.append("give_paper_recv_nm",document.trstFrm.give_paper_recv_nm.value);
			data.append("give_paper_acont",document.trstFrm.give_paper_acont.value);
			data.append("give_paper_req_nm",document.trstFrm.give_paper_req_nm.value);
			data.append("give_paper_per_nm",document.trstFrm.give_paper_per_nm.value);
			data.append("give_paper_req_dt",document.trstFrm.give_paper_req_dt.value);
	    	
			
			//선택사항 8    
			var reqT;
			var req1;
			var req2;
			var req3;
			var req4;
			var req5
			if(($('input:checkbox[id="intval_give_req1"]').is(":checked") == true) == true){
				req1 = '1';
			}else{
				req1 = 'N';
			}
			if(($('input:checkbox[id="intval_give_req2"]').is(":checked") == true) == true){
				req2 = '2';
			}else{
				req2 = 'N';
			}
			if(($('input:checkbox[id="intval_give_req3"]').is(":checked") == true) == true){
				req3 = '3';
			}else{
				req3 = 'N';
			}
			if(($('input:checkbox[id="intval_give_req4"]').is(":checked") == true) == true){
				req4 = '4';
			}else{
				req4 = 'N';
			}
			if(($('input:checkbox[id="intval_give_req5"]').is(":checked") == true) == true){
				req5 = '5';
			}else{
				req5 = 'N';
			}
			reqT = req1 + ',' + req2 +  ',' + req3 +  ',' + req4 +  ',' + req5;
			data.append("intval_give_req",reqT);
			data.append("intval_give_req1",req1);
			data.append("intval_give_req2",req2);
			data.append("intval_give_req3",req3);
			data.append("intval_give_req4",req4);
			data.append("intval_give_req5",req5);
			//선택사항 9
			var hope_supt_yn = $('input[name=hope_supt_yn]:checked').val();
			if(hope_supt_yn == undefined){
				hope_supt_yn = "";
			}
			var etc_dcsi_yn = $('input[name=etc_dcsi_yn]:checked').val();
			if(etc_dcsi_yn == undefined){
				etc_dcsi_yn = "";
			}
			data.append("hope_supt_yn",hope_supt_yn);
			data.append("etc_dcsi_yn",etc_dcsi_yn);
			data.append("supt1_nm",document.trstFrm.supt1_nm.value);
			data.append("supt1_rel",document.trstFrm.supt1_rel.value);
			data.append("supt2_nm",document.trstFrm.supt2_nm.value);
			data.append("supt2_rel",document.trstFrm.supt2_rel.value);
			
	    	$.ajax({
		        data: data ,
		        type: "POST",
		        url: "/fn_admTrstList_Update.do",
		        cache: false,
		        contentType: false,
		        processData: false,
		        dataType:"json",	        
		        success: function(json) {
		        	alert("수정 되었습니다.");
		        	document.trstFrm.action = "/admTrstList.do";
		           	document.trstFrm.submit();
		        }     
		    });
	    }
	    function fn_list() {
	    	document.trstFrm.action = "<c:url value='/admTrstList.do'/>";
	       	document.trstFrm.submit();
	    }
	    
	    function fn_delete() {
	    	var data=new FormData();
	    	data.append("mng_no",document.trstFrm.mng_no.value);
			data.append("clent_id",document.trstFrm.clent_id.value);
			
	    	
	    	$.ajax({
		        data: data ,
		        type: "POST",
		        url: "/fn_admTrstList_Delete.do",
		        cache: false,
		        contentType: false,
		        processData: false,
		        dataType:"json",	        
		        success: function(json) {
		        	alert("삭제 되었습니다.");
		        	document.trstFrm.action = "/admTrstList.do";
		           	document.trstFrm.submit();
		        }     
		    });
	    	
	    	
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

    