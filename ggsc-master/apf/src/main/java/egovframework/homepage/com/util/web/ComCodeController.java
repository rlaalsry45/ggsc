package egovframework.homepage.com.util.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.homepage.com.util.service.ComCodeService;

@Controller
public class ComCodeController {
	
	/** ComCodeService */
	@Resource(name = "comCodeService")
	private ComCodeService comCodeService;
	
	
	
}