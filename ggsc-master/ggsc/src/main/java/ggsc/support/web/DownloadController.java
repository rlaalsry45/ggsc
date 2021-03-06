package ggsc.support.web;

import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.List;

import javax.annotation.Resource;
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
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.xhtmlrenderer.pdf.ITextFontResolver;
import org.xhtmlrenderer.pdf.ITextRenderer;

import com.itextpdf.text.pdf.BaseFont;

import ams.cmm.AMSComm;
import egovframework.com.cmm.util.EgovDateUtil;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import ggsc.cnsmng.service.CounselMngService;
import ggsc.cnsr.service.AdminManageService;
import ggsc.report.service.ReportService;
import ggsc.rorgmng.service.RelatedOrganMngService;
import ggsc.stats.service.ResultStatsService;
import ggsc.support.service.ExcelVO;
import ggsc.support.service.PdfVO;
import ggsc.support.service.SupportService;


@Controller

public class DownloadController {
	@Resource(name = "supportService")
	private SupportService supportService;
	
	@Resource(name = "counselMngService")
	private CounselMngService counselMngService;

	@Resource(name = "ReportService")
	private ReportService reportService;

	@Resource(name = "AdminManageService")
	private AdminManageService adminManageService;

	@Resource(name = "RelatedOrganMngService")
	private RelatedOrganMngService relatedOrganMngService;
	
	@Resource(name = "ResultStatsService")
	private ResultStatsService resultStatsService;
	
