package ams.cmm.util;

import java.util.Calendar;

public class DateTimeUtil {

	@SuppressWarnings("unused")
	public static String currentDate(){
    	Calendar cal = Calendar.getInstance();
       	String month = "";
	   	if(cal.get(Calendar.MONTH)+1<10){
     	   month = "0"+(cal.get(Calendar.MONTH)+1);
     	}else{
     		month=""+(cal.get(Calendar.MONTH)+1);
     	}
     	String day = "";
     	if(cal.get(Calendar.DAY_OF_MONTH)<10){
     		day = "0"+cal.get(Calendar.DAY_OF_MONTH);
     	}else{
     		day = ""+cal.get(Calendar.DAY_OF_MONTH);
     	}
   		String curTime = ""+cal.get(Calendar.YEAR)+month+day;
    	return curTime;
	}
	
	@SuppressWarnings("unused")
	public static String currentDateTime(){
    	Calendar cal = Calendar.getInstance();
    	String month = null;
    	if(cal.get(Calendar.MONTH)+1<10){
    	   month = "0"+(cal.get(Calendar.MONTH)+1);
    	}else{
    		month=""+(cal.get(Calendar.MONTH)+1);
    	}
    	String day = null;
    	if(cal.get(Calendar.DAY_OF_MONTH)<10){
    		day = "0"+cal.get(Calendar.DAY_OF_MONTH);
    	}else{
    		day=""+cal.get(Calendar.DAY_OF_MONTH);
    	}
    	String hour = null;
    	if(cal.get(Calendar.HOUR_OF_DAY)<10){
    		hour = "0"+cal.get(Calendar.HOUR_OF_DAY);
    	}else{
    		hour=""+cal.get(Calendar.HOUR_OF_DAY);
    	}
    	String min = null;
    	if(cal.get(Calendar.MINUTE)<10){
    		min = "0"+cal.get(Calendar.MINUTE);
    	}else{
    		min=""+cal.get(Calendar.MINUTE);
    	}
    	String sec = null;
    	if(cal.get(Calendar.SECOND)<10){
    		sec = "0"+cal.get(Calendar.SECOND);
    	}else{
    		sec=""+cal.get(Calendar.SECOND);
    	}
    	String curTime = ""+cal.get(Calendar.YEAR)+month+day+hour
    			+min+sec;
    	return curTime;
	}
}
