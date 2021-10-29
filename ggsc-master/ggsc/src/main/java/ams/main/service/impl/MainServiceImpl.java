package ams.main.service.impl;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.StringReader;
import java.nio.charset.Charset;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.itextpdf.text.Document;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.tool.xml.XMLWorker;
import com.itextpdf.tool.xml.XMLWorkerFontProvider;
import com.itextpdf.tool.xml.XMLWorkerHelper;
import com.itextpdf.tool.xml.css.CssFile;
import com.itextpdf.tool.xml.css.StyleAttrCSSResolver;
import com.itextpdf.tool.xml.html.CssAppliers;
import com.itextpdf.tool.xml.html.CssAppliersImpl;
import com.itextpdf.tool.xml.html.Tags;
import com.itextpdf.tool.xml.parser.XMLParser;
import com.itextpdf.tool.xml.pipeline.css.CSSResolver;
import com.itextpdf.tool.xml.pipeline.css.CssResolverPipeline;
import com.itextpdf.tool.xml.pipeline.end.PdfWriterPipeline;
import com.itextpdf.tool.xml.pipeline.html.HtmlPipeline;
import com.itextpdf.tool.xml.pipeline.html.HtmlPipelineContext;

import ams.main.mnu.service.MenuVO;
import ams.main.service.MainService;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("mainService")
public class MainServiceImpl extends EgovAbstractServiceImpl implements MainService {

	@Resource(name = "mainDao")
	private MainDAO mainDao;

	@Override
	public EgovMap getMainReport(EgovMap paramMap) {
		EgovMap resultMap = new EgovMap();
		resultMap.put("ext", getMainExtMonthReport(paramMap));
		resultMap.put("yc", mainDao.getMainYcReport(paramMap));
		resultMap.put("ovWeek", getMainOvWeekReport(paramMap));
		resultMap.put("ovMonth", mainDao.getMainOvMonthReport(paramMap));
		return resultMap;
	}

	@Override
	public List<?> getMainOvWeekReport(EgovMap paramMap) {
		return mainDao.getMainOvWeekReport(paramMap);
	}

	@Override
	public List<?> getMainExtMonthReport(EgovMap paramMap) {
		return mainDao.getMainExtReport(paramMap);
	}
	
}