	@RequestMapping(value = "/pdfDownload.do", method = { RequestMethod.POST, RequestMethod.GET })
	public void pdfDown(HttpServletRequest request, PdfVO vo, HttpServletResponse response) {
	
		vo.setNumber( Integer.parseInt(request.getParameter("Number").toString()));
		vo.setNum( Integer.parseInt(request.getParameter("num").toString()));
		String inputFile = utility.func.pdfTemplatePath + vo.getTemplateName() + ".html";
		String fontPath = utility.func.pdfTemplatePath + "NanumGothic-Bold.ttf";
		
		EgovMap result = supportService.PDFDownload(vo, vo.getTemplateSQLName()); 	
		if(result==null) {
			return;
		}
		
		try {
			InputStream is = new FileInputStream(inputFile);

			InputStreamReader isr = new InputStreamReader(is);
			BufferedReader buffer = new BufferedReader(isr);
			String tmp, content = "";
			while ((tmp = buffer.readLine()) != null) {
				content += tmp;
			}
			buffer.close();
			isr.close();
			
			if(vo.getTemplateSQLName().equals("PDFperCnsDtl")) {
				content = content.replaceAll("##?????????##", replaceText(result.get("centerNm")))
						.replaceAll("##??????1##", replaceText(result.get("sign1")))
						.replaceAll("##????????????##", replaceText(result.get("cnsStat")))
						.replaceAll("##????????????##", replaceText(result.get("cnsGb")))
						.replaceAll("##????????????##", replaceText(result.get("cnsCnt")))
						.replaceAll("##???????????????##", replaceText(result.get("cnsrGb")))
						.replaceAll("##????????????##", replaceText(result.get("cnsrNm")))
						.replaceAll("##????????????##", replaceText(result.get("cnsleNm")))
						.replaceAll("##????????????##", replaceText(result.get("birthDt")))
						.replaceAll("##??????##", replaceText(result.get("gender")))
						.replaceAll("##??????##", replaceText(result.get("addr")))
						.replaceAll("##??????????????????##", replaceText(result.get("mobile")))
						.replaceAll("##???????????????##", replaceText(result.get("emgcyTel")))
						.replaceAll("##??????????????????##", replaceText(result.get("cnsEfftPlace")))
						.replaceAll("##??????????????????##", replaceText(result.get("cnsRsvtPlace")))
						.replaceAll("##?????????????????????##", replaceText(result.get("cnsRsvtDt")))
						.replaceAll("##???????????????##", replaceText(result.get("emgcyUrgt")))
						.replaceAll("##????????????##", replaceText(result.get("killsOptn")))
						.replaceAll("##????????????????????????##", replaceText(result.get("ahydSuptYn")))
						.replaceAll("##?????????##", replaceText(result.get("ahydAcptDt")))
						.replaceAll("##?????????##", replaceText(result.get("ahydEndDt")))
						.replaceAll("##????????????##", replaceText(result.get("abusOptn")))
						.replaceAll("##????????????##", replaceText(result.get("cnsMethd")))
						.replaceAll("##??????????????????##", replaceText(result.get("cnsleRel")))
						.replaceAll("##???????????????##", replaceText(result.get("majorApplCd")))
						.replaceAll("##???????????????##", replaceText(result.get("killsRskn")))
						.replaceAll("##????????????##", replaceText(result.get("psycQust")))
						.replaceAll("##??????????????????##", replaceText(result.get("perRelQust")))
						.replaceAll("##??????##", replaceText(result.get("psng")))
						.replaceAll("##??????##", replaceText(result.get("dmta")))
						.replaceAll("##????????????##", replaceText(result.get("dsm")))
						.replaceAll("##????????????##", replaceText(result.get("helthQust")))
						.replaceAll("##????????????##", replaceText(result.get("econoQust")))
						.replaceAll("##????????????##", replaceText(result.get("cnsCntn"))).replaceAll("&ldquo;", "&quot;").replaceAll("&rdquo;", "&quot;")
						.replaceAll("##?????????????????????##", replaceText(result.get("cnsItvtLink"))).replaceAll("&ldquo;", "&quot;").replaceAll("&rdquo;", "&quot;")
						.replaceAll("##???????????? ?????? ??? ????????????##", replaceText(result.get("cnsCntEvatCntn"))).replaceAll("&ldquo;", "&quot;").replaceAll("&rdquo;", "&quot;")
						.replaceAll("##????????????##", replaceText(result.get("daftMng"))).replaceAll("&ldquo;", "&quot;").replaceAll("&rdquo;", "&quot;")
						.replaceAll("##????????????????????????##", replaceText(result.get("emotCptvDegr")))
						.replaceAll("##??????????????????##", replaceText(result.get("helpDegr")))
						.replaceAll("##??????????????????????????????##", replaceText(result.get("cnsChngDegr")))
						.replaceAll("##????????????##", replaceText(result.get("cnsDt")))
						.replaceAll("##??????##", replaceText(result.get("cnsDtWeekCd")))
						.replaceAll("##???##", replaceText(result.get("cnsDtStdHour")))
						.replaceAll("##???##", replaceText(result.get("cnsDtStdMin")))
						.replaceAll("##???2##", replaceText(result.get("cnsDtEndHour")))
						.replaceAll("##???2##", replaceText(result.get("cnsDtEndMin")))
						.replaceAll("##???##", replaceText(result.get("cnsTimeTotMin")))
						.replaceAll("##????????????2##", replaceText(result.get("cnsRsvtDt")))
						.replaceAll("##??????2##", replaceText(result.get("cnsRsvtWeekCd")))
						.replaceAll("##???3##", replaceText(result.get("cnsRsvtStrtHour")))
						.replaceAll("##???3##", replaceText(result.get("cnsRsvtStrtMin")))
						.replaceAll("##???4##", replaceText(result.get("cnsRsvtEndHour")))
						.replaceAll("##???4##", replaceText(result.get("cnsRsvtEndMin")))
						.replaceAll("##???2##", replaceText(result.get("cnsRsvtTotMin")))
						;
			} else if(vo.getTemplateSQLName().equals("PDFgCnsDtl")) {
				content = content.replaceAll("##?????????##", replaceText(result.get("centerNm")))
						.replaceAll("##????????????##", replaceText(result.get("cnsGb")))
						.replaceAll("##????????????##", replaceText(result.get("sigunGb")))
						.replaceAll("##????????????##", replaceText(result.get("centerGb")))
						.replaceAll("##???????????????##", replaceText(result.get("majorApplCd")))
						.replaceAll("##???????????????##", replaceText(result.get("pgrmNm")))
						.replaceAll("##??????##", replaceText(result.get("cnsCnt")))
						.replaceAll("##????????????##", replaceText(result.get("atvyDt")))
						.replaceAll("##????????????##", replaceText(result.get("atvyPlace")))
						.replaceAll("##?????????????????????##", replaceText(result.get("olderRel")))
						.replaceAll("##??????##", replaceText(result.get("leader")))
						.replaceAll("##????????????##", replaceText(result.get("leaderGb")))
						.replaceAll("##?????????##", replaceText(result.get("anchor")))
						.replaceAll("##?????????##", replaceText(result.get("inputNm")))
						.replaceAll("##?????????##", replaceText(result.get("atdeCnt")))
						.replaceAll("##????????????##", replaceText(result.get("atdeNm")))
						.replaceAll("##????????????##", replaceText(result.get("atvyTitle")))
						.replaceAll("##????????????##", replaceText(result.get("cnsType")))
						.replaceAll("##????????????##", replaceText(result.get("atvyGoal"))).replaceAll("&ldquo;", "&quot;").replaceAll("&rdquo;", "&quot;")
						.replaceAll("##??????????????????##", replaceText(result.get("pgrmCntn"))).replaceAll("&ldquo;", "&quot;").replaceAll("&rdquo;", "&quot;")
						.replaceAll("##??????##", replaceText(result.get("evat"))).replaceAll("&ldquo;", "&quot;").replaceAll("&rdquo;", "&quot;")
						.replaceAll("##????????????##", replaceText(result.get("afterPlan"))).replaceAll("&ldquo;", "&quot;").replaceAll("&rdquo;", "&quot;")
						.replaceAll("##??????##", replaceText(result.get("etc"))).replaceAll("&ldquo;", "&quot;").replaceAll("&rdquo;", "&quot;")
						.replaceAll("##???##", replaceText(result.get("atvyStrtHour")))
						.replaceAll("##???##", replaceText(result.get("atvyStrtMin")))
						.replaceAll("##???2##", replaceText(result.get("atvyEndHour")))
						.replaceAll("##???2##", replaceText(result.get("atvyEndMin")))
						.replaceAll("##???##", replaceText(result.get("atvyTotMin")))
						;
			}else {
				content = content.replaceAll("##?????????##", replaceText(result.get("centerNm")))
						.replaceAll("##caseNo##", replaceText(result.get("caseNo")))
						.replaceAll("##????????????##", replaceText(result.get("homepage")))
						.replaceAll("##??????1##", replaceText(result.get("sign1")))
						.replaceAll("##??????2##", replaceText(result.get("sign2")))
						.replaceAll("##??????##", replaceText(result.get("writeDt")))
						.replaceAll("##??????2##", replaceText(result.get("endDt")))
						.replaceAll("##????????????##", replaceText(result.get("rewdNo")))
						.replaceAll("##??????##", replaceText(result.get("stime")))
						.replaceAll("##????????????##", replaceText(result.get("birthDt")))
						.replaceAll("##??????##", replaceText(result.get("gender")))
						.replaceAll("##????????????##", replaceText(result.get("etime")))
						.replaceAll("##????????????##", replaceText(result.get("ttime")))
						.replaceAll("##??????1Y##", replaceText(result.get("survey1y")))
						.replaceAll("##??????1N##", replaceText(result.get("survey1n")))
						.replaceAll("##??????1??????##", replaceText(result.get("survey1str")))
						.replaceAll("##??????2Y##", replaceText(result.get("survey2y")))
						.replaceAll("##??????2N##", replaceText(result.get("survey2n")))
						.replaceAll("##??????2??????##", replaceText(result.get("survey2str")))
						.replaceAll("##??????3Y##", replaceText(result.get("survey3y")))
						.replaceAll("##??????3N##", replaceText(result.get("survey3n")))
						.replaceAll("##??????3??????##", replaceText(result.get("survey3str")))
						.replaceAll("##??????4Y##", replaceText(result.get("survey4y")))
						.replaceAll("##??????4N##", replaceText(result.get("survey4n")))
						.replaceAll("##??????5Y##", replaceText(result.get("survey5y")))
						.replaceAll("##??????5N##", replaceText(result.get("survey5n")))
						.replaceAll("##??????6Y##", replaceText(result.get("survey6y")))
						.replaceAll("##??????6N##", replaceText(result.get("survey6n")))
						.replaceAll("##??????7Y##", replaceText(result.get("survey7y")))
						.replaceAll("##??????7N##", replaceText(result.get("survey7n")))
						.replaceAll("##??????8Y##", replaceText(result.get("survey8y")))
						.replaceAll("##??????8N##", replaceText(result.get("survey8n")))
						.replaceAll("##??????9Y##", replaceText(result.get("survey9y")))
						.replaceAll("##??????9N##", replaceText(result.get("survey9n")))
						.replaceAll("##??????10Y##", replaceText(result.get("survey10y")))
						.replaceAll("##??????10N##", replaceText(result.get("survey10n")))
						.replaceAll("##??????11Y##", replaceText(result.get("survey11y")))
						.replaceAll("##??????11N##", replaceText(result.get("survey11n")))
						.replaceAll("##??????12Y##", replaceText(result.get("survey12y")))
						.replaceAll("##??????12N##", replaceText(result.get("survey12n")))
						.replaceAll("##??????13Y##", replaceText(result.get("survey13y")))
						.replaceAll("##??????13N##", replaceText(result.get("survey13n")))
						.replaceAll("##??????14Y##", replaceText(result.get("survey14y")))
						.replaceAll("##??????14N##", replaceText(result.get("survey14n")))
						.replaceAll("##??????15Y##", replaceText(result.get("survey15y")))
						.replaceAll("##??????15N##", replaceText(result.get("survey15n")))
						.replaceAll("##??????16Y##", replaceText(result.get("survey16y")))
						.replaceAll("##??????16N##", replaceText(result.get("survey16n")))
						.replaceAll("##??????17Y##", replaceText(result.get("survey17y")))
						.replaceAll("##??????17N##", replaceText(result.get("survey17n")))
						.replaceAll("##??????18Y##", replaceText(result.get("survey18y")))
						.replaceAll("##??????18N##", replaceText(result.get("survey18n")))
						
						.replaceAll("##??????19Y##", replaceText(result.get("survey19y")))
						.replaceAll("##??????19N##", replaceText(result.get("survey19n")))
						.replaceAll("##??????20Y##", replaceText(result.get("survey20y")))
						.replaceAll("##??????20N##", replaceText(result.get("survey20n")))
						.replaceAll("##??????21Y##", replaceText(result.get("survey21y")))
						.replaceAll("##??????21N##", replaceText(result.get("survey21n")))
						.replaceAll("##??????22Y##", replaceText(result.get("survey22y")))
						.replaceAll("##??????22N##", replaceText(result.get("survey22n")))
						.replaceAll("##??????23Y##", replaceText(result.get("survey23y")))
						.replaceAll("##??????23N##", replaceText(result.get("survey23n")))
						.replaceAll("##??????24Y##", replaceText(result.get("survey24y")))
						.replaceAll("##??????24N##", replaceText(result.get("survey24n")))
						.replaceAll("##??????25Y##", replaceText(result.get("survey25y")))
						.replaceAll("##??????25N##", replaceText(result.get("survey25n")))
						.replaceAll("##??????26Y##", replaceText(result.get("survey26y")))
						.replaceAll("##??????26N##", replaceText(result.get("survey26n")))
						.replaceAll("##??????27Y##", replaceText(result.get("survey27y")))
						.replaceAll("##??????27N##", replaceText(result.get("survey27n")))
						.replaceAll("##??????28Y##", replaceText(result.get("survey28y")))
						.replaceAll("##??????28N##", replaceText(result.get("survey28n")))
						.replaceAll("##??????29Y##", replaceText(result.get("survey29y")))
						.replaceAll("##??????29N##", replaceText(result.get("survey29n")))
						.replaceAll("##??????30Y##", replaceText(result.get("survey30y")))
						.replaceAll("##??????30N##", replaceText(result.get("survey30n")))
						.replaceAll("##??????31Y##", replaceText(result.get("survey31y")))
						.replaceAll("##??????31N##", replaceText(result.get("survey31n")))
						.replaceAll("##??????32Y##", replaceText(result.get("survey32y")))
						.replaceAll("##??????32N##", replaceText(result.get("survey32n")))
						
						.replaceAll("##??????33Y##", replaceText(result.get("survey33y")))
						.replaceAll("##??????33N##", replaceText(result.get("survey33n")))
						.replaceAll("##??????34Y##", replaceText(result.get("survey34y")))
						.replaceAll("##??????34N##", replaceText(result.get("survey34n")))
						.replaceAll("##??????35Y##", replaceText(result.get("survey35y")))
						.replaceAll("##??????35N##", replaceText(result.get("survey35n")))
						.replaceAll("##??????36Y##", replaceText(result.get("survey36y")))
						.replaceAll("##??????36N##", replaceText(result.get("survey36n")))
						.replaceAll("##??????37Y##", replaceText(result.get("survey37y")))
						.replaceAll("##??????37N##", replaceText(result.get("survey37n")))
						.replaceAll("##??????38Y##", replaceText(result.get("survey38y")))
						.replaceAll("##??????38N##", replaceText(result.get("survey38n")))
						.replaceAll("##??????39Y##", replaceText(result.get("survey39y")))
						.replaceAll("##??????39N##", replaceText(result.get("survey39n")))
						.replaceAll("##??????40Y##", replaceText(result.get("survey40y")))
						.replaceAll("##??????40N##", replaceText(result.get("survey40n")))
						.replaceAll("##??????41Y##", replaceText(result.get("survey41y")))
						.replaceAll("##??????41N##", replaceText(result.get("survey41n")))
						.replaceAll("##??????42Y##", replaceText(result.get("survey42y")))
						.replaceAll("##??????42N##", replaceText(result.get("survey42n")))
						.replaceAll("##??????43Y##", replaceText(result.get("survey43y")))
						.replaceAll("##??????43N##", replaceText(result.get("survey43n")))
						.replaceAll("##??????44Y##", replaceText(result.get("survey44y")))
						.replaceAll("##??????44N##", replaceText(result.get("survey44n")))
						.replaceAll("##??????45Y##", replaceText(result.get("survey45y")))
						.replaceAll("##??????45N##", replaceText(result.get("survey45n")))
						.replaceAll("##??????46Y##", replaceText(result.get("survey46y")))
						.replaceAll("##??????46N##", replaceText(result.get("survey46n")))
						
						.replaceAll("##??????47Y##", replaceText(result.get("survey47y")))
						.replaceAll("##??????47N##", replaceText(result.get("survey47n")))
						.replaceAll("##??????48Y##", replaceText(result.get("survey48y")))
						.replaceAll("##??????48N##", replaceText(result.get("survey48n")))
						.replaceAll("##??????49Y##", replaceText(result.get("survey49y")))
						.replaceAll("##??????49N##", replaceText(result.get("survey49n")))
						.replaceAll("##??????50Y##", replaceText(result.get("survey50y")))
						.replaceAll("##??????50N##", replaceText(result.get("survey50n")))
						.replaceAll("##??????51Y##", replaceText(result.get("survey51y")))
						.replaceAll("##??????51N##", replaceText(result.get("survey51n")))
						.replaceAll("##??????52Y##", replaceText(result.get("survey52y")))
						.replaceAll("##??????52N##", replaceText(result.get("survey52n")))
						.replaceAll("##??????53Y##", replaceText(result.get("survey53y")))
						.replaceAll("##??????53N##", replaceText(result.get("survey53n")))
						.replaceAll("##??????54Y##", replaceText(result.get("survey54y")))
						.replaceAll("##??????54N##", replaceText(result.get("survey54n")))
						.replaceAll("##??????55Y##", replaceText(result.get("survey55y")))
						.replaceAll("##??????55N##", replaceText(result.get("survey55n")))
						.replaceAll("##??????56Y##", replaceText(result.get("survey56y")))
						.replaceAll("##??????56N##", replaceText(result.get("survey56n")))
						.replaceAll("##??????57Y##", replaceText(result.get("survey57y")))
						.replaceAll("##??????57N##", replaceText(result.get("survey57n")))
						.replaceAll("##??????58Y##", replaceText(result.get("survey58y")))
						.replaceAll("##??????58N##", replaceText(result.get("survey58n")))
						.replaceAll("##??????59Y##", replaceText(result.get("survey59y")))
						.replaceAll("##??????59N##", replaceText(result.get("survey59n")))
						.replaceAll("##??????60Y##", replaceText(result.get("survey60y")))
						.replaceAll("##??????60N##", replaceText(result.get("survey60n")))
						
						.replaceAll("##??????61Y##", replaceText(result.get("survey61y")))
						.replaceAll("##??????61N##", replaceText(result.get("survey61n")))
						.replaceAll("##??????62Y##", replaceText(result.get("survey62y")))
						.replaceAll("##??????62N##", replaceText(result.get("survey62n")))
						.replaceAll("##??????63Y##", replaceText(result.get("survey63y")))
						.replaceAll("##??????63N##", replaceText(result.get("survey63n")))
						.replaceAll("##??????64Y##", replaceText(result.get("survey64y")))
						.replaceAll("##??????64N##", replaceText(result.get("survey64n")))
						
						.replaceAll("##??????65Y##", replaceText(result.get("survey65y")))
						.replaceAll("##??????65N##", replaceText(result.get("survey65n")))
						.replaceAll("##??????66Y##", replaceText(result.get("survey66y")))
						.replaceAll("##??????66N##", replaceText(result.get("survey66n")))
						.replaceAll("##??????67Y##", replaceText(result.get("survey67y")))
						.replaceAll("##??????67N##", replaceText(result.get("survey67n")))
						.replaceAll("##??????68Y##", replaceText(result.get("survey68y")))
						.replaceAll("##??????68N##", replaceText(result.get("survey68n")))
						.replaceAll("##??????69Y##", replaceText(result.get("survey69y")))
						.replaceAll("##??????69N##", replaceText(result.get("survey69n")))
						.replaceAll("##??????70Y##", replaceText(result.get("survey70y")))
						.replaceAll("##??????70N##", replaceText(result.get("survey70n")))
						.replaceAll("##??????71Y##", replaceText(result.get("survey71y")))
						.replaceAll("##??????71N##", replaceText(result.get("survey71n")))
						.replaceAll("##??????72Y##", replaceText(result.get("survey72y")))
						.replaceAll("##??????72N##", replaceText(result.get("survey72n")))
						.replaceAll("##??????73Y##", replaceText(result.get("survey73y")))
						.replaceAll("##??????73N##", replaceText(result.get("survey73n")))
						.replaceAll("##??????74Y##", replaceText(result.get("survey74y")))
						.replaceAll("##??????74N##", replaceText(result.get("survey74n")))
						.replaceAll("##??????75Y##", replaceText(result.get("survey75y")))
						.replaceAll("##??????75N##", replaceText(result.get("survey75n")))
						.replaceAll("##??????76Y##", replaceText(result.get("survey76y")))
						.replaceAll("##??????76N##", replaceText(result.get("survey76n")))
						.replaceAll("##??????77Y##", replaceText(result.get("survey77y")))
						.replaceAll("##??????77N##", replaceText(result.get("survey77n")))
						.replaceAll("##??????78Y##", replaceText(result.get("survey78y")))
						.replaceAll("##??????78N##", replaceText(result.get("survey78n")))
						.replaceAll("##??????79Y##", replaceText(result.get("survey79y")))
						.replaceAll("##??????79N##", replaceText(result.get("survey79n")))
						.replaceAll("##??????80Y##", replaceText(result.get("survey80y")))
						.replaceAll("##??????80N##", replaceText(result.get("survey80n")))
						.replaceAll("##??????81Y##", replaceText(result.get("survey81y")))
						.replaceAll("##??????81N##", replaceText(result.get("survey81n")))
						.replaceAll("##??????82Y##", replaceText(result.get("survey82y")))
						.replaceAll("##??????82N##", replaceText(result.get("survey82n")))
						.replaceAll("##??????83Y##", replaceText(result.get("survey83y")))
						.replaceAll("##??????83N##", replaceText(result.get("survey83n")))
						.replaceAll("##??????84Y##", replaceText(result.get("survey84y")))
						.replaceAll("##??????84N##", replaceText(result.get("survey84n")))
						.replaceAll("##??????85Y##", replaceText(result.get("survey85y")))
						.replaceAll("##??????85N##", replaceText(result.get("survey85n")))
						.replaceAll("##??????86Y##", replaceText(result.get("survey86y")))
						.replaceAll("##??????86N##", replaceText(result.get("survey86n")))
						
						.replaceAll("##Y??????##", replaceText(result.get("toty")))
						.replaceAll("##N??????##", replaceText(result.get("totn")))
						.replaceAll("##?????????Y??????##", replaceText(result.get("ctoty")))
						.replaceAll("##?????????##", replaceText(result.get("cot")))
						.replaceAll("##?????????ID##", replaceText(result.get("cnsrId")))
						.replaceAll("##?????????##", replaceText(result.get("cnsrNm")))
						.replaceAll("##????????????##", replaceText(result.get("cnsMethd")))
						.replaceAll("##????????????##", replaceText(result.get("cnsDtl")))
						.replaceAll("##??????##", replaceText(result.get("olderRel")))
						.replaceAll("##?????????##", replaceText(result.get("mobile"), true))
						.replaceAll("##?????????2##", replaceText(result.get("tel"), true))
						.replaceAll("##??????##", replaceText(result.get("addr")))
						.replaceAll("##??????##", replaceText(result.get("edu")))
						.replaceAll("##????????????##", replaceText(result.get("decodeLvl")))
						.replaceAll("##??????##", replaceText(result.get("relg")))
						.replaceAll("##????????????##", replaceText(result.get("housingType")))
						.replaceAll("##????????????##", replaceText(result.get("houseType")))
						.replaceAll("##????????????##", replaceText(result.get("merrStat")))
						.replaceAll("##????????????##", replaceText(result.get("liveForm")))
						.replaceAll("##???????????????##", replaceText(result.get("majorApplCd")))
						.replaceAll("##????????????##", replaceText(result.get("cnsCntn")))
						.replaceAll("##????????????##", replaceText(result.get("psycExamCntn"))).replaceAll("&ldquo;", "&quot;").replaceAll("&rdquo;", "&quot;")
						.replaceAll("##???????????????##", replaceText(result.get("intrLinkCntn"))).replaceAll("&ldquo;", "&quot;").replaceAll("&rdquo;", "&quot;")
						.replaceAll("##??????##", replaceText(result.get("year")))
						.replaceAll("##???##", replaceText(result.get("month")))
						.replaceAll("##???##", replaceText(result.get("day")))
						.replaceAll("##???????????????##", replaceText(result.get("myselfAgre")))
						.replaceAll("##?????????##", replaceText(result.get("guardian")))
						.replaceAll("##??????##", replaceText(result.get("name")))
						// ================================================================
						.replaceAll("##????????????##", replaceText(result.get("cnsStat")))
						.replaceAll("##????????????##", replaceText(result.get("cnsGb")))
						.replaceAll("##????????????##", replaceText(result.get("cnsCnt")))
						.replaceAll("##???????????????##", replaceText(result.get("cnsDtlGbCd")))
						/*.replaceAll("##????????????##", replaceText(result.get("cnsrNm")))*/
						.replaceAll("##????????????##", replaceText(result.get("cnsleNm")))
						.replaceAll("##????????????##", replaceText(result.get("birthDt")))
						.replaceAll("##??????##", replaceText(result.get("gender")))
						.replaceAll("##??????##", replaceText(result.get("addr")))
						.replaceAll("##??????????????????##", replaceText(result.get("mobile")))
						.replaceAll("##???????????????##", replaceText(result.get("tel")))
						.replaceAll("##??????????????????##", replaceText(result.get("cnsEfftPlace")))
						.replaceAll("##??????????????????##", replaceText(result.get("cnsRsvtPlace")))
						.replaceAll("##????????????##", replaceText(result.get("cnsDt")))
						.replaceAll("##????????????##", replaceText(result.get("cnsDtWeekCd")))
						.replaceAll("##????????????1##", replaceText(result.get("stime")))
						.replaceAll("##????????????2##", replaceText(result.get("etime")))
						.replaceAll("##???????????????##", replaceText(result.get("ttime")))
						.replaceAll("##?????????????????????##", replaceText(result.get("cnsRsvtDt")))
						.replaceAll("##????????????????????????##", replaceText(result.get("cnsRsvtWeekCd")))
						.replaceAll("##????????????????????????1##", replaceText(result.get("srtime")))
						.replaceAll("##????????????????????????2##", replaceText(result.get("ertime")))
						.replaceAll("##???????????????????????????##", replaceText(result.get("trtime")))
						.replaceAll("##???????????????##", replaceText(result.get("emgcyUrgt")))
						.replaceAll("##????????????##", replaceText(result.get("killsOptn")))
						.replaceAll("##????????????????????????##", replaceText(result.get("ahydSuptYn")))
						.replaceAll("##???????????????##", replaceText(result.get("ahydAcptDt")))
						.replaceAll("##???????????????##", replaceText(result.get("ahydEndDt")))
						.replaceAll("##????????????##", replaceText(result.get("abusOptn")))
						.replaceAll("##????????????##", replaceText(result.get("cnsMethd")))
						.replaceAll("##??????????????????##", replaceText(result.get("cnsleRel")))
						.replaceAll("##???????????????##", replaceText(result.get("majorApplCd")))
						.replaceAll("##????????????##", replaceText(result.get("livgForm")))
						.replaceAll("##????????????##", replaceText(result.get("houseForm")))
						.replaceAll("##???????????????##", replaceText(result.get("houseChng")))
						.replaceAll("##????????????##", replaceText(result.get("merrStat")))
						.replaceAll("##????????????##", replaceText(result.get("liveForm")))
						.replaceAll("##????????????##", replaceText(result.get("sujtHelcyStat")))
						.replaceAll("##????????????##", replaceText(result.get("dignMhist")))
						.replaceAll("##?????????##", replaceText(result.get("mnds")))
						.replaceAll("##????????????##", replaceText(result.get("econoStat")))
						.replaceAll("##????????????????????????##", replaceText(result.get("recntFmlyDeth")))
						.replaceAll("##???????????????????????????##", replaceText(result.get("recntMmanDeth")))
						.replaceAll("##???????????????????????????##", replaceText(result.get("olderWorkPtptYn")))
						.replaceAll("##???????????????##", replaceText(result.get("killsRskn")))
						.replaceAll("##????????????##", replaceText(result.get("psycQust")))
						.replaceAll("##??????????????????##", replaceText(result.get("perRelQust")))
						.replaceAll("##??????##", replaceText(result.get("psng")))
						.replaceAll("##??????##", replaceText(result.get("dmta")))
						.replaceAll("##????????????##", replaceText(result.get("dsm")))
						.replaceAll("##????????????##", replaceText(result.get("helthQust")))
						.replaceAll("##????????????##", replaceText(result.get("econoQust")))
						.replaceAll("##????????????##", replaceText(result.get("lifeQust")))
						.replaceAll("##?????????????????????##", replaceText(result.get("cnsItvtLink"))).replaceAll("&ldquo;", "&quot;").replaceAll("&rdquo;", "&quot;")
						.replaceAll("##??????????????????##", replaceText(result.get("cnsCntEvatCntn"))).replaceAll("&ldquo;", "&quot;").replaceAll("&rdquo;", "&quot;")
						.replaceAll("##????????????##", replaceText(result.get("daftMng"))).replaceAll("&ldquo;", "&quot;").replaceAll("&rdquo;", "&quot;")
						.replaceAll("##????????????##", replaceText(result.get("cnsCntn"))).replaceAll("&ldquo;", "&quot;").replaceAll("&rdquo;", "&quot;")
						.replaceAll("##??????????????????##", replaceText(result.get("emotCptvDegr")))
						.replaceAll("##??????????????????##", replaceText(result.get("helpDegr")))
						.replaceAll("##????????????##", replaceText(result.get("cnsChngDegr")));
				
			}

			ITextRenderer renderer = new ITextRenderer();
			ITextFontResolver ifr = renderer.getFontResolver();
			ifr.addFont(fontPath, BaseFont.IDENTITY_H, true);
			renderer.setDocumentFromString(content);
			renderer.layout();

			OutputStream outputPDF;
			if (request.getParameter("test").toString().equals("1")) {
				String pdfFilePath = utility.func.filePath + "test.pdf";
				outputPDF = new FileOutputStream(pdfFilePath);
				renderer.createPDF(outputPDF);
			} else {
				System.out.println("FILE NAME : " + vo.getFileName());
				response.reset();
				response.setHeader("Content-Disposition", "attachment;filename=" + vo.getFileName() + ".pdf");
				response.setContentType("application/pdf");
				outputPDF = new BufferedOutputStream(response.getOutputStream());
				renderer.createPDF(outputPDF);
				outputPDF.flush();
			}
			outputPDF.close();

		} catch (FileNotFoundException e) {
			utility.func.Logging(this.getClass().getName(), "Fild Not Found");
		} catch (IOException e) {
			utility.func.Logging(this.getClass().getName(), "IOException");
		} catch (com.lowagie.text.DocumentException e) {
			utility.func.Logging(this.getClass().getName(), "Document Error");
		}

	}
	
