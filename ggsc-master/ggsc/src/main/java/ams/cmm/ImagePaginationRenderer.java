package ams.cmm;

import egovframework.rte.ptl.mvc.tags.ui.pagination.AbstractPaginationRenderer;

public class ImagePaginationRenderer extends AbstractPaginationRenderer {
	public ImagePaginationRenderer() {
		firstPageLabel = "<a href=\"#\" onclick=\"{0}({1}); return false;\"><i class=\"fa fa-angle-double-left\"></i></a>&nbsp;"; 
		previousPageLabel = "<a href=\"#\" onclick=\"{0}({1}); return false;\"><i class=\"fa fa-angle-left\"></i></a>&nbsp;";
		currentPageLabel = "<a href=\"#\" class=\"active\">{0}</a>&nbsp;";
		otherPageLabel = "<a href=\"#\" onclick=\"{0}({1}); return false;\">{2}</a> ";
		nextPageLabel = "<a href=\"#\" onclick=\"{0}({1}); return false;\"><i class=\"fa fa-angle-right\"></i></a>&nbsp;";
		lastPageLabel = "<a href=\"#\" onclick=\"{0}({1}); return false;\"><i class=\"fa fa-angle-double-right \"></i></a>&nbsp;";
	}
}
