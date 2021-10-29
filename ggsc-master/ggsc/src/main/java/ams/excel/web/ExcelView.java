package ams.excel.web;

import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.util.CellRangeAddress;
import org.springframework.web.servlet.view.document.AbstractExcelView;

import egovframework.com.cmm.util.EgovDateUtil;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public class ExcelView extends AbstractExcelView {

	@SuppressWarnings("unchecked")
	@Override
	protected void buildExcelDocument(Map<String, Object> model, HSSFWorkbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException, IOException {

		/** 엑셀fileName와 sheetName 으로 쓸 값 가져오기 */
		String excelName = String.valueOf(model.get("excelName"));
		/** 오늘 날짜 가져오기 */
		String todayStr = EgovDateUtil.getToday();
		/** 파일명 세팅 */
		String fileName = excelName + "_" + todayStr;
		/** 유저 환경 */
		String userAgent = request.getHeader("User-Agent");
		/** 파일이름 인코딩 */
		if (userAgent.indexOf("MSIE 5.5") > -1) { // MS IE 5.5 이하
			fileName = URLEncoder.encode(fileName, "utf-8");
		} else if (userAgent.indexOf("MSIE") > -1) { // MS IE (보통은 6.x 이상 가정)
			fileName = URLEncoder.encode(fileName, "utf-8");
		} else if (userAgent.indexOf("Trident") > -1) { // MS IE 11
			fileName = URLEncoder.encode(fileName, "utf-8");
		} else if (userAgent.indexOf("Chrome") > -1) {
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < fileName.length(); i++) {
				char c = fileName.charAt(i);
				if (c > '~') {
					sb.append(URLEncoder.encode("" + c, "UTF-8"));
				} else {
					sb.append(c);
				}
			}
			fileName = sb.toString();
		} else if (userAgent.indexOf("Opera") > -1) {
			fileName = new String(fileName.getBytes("UTF-8"), "8859_1");
		} else if (userAgent.indexOf("Firefox") > -1) {
			fileName = "\"" + new String(fileName.getBytes("UTF-8"), "8859_1") + "\"";
		} else {
			fileName = new String(fileName.getBytes("utf-8"), "iso-8859-1");
		}

		/** 출력 할 엑셀 리스트 데이터 가져오기 */
		List<EgovMap> excelList = (List<EgovMap>) model.get("excelList");
		/** 출력 데이터 존재여부 체크 */
		if (excelList.size() > 0) {
			response.setHeader("Content-Disposition", "ATTachment; Filename=" + fileName + ".xls");
			response.setHeader("Content-Transfer-Encoding", "binary");
			/** sheet 변수선언 */
			HSSFSheet worksheet = null;
			/** row 변수서언 */
			HSSFRow row = null;
			/** cell 변수선언 */
			HSSFCell cell = null;
			/** 워크 시트 생성 */
			worksheet = workbook.createSheet();
			/** 타이틀 키셋 */
			List<String> keyList = excelList.get(0).keyList();
			/** 컬럼 갯수 가져오기 */
			int columnTitleNum = keyList.size();
			/** 첫행 선언 */
			int rowNum = 0;
			/** 엑셀리스트 제목 폰트 */
			Font headFont = workbook.createFont();
			headFont.setFontHeightInPoints((short) 15);
			headFont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
			headFont.setFontName("돋움체");
			/** 컬럼명 폰트 */
			Font coulmnFont = workbook.createFont();
			coulmnFont.setFontHeightInPoints((short) 11);
			coulmnFont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
			coulmnFont.setFontName("돋움체");
			/** 데이터 폰트 */
			Font dataFont = workbook.createFont();
			dataFont.setFontHeightInPoints((short) 10);
			dataFont.setFontName("돋움체");
			/** 엑셀리스트 제목 스타일 */
			CellStyle headStyle = workbook.createCellStyle();
			headStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
			headStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
			headStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
			headStyle.setFillForegroundColor(HSSFColor.WHITE.index);
			headStyle.setBorderRight(HSSFCellStyle.BORDER_THIN);
			headStyle.setBorderLeft(HSSFCellStyle.BORDER_THIN);
			headStyle.setBorderTop(HSSFCellStyle.BORDER_THIN);
			headStyle.setBorderBottom(HSSFCellStyle.BORDER_THIN);
			headStyle.setFont(headFont);
			/** 컬럼명 스타일 */
			CellStyle coulmnNameStyle = workbook.createCellStyle();
			coulmnNameStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
			coulmnNameStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
			coulmnNameStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
			coulmnNameStyle.setFillForegroundColor(HSSFColor.PALE_BLUE.index);
			coulmnNameStyle.setBorderRight(HSSFCellStyle.BORDER_THIN);
			coulmnNameStyle.setBorderLeft(HSSFCellStyle.BORDER_THIN);
			coulmnNameStyle.setBorderTop(HSSFCellStyle.BORDER_THIN);
			coulmnNameStyle.setBorderBottom(HSSFCellStyle.BORDER_THIN);
			coulmnNameStyle.setFont(coulmnFont);
			/** 데이터 스타일 */
			CellStyle dataStyle = workbook.createCellStyle();
			dataStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
			dataStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
			dataStyle.setBorderRight(HSSFCellStyle.BORDER_THIN);
			dataStyle.setBorderLeft(HSSFCellStyle.BORDER_THIN);
			dataStyle.setBorderTop(HSSFCellStyle.BORDER_THIN);
			dataStyle.setBorderBottom(HSSFCellStyle.BORDER_THIN);
			dataStyle.setWrapText(true);
			dataStyle.setFont(dataFont);
			/** 제목라인 */
			row = worksheet.createRow(rowNum);
			row.setHeight((short) 500);
			for (int i = 0; i < columnTitleNum; i++) {
				cell = row.createCell(i);
				if (i == 0) {
					cell.setCellValue(excelName);
				}
				cell.setCellStyle(headStyle);
			}
			/** 셀 병합 */
			worksheet.addMergedRegion(new CellRangeAddress(rowNum, 0, 0, columnTitleNum - 1));
			rowNum += 1;
			/** 컬럼 라인 */
			row = worksheet.createRow(rowNum);
			row.setHeight((short) 400);
			for (int i = 0; i < columnTitleNum; i++) {
				cell = row.createCell(i);
				cell.setCellValue(keyList.get(i));
				cell.setCellStyle(coulmnNameStyle);
			}
			rowNum += 1;
			/** 데이터 라인 */
			for (int i = rowNum; i < (excelList.size() + rowNum); i++) {
				row = worksheet.createRow(i);
				for (int j = 0; j < columnTitleNum; j++) {
					cell = row.createCell(j);
					cell.setCellValue(String.valueOf(excelList.get(i - rowNum).get(keyList.get(j))));
					cell.setCellStyle(dataStyle);
				}
			}
			/** 컬럼 사이즈 */
			for (int i = 0; i < columnTitleNum; i++) {
				worksheet.autoSizeColumn(i);
				worksheet.setColumnWidth(i, (worksheet.getColumnWidth(i)) + 1000);
			}
			/** 출력 데이터 없을 시에 alert창 */
		} else {
			String rtnStr = "<script>alert('출력할 데이터가 없습니다.');</script>";
			response.setContentType("text/html; charset=UTF-8");
			OutputStream out = response.getOutputStream();
			out.write(rtnStr.getBytes());
			out.flush();
		}
	}
}
