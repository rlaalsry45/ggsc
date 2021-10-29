/*
 * Copyright 2008-2009 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package egovframework.user.mypage.service;

/**
 * @Class Name : SampleVO.java
 * @Description : SampleVO Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2009.03.16           최초생성
 *
 * @author 개발프레임웍크 실행환경 개발팀
 * @since 2009. 03.16
 * @version 1.0
 * @see
 *
 *  Copyright (C) by MOPAS All right reserved.
 */
public class MypageVO extends MypageDefaultVO {

	private static final long serialVersionUID = 1L;

	/** 아이디 */
	private String id;

	/** 이름 */
	private String name;

	/** 내용 */
	private String pwd;

	/** 사용여부 */
	private String birth_dt;

	/** 등록자 */
	private String basic_addr;
	
	/** 등록자 */
	private String dtl_addr;
	
	private String addr;
	
	/** 등록자 */
	private String tel;
	
	/** 등록자 */
	private String email;
	
	
	private int rd_num;
	private String year;
	private String mon;
	private int cnt;
	private String title;
	private String content;
	private String reg_id;
	private String reg_tm;
	private String file_num;
	private String file_path;
	private String org_file_nm;
	private String sys_file_nm;
	private int file_size;
	
	
	private String mng_no;
	private String witr_id;
	private String rpt1_id;
	private String rpt2_id;
	private String rpt1_num;
	private String rpt2_num;
	private String witr_name;            
	private String witr_birth_dt;        
	private String witr_tel;             
    private String witr_email;           
	private String witr_addr;   
	private String exe_dt;
	private String wit_name;             
	private String wit_birth_dt;         
	private String wit_tel;              
    private String wit_email;            
	private String wit_addr;             
	private String make_year;            
    private String make_month;           
	private String make_day;             
	private String aply_point;           
	private String aply_etc;             
	private String rpt1_auth_1;          
	private String rpt1_auth_2;         
	private String rpt1_auth_3;          
	private String rpt1_auth_4;          
	private String rpt1_auth_5;          
	private String rpt1_auth_6;          
	private String rpt1_auth_7;          
	private String rpt1_auth_8;          
	private String rpt1_auth_9;          
	private String rpt1_auth_10;         
	private String rpt1_auth_11;         
	private String rpt2_auth_1;          
	private String rpt2_auth_2;          
	private String rpt2_auth_3;          
	private String rpt2_auth_4;          
	private String writer_name;         
	private String rpt_name;             
	private String keep_name;            
	private String supl_yn;              
	
	private String rpt1_name;
    private String rpt1_birth_dt;
    private String rpt1_tel;
    private String rpt1_email;
    private String rpt1_addr;
    private String write_dt;
    
    private String rpt2_name;
    private String rpt2_birth_dt;
    private String rpt2_tel;
    private String rpt2_email;
    private String rpt2_addr;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getBirth_dt() {
		return birth_dt;
	}

	public void setBirth_dt(String birth_dt) {
		this.birth_dt = birth_dt;
	}

	public String getBasic_addr() {
		return basic_addr;
	}

	public void setBasic_addr(String basic_addr) {
		this.basic_addr = basic_addr;
	}

	public String getDtl_addr() {
		return dtl_addr;
	}

