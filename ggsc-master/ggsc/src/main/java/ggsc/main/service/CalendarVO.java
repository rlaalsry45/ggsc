package ggsc.main.service;


import ams.cmm.PageVO;

public class CalendarVO extends PageVO{
	private String schDate;
	private int num;
	
	private String c_title, c_content, c_startdate, c_starttime, c_enddate, c_endtime, c_color, c_flag, user_id, c_room;

	public String getC_room() {
		return c_room;
	}

	public void setC_room(String c_room) {
		this.c_room = c_room;
	}

	public String getSchDate() {
		return schDate;
	}

	public void setSchDate(String schDate) {
		this.schDate = schDate;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getC_title() {
		return c_title;
	}

	public void setC_title(String c_title) {
		this.c_title = c_title;
	}

	public String getC_content() {
		return c_content;
	}

	public void setC_content(String c_content) {
		this.c_content = c_content;
	}

	public String getC_startdate() {
		return c_startdate;
	}

	public void setC_startdate(String c_startdate) {
		this.c_startdate = c_startdate;
	}

	public String getC_starttime() {
		return c_starttime;
	}

	public void setC_starttime(String c_starttime) {
		this.c_starttime = c_starttime;
	}

	public String getC_enddate() {
		return c_enddate;
	}

	public void setC_enddate(String c_enddate) {
		this.c_enddate = c_enddate;
	}

	public String getC_endtime() {
		return c_endtime;
	}

	public void setC_endtime(String c_endtime) {
		this.c_endtime = c_endtime;
	}

	public String getC_color() {
		return c_color;
	}

	public void setC_color(String c_color) {
		this.c_color = c_color;
	}

	public String getC_flag() {
		return c_flag;
	}

	public void setC_flag(String c_flag) {
		this.c_flag = c_flag;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
	
	
	
	
	

}