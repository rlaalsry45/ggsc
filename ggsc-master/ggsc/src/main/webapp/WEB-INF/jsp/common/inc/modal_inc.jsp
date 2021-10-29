<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="egovframework.rte.psl.dataaccess.util.EgovMap"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 사원 선택 리스트(사원선택 버튼 클릭시 노출) -->
<form id="empForm" name="empForm" onsubmit="return false;">
<div class="mw" id="org_place" style="display:none;">
	<div class="bg"></div>
		<div class="layer-popup layer-ow">
			<h1>
				<i class="fa fa-dot-circle-o"></i> 사원선택
				<button onclick="showHide('org_place');" type="button" class="btn-close"><i class="fa fa-times-circle"></i></button>
			</h1>
			<div id="org_place" class="FormStyle1">
			<div class="ListBlock">
				<div class="search-group">
					<span class="form wd130 mg-r5">
						<select  class="wd130" name="schDeptId1" id="schDeptId1" onChange="deptLevel1(this.value, 'empForm')">
							<option value="000000101">서울여성가족재단</option>
						</select>
					</span>
					<span class="form wd130 mg-r5">
						<select  class="wd130" name="schDeptId2" id="schDeptId2" onChange="deptLevel2(this.value, 'empForm')">
							<option value="">상위부서 선택</option>
						</select>
					</span>
					<span class="form wd130">
						<select  class="wd130" name="schDeptId3" id="schDeptId3" onChange="deptLevel3(this.value, 'empForm');">
							<option value="">부서선택</option>
						</select>
					</span>
				</div>
				<div class="search-group">
					<span class="form wd130">
						<select class="wd130" name="schType" id="schType">
							<option value="schUserName">직원이름</option>
							<option value="schDeptName">부서명</option>
						</select>
					</span>
					<span class="form wd150">
						<input type="text" name="schText" id="schText" class="wd150" onKeyDown="javascript:if (event.keyCode == 13) { schLeftUserList(); }">
					</span>
					<span class="form wd30">
						<a onClick="schLeftUserList();" class="mg-l10 cursor" id="btnRegSearch"><img src="../images/org_search_bt.gif" width="20" height="20" alt="검색"></a>
					</span>
				</div>
				<!-- 좌측 선택 목록 -->
				<div class="ListBox2">
					<ul class="ListST1" id="userLeftArea">
					</ul>
				</div>
				<!-- /좌측 선택 목록 -->

				<!-- 추가,삭제 버튼 -->
				<div class="AddBtns">
					<button type="button" alt="추가" id="userAdd"><i class="fa fa-arrow-right"></i></button>
					<!-- <button type="button" alt="삭제" id="userDel"><i class="fa fa-arrow-left"></i></button> -->
				</div>
				<!-- /추가,삭제 버튼 -->

				<!-- 우측 선택 된 목록 -->
				<div class="ListBox3">
					<ul class="ListST1" id="userRightArea">
					</ul>
				</div>
				<!-- /우측 선택 된 목록 -->

				<!-- 선택완료,취소 버튼 -->
				<div class="BtmBtns">
					<button type="button" id="btnSelOk" onclick="userSelectSuccess();" class="mg-r3">완료</button>
					<button type="button" id="btnSelCan" onclick="showHide('org_place');">닫기</button>
				</div>
				<!-- /선택완료,취소 버튼 -->
			</div>
		</div>
	</div>
</div>
</form>
<!-- /사원 선택 리스트(사원선택 버튼 클릭시 노출) -->


<!-- 부서선택 리스트(부서선택 버튼 클릭시 노출) -->
<form id="deptForm" name="deptForm" onsubmit="return false;">
<div class="mw" id="dept_place" style="display:none;">
	<div class="bg"></div>
	<div class="layer-popup layer-dw">
		<h1>
			<i class="fa fa-dot-circle-o"></i> 부서선택
			<button onclick="showHide('dept_place');" type="button" class="btn-close"><i class="fa fa-times-circle"></i></button>
		</h1>
		<div id="dept_place" class="FormStyle1">
			<div class="ListBlock">
				<!-- 최상위 부서  -->
				<div class="dept_box1">
					<ul>
						<li>
							<label><input name="chkTempDept" type="checkbox" value="000000101">
								<span class="Temp" id="tempDeptName_000000101">서울특별시여성가족재단</span>
							</label>
							<label><input name="chkTempDept" type="checkbox" value="000010800">
								<span class="Temp" id="tempDeptName_000010800">재단)퇴사</span>
							</label>
						</li>
					</ul>
				</div>
				<!-- /최상위 부서  -->
				<!-- 상위 부서  -->
				<div class="dept_box2 mg-l5">
					<ul id="userLeftArea_box2">
					</ul>
				</div>
				<!-- /상위 부서  -->
				<!-- 부서  -->
				<div class="dept_box3 mg-l5">
					<ul id="userLeftArea_box3">
					</ul>
				</div>
				<!-- /부서  -->
				<!-- 추가,삭제 버튼 -->
				<div class="AddBtns mg-t100">
					<button type="button" alt="추가" id="deptAdd"><i class="fa fa-arrow-right"></i></button>
					<!-- <button type="button" alt="삭제" id="userDel"><i class="fa fa-arrow-left"></i></button> -->
				</div>
				<!-- /추가,삭제 버튼 -->
				<!-- 우측 선택 된 목록 -->
				<div class="ListBox4">
					<ul class="ListST1" id="deptRightArea">
					</ul>
				</div>
				<!-- /우측 선택 된 목록 -->
				<!-- 선택완료,취소 버튼 -->
				<div class="BtmBtns">
					<button type="button" id="btnSelOk" onclick="deptSelectSuccess();" class="mg-r3">완료</button>
					<button type="button" id="btnSelCan" onclick="showHide('dept_place');">닫기</button>
				</div>
				<!-- /선택완료,취소 버튼 -->
			</div>
		</div>
	</div>
</div>
</form>
<!-- /부서 선택 리스트(부서선택 버튼 클릭시 노출) -->





<div class="wrap-loading" style="display:none;" id="modal_block">
	<div><img src="/images/loading.gif" width="30" height="30"></div>
</div>