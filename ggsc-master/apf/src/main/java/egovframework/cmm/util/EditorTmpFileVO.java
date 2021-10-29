package egovframework.cmm.util;

public class EditorTmpFileVO {
	
	// 값이없어서 추가한 값(DB에 컬럼추가 아직 하지않음 2020.10.13)
	public int idx;
	
    public int bd_id=0;
    public int file_num=0;
    public String file_path;
    public String org_file_nm;
    public String sys_file_nm;
    public String use_yn;
    public String odr;
    public int file_size;
    
    public String reg_tm;
    
    public String file_name;
    public String up_yn;
    public String reg_dt;

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public int getFile_num() {
		return file_num;
	}

	public void setFile_num(int file_num) {
		this.file_num = file_num;
	}

	public String getFile_path() {
		return file_path;
	}

	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}

	public int getBd_id() {
		return bd_id;
	}

	public void setBd_id(int bd_id) {
		this.bd_id = bd_id;
	}

	public String getReg_tm() {
		return reg_tm;
	}

	public void setReg_tm(String reg_tm) {
		this.reg_tm = reg_tm;
	}

	public String getOrg_file_nm() {
		return org_file_nm;
	}

	public void setOrg_file_nm(String org_file_nm) {
		this.org_file_nm = org_file_nm;
	}

	public String getSys_file_nm() {
		return sys_file_nm;
	}

	public void setSys_file_nm(String sys_file_nm) {
		this.sys_file_nm = sys_file_nm;
	}

	public String getUse_yn() {
		return use_yn;
	}

	public void setUse_yn(String use_yn) {
		this.use_yn = use_yn;
	}

	public String getOdr() {
		return odr;
	}

	public void setOdr(String odr) {
		this.odr = odr;
	}

	public int getFile_size() {
		return file_size;
	}

	public void setFile_size(int file_size) {
		this.file_size = file_size;
	}

	public String getFile_name() {
		return file_name;
	}

	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}

	public String getUp_yn() {
		return up_yn;
	}

	public void setUp_yn(String up_yn) {
		this.up_yn = up_yn;
	}

	public String getReg_dt() {
		return reg_dt;
	}

	public void setReg_dt(String reg_dt) {
		this.reg_dt = reg_dt;
	}

}
