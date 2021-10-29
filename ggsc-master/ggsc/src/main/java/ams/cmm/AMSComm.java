package ams.cmm;

import java.awt.Graphics2D;
import java.awt.RenderingHints;
import java.awt.Transparency;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import java.util.UUID;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.CellStyle;
import org.springframework.web.multipart.MultipartFile;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public class AMSComm {
	public static String getBASE36(String reqValue, int reqSize) {
		long wSeq = Long.parseLong(reqValue);

		String STRLIST = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
		StringBuffer wResult = new StringBuffer();

		long wSplit = 0L;
		long wMod = 0L;

		wSplit = wSeq;

		while (wSplit > 35L) {
			wMod = wSplit % 36L;
			wSplit /= 36L;
			wResult.insert(0, STRLIST.substring((int) wMod, (int) wMod + 1));
		}

		wResult.insert(0, STRLIST.substring((int) wSplit, (int) wSplit + 1));

		int wSize = reqSize - wResult.length() + 1;
		for (int i = 1; i < wSize; i++) {
			wResult.insert(0, "0");
		}

		return wResult.toString();
	}

	public static String getUserName(String reqDeptName, String reqPosName, String reqUserName) {
		String wPos = reqPosName;
		String wDept = reqDeptName;

		if (!wPos.equals(""))
			wPos = " " + wPos;
		if (!wDept.equals(""))
			wDept = " (" + wDept + ")";

		return reqUserName + wPos + wDept;
	}

	/**
	 * 1주일 구하기
	 *
	 * @param reqDate
	 * @return
	 */
	public static String getWeekDate(String reqDate) {
		String wTmp = reqDate;

		AMSDate wWorkDate = new AMSDate();

		String wWorkYear = "";
		String wWorkMonth = "";
		String wWorkDay = "";
		String wWeekString = "";

		int wInt = 0;

		if (wTmp.length() == 10) {
			wWorkYear = wTmp.substring(0, 4);
			wWorkMonth = wTmp.substring(5, 7);
			wWorkDay = wTmp.substring(8, 10);
			wWorkDate = new AMSDate(Integer.parseInt(wWorkYear), Integer.parseInt(wWorkMonth),
					Integer.parseInt(wWorkDay));
			wInt = wWorkDate.getWeekDay();
			System.out.println("wInt = " + wInt);
			// wInt--;//(한주기준 일~토 -> 토~금 으로 변경)

			// 1:일,2:월,3:화,4:수,5:목,6:금,7:토

			System.out.println("wInt = " + wInt);

			if (wInt == 7) {
				wWeekString = wWorkDate.getDate("YYYY.MM.DD");
				wWorkDate.move("d", 6);
				wWeekString += "[#|#]" + wWorkDate.getDate("YYYY.MM.DD");
			} else {
				wWorkDate.move("d", -wInt);// 1주 첫날
				wWeekString = wWorkDate.getDate("YYYY.MM.DD");
				wWorkDate.move("d", 6);// 1주막날
				wWeekString += "[#|#]" + wWorkDate.getDate("YYYY.MM.DD");
			}
		}

		System.out.println("최종리턴값 = " + wWeekString);
		return wWeekString;
	}

	public static String getReplace(String reqString, String reqPattern, String reqReplace) {
		StringBuffer wResult = new StringBuffer();
		String wUPPER = reqString.toUpperCase();
		String wPattern = reqPattern.toUpperCase();

		int wStart = 0;
		int wEnd = 0;

		wEnd = wUPPER.indexOf(wPattern, wStart);
		while (wEnd >= 0) {
			wResult.append(reqString.substring(wStart, wEnd));
			wResult.append(reqReplace);
			wStart = wEnd + reqPattern.length();
			wEnd = wUPPER.indexOf(wPattern, wStart);
		}
		wResult.append(reqString.substring(wStart));

		return wResult.toString();
	}

	public static String[] split(String strTarget, String strDelim) {
		if (strTarget.equals("")) {
			String[] wResult = new String[1];
			wResult[0] = "";
			return wResult;
		}

		int index = 0;
		String[] resultStrArray = new String[doStrSearch(strTarget, strDelim) + 1];
		String strCheck = new String(strTarget);
		while (strCheck.length() != 0) {
			int begin = strCheck.indexOf(strDelim);
			if (begin == -1) {
				resultStrArray[index] = strCheck;
				break;
			}

			int end = begin + strDelim.length();
			resultStrArray[(index++)] = strCheck.substring(0, begin);

			strCheck = strCheck.substring(end);
			if (strCheck.length() != 0)
				continue;
			resultStrArray[index] = strCheck;
			break;
		}

		return resultStrArray;
	}

	private static int doStrSearch(String strTarget, String strSearch) {
		int result = 0;
		String strCheck = new String(strTarget);
		for (int i = 0; i < strTarget.length();) {
			int loc = strCheck.indexOf(strSearch);
			if (loc == -1) {
				break;
			}

			result++;
			i = loc + strSearch.length();
			strCheck = strCheck.substring(i);
		}

		return result;
	}

	/*
	 * ===================================================================== 분구하기
	 * =====================================================================
	 */
	public static String getMin(String reqTime, String reqMin) {
		String wTmp = "";

		int wInt = (Integer.parseInt(reqTime) * 60 + Integer.parseInt(reqMin));

		wTmp = "" + wInt;

		return wTmp;
	}

	public static String getMin_cut(String reqTime, String reqMin, int reqType) {
		String wTmp = "";

		int wInt = (Integer.parseInt(reqTime) * 60 + Integer.parseInt(reqMin));

		wTmp = "" + wInt;

		if (reqType == 1) {
			// 오전값 0이면 패스 1~9면 올림처리
			wTmp = wTmp.substring(wTmp.length() - 1, wTmp.length());
			if (wTmp.equals("0")) {
				wTmp = "" + wInt;
			} else {
				wInt = wInt + 10;
				wTmp = "" + wInt;
				wTmp = wTmp.substring(0, wTmp.length() - 1) + "0";
			}
		} else {
			// 오후값 무조건 0으로 초기화
			wTmp = wTmp.substring(0, wTmp.length() - 1) + "0";
		}

		return wTmp;
	}

	public static String getWeek(String reqDate) {
		String wTmp = reqDate;

		AMSDate wWorkDate = new AMSDate();

		String wWorkYear = "";
		String wWorkMonth = "";
		String wWorkDay = "";
		String wWeekString = "";

		int wInt = 0;

		if (wTmp.length() == 10) {
			wWorkYear = wTmp.substring(0, 4);
			wWorkMonth = wTmp.substring(5, 7);
			wWorkDay = wTmp.substring(8, 10);
			wWorkDate = new AMSDate(Integer.parseInt(wWorkYear), Integer.parseInt(wWorkMonth),
					Integer.parseInt(wWorkDay));
			wInt = wWorkDate.getWeekDay();

			if (wInt == 1) {
				wWeekString = "(일)";
			}
			if (wInt == 2) {
				wWeekString = "(월)";
			}
			if (wInt == 3) {
				wWeekString = "(화)";
			}
			if (wInt == 4) {
				wWeekString = "(수)";
			}
			if (wInt == 5) {
				wWeekString = "(목)";
			}
			if (wInt == 6) {
				wWeekString = "(금)";
			}
			if (wInt == 7) {
				wWeekString = "(토)";
			}
		}
		return wWeekString;
	}

	public static String getDateWeek(String reqDate) {
		String wTmp = reqDate;
		AMSDate wWorkDate = new AMSDate();
		String wWorkYear = "";
		String wWorkMonth = "";
		String wWorkDay = "";
		String wWeekString = "";
		int wInt = 0;
		if (wTmp.length() == 10) {
			wWorkYear = wTmp.substring(0, 4);
			wWorkMonth = wTmp.substring(5, 7);
			wWorkDay = wTmp.substring(8, 10);
			wWorkDate = new AMSDate(Integer.parseInt(wWorkYear), Integer.parseInt(wWorkMonth),
					Integer.parseInt(wWorkDay));
			wInt = wWorkDate.getWeekDay();
			if (wInt == 1) {
				wWeekString = "(일)";
			}
			if (wInt == 2) {
				wWeekString = "(월)";
			}
			if (wInt == 3) {
				wWeekString = "(화)";
			}
			if (wInt == 4) {
				wWeekString = "(수)";
			}
			if (wInt == 5) {
				wWeekString = "(목)";
			}
			if (wInt == 6) {
				wWeekString = "(금)";
			}
			if (wInt == 7) {
				wWeekString = "(토)";
			}
		}
		return wWorkYear + "년" + wWorkMonth + "월" + wWorkDay + "일 " + wWeekString;
	}

	public static String logoutProcBySvNm(HttpServletRequest request) {

		if (request.getServerName().indexOf("localhost") > -1) {
			// request.getSession().setAttribute("LoginVO", null);
			request.getSession().removeAttribute("LoginVO");
			return "redirect:/gnoincoundb/login/login.do";
		} else {
			return "redirect:/gnoincoundb/login/login.do";
			// return "redirect:/gnoincoundb/login/actionLogout.do";
		}
	}

	// 엑셀 다운로드
	public static HSSFWorkbook listExcelDownload(List<EgovMap> list, String[] mapKey, String[] header, String sheetNm) {

		HSSFWorkbook workbook = new HSSFWorkbook();

		HSSFSheet sheet = workbook.createSheet(sheetNm);

		HSSFRow row = null;

		HSSFCell cell = null;

		CellStyle cs = workbook.createCellStyle();
		cs.setBorderTop(CellStyle.BORDER_THIN);
		cs.setBorderBottom(CellStyle.BORDER_THIN);
		cs.setBorderLeft(CellStyle.BORDER_THIN);
		cs.setBorderRight(CellStyle.BORDER_THIN);

		row = sheet.createRow(0);
		
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@ excel header length : "+header.length);

		for (int i = 0; i < header.length; i++) {
			cell = row.createCell(i);
			cell.setCellValue(header[i]);
			cell.setCellStyle(cs);
		}

		for (int i = 0; i < list.size(); i++) {
			row = sheet.createRow(i + 1);
			EgovMap map = list.get(i);

			for (int j = 0; j < mapKey.length; j++) {
				cell = row.createCell(j);
				cell.setCellValue((String) (map.get(mapKey[j]) == null ? "" : String.valueOf(map.get(mapKey[j]))));
				cell.setCellStyle(cs);
			}
		}

		for (int i = 0; i < list.size(); i++) {
			sheet.autoSizeColumn(i);
			sheet.setColumnWidth(i, (sheet.getColumnWidth(i)) + 1500);
		}

		return workbook;
	}

	public static EgovMap ImageUpload(MultipartFile file, String subPath) {
		EgovMap map = new EgovMap();
		if (file.getSize() > 0) {
			String fileRoot = utility.func.imagePath;
			String thumbRoot = fileRoot + "thumb\\";

			String originalFileName = file.getOriginalFilename(); // 오리지날 파일명
			String extension = originalFileName.substring(originalFileName.lastIndexOf(".")); // 파일 확장자
			// 랜덤 UUID+확장자로 저장될 savedFileName
			String savedFileName = UUID.randomUUID() + extension;

			map.put("fileNm", originalFileName);
			map.put("sysFileNm", savedFileName);
			map.put("filePath", subPath);
			map.put("fileSize", file.getSize());
			map.put("responseCode", "0");

			String[] exts = new String[] { "jpg", "jpeg", "bmp", "png" };

			boolean uploadOK = false;
			for (String a : exts) {
				if (a.equals(extension.substring(1, extension.length()).toLowerCase())) {
					uploadOK = true;
					break;
				}
			}

			System.out.println("file extension : " + extension);

			if (!uploadOK) {
				System.out.println("file upload false");
				map.put("fileNm", "");
				map.put("sysFileNm", "");
				map.put("filePath", "");
				map.put("fileSize", 0);
				map.put("responseCode", "-1");
				System.out.println("file upload false return > " + map.toString());
				return map;
			}

			File Folder = new File(fileRoot);
			if (!Folder.exists()) {
				try {
					Folder.mkdir(); // 폴더 생성합니다.
					Folder.setWritable(true); // 쓰기가능설정
					Folder.setReadable(true); // 읽기가능설정
				} catch (NullPointerException e) {
					utility.func.Logging("AMSComm.ImageUpload.NULL", e);
				}
			}

			File targetFile = new File(fileRoot + savedFileName);
			try {
				InputStream fileStream = file.getInputStream();
				FileUtils.copyInputStreamToFile(fileStream, targetFile); // 파일 저장

				/// 썸네일 생성
				Folder = new File(thumbRoot);
				System.out.println("Thumb Root : " + thumbRoot);

				if (!Folder.exists()) {
					try {
						Folder.mkdir(); // 폴더 생성합니다.
						Folder.setWritable(true); // 쓰기가능설정
						Folder.setReadable(true); // 읽기가능설정
					} catch (NullPointerException e) {
						utility.func.Logging("AMSComm.ImageUpload.NULL", e);
					}
				}

				int thumbnail_width = 320;
				int thumbnail_height = 320;

				BufferedImage inputImage = ImageIO.read(targetFile);
				System.out.println("Image Read Complete");
				double width = inputImage.getWidth(), height = inputImage.getHeight();
				System.out.println("width : " + width + ", height : " + height);

				if (width < height) {
					thumbnail_width = (int) ((width / height) * 320);
				} else {
					thumbnail_height = (int) ((height / width) * 320);
				}

				System.out.println("width : " + thumbnail_width + ", height : " + thumbnail_height);

				int imgType = (inputImage.getTransparency() == Transparency.OPAQUE) ? BufferedImage.TYPE_INT_RGB
						: BufferedImage.TYPE_INT_ARGB;
				BufferedImage thumbImage = resize(inputImage, thumbnail_width, thumbnail_height, imgType);
				System.out.println(
						"thumb file full : " + thumbRoot + savedFileName + "/" + extension.toLowerCase().substring(1));
				ImageIO.write(thumbImage, extension.toLowerCase().substring(1), new File(thumbRoot + savedFileName));

			} catch (IOException e) {
				FileUtils.deleteQuietly(targetFile); // 실패시 저장된 파일 삭제
				utility.func.Logging("AMSComm.ImageUpload", e);
			}

		} else {
			map.put("fileNm", "");
			map.put("sysFileNm", "");
			map.put("filePath", "");
			map.put("fileSize", 0);
			map.put("responseCode", "-2");
		}
		return map;
	}

	public static BufferedImage resize(BufferedImage inputImage, int width, int height, int imgType)
			throws IOException {

		BufferedImage outputImage = new BufferedImage(width, height, imgType);

		Graphics2D graphics2D = outputImage.createGraphics();
		graphics2D.setRenderingHint(RenderingHints.KEY_INTERPOLATION, RenderingHints.VALUE_INTERPOLATION_BICUBIC);
		graphics2D.drawImage(inputImage, 0, 0, width, height, null);
		graphics2D.dispose();

		return outputImage;
	}

	public static EgovMap fileUpload(MultipartFile file, String subPath) {
		EgovMap map = new EgovMap();
		if (file.getSize() > 0) {
			// String fileRoot = utility.func.filePath + subPath + "/"; 파일생성 에러로 주석처리
			// 2021-01-13
			/* String fileRoot = utility.func.filePath+ "\\"; */
			String fileRoot = utility.func.filePath;
			String originalFileName = file.getOriginalFilename(); // 오리지날 파일명
			String extension = originalFileName.substring(originalFileName.lastIndexOf(".")); // 파일 확장자
			// 랜덤 UUID+확장자로 저장될 savedFileName
			String savedFileName = UUID.randomUUID() + extension;
			
			try {
				map.put("sysFileNm",AES256Crypto.getInstance().AESEncode(savedFileName));
			} catch (InvalidKeyException e) {
				map.put("sysFileNm", savedFileName);
				utility.func.Logging("AES256Crypto", "ENCODE ERROR - 1");
			} catch (NoSuchAlgorithmException e) {
				map.put("sysFileNm", savedFileName);
				utility.func.Logging("AES256Crypto", "ENCODE ERROR - 2");
			} catch (NoSuchPaddingException e) {
				map.put("sysFileNm", savedFileName);
				utility.func.Logging("AES256Crypto", "ENCODE ERROR - 3");
			} catch (InvalidAlgorithmParameterException e) {
				map.put("sysFileNm", savedFileName);
				utility.func.Logging("AES256Crypto", "ENCODE ERROR - 4");
			} catch (IllegalBlockSizeException e) {
				map.put("sysFileNm", savedFileName);
				utility.func.Logging("AES256Crypto", "ENCODE ERROR - 5");
			} catch (BadPaddingException e) {
				map.put("sysFileNm", savedFileName);
				utility.func.Logging("AES256Crypto", "ENCODE ERROR - 6");
			} catch (UnsupportedEncodingException e) {
				map.put("sysFileNm", savedFileName);
				utility.func.Logging("AES256Crypto", "ENCODE ERROR - 7");
			}
			
			map.put("fileNm", originalFileName);
			//map.put("sysFileNm", savedFileName);
			map.put("filePath", subPath);
			map.put("fileSize", file.getSize());

			String[] exts = new String[] { "hwp", "pdf" , "jpg", "jpeg", "bmp", "png", "psd", "doc", "docx", "xls", "xlsx", "ppt",
					"pptx", "zip", "txt" };

			boolean uploadOK = false;
			for (String a : exts) {
				if (a.equals(extension.substring(1, extension.length()).toLowerCase())) {
					uploadOK = true;
					break;
				}
			}

			System.out.println("file extension : " + extension);

			if (!uploadOK) {
				System.out.println("file upload false");
				map.put("fileNm", "");
				map.put("sysFileNm", "");
				map.put("filePath", "");
				map.put("fileSize", 0);
				System.out.println("file upload false return > " + map.toString());
				return map;
			}

			File Folder = new File(fileRoot);
			if (!Folder.exists()) {
				try {
					Folder.mkdir(); // 폴더 생성합니다.
					Folder.setWritable(true); // 쓰기가능설정
					Folder.setReadable(true); // 읽기가능설정
				} catch (NullPointerException e) {
					utility.func.Logging("AMSComm.fileUpload", "Folder Null");
				}
			}

			File targetFile = new File(fileRoot + savedFileName);
			try {
				InputStream fileStream = file.getInputStream();
				FileUtils.copyInputStreamToFile(fileStream, targetFile); // 파일 저장
				fileStream.close();
			} catch (IOException e) {
				FileUtils.deleteQuietly(targetFile); // 실패시 저장된 파일 삭제
				utility.func.Logging("AMSComm.fileUpload", "IO");
			}

		} else {
			map.put("fileNm", "");
			map.put("sysFileNm", "");
			map.put("filePath", "");
			map.put("fileSize", 0);
		}
		return map;
	}

	// 배열 문자열로 나열

	public static String arryToString(String[] arry) {
		String result = "";

		if (arry != null) {
			for (int i = 0; i < arry.length; i++) {
				result += arry[i];
				if (i != arry.length - 1) {
					result += ",";
				}
			}
		}

		return result;
	}
}