	private String replaceText(Object object, boolean useFormat) {
		return object != null ? utility.func.Mobile_Replace(object.toString()) : "";
	}
	private String replaceText(Object object) {
		return object != null ? object.toString() : ""; 
	}
	
	
	@RequestMapping(value = "/excelDownLoad.do", method = RequestMethod.POST)
	public void excelDown(HttpServletRequest request, ExcelVO vo, HttpServletResponse response) throws IOException {
		// ?????? ?????? ??????
		EgovMap loginVo = (EgovMap) request.getSession().getAttribute("LoginVO");

		int userAuth, userCenterGb;
		try {
			userAuth = Integer.parseInt(loginVo.get("authCd").toString());
			userCenterGb = Integer.parseInt(loginVo.get("centerGb").toString());
			if (userAuth == 0)
				userAuth = 10;
		} catch (NumberFormatException err) {
			userAuth = 10;
			userCenterGb = 0;
			utility.func.Logging(this.getClass().getName(), "Auth Error : NumberFormat");
		} catch (NullPointerException err ) {
			userAuth = 10;
			userCenterGb = 0;
			utility.func.Logging(this.getClass().getName(), "Auth Error : Null");
		}

		if (userAuth > 1) { // ?????? ?????? ????????? ?????????
			vo.setSchCenterGb(Integer.toString(userCenterGb));
		}
		switch (userAuth) {
			case 1: vo.setAuthCd("1"); break; 
			case 2: vo.setAuthCd("2"); break; 
			case 3: vo.setAuthCd("3"); break; 
			default: vo.setAuthCd("4"); break; 
		}
		
		String regId = loginVo.get("userId").toString();
		vo.setRegId(regId);
		
		// ?????? ?????? ???
		
		
		

				
				
		List<EgovMap> list = null;
		switch (vo.getNumber()) {
			case 1: list = reportService.getCnsBookListExcel(vo); break; // ??????????????????
			case 2: list = reportService.getCnsEndBookListExcel(vo); break; // ??????????????????
			case 3: list = reportService.getNtwkMeetRptListExcel(vo); break; // ?????????????????????????????????
			case 4: list = reportService.getEduAtvyRptListExcel(vo); break; // ?????????????????????
			case 5: list = reportService.getPrAtvyRptListExcel(vo); break; // ????????????????????? // ?????? ??????
			case 6:
				vo.setSchGubun("0");
				list = reportService.getMindSharingListExcel(vo); break; // ????????????????????? // ?????? ??????
			case 7:
				vo.setSchGubun("1");
				list = reportService.getMindSharingListExcel(vo); break; // ????????????????????? // ?????? ??????
			case 8: list = reportService.getCnsEndListExcel(vo); break; // ?????????????????????
			case 9: list = reportService.getLinkOrgRptListExcel(vo); break; // ??????????????????????????? // ????????????
			case 10: list = counselMngService.getCnsAcptListExcel(vo); break; // ??????????????????
			case 11: list = adminManageService.getCnsrListExcel(vo); break; // ????????? ??????
			case 12: list = adminManageService.getCenterListExcel(vo); break; // ?????? ??????
			case 13: list = adminManageService.getGroupingListExcel(vo); break; // ?????? ??????
			case 14: list = relatedOrganMngService.getRelatedOrganMngListExcel(vo); break; // ???????????? ??????
			case 15: list = resultStatsService.getResultReportListExcel(vo); break; // ?????????????????????
			
			case 22: list = counselMngService.getPerCnsListExcel(vo); break; // ????????????
			case 23: list = counselMngService.getGcnsListExcel(vo); break; // ????????????
			case 26: list = resultStatsService.getPsyCnsStateListExcel(vo); break;
			case 28: list = counselMngService.getPretestListExcel(vo); break; // ????????????
			case 29: list = counselMngService.getEalyCnsDocListExcel(vo); break; // ?????????????????????
			case 30: list = counselMngService.getLinkageReqListExcel(vo); break; // ???????????????
		}

		OutputStream out = null;
		try {
			vo.init();
			vo.setList(list);
			
			HSSFWorkbook workbook = null;
	         XSSFWorkbook workbook2 = null;
	         vo.init();
	         vo.setList(list);
	         if(vo.getNumber() == 27) {
	            workbook2 = makeExcelFile(vo.getList(), vo.getMapKey(), vo.getHeader(), "Sheet1");
	         }else {
	            workbook = AMSComm.listExcelDownload(vo.getList(), vo.getMapKey(), vo.getHeader(), "Sheet1");
	         }
	         
	         response.reset();
	         response.setHeader("Content-Disposition", "attachment;filename=" + vo.getFileName() + ".xls");
	         response.setContentType("application/vnd.ms-excel");
	         out = new BufferedOutputStream(response.getOutputStream());
	         
	         if(workbook == null) {
	            workbook2.write(out);
	         }else {
	            workbook.write(out);
	         }


			out.flush();
		} catch (IOException e) {
			utility.func.Logging(this.getClass().getName(), "Excel Download Error");
		} finally {
			if (out != null)
				out.close();
		}

	}
	