	public void setDtl_addr(String dtl_addr) {
		this.dtl_addr = dtl_addr;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public int getRd_num() {
		return rd_num;
	}

	public void setRd_num(int rd_num) {
		this.rd_num = rd_num;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getMon() {
		return mon;
	}

	public void setMon(String mon) {
		this.mon = mon;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getReg_id() {
		return reg_id;
	}

	public void setReg_id(String reg_id) {
		this.reg_id = reg_id;
	}

	public String getReg_tm() {
		return reg_tm;
	}

	public void setReg_tm(String reg_tm) {
		this.reg_tm = reg_tm;
	}

	public String getFile_num() {
		return file_num;
	}

	public void setFile_num(String file_num) {
		this.file_num = file_num;
	}

	public String getFile_path() {
		return file_path;
	}

	public void setFile_path(String file_path) {
		this.file_path = file_path;
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

	public int getFile_size() {
		return file_size;
	}

	public void setFile_size(int file_size) {
		this.file_size = file_size;
	}

	public String getMng_no() {
		return mng_no;
	}

	public void setMng_no(String mng_no) {
		this.mng_no = mng_no;
	}

	public String getWitr_id() {
		return witr_id;
	}

	public void setWitr_id(String witr_id) {
		this.witr_id = witr_id;
	}

	public String getRpt1_id() {
		return rpt1_id;
	}

	public void setRpt1_id(String rpt1_id) {
		this.rpt1_id = rpt1_id;
	}

	public String getRpt2_id() {
		return rpt2_id;
	}

	public void setRpt2_id(String rpt2_id) {
		this.rpt2_id = rpt2_id;
	}

	public String getRpt1_num() {
		return rpt1_num;
	}

	public void setRpt1_num(String rpt1_num) {
		this.rpt1_num = rpt1_num;
	}

	public String getRpt2_num() {
		return rpt2_num;
	}

	public void setRpt2_num(String rpt2_num) {
		this.rpt2_num = rpt2_num;
	}

	public String getWitr_name() {
		return witr_name;
	}

	public void setWitr_name(String witr_name) {
		this.witr_name = witr_name;
	}

	public String getWitr_birth_dt() {
		return witr_birth_dt;
	}

	public void setWitr_birth_dt(String witr_birth_dt) {
		this.witr_birth_dt = witr_birth_dt;
	}

	public String getWitr_tel() {
		return witr_tel;
	}

	public void setWitr_tel(String witr_tel) {
		this.witr_tel = witr_tel;
	}

	public String getWitr_email() {
		return witr_email;
	}

	public void setWitr_email(String witr_email) {
		this.witr_email = witr_email;
	}

	public String getWitr_addr() {
		return witr_addr;
	}

	public void setWitr_addr(String witr_addr) {
		this.witr_addr = witr_addr;
	}

	public String getExe_dt() {
		return exe_dt;
	}

	public void setExe_dt(String exe_dt) {
		this.exe_dt = exe_dt;
	}

	public String getWit_name() {
		return wit_name;
	}

	public void setWit_name(String wit_name) {
		this.wit_name = wit_name;
	}

	public String getWit_birth_dt() {
		return wit_birth_dt;
	}

	public void setWit_birth_dt(String wit_birth_dt) {
		this.wit_birth_dt = wit_birth_dt;
	}

	public String getWit_tel() {
		return wit_tel;
	}

	public void setWit_tel(String wit_tel) {
		this.wit_tel = wit_tel;
	}

	public String getWit_email() {
		return wit_email;
	}

	public void setWit_email(String wit_email) {
		this.wit_email = wit_email;
	}

	public String getWit_addr() {
		return wit_addr;
	}

	public void setWit_addr(String wit_addr) {
		this.wit_addr = wit_addr;
	}

	public String getMake_year() {
		return make_year;
	}

	public void setMake_year(String make_year) {
		this.make_year = make_year;
	}

	public String getMake_month() {
		return make_month;
	}

	public void setMake_month(String make_month) {
		this.make_month = make_month;
	}

	public String getMake_day() {
		return make_day;
	}

	public void setMake_day(String make_day) {
		this.make_day = make_day;
	}

	public String getAply_point() {
		return aply_point;
	}

	public void setAply_point(String aply_point) {
		this.aply_point = aply_point;
	}

	public String getAply_etc() {
		return aply_etc;
	}

	public void setAply_etc(String aply_etc) {
		this.aply_etc = aply_etc;
	}

	public String getRpt1_auth_1() {
		return rpt1_auth_1;
	}

	public void setRpt1_auth_1(String rpt1_auth_1) {
		this.rpt1_auth_1 = rpt1_auth_1;
	}

	public String getRpt1_auth_2() {
		return rpt1_auth_2;
	}

	public void setRpt1_auth_2(String rpt1_auth_2) {
		this.rpt1_auth_2 = rpt1_auth_2;
	}

	public String getRpt1_auth_3() {
		return rpt1_auth_3;
	}

	public void setRpt1_auth_3(String rpt1_auth_3) {
		this.rpt1_auth_3 = rpt1_auth_3;
	}

	public String getRpt1_auth_4() {
		return rpt1_auth_4;
	}

	public void setRpt1_auth_4(String rpt1_auth_4) {
		this.rpt1_auth_4 = rpt1_auth_4;
	}

	public String getRpt1_auth_5() {
		return rpt1_auth_5;
	}

	public void setRpt1_auth_5(String rpt1_auth_5) {
		this.rpt1_auth_5 = rpt1_auth_5;
	}

	public String getRpt1_auth_6() {
		return rpt1_auth_6;
	}

	public void setRpt1_auth_6(String rpt1_auth_6) {
		this.rpt1_auth_6 = rpt1_auth_6;
	}

	public String getRpt1_auth_7() {
		return rpt1_auth_7;
	}

	public void setRpt1_auth_7(String rpt1_auth_7) {
		this.rpt1_auth_7 = rpt1_auth_7;
	}

	public String getRpt1_auth_8() {
		return rpt1_auth_8;
	}

	public void setRpt1_auth_8(String rpt1_auth_8) {
		this.rpt1_auth_8 = rpt1_auth_8;
	}

	public String getRpt1_auth_9() {
		return rpt1_auth_9;
	}

	public void setRpt1_auth_9(String rpt1_auth_9) {
		this.rpt1_auth_9 = rpt1_auth_9;
	}

	public String getRpt1_auth_10() {
		return rpt1_auth_10;
	}

	public void setRpt1_auth_10(String rpt1_auth_10) {
		this.rpt1_auth_10 = rpt1_auth_10;
	}

	public String getRpt1_auth_11() {
		return rpt1_auth_11;
	}

	public void setRpt1_auth_11(String rpt1_auth_11) {
		this.rpt1_auth_11 = rpt1_auth_11;
	}

	public String getRpt2_auth_1() {
		return rpt2_auth_1;
	}

	public void setRpt2_auth_1(String rpt2_auth_1) {
		this.rpt2_auth_1 = rpt2_auth_1;
	}

	public String getRpt2_auth_2() {
		return rpt2_auth_2;
	}

	public void setRpt2_auth_2(String rpt2_auth_2) {
		this.rpt2_auth_2 = rpt2_auth_2;
	}

	public String getRpt2_auth_3() {
		return rpt2_auth_3;
	}

	public void setRpt2_auth_3(String rpt2_auth_3) {
		this.rpt2_auth_3 = rpt2_auth_3;
	}

	public String getRpt2_auth_4() {
		return rpt2_auth_4;
	}

	public void setRpt2_auth_4(String rpt2_auth_4) {
		this.rpt2_auth_4 = rpt2_auth_4;
	}

	public String getWriter_name() {
		return writer_name;
	}

	public void setWriter_name(String writer_name) {
		this.writer_name = writer_name;
	}

	public String getRpt_name() {
		return rpt_name;
	}

	public void setRpt_name(String rpt_name) {
		this.rpt_name = rpt_name;
	}

	public String getKeep_name() {
		return keep_name;
	}

	public void setKeep_name(String keep_name) {
		this.keep_name = keep_name;
	}

	public String getSupl_yn() {
		return supl_yn;
	}

	public void setSupl_yn(String supl_yn) {
		this.supl_yn = supl_yn;
	}

	public String getRpt1_name() {
		return rpt1_name;
	}

	public void setRpt1_name(String rpt1_name) {
		this.rpt1_name = rpt1_name;
	}

	public String getRpt1_birth_dt() {
		return rpt1_birth_dt;
	}

	public void setRpt1_birth_dt(String rpt1_birth_dt) {
		this.rpt1_birth_dt = rpt1_birth_dt;
	}

	public String getRpt1_tel() {
		return rpt1_tel;
	}

	public void setRpt1_tel(String rpt1_tel) {
		this.rpt1_tel = rpt1_tel;
	}

	public String getRpt1_email() {
		return rpt1_email;
	}

	public void setRpt1_email(String rpt1_email) {
		this.rpt1_email = rpt1_email;
	}

	public String getRpt1_addr() {
		return rpt1_addr;
	}

	public void setRpt1_addr(String rpt1_addr) {
		this.rpt1_addr = rpt1_addr;
	}

	public String getWrite_dt() {
		return write_dt;
	}

	public void setWrite_dt(String write_dt) {
		this.write_dt = write_dt;
	}

	public String getRpt2_name() {
		return rpt2_name;
	}

	public void setRpt2_name(String rpt2_name) {
		this.rpt2_name = rpt2_name;
	}

	public String getRpt2_birth_dt() {
		return rpt2_birth_dt;
	}

	public void setRpt2_birth_dt(String rpt2_birth_dt) {
		this.rpt2_birth_dt = rpt2_birth_dt;
	}

	public String getRpt2_tel() {
		return rpt2_tel;
	}

	public void setRpt2_tel(String rpt2_tel) {
		this.rpt2_tel = rpt2_tel;
	}

	public String getRpt2_email() {
		return rpt2_email;
	}

	public void setRpt2_email(String rpt2_email) {
		this.rpt2_email = rpt2_email;
	}

	public String getRpt2_addr() {
		return rpt2_addr;
	}

	public void setRpt2_addr(String rpt2_addr) {
		this.rpt2_addr = rpt2_addr;
	}


	

}
