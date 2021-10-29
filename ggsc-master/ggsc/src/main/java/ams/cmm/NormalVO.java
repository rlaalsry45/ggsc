package ams.cmm;

public class NormalVO {
	
    private String saveFlag ;

	private String schColm = "1";

	private String schStr = "" ;

	private String schFrom;

	private String schTo;

    private String pageRows = "10" ;

    private String pageList = "10" ;

    private String fromIndex ;

    private String toIndex ;

    private String curPage = "1";

    private int rowsCnt ;

	private int rnum ;
    
	private String oriFileNm = "" ;
	private String filePath = "" ;
    
	private String regId = "" ;
	private String dbUpdDt;
	private String dbInsDt;
    
    
    
	public String getRegId() {
		return regId;
	}

	public void setRegId(String regId) {
		this.regId = regId;
	}

	public String getDbUpdDt() {
		return dbUpdDt;
	}

	public void setDbUpdDt(String dbUpdDt) {
		this.dbUpdDt = dbUpdDt;
	}

	public String getDbInsDt() {
		return dbInsDt;
	}

	public void setDbInsDt(String dbInsDt) {
		this.dbInsDt = dbInsDt;
	}

	public String getOriFileNm() {
		return oriFileNm;
	}

	public void setOriFileNm(String oriFileNm) {
		this.oriFileNm = oriFileNm;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getSaveFlag() {
		return saveFlag;
	}

	public void setSaveFlag(String saveFlag) {
		this.saveFlag = saveFlag;
	}

	public String getSchFrom() {
		return schFrom;
	}

	public void setSchFrom(String schFrom) {
		this.schFrom = schFrom;
	}

	public String getSchTo() {
		return schTo;
	}

	public void setSchTo(String schTo) {
		this.schTo = schTo;
	}

	public int getRowsCnt() {
		return rowsCnt;
	}

	public void setRowsCnt(int rowsCnt) {
		this.rowsCnt = rowsCnt;
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}


	public String getSchColm() {
		return schColm;
	}

	public void setSchColm(String schColm) {
		this.schColm = schColm;
	}

	public String getSchStr() {
		return schStr;
	}

	public void setSchStr(String schStr) {
		this.schStr = schStr;
	}

	public String getPageRows() {
		return pageRows;
	}

	public void setPageRows(String pageRows) {
		this.pageRows = pageRows;
	}

	public String getPageList() {
		return pageList;
	}

	public void setPageList(String pageList) {
		this.pageList = pageList;
	}

	public String getFromIndex() {
		return fromIndex;
	}

	public void setFromIndex(String fromIndex) {
		this.fromIndex = fromIndex;
	}

	public String getToIndex() {
		return toIndex;
	}

	public void setToIndex(String toIndex) {
		this.toIndex = toIndex;
	}

	public String getCurPage() {
		return curPage;
	}

	public void setCurPage(String curPage) {
		this.curPage = curPage;
	}


}
