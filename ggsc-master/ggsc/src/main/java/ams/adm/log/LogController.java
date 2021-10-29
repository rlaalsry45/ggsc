package ams.adm.log;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



@Controller
public class LogController {
	
	
	@Resource(name = "logService")
	private LogServiceImpl logService;


	
	
	
	@RequestMapping(value = "/logList.do", method = RequestMethod.GET)
	public String logList(LogVO vo, HttpServletRequest request, ModelMap model){	
		model.addAttribute("vo", vo);
		return "adm/log/logList.main";
	}

	@RequestMapping(value = "/logDtl.do", method = RequestMethod.GET)
	public String logDtl(LogVO vo, HttpServletRequest request, ModelMap model){	
		model.addAttribute("vo", vo);
		return "adm/log/logDtl.main";
	}

	@RequestMapping(value = "/logListAjax.do", method = RequestMethod.POST)
	public String logListAjax( LogVO vo , HttpServletRequest request , ModelMap model ) {
		model.addAttribute("list", logService.logList(vo) );
		vo.setRowsCnt( logService.logListCnt(vo) ) ;
		model.addAttribute("vo", vo);
		return "jsonView";
	}
	
	@RequestMapping(value = "/logDtlAjax.do", method = RequestMethod.POST)
	public String logDtlAjax(LogVO vo, HttpServletRequest request, ModelMap model){
		model.addAttribute("list", logService.logDtl(vo) );
		return "jsonView";
	}


	

}
