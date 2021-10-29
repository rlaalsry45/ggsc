package utility;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;

import org.apache.log4j.Logger;

import egovframework.com.cmm.service.EgovProperties;

public class func {
	public static final String filePath = EgovProperties.getProperty("Globals.filePath");
	public static final String imagePath = EgovProperties.getProperty("Globals.imagePath");
	public static final String LogPath = EgovProperties.getProperty("Globals.logPath");
	public static final String secureKeyPath = EgovProperties.getProperty("Globals.secureKeyPath");
	public static final String pdfTemplatePath = EgovProperties.getProperty("Globals.pdfTemplatePath");
	
	public static final boolean useSSH = Boolean.parseBoolean(EgovProperties.getProperty("SSH.Use"));

	public static int OnlyNumber(String str, int defaultValue) {
		int returnValue;
		try {
			returnValue = Integer.parseInt(str);
		} catch (NumberFormatException e) {
			returnValue = defaultValue;
		}
		return returnValue;
	}

	public static String Mobile_Replace(String str) {
		if (str == null) return "";
		
		if (str.length() == 8) {
			return str.replaceFirst("^([0-9]{4})([0-9]{4})$", "$1-$2");
		} else if (str.length() == 12) {
			return str.replaceFirst("(^[0-9]{4})([0-9]{4})([0-9]{4})$", "$1-$2-$3");
		}
		return str.replaceFirst("(^02|[0-9]{3})([0-9]{3,4})([0-9]{4})$", "$1-$2-$3");
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
		SimpleDateFormat format1 = new SimpleDateFormat ( "[yyyy-MM-dd HH:mm:ss]");
		
		try {
			logger.error(errorMessage);
			File file = new File(LogPath + "log_" + currentDate + ".log");
			FileWriter fw = new FileWriter(file, true);
			fw.write(format1.format(new Date()) + errorMessage);
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