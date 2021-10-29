package utility;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import org.apache.log4j.Logger;

public class func {
	/*public static final boolean useSSH = false;
	public static final String filePath = "C:\\Users\\huensys\\git\\Files\\";
	public static final String secureKeyPath = "C:/Users/huensys/Settings/key";
	private static final String LogPath = "C:\\Users\\huensys\\git\\log\\"; */
	
	public static final boolean useSSH = true;
	public static final String filePath = "/software/tomcat/webapps/files/";
	public static final String secureKeyPath = "/software/key";
	private static final String LogPath = "/software/tomcat/webapps/log/"; 
	
	public static int OnlyNumber(String str, int defaultValue) {
		int returnValue; 
		try {
			returnValue = Integer.parseInt(str);
		}
		catch (NumberFormatException e) {
			returnValue  = defaultValue;
		}
		return returnValue;
	}
	
	 public static String XSSReplace(String value) {
		 value = value.replaceAll("<", "& lt;").replaceAll(">", "& gt;");
		 value = value.replaceAll("\\(", "& #40;").replaceAll("\\)", "& #41;");
		 value = value.replaceAll("'", "& #39;");
		 value = value.replaceAll("eval\\((.*)\\)", "");
		 value = value.replaceAll("[\\\"\\\'][\\s]*javascript:(.*)[\\\"\\\']", "\"\"");
		 value = value.replaceAll("script", "");
		 return value;
	}
	 
	 public static void Logging(String cls, String error) {
			String errorMessage = String.format("[ERROR : %s] %s", cls, error);
			File Folder = new File(LogPath);
			if (!Folder.exists()) {
				Folder.mkdir(); // 폴더 생성합니다.
			}
			
			Logger logger = Logger.getLogger(cls);

			String currentDate = LocalDate.now().format(DateTimeFormatter.BASIC_ISO_DATE);
			try {
				logger.error(errorMessage);
				File file = new File(LogPath + "log_" + currentDate + ".log");
				FileWriter fw = new FileWriter(file, true);
				fw.write(errorMessage);
				fw.write("\r\n");
				fw.flush();
				fw.close();
			} catch (IOException e) {
				logger.error("Log Write Error");
			}
		}
		public static void Logging(String cls, Exception err) {
			Logger logger = Logger.getLogger(cls);
			logger.error("ERROR : " + cls);
		}
	 
}