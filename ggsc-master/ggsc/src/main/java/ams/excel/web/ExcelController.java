package ams.excel.web;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class ExcelController {

	@RequestMapping(value ="/excelDown.do", method = RequestMethod.POST)
	public String excelDown(ModelMap model,@RequestParam Map<String,Object> map) throws Exception {
	 	List<?> list = null;

		model.put("excelList", list);
        model.put("name", map.get("excelName").toString().trim());

		return "excelView";
	}
}