	@RequestMapping(value = "/executeExcel.do")
	public void executeExcel() {
		resultStatsService.insertTotalResultReportList();
	}
	
	@RequestMapping(value = "/excelTestArea.do", method = RequestMethod.POST)
	public void excelTestArea(HttpServletRequest request, ExcelVO vo, HttpServletResponse response, HSSFWorkbook workbook) throws IOException {
		
		// ?????? ?????? ??????
		EgovMap loginVo = (EgovMap) request.getSession().getAttribute("LoginVO");

		int userAuth, userCenterGb;
		try {
			userAuth = Integer.parseInt(loginVo.get("authCd").toString());
			userCenterGb = Integer.parseInt(loginVo.get("centerGb").toString());
			if (userAuth == 0)
				userAuth = 10;
		} catch (NumberFormatException err) {
			userAuth = 10;
			userCenterGb = 0;
			utility.func.Logging(this.getClass().getName(), "Auth Error : NumberFormat");
		} catch (NullPointerException err ) {
			userAuth = 10;
			userCenterGb = 0;
			utility.func.Logging(this.getClass().getName(), "Auth Error : Null");
		}

		if (userAuth > 1) { // ?????? ?????? ????????? ?????????
			vo.setSchCenterGb(Integer.toString(userCenterGb));
		}
		// ?????? ?????? ???
		
		/** ??????fileName??? sheetName ?????? ??? ??? ???????????? */
		// String excelName = String.valueOf(model.get("excelName"));
		String excelName = "excel ???????????????";
		/** ?????? ?????? ???????????? */
		String todayStr = EgovDateUtil.getToday();
		/** ????????? ?????? */
		String fileName = excelName + "_" + todayStr;
		/** ?????? ?????? */
		String userAgent = request.getHeader("User-Agent");
		/** ???????????? ????????? */
		if (userAgent.indexOf("MSIE 5.5") > -1) { // MS IE 5.5 ??????
			fileName = URLEncoder.encode(fileName, "utf-8");
		} else if (userAgent.indexOf("MSIE") > -1) { // MS IE (????????? 6.x ?????? ??????)
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

		/** ?????? ??? ?????? ????????? ????????? ???????????? */
		// List<EgovMap> excelList = (List<EgovMap>) model.get("excelList");
		List<EgovMap> excelList = null;
		/*for(int i=1; i<5; i++) {
			vo.setCenterGb(String.valueOf(i));
			excelList = resultStatsService.getResultReportListExcel(vo);
			System.out.println("@@@@  "+excelList.get(0));
		}*/
		
		// excelList = resultStatsService.getResultReportListExcel(vo);
		/** ?????? ????????? ???????????? ?????? */
		// if (excelList.size() > 0) {
			response.setHeader("Content-Disposition", "ATTachment; Filename=" + fileName + ".xls");
			response.setHeader("Content-Transfer-Encoding", "binary");
			/** sheet ???????????? */
			HSSFSheet worksheet = null;
			/** row ???????????? */
			HSSFRow row = null;
			/** cell ???????????? */
			HSSFCell cell = null;
			/** ?????? ?????? ?????? */
			worksheet = workbook.createSheet();
			/** ????????? ?????? */
			//List<String> keyList = excelList.get(0).keyList();
			/** ?????? ?????? ???????????? */
			//int columnTitleNum = keyList.size();
			int columnTitleNum = 170;
			/** ?????? ?????? */
			int rowNum = 0;
			/** ??????????????? ?????? ?????? */
			Font headFont = workbook.createFont();
			headFont.setFontHeightInPoints((short) 10);
			headFont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
			headFont.setFontName("?????? ??????");
			/** ????????? ?????? */
			Font coulmnFont = workbook.createFont();
			coulmnFont.setFontHeightInPoints((short) 11);
			coulmnFont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
			coulmnFont.setFontName("?????????");
			/** ????????? ?????? */
			Font dataFont = workbook.createFont();
			dataFont.setFontHeightInPoints((short) 10);
			dataFont.setFontName("?????????");
			
			/** ??????????????? ?????? ????????? */
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
			
			CellStyle[] headStyleArr = new CellStyle[10];
			
			for(int i=1; i<10; i++) {
				headStyleArr[i] = workbook.createCellStyle();
				headStyleArr[i].setAlignment(HSSFCellStyle.ALIGN_CENTER);
				headStyleArr[i].setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
				headStyleArr[i].setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
				headStyleArr[i].setFillForegroundColor(HSSFColor.WHITE.index);
				headStyleArr[i].setBorderRight(HSSFCellStyle.BORDER_THIN);
				headStyleArr[i].setBorderLeft(HSSFCellStyle.BORDER_THIN);
				headStyleArr[i].setBorderTop(HSSFCellStyle.BORDER_THIN);
				headStyleArr[i].setBorderBottom(HSSFCellStyle.BORDER_THIN);
				headStyleArr[i].setFont(headFont);
			}
			headStyleArr[1].setFillForegroundColor(HSSFColor.GREY_25_PERCENT.index);
			headStyleArr[2].setFillForegroundColor(HSSFColor.AQUA.index);
			headStyleArr[3].setFillForegroundColor(HSSFColor.ROSE.index);
			headStyleArr[4].setFillForegroundColor(HSSFColor.PALE_BLUE.index);
			headStyleArr[5].setFillForegroundColor(HSSFColor.LAVENDER.index);
			headStyleArr[6].setFillForegroundColor(HSSFColor.TURQUOISE.index);
			headStyleArr[7].setFillForegroundColor(HSSFColor.CORNFLOWER_BLUE.index);
			headStyleArr[8].setFillForegroundColor(HSSFColor.TAN.index);
			headStyleArr[9].setFillForegroundColor(HSSFColor.LEMON_CHIFFON.index);
			
			/** ????????? ????????? */
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
			/** ????????? ????????? */
			CellStyle dataStyle = workbook.createCellStyle();
			dataStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
			dataStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
			dataStyle.setBorderRight(HSSFCellStyle.BORDER_THIN);
			dataStyle.setBorderLeft(HSSFCellStyle.BORDER_THIN);
			dataStyle.setBorderTop(HSSFCellStyle.BORDER_THIN);
			dataStyle.setBorderBottom(HSSFCellStyle.BORDER_THIN);
			dataStyle.setWrapText(true);
			dataStyle.setFont(dataFont);
			
			// ??? ?????? ??????
			worksheet.autoSizeColumn(0);
			worksheet.setColumnWidth(0, (worksheet.getColumnWidth(0))+(short)250);
			worksheet.autoSizeColumn(1);
			worksheet.setColumnWidth(1, (worksheet.getColumnWidth(1))+(short)4096);
			// ??? ?????? ??????
			for (int i=2; i<=columnTitleNum; i++){
				worksheet.autoSizeColumn(i);
				worksheet.setColumnWidth(i, (worksheet.getColumnWidth(i))+(short)1024);
			}


		
			
			// ????????? row
			row = worksheet.createRow(0);
			row.setHeight((short) 700);
			
			worksheet.addMergedRegion(new CellRangeAddress(0, 3, 0, 0));
			cell = row.createCell(0);
			cell.setCellStyle(headStyle);
			cell.setCellValue("??????");
			worksheet.addMergedRegion(new CellRangeAddress(0, 3, 1, 1));
			cell = row.createCell(1);
			cell.setCellStyle(headStyle);
			cell.setCellValue("????????????");
			
			worksheet.addMergedRegion(new CellRangeAddress(0, 0, 2, 9));
			for(int i=2; i<10; i++) {
				cell = row.createCell(i);
				cell.setCellStyle(headStyleArr[2]);
				cell.setCellValue("1-1. ??????");
			}
			
			for (int i = 0; i < columnTitleNum; i++) {
				worksheet.autoSizeColumn(i);
				worksheet.setColumnWidth(i, (worksheet.getColumnWidth(i)) + 1000);
			}
			
			worksheet.addMergedRegion(new CellRangeAddress(0, 0, 10, 17));
			cell = row.createCell(10);
			cell.setCellStyle(headStyleArr[2]);
			cell.setCellValue("1-2. ??????????????? ??????");
			
			worksheet.addMergedRegion(new CellRangeAddress(0, 0, 18, 29));
			cell = row.createCell(18);
			cell.setCellStyle(headStyleArr[2]);
			cell.setCellValue("1-3. ????????? ??????");
			
			worksheet.addMergedRegion(new CellRangeAddress(0, 0, 30, 43));
			cell = row.createCell(30);
			cell.setCellStyle(headStyleArr[3]);
			cell.setCellValue("2. ????????????");
			
			worksheet.addMergedRegion(new CellRangeAddress(0, 0, 44, 58));
			cell = row.createCell(44);
			cell.setCellStyle(headStyleArr[4]);
			cell.setCellValue("3. ????????????");
			
			worksheet.addMergedRegion(new CellRangeAddress(0, 0, 59, 69));
			cell = row.createCell(59);
			cell.setCellStyle(headStyleArr[5]);
			cell.setCellValue("4-1. ????????????");
			
			worksheet.addMergedRegion(new CellRangeAddress(0, 0, 70, 89));
			cell = row.createCell(70);
			cell.setCellStyle(headStyleArr[5]);
			cell.setCellValue("4-2. ?????? ?????? ??? ??????");
			
			worksheet.addMergedRegion(new CellRangeAddress(0, 0, 90, 98));
			cell = row.createCell(90);
			cell.setCellStyle(headStyleArr[5]);
			cell.setCellValue("??? 4-3. ??????????????????");
			
			worksheet.addMergedRegion(new CellRangeAddress(0, 0, 99, 109));
			cell = row.createCell(99);
			cell.setCellStyle(headStyleArr[5]);
			cell.setCellValue("??? 4-4. ????????????");
			
			worksheet.addMergedRegion(new CellRangeAddress(0, 0, 110, 116));
			cell = row.createCell(110);
			cell.setCellStyle(headStyleArr[6]);
			cell.setCellValue("5. ????????????????????? ??????");
			
			worksheet.addMergedRegion(new CellRangeAddress(0, 0, 117, 123));
			cell = row.createCell(117);
			cell.setCellStyle(headStyleArr[7]);
			cell.setCellValue("6. ???????????? ??????");
			
			worksheet.addMergedRegion(new CellRangeAddress(0, 0, 124, 135));
			cell = row.createCell(124);
			cell.setCellStyle(headStyleArr[8]);
			cell.setCellValue("??? 7-1. ??????");
			
			worksheet.addMergedRegion(new CellRangeAddress(0, 0, 136, 141));
			cell = row.createCell(136);
			cell.setCellStyle(headStyleArr[8]);
			cell.setCellValue("??? 7-2. ????????????");
			
			worksheet.addMergedRegion(new CellRangeAddress(0, 0, 142, 157));
			cell = row.createCell(142);
			cell.setCellStyle(headStyleArr[8]);
			cell.setCellValue("??? 7-3. ??????");
			
			worksheet.addMergedRegion(new CellRangeAddress(0, 0, 158, 170));
			for(int i=158; i<171; i++) {
				cell = row.createCell(i);
				cell.setCellStyle(headStyleArr[9]);
				cell.setCellValue("8. ??????");
			}
			
			
			
			// ????????? row
			row = worksheet.createRow(1);
			row.setHeight((short) 700);
			worksheet.addMergedRegion(new CellRangeAddress(1, 1, 0, 0));
			cell = row.createCell(0);
			cell.setCellStyle(headStyle);
			worksheet.addMergedRegion(new CellRangeAddress(1, 2, 2, 3));
			cell = row.createCell(2);
			cell.setCellStyle(headStyleArr[2]);
			cell.setCellValue("???");
			worksheet.addMergedRegion(new CellRangeAddress(1, 1, 4, 9));
			for(int i=4; i<10; i++) {
				cell = row.createCell(i);
				cell.setCellStyle(headStyleArr[2]);
				cell.setCellValue("??????");				
			}
			
			worksheet.addMergedRegion(new CellRangeAddress(1, 2, 10, 10));
			cell = row.createCell(10);
			cell.setCellStyle(headStyleArr[2]);
			cell.setCellValue("???");
			worksheet.addMergedRegion(new CellRangeAddress(1, 2, 11, 11));
			cell = row.createCell(11);
			cell.setCellStyle(headStyleArr[2]);
			cell.setCellValue("??????");
			worksheet.addMergedRegion(new CellRangeAddress(1, 1, 12, 17));
			for(int i=12; i<18; i++) {
				cell = row.createCell(i);
				cell.setCellStyle(headStyleArr[2]);
				cell.setCellValue("?????? ???");			
			}
			
			worksheet.addMergedRegion(new CellRangeAddress(1, 2, 18, 19));
			cell = row.createCell(18);
			cell.setCellStyle(headStyleArr[2]);
			cell.setCellValue("???");
			cell = row.createCell(19);
			cell.setCellStyle(headStyleArr[2]);
			worksheet.addMergedRegion(new CellRangeAddress(1, 1, 20, 29));
			for(int i=20; i<30; i++) {
				cell = row.createCell(i);
				cell.setCellStyle(headStyleArr[2]);
				cell.setCellValue("??????");			
			}
			
			worksheet.addMergedRegion(new CellRangeAddress(1, 2, 30, 30));
			cell = row.createCell(30);
			cell.setCellStyle(headStyleArr[3]);
			cell.setCellValue("???(???)");
			worksheet.addMergedRegion(new CellRangeAddress(1, 2, 31, 31));
			cell = row.createCell(31);
			cell.setCellStyle(headStyleArr[3]);
			cell.setCellValue("?????? ????????? \r\n??????");
			cell = row.createCell(32);
			cell.setCellStyle(headStyleArr[3]);
			cell.setCellValue("?????? \n????????????");
			worksheet.addMergedRegion(new CellRangeAddress(1, 1, 33, 39));
			for(int i=33; i<40; i++) {
				cell = row.createCell(i);
				cell.setCellStyle(headStyleArr[3]);
				cell.setCellValue("?????? ????????????");			
			}
			worksheet.addMergedRegion(new CellRangeAddress(1, 2, 40, 40));
			cell = row.createCell(40);
			cell.setCellStyle(headStyleArr[3]);
			cell.setCellValue("????????? ??????");
			worksheet.addMergedRegion(new CellRangeAddress(1, 2, 41, 41));
			cell = row.createCell(41);
			cell.setCellStyle(headStyleArr[3]);
			cell.setCellValue("??????");
			worksheet.addMergedRegion(new CellRangeAddress(1, 2, 42, 42));
			cell = row.createCell(42);
			cell.setCellStyle(headStyleArr[3]);
			cell.setCellValue("??????-??????");
			worksheet.addMergedRegion(new CellRangeAddress(1, 2, 43, 43));
			cell = row.createCell(43);
			cell.setCellStyle(headStyleArr[3]);
			cell.setCellValue("?????? \n ?????????(???)");
			
			worksheet.addMergedRegion(new CellRangeAddress(1, 2, 44, 44));
			cell = row.createCell(44);
			cell.setCellStyle(headStyleArr[4]);
			cell.setCellValue("???(???)");
			worksheet.addMergedRegion(new CellRangeAddress(1, 1, 45, 50));
			for(int i=45; i<51; i++) {
				cell = row.createCell(i);
				cell.setCellStyle(headStyleArr[4]);
				cell.setCellValue("????????????(???)");
			}
			worksheet.addMergedRegion(new CellRangeAddress(1, 1, 51, 58));
			for(int i=51; i<59; i++) {
				cell = row.createCell(i);
				cell.setCellStyle(headStyleArr[4]);
				cell.setCellValue("????????????(???)");
			}
			worksheet.addMergedRegion(new CellRangeAddress(1, 2, 59, 59));
			cell = row.createCell(59);
			cell.setCellStyle(headStyleArr[5]);
			cell.setCellValue("???(???)");
			worksheet.addMergedRegion(new CellRangeAddress(1, 1, 60, 69));
			for(int i=60; i<70; i++) {
				cell = row.createCell(i);
				cell.setCellStyle(headStyleArr[5]);
				cell.setCellValue("????????? ??????");
			}
			
			worksheet.addMergedRegion(new CellRangeAddress(1, 2, 70, 70));
			cell = row.createCell(70);
			cell.setCellStyle(headStyleArr[5]);
			cell.setCellValue("???(???)");
			worksheet.addMergedRegion(new CellRangeAddress(1, 1, 71, 77));
			for(int i=71; i<78; i++) {
				cell = row.createCell(i);
				cell.setCellStyle(headStyleArr[5]);
				cell.setCellValue("?????? ??????");
			}
			worksheet.addMergedRegion(new CellRangeAddress(1, 1, 78, 89));
			for(int i=78; i<90; i++) {
				cell = row.createCell(i);
				cell.setCellStyle(headStyleArr[5]);
				cell.setCellValue("?????? ??????");
			}
			worksheet.addMergedRegion(new CellRangeAddress(1, 2, 90, 90));
			cell = row.createCell(90);
			cell.setCellStyle(headStyleArr[5]);
			cell.setCellValue("???(???)");
			worksheet.addMergedRegion(new CellRangeAddress(1, 1, 91, 93));
			for(int i=91; i<94; i++) {
				cell = row.createCell(i);
				cell.setCellStyle(headStyleArr[5]);
				cell.setCellValue("????????? ??????(1??? ??????)");
			}
			worksheet.addMergedRegion(new CellRangeAddress(1, 1, 94, 98));
			for(int i=94; i<99; i++) {
				cell = row.createCell(i);
				cell.setCellStyle(headStyleArr[5]);
				cell.setCellValue("????????????");
			}
			
			worksheet.addMergedRegion(new CellRangeAddress(1, 2, 99, 99));
			cell = row.createCell(99);
			cell.setCellStyle(headStyleArr[5]);
			cell.setCellValue("???(???)");
			worksheet.addMergedRegion(new CellRangeAddress(1, 1, 100, 109));
			for(int i=100; i<110; i++) {
				cell = row.createCell(i);
				cell.setCellStyle(headStyleArr[5]);
				cell.setCellValue("??? 4-4. ????????????");
			}
			
			worksheet.addMergedRegion(new CellRangeAddress(1, 2, 110, 110));
			cell = row.createCell(110);
			cell.setCellStyle(headStyleArr[6]);
			cell.setCellValue("???(???)");
			worksheet.addMergedRegion(new CellRangeAddress(1, 1, 111, 116));
			for(int i=111; i<117; i++) {
				cell = row.createCell(i);
				cell.setCellStyle(headStyleArr[6]);
				cell.setCellValue("5. ????????????????????? ??????");
			}
			
			worksheet.addMergedRegion(new CellRangeAddress(1, 2, 117, 117));
			cell = row.createCell(117);
			cell.setCellStyle(headStyleArr[7]);
			cell.setCellValue("???(???)");
			worksheet.addMergedRegion(new CellRangeAddress(1, 1, 118, 123));
			for(int i=118; i<124; i++) {
				cell = row.createCell(i);
				cell.setCellStyle(headStyleArr[7]);
				cell.setCellValue("6. ???????????? ??????");
			}
			
			worksheet.addMergedRegion(new CellRangeAddress(1, 2, 124, 125));
			cell = row.createCell(124);
			cell.setCellStyle(headStyleArr[8]);
			cell.setCellValue("???");
			cell = row.createCell(125);
			cell.setCellStyle(headStyleArr[8]);
			worksheet.addMergedRegion(new CellRangeAddress(1, 1, 126, 135));
			for(int i=126; i<136; i++) {
				cell = row.createCell(i);
				cell.setCellStyle(headStyleArr[8]);
				cell.setCellValue("????????????");
			}
			
			worksheet.addMergedRegion(new CellRangeAddress(1, 2, 136, 137));
			cell = row.createCell(136);
			cell.setCellStyle(headStyleArr[8]);
			cell.setCellValue("???");
			cell = row.createCell(137);
			cell.setCellStyle(headStyleArr[8]);
			worksheet.addMergedRegion(new CellRangeAddress(1, 1, 138, 141));
			for(int i=138; i<142; i++) {
				cell = row.createCell(i);
				cell.setCellStyle(headStyleArr[8]);
				cell.setCellValue("?????? ??????");
			}
			
			worksheet.addMergedRegion(new CellRangeAddress(1, 2, 142, 143));
			cell = row.createCell(142);
			cell.setCellStyle(headStyleArr[8]);
			cell.setCellValue("???");
			cell = row.createCell(143);
			cell.setCellStyle(headStyleArr[8]);
			worksheet.addMergedRegion(new CellRangeAddress(1, 1, 144, 157));
			for(int i=144; i<158; i++) {
				cell = row.createCell(i);
				cell.setCellStyle(headStyleArr[8]);
				cell.setCellValue("?????? ??????");
			}
			
			worksheet.addMergedRegion(new CellRangeAddress(1, 2, 158, 160));
			for(int i=158; i<161; i++) {
				cell = row.createCell(i);
				cell.setCellStyle(headStyleArr[9]);
				cell.setCellValue("???");
			}
			worksheet.addMergedRegion(new CellRangeAddress(1, 1, 161, 170));
			for(int i=161; i<171; i++) {
				cell = row.createCell(i);
				cell.setCellStyle(headStyleArr[9]);
				cell.setCellValue("??????");
			}
			
			// ????????? row
			row = worksheet.createRow(2);
			row.setHeight((short) 700);
			worksheet.addMergedRegion(new CellRangeAddress(2, 2, 0, 0));
			cell = row.createCell(0);
			cell.setCellStyle(headStyleArr[2]);
			worksheet.addMergedRegion(new CellRangeAddress(2, 2, 1, 1));
			cell = row.createCell(1);
			cell.setCellStyle(headStyleArr[2]);
			worksheet.addMergedRegion(new CellRangeAddress(2, 2, 4, 5));
			cell = row.createCell(4);
			cell.setCellStyle(headStyleArr[2]);
			cell.setCellValue("??????");
			cell = row.createCell(5);
			cell.setCellStyle(headStyleArr[2]);
			worksheet.addMergedRegion(new CellRangeAddress(2, 2, 6, 7));
			cell = row.createCell(6);
			cell.setCellStyle(headStyleArr[2]);
			cell.setCellValue("???");
			cell = row.createCell(7);
			cell.setCellStyle(headStyleArr[2]);
			worksheet.addMergedRegion(new CellRangeAddress(2, 2, 8, 9));
			cell = row.createCell(8);
			cell.setCellStyle(headStyleArr[2]);
			cell.setCellValue("???");
			cell = row.createCell(9);
			cell.setCellStyle(headStyleArr[2]);
			cell = row.createCell(10);
			cell.setCellStyle(headStyleArr[2]);
			
			cell = row.createCell(12);
			cell.setCellStyle(headStyleArr[2]);
			cell.setCellValue("??????");
			cell = row.createCell(13);
			cell.setCellStyle(headStyleArr[2]);
			cell.setCellValue("?????????");
			cell = row.createCell(14);
			cell.setCellStyle(headStyleArr[2]);
			cell.setCellValue("??????");
			cell = row.createCell(15);
			cell.setCellStyle(headStyleArr[2]);
			cell.setCellValue("?????????");
			cell = row.createCell(16);
			cell.setCellStyle(headStyleArr[2]);
			cell.setCellValue("??????");
			cell = row.createCell(17);
			cell.setCellStyle(headStyleArr[2]);
			cell.setCellValue("????????????");
			
			worksheet.addMergedRegion(new CellRangeAddress(2, 2, 20, 21));
			cell = row.createCell(20);
			cell.setCellStyle(headStyleArr[2]);
			cell.setCellValue("60???");
			worksheet.addMergedRegion(new CellRangeAddress(2, 2, 22, 23));
			cell = row.createCell(22);
			cell.setCellStyle(headStyleArr[2]);
			cell.setCellValue("70???");
			worksheet.addMergedRegion(new CellRangeAddress(2, 2, 24, 25));
			cell = row.createCell(24);
			cell.setCellStyle(headStyleArr[2]);
			cell.setCellValue("80???");
			worksheet.addMergedRegion(new CellRangeAddress(2, 2, 26, 27));
			cell = row.createCell(26);
			cell.setCellStyle(headStyleArr[2]);
			cell.setCellValue("90??? ??????");
			worksheet.addMergedRegion(new CellRangeAddress(2, 2, 28, 29));
			cell = row.createCell(28);
			cell.setCellStyle(headStyleArr[2]);
			cell.setCellValue("60??? ??????");
			cell = row.createCell(29);
			cell.setCellStyle(headStyleArr[2]);
			cell = row.createCell(30);
			cell.setCellStyle(headStyleArr[2]);
			cell = row.createCell(32);
			cell.setCellStyle(headStyleArr[3]);
			cell.setCellValue("????????????");
			cell = row.createCell(33);
			cell.setCellStyle(headStyleArr[3]);
			cell.setCellValue("??????");
			cell = row.createCell(34);
			cell.setCellStyle(headStyleArr[3]);
			cell.setCellValue("??????????????????");
			cell = row.createCell(35);
			cell.setCellStyle(headStyleArr[3]);
			cell.setCellValue("????????????\n????????????");
			cell = row.createCell(36);
			cell.setCellStyle(headStyleArr[3]);
			cell.setCellValue("????????????\n????????????");
			cell = row.createCell(37);
			cell.setCellStyle(headStyleArr[3]);
			cell.setCellValue("??????????????????");
			cell = row.createCell(38);
			cell.setCellStyle(headStyleArr[3]);
			cell.setCellValue("????????????");
			cell = row.createCell(39);
			cell.setCellStyle(headStyleArr[3]);
			cell.setCellValue("??????-??????");
			cell = row.createCell(40);
			cell.setCellStyle(headStyleArr[3]);
			cell = row.createCell(41);
			cell.setCellStyle(headStyleArr[3]);
			cell = row.createCell(42);
			cell.setCellStyle(headStyleArr[3]);
			cell = row.createCell(43);
			cell.setCellStyle(headStyleArr[3]);
			cell = row.createCell(45);
			cell.setCellStyle(headStyleArr[4]);
			cell.setCellValue("??????");
			cell = row.createCell(46);
			cell.setCellStyle(headStyleArr[4]);
			cell.setCellValue("??????");
			cell = row.createCell(47);
			cell.setCellStyle(headStyleArr[4]);
			cell.setCellValue("??????");
			cell = row.createCell(48);
			cell.setCellStyle(headStyleArr[4]);
			cell.setCellValue("??????");
			cell = row.createCell(49);
			cell.setCellStyle(headStyleArr[4]);
			cell.setCellValue("?????????");
			cell = row.createCell(50);
			cell.setCellStyle(headStyleArr[4]);
			cell.setCellValue("??????");
			cell = row.createCell(51);
			cell.setCellStyle(headStyleArr[4]);
			cell.setCellValue("??????");
			cell = row.createCell(52);
			cell.setCellStyle(headStyleArr[4]);
			cell.setCellValue("????????????");
			cell = row.createCell(53);
			cell.setCellStyle(headStyleArr[4]);
			cell.setCellValue("????????????");
			cell = row.createCell(54);
			cell.setCellStyle(headStyleArr[4]);
			cell.setCellValue("????????????\n????????????");
			cell = row.createCell(55);
			cell.setCellStyle(headStyleArr[4]);
			cell.setCellValue("??????????????");
			cell = row.createCell(56);
			cell.setCellStyle(headStyleArr[4]);
			cell.setCellValue("????????????");
			cell = row.createCell(57);
			cell.setCellStyle(headStyleArr[4]);
			cell.setCellValue("????????????");
			cell = row.createCell(58);
			cell.setCellStyle(headStyleArr[4]);
			cell.setCellValue("??????");
			
			cell = row.createCell(60);
			cell.setCellStyle(headStyleArr[5]);
			cell.setCellValue("????????????");
			cell = row.createCell(61);
			cell.setCellStyle(headStyleArr[5]);
			cell.setCellValue("????????????");
			cell = row.createCell(62);
			cell.setCellStyle(headStyleArr[5]);
			cell.setCellValue("??????");
			cell = row.createCell(63);
			cell.setCellStyle(headStyleArr[5]);
			cell.setCellValue("??????");
			cell = row.createCell(64);
			cell.setCellStyle(headStyleArr[5]);
			cell.setCellValue("??????, ??????");
			cell = row.createCell(65);
			cell.setCellStyle(headStyleArr[5]);
			cell.setCellValue("??????");
			cell = row.createCell(66);
			cell.setCellStyle(headStyleArr[5]);
			cell.setCellValue("???");
			cell = row.createCell(67);
			cell.setCellStyle(headStyleArr[5]);
			cell.setCellValue("??????");
			cell = row.createCell(68);
			cell.setCellStyle(headStyleArr[5]);
			cell.setCellValue("??????");
			cell = row.createCell(69);
			cell.setCellStyle(headStyleArr[5]);
			cell.setCellValue("??????");
			
			cell = row.createCell(71);
			cell.setCellStyle(headStyleArr[5]);
			cell.setCellValue("??????");
			cell = row.createCell(72);
			cell.setCellStyle(headStyleArr[5]);
			cell.setCellValue("??????");
			cell = row.createCell(73);
			cell.setCellStyle(headStyleArr[5]);
			cell.setCellValue("??????, ??????");
			cell = row.createCell(74);
			cell.setCellStyle(headStyleArr[5]);
			cell.setCellValue("????????????");
			cell = row.createCell(75);
			cell.setCellStyle(headStyleArr[5]);
			cell.setCellValue("??????, ?????????");
			cell = row.createCell(76);
			cell.setCellStyle(headStyleArr[5]);
			cell.setCellValue("??????, ?????????, ??????");
			cell = row.createCell(77);
			cell.setCellStyle(headStyleArr[5]);
			cell.setCellValue("??????");
			
			cell = row.createCell(78);
			cell.setCellStyle(headStyleArr[5]);
			cell.setCellValue("??????");
			cell = row.createCell(79);
			cell.setCellStyle(headStyleArr[5]);
			cell.setCellValue("???????????? ???????????? ??????");
			cell = row.createCell(80);
			cell.setCellStyle(headStyleArr[5]);
			cell.setCellValue("?????? ???????????? ??????");
			cell = row.createCell(81);
			cell.setCellStyle(headStyleArr[5]);
			cell.setCellValue("????????? ????????????");
			cell = row.createCell(82);
			cell.setCellStyle(headStyleArr[5]);
			cell.setCellValue("????????? ????????????");
			cell = row.createCell(83);
			cell.setCellStyle(headStyleArr[5]);
			cell.setCellValue("???????????? ?????? ????????????");
			cell = row.createCell(84);
			cell.setCellStyle(headStyleArr[5]);
			cell.setCellValue("????????????");
			cell = row.createCell(85);
			cell.setCellStyle(headStyleArr[5]);
			cell.setCellValue("?????????, ???????????? ?????????");
			cell = row.createCell(86);
			cell.setCellStyle(headStyleArr[5]);
			cell.setCellValue("???????????? ??????");
			cell = row.createCell(87);
			cell.setCellStyle(headStyleArr[5]);
			cell.setCellValue("???????????? ????????? ??????");
			cell = row.createCell(88);
			cell.setCellStyle(headStyleArr[5]);
			cell.setCellValue("???????????? ????????????");
			cell = row.createCell(89);
			cell.setCellStyle(headStyleArr[5]);
			cell.setCellValue("??????");
			
			cell = row.createCell(91);
			cell.setCellStyle(headStyleArr[5]);
			cell.setCellValue("??????");
			cell = row.createCell(92);
			cell.setCellStyle(headStyleArr[5]);
			cell.setCellValue("???????????? ??????");
			cell = row.createCell(93);
			cell.setCellStyle(headStyleArr[5]);
			cell.setCellValue("?????? ????????? ??????");
			cell = row.createCell(94);
			cell.setCellStyle(headStyleArr[5]);
			cell.setCellValue("??????");
			cell = row.createCell(95);
			cell.setCellStyle(headStyleArr[5]);
			cell.setCellValue("10?????? ??????");
			cell = row.createCell(96);
			cell.setCellStyle(headStyleArr[5]);
			cell.setCellValue("20?????? ??????");
			cell = row.createCell(97);
			cell.setCellStyle(headStyleArr[5]);
			cell.setCellValue("20?????? ?????? 30?????? ??????");
			cell = row.createCell(98);
			cell.setCellStyle(headStyleArr[5]);
			cell.setCellValue("30????????????");
			
			cell = row.createCell(100);
			cell.setCellStyle(headStyleArr[5]);
			cell.setCellValue("DUKE-AD ????????????");
			cell = row.createCell(101);
			cell.setCellStyle(headStyleArr[5]);
			cell.setCellValue("GDS-KR ????????????");
			cell = row.createCell(102);
			cell.setCellStyle(headStyleArr[5]);
			cell.setCellValue("GDS-SI ???????????? ????????????");
			cell = row.createCell(103);
			cell.setCellStyle(headStyleArr[5]);
			cell.setCellValue("??????");
			cell = row.createCell(104);
			cell.setCellStyle(headStyleArr[5]);
			cell.setCellValue("????????????");
			cell = row.createCell(105);
			cell.setCellStyle(headStyleArr[5]);
			cell.setCellValue("?????? ????????????");
			cell = row.createCell(106);
			cell.setCellStyle(headStyleArr[5]);
			cell.setCellValue("???????????? ??????");
			cell = row.createCell(107);
			cell.setCellStyle(headStyleArr[5]);
			cell.setCellValue("?????? ????????????");
			cell = row.createCell(108);
			cell.setCellStyle(headStyleArr[5]);
			cell.setCellValue("MMSE-K ????????????");
			cell = row.createCell(109);
			cell.setCellStyle(headStyleArr[5]);
			cell.setCellValue("??????");
			
			cell = row.createCell(111);
			cell.setCellStyle(headStyleArr[6]);
			cell.setCellValue("????????????-????????????(??????)");
			cell = row.createCell(112);
			cell.setCellStyle(headStyleArr[6]);
			cell.setCellValue("????????????-????????????(??????)");
			cell = row.createCell(113);
			cell.setCellStyle(headStyleArr[6]);
			cell.setCellValue("????????????");
			cell = row.createCell(114);
			cell.setCellStyle(headStyleArr[6]);
			cell.setCellValue("???????????? ??????");
			cell = row.createCell(115);
			cell.setCellStyle(headStyleArr[6]);
			cell.setCellValue("????????????");
			cell = row.createCell(116);
			cell.setCellStyle(headStyleArr[6]);
			cell.setCellValue("??????");
			
			cell = row.createCell(118);
			cell.setCellStyle(headStyleArr[7]);
			cell.setCellValue("???????????? ????????????");
			cell = row.createCell(119);
			cell.setCellStyle(headStyleArr[7]);
			cell.setCellValue("???????????? ??????");
			cell = row.createCell(120);
			cell.setCellStyle(headStyleArr[7]);
			cell.setCellValue("????????????");
			cell = row.createCell(121);
			cell.setCellStyle(headStyleArr[7]);
			cell.setCellValue("???????????? ????????????");
			cell = row.createCell(122);
			cell.setCellStyle(headStyleArr[7]);
			cell.setCellValue("???????????? ???????????? ??????");
			cell = row.createCell(123);
			cell.setCellStyle(headStyleArr[7]);
			cell.setCellValue("??????");
			
			worksheet.addMergedRegion(new CellRangeAddress(2, 2, 126, 127));
			cell = row.createCell(126);
			cell.setCellStyle(headStyleArr[8]);
			cell.setCellValue("??????");
			worksheet.addMergedRegion(new CellRangeAddress(2, 2, 128, 129));
			cell = row.createCell(128);
			cell.setCellStyle(headStyleArr[8]);
			cell.setCellValue("????????????");
			worksheet.addMergedRegion(new CellRangeAddress(2, 2, 130, 131));
			cell = row.createCell(130);
			cell.setCellStyle(headStyleArr[8]);
			cell.setCellValue("????????????");
			worksheet.addMergedRegion(new CellRangeAddress(2, 2, 132, 133));
			cell = row.createCell(132);
			cell.setCellStyle(headStyleArr[8]);
			cell.setCellValue("????????????");
			worksheet.addMergedRegion(new CellRangeAddress(2, 2, 134, 135));
			cell = row.createCell(134);
			cell.setCellStyle(headStyleArr[8]);
			cell.setCellValue("??????");
			cell = row.createCell(135);
			cell.setCellStyle(headStyleArr[8]);
			
			worksheet.addMergedRegion(new CellRangeAddress(2, 2, 138, 139));
			cell = row.createCell(138);
			cell.setCellStyle(headStyleArr[8]);
			cell.setCellValue("?????????");
			worksheet.addMergedRegion(new CellRangeAddress(2, 2, 140, 141));
			cell = row.createCell(140);
			cell.setCellStyle(headStyleArr[8]);
			cell.setCellValue("??????");
			cell = row.createCell(141);
			cell.setCellStyle(headStyleArr[8]);
			
			worksheet.addMergedRegion(new CellRangeAddress(2, 2, 144, 145));
			cell = row.createCell(144);
			cell.setCellStyle(headStyleArr[8]);
			cell.setCellValue("????????????");
			worksheet.addMergedRegion(new CellRangeAddress(2, 2, 146, 147));
			cell = row.createCell(146);
			cell.setCellStyle(headStyleArr[8]);
			cell.setCellValue("????????????");
			worksheet.addMergedRegion(new CellRangeAddress(2, 2, 148, 149));
			cell = row.createCell(148);
			cell.setCellStyle(headStyleArr[8]);
			cell.setCellValue("????????????");
			worksheet.addMergedRegion(new CellRangeAddress(2, 2, 150, 151));
			cell = row.createCell(150);
			cell.setCellStyle(headStyleArr[8]);
			cell.setCellValue("????????????");
			worksheet.addMergedRegion(new CellRangeAddress(2, 2, 152, 153));
			cell = row.createCell(152);
			cell.setCellStyle(headStyleArr[8]);
			cell.setCellValue("????????????");
			worksheet.addMergedRegion(new CellRangeAddress(2, 2, 154, 155));
			cell = row.createCell(154);
			cell.setCellStyle(headStyleArr[8]);
			cell.setCellValue("????????????");
			worksheet.addMergedRegion(new CellRangeAddress(2, 2, 156, 157));
			cell = row.createCell(156);
			cell.setCellStyle(headStyleArr[8]);
			cell.setCellValue("??????");
			cell = row.createCell(158);
			cell.setCellStyle(headStyleArr[8]);
			
			worksheet.addMergedRegion(new CellRangeAddress(2, 2, 161, 162));
			cell = row.createCell(161);
			cell.setCellStyle(headStyleArr[9]);
			cell.setCellValue("??????");
			worksheet.addMergedRegion(new CellRangeAddress(2, 2, 163, 164));
			cell = row.createCell(163);
			cell.setCellStyle(headStyleArr[9]);
			cell.setCellValue("????????????");
			cell = row.createCell(165);
			cell.setCellStyle(headStyleArr[9]);
			cell.setCellValue("????????????");
			cell = row.createCell(166);
			cell.setCellStyle(headStyleArr[9]);
			cell.setCellValue("?????????");
			cell = row.createCell(167);
			cell.setCellStyle(headStyleArr[9]);
			cell.setCellValue("?????????");
			worksheet.addMergedRegion(new CellRangeAddress(2, 2, 168, 169));
			cell = row.createCell(168);
			cell.setCellStyle(headStyleArr[9]);
			cell.setCellValue("????????????");
			cell = row.createCell(170);
			cell.setCellStyle(headStyleArr[9]);
			cell.setCellValue("??????");
			
			// ????????? row
			row = worksheet.createRow(3);
			row.setHeight((short) 400);
			worksheet.addMergedRegion(new CellRangeAddress(3, 3, 0, 0));
			cell = row.createCell(0);
			cell.setCellStyle(headStyle);
			worksheet.addMergedRegion(new CellRangeAddress(3, 3, 1, 1));
			cell = row.createCell(1);
			cell.setCellStyle(headStyle);
			cell = row.createCell(2);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(3);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(4);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(5);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(6);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(7);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(8);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(9);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			
			cell = row.createCell(10);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(11);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(12);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(13);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(14);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(15);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(16);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(17);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			
			cell = row.createCell(18);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(19);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(20);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(21);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(22);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(23);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(24);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(25);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(26);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(27);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(28);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(29);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			
			cell = row.createCell(30);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(31);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(32);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(33);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(34);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(35);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(36);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(37);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(38);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(39);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(40);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(41);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(42);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(43);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			
			cell = row.createCell(44);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(45);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(46);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(47);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(48);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(49);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(50);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(51);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(52);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(53);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(54);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(55);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(56);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(57);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(58);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			
			cell = row.createCell(59);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(60);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(61);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(62);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(63);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(64);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(65);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(66);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(67);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(68);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(69);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			
			cell = row.createCell(70);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(71);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(72);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(73);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(74);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(75);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(76);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(77);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(78);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(79);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(80);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(81);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(82);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(83);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(84);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(85);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(86);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(87);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(88);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(89);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			
			cell = row.createCell(90);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(91);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(92);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(93);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(94);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(95);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(96);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(97);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(98);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			
			cell = row.createCell(99);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(100);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(101);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(102);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(103);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(104);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(105);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(106);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(107);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(108);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(109);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			
			cell = row.createCell(110);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(111);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(112);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(113);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(114);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(115);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(116);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(117);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(118);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(119);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(120);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(121);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(122);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(123);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			
			cell = row.createCell(124);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(125);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(126);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(127);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(128);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(129);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(130);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(131);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(132);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(133);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(134);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(135);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(136);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(137);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(138);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(139);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(140);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(141);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			
			cell = row.createCell(142);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(143);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(144);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(145);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(146);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(147);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(148);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(149);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(150);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(151);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(152);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(153);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(154);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(155);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(156);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(157);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			
			cell = row.createCell(158);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(159);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(160);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???(???)");
			cell = row.createCell(161);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(162);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(163);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(164);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(165);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(166);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(167);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(168);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???");
			cell = row.createCell(169);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???(???)");
			cell = row.createCell(170);
			cell.setCellStyle(headStyleArr[1]);
			cell.setCellValue("???(???)");
			
			// ???????????? row
			/*row = worksheet.createRow(4);
			row.setHeight((short) 400);*/
			
			List<EgovMap> totalExcelList = null;
			totalExcelList = resultStatsService.getTotalResultReportListExcel(vo);
			row = worksheet.createRow(4);
			row.setHeight((short) 400);
			cell = row.createCell(1);
			cell.setCellStyle(headStyle);
			cell.setCellValue("??????");
			
			// ?????? row
			for(int i=1; i<columnTitleNum; i++) {
				cell = row.createCell(i+1);
				cell.setCellStyle(headStyle);
				String param = String.valueOf(totalExcelList.get(0).get("c"+String.valueOf(i)));
				cell.setCellValue(param);
			}
			
			// ???????????? row(59???)
			for(int i=1; i<60; i++) {
				row = worksheet.createRow(i+4);
				row.setHeight((short) 400);
				vo.setCenterGb(String.valueOf(i));
				excelList = resultStatsService.getResultReportListExcel(vo);
				for(int j=0; j<=columnTitleNum; j++) {
					cell = row.createCell(j);
					cell.setCellStyle(headStyle);
					String param = String.valueOf(excelList.get(0).get("c"+String.valueOf(j)));
					cell.setCellValue(param);
				}
			}
			
			/*for(int i=0; i<20; i++) {
				cell = row.createCell(i+1);
				cell.setCellStyle(headStyle);
				String idx = "c"+String.valueOf(i+1);
				String param = String.valueOf(excelList.get(0).get(idx));
				cell.setCellValue(param);
			}*/
			
			/*for(int i=0;i<3;i++) {
				worksheet.getRow(i);
				for(int z=0;z<5;z++) {
					cell = row.getCell(z);
					cell.setCellStyle(headStyle);
				}
					
			}*/
			// ???
			
			workbook.write(response.getOutputStream());
			workbook.close();
			
			/** ???????????? */
			/*row = worksheet.createRow(rowNum);
			row.setHeight((short) 500);
			for (int i = 0; i < columnTitleNum; i++) {
				cell = row.createCell(i);
				if (i == 0) {
					cell.setCellValue(excelName);
				}
				cell.setCellStyle(headStyle);
			}*/
			/** ??? ?????? */
			/*worksheet.addMergedRegion(new CellRangeAddress(rowNum, 0, 0, columnTitleNum - 1));
			rowNum += 1;*/
			/** ?????? ?????? */
			/*row = worksheet.createRow(rowNum);
			row.setHeight((short) 400);
			for (int i = 0; i < columnTitleNum; i++) {
				cell = row.createCell(i);
				cell.setCellValue(keyList.get(i));
				cell.setCellStyle(coulmnNameStyle);
			}
			rowNum += 1;*/
			/** ????????? ?????? */
			/*for (int i = rowNum; i < (excelList.size() + rowNum); i++) {
				row = worksheet.createRow(i);
				for (int j = 0; j < columnTitleNum; j++) {
					cell = row.createCell(j);
					cell.setCellValue(String.valueOf(excelList.get(i - rowNum).get(keyList.get(j))));
					cell.setCellStyle(dataStyle);
				}
			}*/
			/** ?????? ????????? */
			/*for (int i = 0; i < columnTitleNum; i++) {
				worksheet.autoSizeColumn(i);
				worksheet.setColumnWidth(i, (worksheet.getColumnWidth(i)) + 1000);
			}*/
			/** ?????? ????????? ?????? ?????? alert??? */
		/*} else {
			String rtnStr = "<script>alert('????????? ???????????? ????????????.');</script>";
			response.setContentType("text/html; charset=UTF-8");
			OutputStream out = response.getOutputStream();
			out.write(rtnStr.getBytes());
			out.flush();
		}*/
	
	}
	
	private XSSFWorkbook makeExcelFile(List<EgovMap> list, String[] getMapKey, String[] getHeader, String SheetName) {
	      
	      XSSFWorkbook workbook = new XSSFWorkbook();
	      XSSFSheet sheet = workbook.createSheet(SheetName);
	      XSSFRow row;
	      XSSFCell cell;
	      int headerRow = 0;

	      row = sheet.createRow(0);
	      cell = row.createCell(0);
	      cell.setCellValue("??????");
	      cell = row.createCell(1);
	      cell.setCellValue("?????????");

	      row = sheet.createRow(1);
	      cell = row.createCell(0);
	      cell.setCellValue("?????????");
	      cell = row.createCell(1);
	      cell.setCellValue("010-1234-1234");

	      
	      CellStyle cs = workbook.createCellStyle();
	      cs.setBorderTop(CellStyle.BORDER_THIN);
	      cs.setBorderBottom(CellStyle.BORDER_THIN);
	      cs.setBorderLeft(CellStyle.BORDER_THIN);
	      cs.setBorderRight(CellStyle.BORDER_THIN);

	      row = sheet.createRow(headerRow);
	      
	      int nowCellNumber = 0;
	      for (int i = 0; i < getHeader.length; i++) {
	         String header = getHeader[i];
	         if(header != null) {
	            if( header.indexOf("||") > 0) {
	               String[] tmp = header.split("\\|\\|");
	               if(tmp.length == 3) {
	                  String colName = tmp[0];
	                  int colHeight = Integer.parseInt(tmp[2]), colWidth = Integer.parseInt(tmp[1]);
	                  if(colHeight==0) colHeight = 1;
	                  if(colWidth==0) colWidth = 1;
	                  
	                  System.out.println("??? ?????? :" + colName + "/ ?????? ?????? : " + headerRow + "/ ?????? ??? : " + nowCellNumber + "/ ????????? ??? : " +  (nowCellNumber + (colWidth-1)));
	                  sheet.addMergedRegion(new CellRangeAddress(headerRow, headerRow + (colHeight-1), nowCellNumber, nowCellNumber + (colWidth-1)));
	                  nowCellNumber = nowCellNumber + (colWidth - 1);
	                  
	                  cell = row.createCell(nowCellNumber);
	                  cell.setCellValue(colName);
	                  cell.setCellStyle(cs);
	                  
	                  nowCellNumber++;
	               }
	               
	            }else if(header.equals("[ROW]")) {
	               row = sheet.createRow(++headerRow);
	               if(headerRow==1) {
	                  nowCellNumber = 2;
	               }else if(headerRow==2) {
	                  nowCellNumber = 4;
	               }else {
	                  nowCellNumber = headerRow >= 1 ? 2 : 0 ;
	               }
	               
	            }else {
	               cell = row.createCell(nowCellNumber++);
	               cell.setCellValue(header);
	               cell.setCellStyle(cs);
	            }
	         }

	         
	         
	      }
	      /*
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
	         sheet.setColumnWidth(i, (sheet.getColumnWidth(i)) + 1000);
	      }
	      
	      */

	      return workbook;
	   }
	
	

}
