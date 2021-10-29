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
package egovframework.user.notice.service;

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
public class NotVO extends NotDefaultVO {

	private static final long serialVersionUID = 1L;

	/** 아이디 */
	private String bd_id;

	/** 이름 */
	private String bd_title;
	
	private String bd_content;
	private int bd_cnt;
	private String reg_id;
	private String reg_tm;
	private String sch;
	private String file_num;
	private String org_file_nm;
	private String sys_file_nm;
	private String file_path;
	private int file_size;
	
	
	private String id;
	private String name;
	

	public String getBd_id() {
		return bd_id;
	}

	public void setBd_id(String bd_id) {
		this.bd_id = bd_id;
	}

	public String getBd_title() {
		return bd_title;
	}

	public void setBd_title(String bd_title) {
		this.bd_title = bd_title;
	}

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

	public String getBd_content() {
		return bd_content;
	}

	public void setBd_content(String bd_content) {
		this.bd_content = bd_content;
	}

	public int getBd_cnt() {
		return bd_cnt;
	}

	public void setBd_cnt(int bd_cnt) {
		this.bd_cnt = bd_cnt;
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

	public String getSch() {
		return sch;
	}

	public void setSch(String sch) {
		this.sch = sch;
	}

	public String getFile_num() {
		return file_num;
	}

	public void setFile_num(String file_num) {
		this.file_num = file_num;
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

	

}
