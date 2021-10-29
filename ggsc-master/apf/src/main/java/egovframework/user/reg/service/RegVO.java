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
package egovframework.user.reg.service;





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
public class RegVO extends RegDefaultVO {

	private static final long serialVersionUID = 1L;

	/** 아이디 */
	private String id;

	/** 이름 */
	private String name;

	/** 내용 */
	private String description;

	/** 사용여부 */
	private String useYn;

	/** 등록자 */
	private String regUser;
	
	private int cnt;
	
	
	private String mng_no;               
    private String witr_id;  
    private int odr;
    private String use_yn;               
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
	private String reg_id;               
	private String reg_tm;   
	
	private String rpt1_id;
    private int rpt1_num;
    private String rpt1_name;
    private String rpt1_birth_dt;
    private String rpt1_tel;
    private String rpt1_email;
    private String rpt1_addr;
    private String write_dt;
    
    private String rpt2_id;
    private int rpt2_num;
    private String rpt2_name;
    private String rpt2_birth_dt;
    private String rpt2_tel;
    private String rpt2_email;
    private String rpt2_addr;
   
	
    private String my_thik_1;
    private String my_thik_1_room;
    private String my_thik_2;
    private String my_thik_3;
    private String my_thik_3_area;
    private String my_thik_3_room;
    private String my_thik_4;
    private String my_thik_5;
    private String my_thik_6;
    private String my_thik_6_cntn;
    
    
    private String no1_buid_cntn;
    private String no1_buid_tel;
	private String no1_buid_addr;
	private String no2_buid_cntn;
	private String no2_buid_tel;
	private String no2_buid_addr;
	private String no3_buid_cntn;
	
	private String my_req_1;
	private String my_req_2;
	private String my_req_3;
	private String my_req_4;
	private String my_req_5;
	
	private String free_vist_1_name;
	private String free_vist_1_rel;
	private String free_vist_1_tel;
	private String free_vist_2_name;
	private String free_vist_2_rel;
	private String free_vist_2_tel;
	private String free_vist_3_name;
	private String free_vist_3_rel;
	private String free_vist_3_tel;
	
	private String my_indv_1;
	private String my_indv_2;
	private String my_indv_3;
	private String my_indv_4;
	
	
	/** 신탁계약서 */
	private String clent_id;
	private String clent_nm;
 	private String clent_birth_dt;
 	private String clent_tel;
 	private String clent_email;
 	private String clent_addr;
	
 	private String csmt_nm;
 	private String csmt_birth_dt;
 	private String csmt_tel;
 	private String csmt_email;
 	private String csmt_addr;
	
 	private String bnft_nm;
 	private String bnft_birth_dt;
 	private String bnft_tel;
 	private String bnft_email;
 	private String bnft_addr;
 	
 	private String go_bnft_nm;
	private String go_bnft_birth_dt;
	private String go_bnft_tel;
	private String go_bnft_email;
	private String go_bnft_addr;
	
	
	private String per_give_nm;
	private String per_give_birth_dt;
	private String per_give_tel;
	private String per_give_rel;
	private String per_give_email;
	private String per_give_addr;
	
	private String contct_dt;
	private String open_dt;
	private String tot_amt;
	private String tot_dt;
	private String sevr_amt;
	private String sevr_dt;
	
	private String use11;
	private String use12;
	private String use13;
	private String use14;
	private String use15;
	private String use16;
	private String use17;
	private String use18;
	private String use19;
	private String pokt_mony_bank;
	private String pokt_mony_name;
	private String pokt_mony_acont;
	
	private String trst_goal_amt;
	private String trst_tot_amt;
	private String trst_sevr_amt;  
	private String trst_give_dt;
	
	private String csmt_bank;
	private String csmt_name;
	private String csmt_acont;
	
	private String csmt_tel2;
	private String csmt_fax2; 
	private String csmt_email2;
	
	private String trst_give_sign1;
	private String trst_give_sign2;
	private String trst_give_sign3;
	private String trst_give_sign4;
	private String trst_give_etc1;
	private String trst_give_etc2;
	
	private String trst_recv_bank;
	private String trst_recv_name;
	private String trst_recv_acont;
	
	private String give_paper_issue;
	private String give_paper_issue1;
	private String give_paper_issue2;
	private String give_paper_issue3;
	private String give_paper_issue4;
	private String give_paper_issue5;
	
