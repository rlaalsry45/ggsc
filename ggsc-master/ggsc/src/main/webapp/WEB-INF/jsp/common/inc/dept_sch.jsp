<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="egovframework.rte.psl.dataaccess.util.EgovMap"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<div class="search-group">
		<input name="schDeptId" id="schDeptId" type="hidden">
		<span class="label"><label>최 상위부서</label></span>
		<span class="form">
			<select name="schDeptId1" id="schDeptId1" onChange="deptLevel1(this.value, 'searchForm')">
				<option value="">최상위부서선택</option>
				<option value="000000101">서울특별시여성가족재단</option>
			</select>
		</span>
	</div>
	<div class="search-group">
		<span class="label"><label>상위부서</label></span>
		<span class="form">
			<select name="schDeptId2" id="schDeptId2" onChange="deptLevel2(this.value, 'searchForm')">
				<option value="">상위부서선택</option>
			</select>
		</span>
	</div>
	<div class="search-group">
		<span class="label"><label>부서</label></span>
		<span class="form">
			<select name="schDeptId3" id="schDeptId3" onChange="deptLevel3(this.value, 'searchForm');">
				<option value="">부서선택</option>
			</select>
		</span>
	</div>
	<div class="search-group" id="schUserDiv">
		<span class="label"><label>근무자 </label></span>
		<span class="form">
		<input type="hidden" name="schUserId" id="schUserId"  class="input-search">
		<input type="text" name="schUserName" id="schUserName"  class="input-search" autocomplete="off"><a id="toggle" class="btn-ico-search"></a>
		<!-- 근무자 찾기 레이어팝업 -->
			<div id="layer-popup-place" style="height:500px;display:none;overflow-y:scroll;">
				<table class="dept-style" id="userTbl">
				<thead>
					<tr>
					</tr>
				</thead>
				<tbody id="tby5">
				</tbody>
				</table>
			</div>
			<!-- // 근무자 찾기 레이어팝업 -->
		</span>
	</div>