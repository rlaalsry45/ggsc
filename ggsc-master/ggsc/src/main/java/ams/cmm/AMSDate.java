package ams.cmm;

import java.util.Calendar;

public class AMSDate
{
  private int gYear;
  private int gMonth;
  private int gDay;
  private int gHour;
  private int gMinute;
  private int gSecond;
  private int gMiliSec;
  private String weekNum;

  public AMSDate()
  {
    Calendar wNow = Calendar.getInstance();

    this.gYear = wNow.get(1);
    this.gMonth = (wNow.get(2) + 1);
    this.gDay = wNow.get(5);
    this.gHour = wNow.get(11);
    this.gMinute = wNow.get(12);
    this.gSecond = wNow.get(13);
    this.gMiliSec = wNow.get(14);
    this.weekNum = String.valueOf(wNow.get(Calendar.WEEK_OF_MONTH));

  }

  public AMSDate(int reqYear)
  {
    this();
    this.gYear = reqYear;
  }

  public AMSDate(int reqYear, int reqMonth)
  {
    this();
    this.gYear = reqYear;
    this.gMonth = reqMonth;
  }

  public AMSDate(int reqYear, int reqMonth, int reqDay)
  {
    this();
    this.gYear = reqYear;
    this.gMonth = reqMonth;
    this.gDay = reqDay;
  }

  public AMSDate(String reqYear, String reqMonth, String reqDay)
  {
    this();
    this.gYear = Integer.parseInt(reqYear);
    this.gMonth = Integer.parseInt(reqMonth);
    this.gDay = Integer.parseInt(reqDay);
  }

  public String getYear()
  {
    return ""+this.gYear;
  }
  public String getMonth() {
    String wResult = ""+this.gMonth;
    if (this.gMonth < 10) wResult = "0" + this.gMonth;
    return wResult;
  }

  public String getDay()
  {
    String wResult = ""+this.gDay;
    if (this.gDay < 10) wResult = "0" + this.gDay;
    return wResult;
  }

  public String getHour()
  {
    String wResult = ""+this.gHour;
    if (this.gHour < 10) wResult = "0" + this.gHour;
    return wResult;
  }

  public String getMinute()
  {
    String wResult = ""+this.gMinute;
    if (this.gMinute < 10) wResult = "0" + this.gMinute;
    return wResult;
  }

  public String getSecond()
  {
    int wResult = this.gSecond;
    if (this.gSecond < 10) wResult = this.gSecond;
    return ""+wResult;
  }
  public int getMiliSec() {
    return this.gMiliSec;
  }

  public String getWeekNum() {
	return weekNum;
  }

  public int getWeekDay()
  {
    Calendar wNow = Calendar.getInstance();
    wNow.set(this.gYear, this.gMonth - 1, this.gDay);
    return wNow.get(7);
  }

  public void move(String reqType, int reqValue)
  {
    if (reqType.equalsIgnoreCase("y")) this.gYear += reqValue;
    if (reqType.equalsIgnoreCase("m")) this.gMonth += reqValue;
    if (reqType.equalsIgnoreCase("d")) this.gDay += reqValue;
    if (reqType.equalsIgnoreCase("h")) this.gHour += reqValue;
    if (reqType.equalsIgnoreCase("n")) this.gMinute += reqValue;
    if (reqType.equalsIgnoreCase("s")) this.gSecond += reqValue;

    Calendar wNow = Calendar.getInstance();

    wNow.set(1, this.gYear);
    wNow.set(2, this.gMonth - 1);
    wNow.set(5, this.gDay);
    wNow.set(11, this.gHour);
    wNow.set(12, this.gMinute);
    wNow.set(13, this.gSecond);
    wNow.set(14, this.gMiliSec);

    this.gYear = wNow.get(1);
    this.gMonth = (wNow.get(2) + 1);
    this.gDay = wNow.get(5);
    this.gHour = wNow.get(11);
    this.gMinute = wNow.get(12);
    this.gSecond = wNow.get(13);
    this.gMiliSec = wNow.get(14);
  }

  public void setDate(String reqDate)
  {
    String wTmp = reqDate;
    wTmp = AMSComm.getReplace(wTmp, ".", "");
    wTmp = AMSComm.getReplace(wTmp, "-", "");
    wTmp = AMSComm.getReplace(wTmp, "/", "");
    wTmp = AMSComm.getReplace(wTmp, " ", "");

    if (wTmp.length() > 7)
    {
      setDate(Integer.parseInt(wTmp.substring(0, 4)), Integer.parseInt(wTmp.substring(4, 6)), Integer.parseInt(wTmp.substring(6, 8)));
    }
  }

  public void setDate(String reqYear, String reqMonth, String reqDay)
  {
    setDate(Integer.parseInt(reqYear), Integer.parseInt(reqMonth), Integer.parseInt(reqDay));
  }

  public void setDate(int reqYear, int reqMonth, int reqDay)
  {
    this.gYear = reqYear;
    this.gMonth = reqMonth;
    this.gDay = reqDay;

    Calendar wNow = Calendar.getInstance();

    wNow.set(1, this.gYear);
    wNow.set(2, this.gMonth - 1);
    wNow.set(5, this.gDay);
    wNow.set(11, this.gHour);
    wNow.set(12, this.gMinute);
    wNow.set(13, this.gSecond);
    wNow.set(14, this.gMiliSec);

    this.gYear = wNow.get(1);
    this.gMonth = (wNow.get(2) + 1);
    this.gDay = wNow.get(5);
    this.gHour = wNow.get(11);
    this.gMinute = wNow.get(12);
    this.gSecond = wNow.get(13);
    this.gMiliSec = wNow.get(14);
  }

  public String getDate()
  {
    return getDate("YYYY.MM.DD HH:NN:SS");
  }

  public String getDate(String reqFormat)
  {
    String wResult = reqFormat.trim().toUpperCase();//대문자변경

    wResult = AMSComm.getReplace(wResult, "YYYY", "Y");
    wResult = AMSComm.getReplace(wResult, "MM", "M");
    wResult = AMSComm.getReplace(wResult, "DD", "D");
    wResult = AMSComm.getReplace(wResult, "HH", "H");
    wResult = AMSComm.getReplace(wResult, "NN", "N");
    wResult = AMSComm.getReplace(wResult, "SS", "S");

    wResult = AMSComm.getReplace(wResult, "Y", getYear());
    wResult = AMSComm.getReplace(wResult, "M", getMonth());
    wResult = AMSComm.getReplace(wResult, "D", getDay());
    wResult = AMSComm.getReplace(wResult, "H", getHour());
    wResult = AMSComm.getReplace(wResult, "N", getMinute());
    wResult = AMSComm.getReplace(wResult, "S", getSecond());

    return wResult;
  }

  public int getLastDay(String reqYear, String reqMonth)
  {
    return getLastDay(Integer.parseInt(reqYear), Integer.parseInt(reqMonth));
  }
  public int getLastDay(int reqYear, int reqMonth) {
    int wDay = 1;
    int wMonth = reqMonth;

    Calendar wNow = Calendar.getInstance();
    wNow.set(reqYear, reqMonth - 1, wDay);

    while (wMonth == reqMonth)
    {
      wDay++;
      wNow.add(5, 1);
      wMonth = wNow.get(2) + 1;
    }

    return wDay - 1;
  }
}
