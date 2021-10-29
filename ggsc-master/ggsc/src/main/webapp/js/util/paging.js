var Paging = function(totalCnt, dataSize, pageSize, pageNo, fnName) {
	totalCnt = parseInt(totalCnt);// 전체레코드수
	dataSize = parseInt(dataSize); // 페이지당 보여줄 데이타수
	pageSize = parseInt(pageSize); // 페이지 그룹 범위 1 2 3 5 6 7 8 9 10
	pageNo = parseInt(pageNo); // 현재페이지
	var html = new Array();
	if (totalCnt == 0) {
		return "";
	} // 페이지 카운트
	var pageCnt = totalCnt % dataSize;
	if (pageCnt == 0) {
		pageCnt = parseInt(totalCnt / dataSize);
	} else {
		pageCnt = parseInt(totalCnt / dataSize) + 1;
	}
	var pRCnt = parseInt(pageNo / pageSize);
	if (pageNo % pageSize == 0) {
		pRCnt = parseInt(pageNo / pageSize) - 1;
	} //이전 화살표

	html.push(' <a href=javascript:' + fnName +'("');
	html.push(1);
	html.push('"); >');
	html.push('<i class="fa fa-angle-double-left"></i>');
	html.push("</a> ");

	if (pageNo > pageSize) {
		var s2;
		if (pageNo % pageSize == 0) {
			s2 = pageNo - pageSize;
		} else {
			s2 = pageNo - pageNo % pageSize;
		}
		html.push(' <a href=javascript:' + fnName +'("');
		html.push(s2);
		html.push('"); >');
		html.push('<i class="fa fa-angle-left"></i>');
		html.push("</a> ");
	} else {
		html.push(' <a href="#">\n');
		html.push('<i class="fa fa-angle-left"></i>');
		html.push('</a> ');
	} //paging Bar
	for (var index = pRCnt * pageSize + 1; index < (pRCnt + 1) * pageSize + 1; index++) {
		if (index == pageNo) {
			html.push(' <a href="#" class="active">');
			html.push(index);
			html.push('</a> ');
		} else {
			html.push(' <a href=javascript:' + fnName +'("');
			html.push(index);
			html.push('");>');
			html.push(index);
			html.push('</a> ');
		}
		if (index == pageCnt) {
			break;
		} else
			html.push('');
	} //다음 화살표
	if (pageCnt > (pRCnt + 1) * pageSize) {
		html.push(' <a href=javascript:' + fnName +'("');
		html.push((pRCnt + 1) * pageSize + 1);
		html.push('");>');
		html.push('<i class="fa fa-angle-right"></i>');
		html.push('</a> ');
	}else {
		html.push(' <a href="#">');
		html.push('<i class="fa fa-angle-right"></i>');
		html.push('</a> ');
	}

	html.push(' <a href=javascript:' + fnName +'("');
	html.push(pageCnt);
	html.push('");>');
	html.push('<i class="fa fa-angle-double-right"></i>');
	html.push('</a> ');

	return html.join("");
}
