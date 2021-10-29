package egovframework.cmm.service;

public class BoardVO extends BoardDefaultVO {
    private int rnum = 0;
    private int idx = 0;
	private int bo_sel = 0;
	private String sub_sel;
	private String title;
	private String cont;
	private String writer;
	private String admin;
	private String files;
	private String files_name;
	private String tit_img;
	private int hit = 0;
	private String main_v;
	private String reply;
	private String reply_idx;
	private String secret;
	private String su_key;
	private String sort;
	private String reg_id;
	private String db_ins_tm;

	private String srh_text;
	private String srh_type;

	//메인 화면에서 사용하는 필드
	private String listNm;

	private String file_num;

	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getBo_sel() {
		return bo_sel;
	}
	public void setBo_sel(int bo_sel) {
		this.bo_sel = bo_sel;
	}
	public String getSub_sel() {
		return sub_sel;
	}
	public void setSub_sel(String sub_sel) {
		this.sub_sel = sub_sel;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCont() {
		return cont;
	}
	public void setCont(String cont) {
		this.cont = cont;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getAdmin() {
		return admin;
	}
	public void setAdmin(String admin) {
		this.admin = admin;
	}
	public String getFiles() {
		return files;
	}
	public void setFiles(String files) {
		this.files = files;
	}
	public String getFiles_name() {
		return files_name;
	}
	public void setFiles_name(String files_name) {
		this.files_name = files_name;
	}
	public String getTit_img() {
		return tit_img;
	}
	public void setTit_img(String tit_img) {
		this.tit_img = tit_img;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getMain_v() {
		return main_v;
	}
	public void setMain_v(String main_v) {
		this.main_v = main_v;
	}
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
	public String getReply_idx() {
		return reply_idx;
	}
	public void setReply_idx(String reply_idx) {
		this.reply_idx = reply_idx;
	}
	public String getSecret() {
		return secret;
	}
	public void setSecret(String secret) {
		this.secret = secret;
	}
	public String getSu_key() {
		return su_key;
	}
	public void setSu_key(String su_key) {
		this.su_key = su_key;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public String getReg_id() {
		return reg_id;
	}
	public void setReg_id(String reg_id) {
		this.reg_id = reg_id;
	}
	public String getDb_ins_tm() {
		return db_ins_tm;
	}
	public void setDb_ins_tm(String db_ins_tm) {
		this.db_ins_tm = db_ins_tm;
	}
	public String getSrh_text() {
		return srh_text;
	}
	public void setSrh_text(String srh_text) {
		this.srh_text = srh_text;
	}
	public String getSrh_type() {
		return srh_type;
	}
	public void setSrh_type(String srh_type) {
		this.srh_type = srh_type;
	}
	public String getListNm() {
		return listNm;
	}
	public void setListNm(String listNm) {
		this.listNm = listNm;
	}
	public String getFile_num() {
		return file_num;
	}
	public void setFile_num(String file_num) {
		this.file_num = file_num;
	}

}