	private String give_paper_amt;
	private String give_paper_recv_nm;
	private String give_paper_acont;
	private String give_paper_req_nm;
	private String give_paper_per_nm;
	private String give_paper_req_dt;
	
	private String intval_give_req;
	private String intval_give_req1;
	private String intval_give_req2;
	private String intval_give_req3;
	private String intval_give_req4;
	private String intval_give_req5;
	
	private String hope_supt_yn;
	private String etc_dcsi_yn;
	private String supt1_nm;
	private String supt1_rel;
	private String supt2_nm;
	private String supt2_rel;
	
	
	private String org_file_nm;
	private String sys_file_nm;
	private String file_path;
	private int file_size;
	private int cd_file_num;
	private int trst_file_num;
	

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

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getUseYn() {
		return useYn;
	}

	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}

	public String getRegUser() {
		return regUser;
	}

	public void setRegUser(String regUser) {
		this.regUser = regUser;
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

	public String getUse_yn() {
		return use_yn;
	}

	public void setUse_yn(String use_yn) {
		this.use_yn = use_yn;
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

	public String getRpt1_id() {
		return rpt1_id;
	}

	public void setRpt1_id(String rpt1_id) {
		this.rpt1_id = rpt1_id;
	}

	public int getRpt1_num() {
		return rpt1_num;
	}

	public void setRpt1_num(int rpt1_num) {
		this.rpt1_num = rpt1_num;
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

	public String getRpt2_id() {
		return rpt2_id;
	}

	public void setRpt2_id(String rpt2_id) {
		this.rpt2_id = rpt2_id;
	}

	public int getRpt2_num() {
		return rpt2_num;
	}

	public void setRpt2_num(int rpt2_num) {
		this.rpt2_num = rpt2_num;
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

	public String getMy_thik_1() {
		return my_thik_1;
	}

	public void setMy_thik_1(String my_thik_1) {
		this.my_thik_1 = my_thik_1;
	}

	public String getMy_thik_1_room() {
		return my_thik_1_room;
	}

	public void setMy_thik_1_room(String my_thik_1_room) {
		this.my_thik_1_room = my_thik_1_room;
	}

	public String getMy_thik_2() {
		return my_thik_2;
	}

	public void setMy_thik_2(String my_thik_2) {
		this.my_thik_2 = my_thik_2;
	}

	public String getMy_thik_3() {
		return my_thik_3;
	}

	public void setMy_thik_3(String my_thik_3) {
		this.my_thik_3 = my_thik_3;
	}

	public String getMy_thik_3_area() {
		return my_thik_3_area;
	}

	public void setMy_thik_3_area(String my_thik_3_area) {
		this.my_thik_3_area = my_thik_3_area;
	}

	public String getMy_thik_3_room() {
		return my_thik_3_room;
	}

	public void setMy_thik_3_room(String my_thik_3_room) {
		this.my_thik_3_room = my_thik_3_room;
	}

	public String getMy_thik_4() {
		return my_thik_4;
	}

	public void setMy_thik_4(String my_thik_4) {
		this.my_thik_4 = my_thik_4;
	}

	public String getMy_thik_5() {
		return my_thik_5;
	}

	public void setMy_thik_5(String my_thik_5) {
		this.my_thik_5 = my_thik_5;
	}

	public String getMy_thik_6() {
		return my_thik_6;
	}

	public void setMy_thik_6(String my_thik_6) {
		this.my_thik_6 = my_thik_6;
	}

	public String getMy_thik_6_cntn() {
		return my_thik_6_cntn;
	}

	public void setMy_thik_6_cntn(String my_thik_6_cntn) {
		this.my_thik_6_cntn = my_thik_6_cntn;
	}

	public String getNo1_buid_cntn() {
		return no1_buid_cntn;
	}

	public void setNo1_buid_cntn(String no1_buid_cntn) {
		this.no1_buid_cntn = no1_buid_cntn;
	}

	public String getNo1_buid_tel() {
		return no1_buid_tel;
	}

	public void setNo1_buid_tel(String no1_buid_tel) {
		this.no1_buid_tel = no1_buid_tel;
	}

	public String getNo1_buid_addr() {
		return no1_buid_addr;
	}

	public void setNo1_buid_addr(String no1_buid_addr) {
		this.no1_buid_addr = no1_buid_addr;
	}

	public String getNo2_buid_cntn() {
		return no2_buid_cntn;
	}

	public void setNo2_buid_cntn(String no2_buid_cntn) {
		this.no2_buid_cntn = no2_buid_cntn;
	}

	public String getNo2_buid_tel() {
		return no2_buid_tel;
	}

	public void setNo2_buid_tel(String no2_buid_tel) {
		this.no2_buid_tel = no2_buid_tel;
	}

	public String getNo2_buid_addr() {
		return no2_buid_addr;
	}

	public void setNo2_buid_addr(String no2_buid_addr) {
		this.no2_buid_addr = no2_buid_addr;
	}

	public String getNo3_buid_cntn() {
		return no3_buid_cntn;
	}

	public void setNo3_buid_cntn(String no3_buid_cntn) {
		this.no3_buid_cntn = no3_buid_cntn;
	}

	public String getMy_req_1() {
		return my_req_1;
	}

	public void setMy_req_1(String my_req_1) {
		this.my_req_1 = my_req_1;
	}

	public String getMy_req_2() {
		return my_req_2;
	}

	public void setMy_req_2(String my_req_2) {
		this.my_req_2 = my_req_2;
	}

	public String getMy_req_3() {
		return my_req_3;
	}

	public void setMy_req_3(String my_req_3) {
		this.my_req_3 = my_req_3;
	}

	public String getMy_req_4() {
		return my_req_4;
	}

	public void setMy_req_4(String my_req_4) {
		this.my_req_4 = my_req_4;
	}

	public String getMy_req_5() {
		return my_req_5;
	}

	public void setMy_req_5(String my_req_5) {
		this.my_req_5 = my_req_5;
	}

	public String getFree_vist_1_name() {
		return free_vist_1_name;
	}

	public void setFree_vist_1_name(String free_vist_1_name) {
		this.free_vist_1_name = free_vist_1_name;
	}

	public String getFree_vist_1_rel() {
		return free_vist_1_rel;
	}

	public void setFree_vist_1_rel(String free_vist_1_rel) {
		this.free_vist_1_rel = free_vist_1_rel;
	}

	public String getFree_vist_1_tel() {
		return free_vist_1_tel;
	}

	public void setFree_vist_1_tel(String free_vist_1_tel) {
		this.free_vist_1_tel = free_vist_1_tel;
	}

	public String getFree_vist_2_name() {
		return free_vist_2_name;
	}

	public void setFree_vist_2_name(String free_vist_2_name) {
		this.free_vist_2_name = free_vist_2_name;
	}

	public String getFree_vist_2_rel() {
		return free_vist_2_rel;
	}

	public void setFree_vist_2_rel(String free_vist_2_rel) {
		this.free_vist_2_rel = free_vist_2_rel;
	}

	public String getFree_vist_2_tel() {
		return free_vist_2_tel;
	}

	public void setFree_vist_2_tel(String free_vist_2_tel) {
		this.free_vist_2_tel = free_vist_2_tel;
	}

	public String getFree_vist_3_name() {
		return free_vist_3_name;
	}

	public void setFree_vist_3_name(String free_vist_3_name) {
		this.free_vist_3_name = free_vist_3_name;
	}

	public String getFree_vist_3_rel() {
		return free_vist_3_rel;
	}

	public void setFree_vist_3_rel(String free_vist_3_rel) {
		this.free_vist_3_rel = free_vist_3_rel;
	}

	public String getFree_vist_3_tel() {
		return free_vist_3_tel;
	}

	public void setFree_vist_3_tel(String free_vist_3_tel) {
		this.free_vist_3_tel = free_vist_3_tel;
	}

	public String getMy_indv_1() {
		return my_indv_1;
	}

	public void setMy_indv_1(String my_indv_1) {
		this.my_indv_1 = my_indv_1;
	}

	public String getMy_indv_2() {
		return my_indv_2;
	}

	public void setMy_indv_2(String my_indv_2) {
		this.my_indv_2 = my_indv_2;
	}

	public String getMy_indv_3() {
		return my_indv_3;
	}

	public void setMy_indv_3(String my_indv_3) {
		this.my_indv_3 = my_indv_3;
	}

	public String getMy_indv_4() {
		return my_indv_4;
	}

	public void setMy_indv_4(String my_indv_4) {
		this.my_indv_4 = my_indv_4;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public String getClent_id() {
		return clent_id;
	}

	public void setClent_id(String clent_id) {
		this.clent_id = clent_id;
	}

	public String getClent_nm() {
		return clent_nm;
	}

	public void setClent_nm(String clent_nm) {
		this.clent_nm = clent_nm;
	}

	public String getClent_birth_dt() {
		return clent_birth_dt;
	}

	public void setClent_birth_dt(String clent_birth_dt) {
		this.clent_birth_dt = clent_birth_dt;
	}

	public String getClent_tel() {
		return clent_tel;
	}

	public void setClent_tel(String clent_tel) {
		this.clent_tel = clent_tel;
	}

	public String getClent_email() {
		return clent_email;
	}

	public void setClent_email(String clent_email) {
		this.clent_email = clent_email;
	}

	public String getClent_addr() {
		return clent_addr;
	}

	public void setClent_addr(String clent_addr) {
		this.clent_addr = clent_addr;
	}

	public String getCsmt_nm() {
		return csmt_nm;
	}

	public void setCsmt_nm(String csmt_nm) {
		this.csmt_nm = csmt_nm;
	}

	public String getCsmt_birth_dt() {
		return csmt_birth_dt;
	}

	public void setCsmt_birth_dt(String csmt_birth_dt) {
		this.csmt_birth_dt = csmt_birth_dt;
	}

	public String getCsmt_tel() {
		return csmt_tel;
	}

	public void setCsmt_tel(String csmt_tel) {
		this.csmt_tel = csmt_tel;
	}

	public String getCsmt_email() {
		return csmt_email;
	}

	public void setCsmt_email(String csmt_email) {
		this.csmt_email = csmt_email;
	}

	public String getCsmt_addr() {
		return csmt_addr;
	}

	public void setCsmt_addr(String csmt_addr) {
		this.csmt_addr = csmt_addr;
	}

	public String getBnft_nm() {
		return bnft_nm;
	}

	public void setBnft_nm(String bnft_nm) {
		this.bnft_nm = bnft_nm;
	}

	public String getBnft_birth_dt() {
		return bnft_birth_dt;
	}

	public void setBnft_birth_dt(String bnft_birth_dt) {
		this.bnft_birth_dt = bnft_birth_dt;
	}

	public String getBnft_tel() {
		return bnft_tel;
	}

	public void setBnft_tel(String bnft_tel) {
		this.bnft_tel = bnft_tel;
	}

	public String getBnft_email() {
		return bnft_email;
	}

	public void setBnft_email(String bnft_email) {
		this.bnft_email = bnft_email;
	}

	public String getBnft_addr() {
		return bnft_addr;
	}

	public void setBnft_addr(String bnft_addr) {
		this.bnft_addr = bnft_addr;
	}

	public String getGo_bnft_nm() {
		return go_bnft_nm;
	}

	public void setGo_bnft_nm(String go_bnft_nm) {
		this.go_bnft_nm = go_bnft_nm;
	}

	public String getGo_bnft_birth_dt() {
		return go_bnft_birth_dt;
	}

	public void setGo_bnft_birth_dt(String go_bnft_birth_dt) {
		this.go_bnft_birth_dt = go_bnft_birth_dt;
	}

	public String getGo_bnft_tel() {
		return go_bnft_tel;
	}

	public void setGo_bnft_tel(String go_bnft_tel) {
		this.go_bnft_tel = go_bnft_tel;
	}

	public String getGo_bnft_email() {
		return go_bnft_email;
	}

	public void setGo_bnft_email(String go_bnft_email) {
		this.go_bnft_email = go_bnft_email;
	}

	public String getGo_bnft_addr() {
		return go_bnft_addr;
	}

	public void setGo_bnft_addr(String go_bnft_addr) {
		this.go_bnft_addr = go_bnft_addr;
	}

	public String getPer_give_nm() {
		return per_give_nm;
	}

	public void setPer_give_nm(String per_give_nm) {
		this.per_give_nm = per_give_nm;
	}

	public String getPer_give_birth_dt() {
		return per_give_birth_dt;
	}

	public void setPer_give_birth_dt(String per_give_birth_dt) {
		this.per_give_birth_dt = per_give_birth_dt;
	}

	public String getPer_give_tel() {
		return per_give_tel;
	}

	public void setPer_give_tel(String per_give_tel) {
		this.per_give_tel = per_give_tel;
	}

	public String getPer_give_rel() {
		return per_give_rel;
	}

	public void setPer_give_rel(String per_give_rel) {
		this.per_give_rel = per_give_rel;
	}

	public String getPer_give_email() {
		return per_give_email;
	}

	public void setPer_give_email(String per_give_email) {
		this.per_give_email = per_give_email;
	}

	public String getPer_give_addr() {
		return per_give_addr;
	}

	public void setPer_give_addr(String per_give_addr) {
		this.per_give_addr = per_give_addr;
	}

	public String getContct_dt() {
		return contct_dt;
	}

	public void setContct_dt(String contct_dt) {
		this.contct_dt = contct_dt;
	}

	public String getOpen_dt() {
		return open_dt;
	}

	public void setOpen_dt(String open_dt) {
		this.open_dt = open_dt;
	}

	public String getTot_amt() {
		return tot_amt;
	}

	public void setTot_amt(String tot_amt) {
		this.tot_amt = tot_amt;
	}

	public String getSevr_amt() {
		return sevr_amt;
	}

	public void setSevr_amt(String sevr_amt) {
		this.sevr_amt = sevr_amt;
	}

	public String getSevr_dt() {
		return sevr_dt;
	}

	public void setSevr_dt(String sevr_dt) {
		this.sevr_dt = sevr_dt;
	}

	public String getUse11() {
		return use11;
	}

	public void setUse11(String use11) {
		this.use11 = use11;
	}

	public String getUse12() {
		return use12;
	}

	public void setUse12(String use12) {
		this.use12 = use12;
	}

	public String getUse13() {
		return use13;
	}

	public void setUse13(String use13) {
		this.use13 = use13;
	}

	public String getUse14() {
		return use14;
	}

	public void setUse14(String use14) {
		this.use14 = use14;
	}

	public String getUse15() {
		return use15;
	}

	public void setUse15(String use15) {
		this.use15 = use15;
	}

	public String getUse16() {
		return use16;
	}

	public void setUse16(String use16) {
		this.use16 = use16;
	}

	public String getUse17() {
		return use17;
	}

	public void setUse17(String use17) {
		this.use17 = use17;
	}

	public String getUse18() {
		return use18;
	}

	public void setUse18(String use18) {
		this.use18 = use18;
	}

	public String getUse19() {
		return use19;
	}

	public void setUse19(String use19) {
		this.use19 = use19;
	}

	public String getPokt_mony_bank() {
		return pokt_mony_bank;
	}

	public void setPokt_mony_bank(String pokt_mony_bank) {
		this.pokt_mony_bank = pokt_mony_bank;
	}

	public String getPokt_mony_name() {
		return pokt_mony_name;
	}

	public void setPokt_mony_name(String pokt_mony_name) {
		this.pokt_mony_name = pokt_mony_name;
	}

	public String getPokt_mony_acont() {
		return pokt_mony_acont;
	}

	public void setPokt_mony_acont(String pokt_mony_acont) {
		this.pokt_mony_acont = pokt_mony_acont;
	}

	public String getTrst_goal_amt() {
		return trst_goal_amt;
	}

	public void setTrst_goal_amt(String trst_goal_amt) {
		this.trst_goal_amt = trst_goal_amt;
	}

	public String getTrst_tot_amt() {
		return trst_tot_amt;
	}

	public void setTrst_tot_amt(String trst_tot_amt) {
		this.trst_tot_amt = trst_tot_amt;
	}

	public String getTrst_sevr_amt() {
		return trst_sevr_amt;
	}

	public void setTrst_sevr_amt(String trst_sevr_amt) {
		this.trst_sevr_amt = trst_sevr_amt;
	}

	public String getTrst_give_dt() {
		return trst_give_dt;
	}

	public void setTrst_give_dt(String trst_give_dt) {
		this.trst_give_dt = trst_give_dt;
	}

	public String getCsmt_bank() {
		return csmt_bank;
	}

	public void setCsmt_bank(String csmt_bank) {
		this.csmt_bank = csmt_bank;
	}

	public String getCsmt_name() {
		return csmt_name;
	}

	public void setCsmt_name(String csmt_name) {
		this.csmt_name = csmt_name;
	}

	public String getCsmt_acont() {
		return csmt_acont;
	}

	public void setCsmt_acont(String csmt_acont) {
		this.csmt_acont = csmt_acont;
	}

	public String getCsmt_tel2() {
		return csmt_tel2;
	}

	public void setCsmt_tel2(String csmt_tel2) {
		this.csmt_tel2 = csmt_tel2;
	}

	public String getCsmt_fax2() {
		return csmt_fax2;
	}

	public void setCsmt_fax2(String csmt_fax2) {
		this.csmt_fax2 = csmt_fax2;
	}

	public String getCsmt_email2() {
		return csmt_email2;
	}

	public void setCsmt_email2(String csmt_email2) {
		this.csmt_email2 = csmt_email2;
	}

	public String getTrst_give_sign1() {
		return trst_give_sign1;
	}

	public void setTrst_give_sign1(String trst_give_sign1) {
		this.trst_give_sign1 = trst_give_sign1;
	}

	public String getTrst_give_sign2() {
		return trst_give_sign2;
	}

	public void setTrst_give_sign2(String trst_give_sign2) {
		this.trst_give_sign2 = trst_give_sign2;
	}

	public String getTrst_give_sign3() {
		return trst_give_sign3;
	}

	public void setTrst_give_sign3(String trst_give_sign3) {
		this.trst_give_sign3 = trst_give_sign3;
	}

	public String getTrst_give_sign4() {
		return trst_give_sign4;
	}

	public void setTrst_give_sign4(String trst_give_sign4) {
		this.trst_give_sign4 = trst_give_sign4;
	}

	public String getTrst_give_etc1() {
		return trst_give_etc1;
	}

	public void setTrst_give_etc1(String trst_give_etc1) {
		this.trst_give_etc1 = trst_give_etc1;
	}

	public String getTrst_give_etc2() {
		return trst_give_etc2;
	}

	public void setTrst_give_etc2(String trst_give_etc2) {
		this.trst_give_etc2 = trst_give_etc2;
	}

	public String getTrst_recv_bank() {
		return trst_recv_bank;
	}

	public void setTrst_recv_bank(String trst_recv_bank) {
		this.trst_recv_bank = trst_recv_bank;
	}

	public String getTrst_recv_name() {
		return trst_recv_name;
	}

	public void setTrst_recv_name(String trst_recv_name) {
		this.trst_recv_name = trst_recv_name;
	}

	public String getTrst_recv_acont() {
		return trst_recv_acont;
	}

	public void setTrst_recv_acont(String trst_recv_acont) {
		this.trst_recv_acont = trst_recv_acont;
	}

	public String getGive_paper_issue() {
		return give_paper_issue;
	}

	public void setGive_paper_issue(String give_paper_issue) {
		this.give_paper_issue = give_paper_issue;
	}

	public String getGive_paper_amt() {
		return give_paper_amt;
	}

	public void setGive_paper_amt(String give_paper_amt) {
		this.give_paper_amt = give_paper_amt;
	}

	public String getGive_paper_recv_nm() {
		return give_paper_recv_nm;
	}

	public void setGive_paper_recv_nm(String give_paper_recv_nm) {
		this.give_paper_recv_nm = give_paper_recv_nm;
	}

	public String getGive_paper_acont() {
		return give_paper_acont;
	}

	public void setGive_paper_acont(String give_paper_acont) {
		this.give_paper_acont = give_paper_acont;
	}

	public String getGive_paper_req_nm() {
		return give_paper_req_nm;
	}

	public void setGive_paper_req_nm(String give_paper_req_nm) {
		this.give_paper_req_nm = give_paper_req_nm;
	}

	public String getGive_paper_per_nm() {
		return give_paper_per_nm;
	}

	public void setGive_paper_per_nm(String give_paper_per_nm) {
		this.give_paper_per_nm = give_paper_per_nm;
	}

	public String getGive_paper_req_dt() {
		return give_paper_req_dt;
	}

	public void setGive_paper_req_dt(String give_paper_req_dt) {
		this.give_paper_req_dt = give_paper_req_dt;
	}

	public String getIntval_give_req() {
		return intval_give_req;
	}

	public void setIntval_give_req(String intval_give_req) {
		this.intval_give_req = intval_give_req;
	}

	public String getHope_supt_yn() {
		return hope_supt_yn;
	}

	public void setHope_supt_yn(String hope_supt_yn) {
		this.hope_supt_yn = hope_supt_yn;
	}

	public String getEtc_dcsi_yn() {
		return etc_dcsi_yn;
	}

	public void setEtc_dcsi_yn(String etc_dcsi_yn) {
		this.etc_dcsi_yn = etc_dcsi_yn;
	}

	public String getSupt1_nm() {
		return supt1_nm;
	}

	public void setSupt1_nm(String supt1_nm) {
		this.supt1_nm = supt1_nm;
	}

	public String getSupt1_rel() {
		return supt1_rel;
	}

	public void setSupt1_rel(String supt1_rel) {
		this.supt1_rel = supt1_rel;
	}

	public String getSupt2_nm() {
		return supt2_nm;
	}

	public void setSupt2_nm(String supt2_nm) {
		this.supt2_nm = supt2_nm;
	}

	public String getSupt2_rel() {
		return supt2_rel;
	}

	public void setSupt2_rel(String supt2_rel) {
		this.supt2_rel = supt2_rel;
	}

	public int getOdr() {
		return odr;
	}

	public void setOdr(int odr) {
		this.odr = odr;
	}

	public String getExe_dt() {
		return exe_dt;
	}

	public void setExe_dt(String exe_dt) {
		this.exe_dt = exe_dt;
	}

	public String getGive_paper_issue1() {
		return give_paper_issue1;
	}

	public void setGive_paper_issue1(String give_paper_issue1) {
		this.give_paper_issue1 = give_paper_issue1;
	}

	public String getGive_paper_issue2() {
		return give_paper_issue2;
	}

	public void setGive_paper_issue2(String give_paper_issue2) {
		this.give_paper_issue2 = give_paper_issue2;
	}

	public String getGive_paper_issue3() {
		return give_paper_issue3;
	}

	public void setGive_paper_issue3(String give_paper_issue3) {
		this.give_paper_issue3 = give_paper_issue3;
	}

	public String getGive_paper_issue4() {
		return give_paper_issue4;
	}

	public void setGive_paper_issue4(String give_paper_issue4) {
		this.give_paper_issue4 = give_paper_issue4;
	}

	public String getGive_paper_issue5() {
		return give_paper_issue5;
	}

	public void setGive_paper_issue5(String give_paper_issue5) {
		this.give_paper_issue5 = give_paper_issue5;
	}

	public String getIntval_give_req1() {
		return intval_give_req1;
	}

	public void setIntval_give_req1(String intval_give_req1) {
		this.intval_give_req1 = intval_give_req1;
	}

	public String getIntval_give_req2() {
		return intval_give_req2;
	}

	public void setIntval_give_req2(String intval_give_req2) {
		this.intval_give_req2 = intval_give_req2;
	}

	public String getIntval_give_req3() {
		return intval_give_req3;
	}

	public void setIntval_give_req3(String intval_give_req3) {
		this.intval_give_req3 = intval_give_req3;
	}

	public String getIntval_give_req4() {
		return intval_give_req4;
	}

	public void setIntval_give_req4(String intval_give_req4) {
		this.intval_give_req4 = intval_give_req4;
	}

	public String getIntval_give_req5() {
		return intval_give_req5;
	}

	public void setIntval_give_req5(String intval_give_req5) {
		this.intval_give_req5 = intval_give_req5;
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

	public String getFile_path() {
		return file_path;
	}

	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}

	public int getFile_size() {
		return file_size;
	}

	public void setFile_size(int file_size) {
		this.file_size = file_size;
	}

	public int getCd_file_num() {
		return cd_file_num;
	}

	public void setCd_file_num(int cd_file_num) {
		this.cd_file_num = cd_file_num;
	}

	public int getTrst_file_num() {
		return trst_file_num;
	}

	public void setTrst_file_num(int trst_file_num) {
		this.trst_file_num = trst_file_num;
	}

	public String getTot_dt() {
		return tot_dt;
	}

	public void setTot_dt(String tot_dt) {
		this.tot_dt = tot_dt;
	}

}
