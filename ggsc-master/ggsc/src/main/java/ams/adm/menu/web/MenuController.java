package ams.adm.menu.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ams.adm.auth.AuthServiceImpl;
import ams.adm.menu.service.MenuService;
import ams.cmm.AMSComm;
import ams.main.mnu.service.MenuVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class MenuController {
	@Resource(name = "menuService")
	private MenuService menuService;

	@Resource(name = "authService")
	private AuthServiceImpl authService;

	/**
	 * 메뉴 목록
	 */

	@RequestMapping(value = "/menu_mng.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String menu_mng(MenuVO vo, HttpServletRequest request, ModelMap model) {
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd", mnuCd);

		if (vo.getCurrentPageNo() == 0) {
			vo.setCurrentPageNo(1);
		}
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(vo.getCurrentPageNo()); // 현재 페이지 번호
		paginationInfo.setRecordCountPerPage(10); // 한 페이지에 게시되는 게시물 건수
		paginationInfo.setPageSize(10); // 페이징 리스트의 사이즈

		vo.setFirstIndex((vo.getCurrentPageNo() - 1) * 10);
		vo.setLastIndex((vo.getCurrentPageNo()) * 10);

		model.addAttribute("menuList", menuService.selectMenuList(vo));
		int totalPageCnt = menuService.selectMenuListTotalCnt(vo);
		model.addAttribute("totalPageCnt", totalPageCnt);
		paginationInfo.setTotalRecordCount(totalPageCnt); // 전체 게시물 건 수
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("vo", vo);

		model.addAttribute("success", "yes");

		return "adm/menu/menu.main";
	}

	/**
	 * 메뉴 목록
	 */

	@RequestMapping(value = "/adm/menu_main_list.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String menu_list(MenuVO vo, HttpServletRequest request, ModelMap model) {

		if (vo.getCurrentPageNo() == 0) {
			vo.setCurrentPageNo(1);
		}
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(vo.getCurrentPageNo()); // 현재 페이지 번호
		paginationInfo.setRecordCountPerPage(10); // 한 페이지에 게시되는 게시물 건수
		paginationInfo.setPageSize(10); // 페이징 리스트의 사이즈

		vo.setFirstIndex((vo.getCurrentPageNo() - 1) * 10);
		vo.setLastIndex((vo.getCurrentPageNo()) * 10);

		model.addAttribute("list", menuService.selectMenuList(vo));
		int totalPageCnt = menuService.selectMenuListTotalCnt(vo);
		model.addAttribute("totalPageCnt", totalPageCnt);
		paginationInfo.setTotalRecordCount(totalPageCnt); // 전체 게시물 건 수
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("vo", vo);

		model.addAttribute("success", "yes");

		return "jsonView";
	}

	/**
	 * 메뉴 등록
	 */

	@RequestMapping(value = "/adm/reg_menu.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String reg_menu(MenuVO vo, HttpServletRequest request, ModelMap model) {

		if (vo.getMnuNo() == 0) {
			menuService.insertMenu(vo);
		} else {
			menuService.updateMenu(vo);
		}

		if (vo.getCurrentPageNo() == 0) {
			vo.setCurrentPageNo(1);
		}
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(vo.getCurrentPageNo()); // 현재 페이지번호
		paginationInfo.setRecordCountPerPage(10); // 한 페이지에 게시되는 게시물 건수
		paginationInfo.setPageSize(10); // 페이징 리스트의 사이즈

		vo.setFirstIndex((vo.getCurrentPageNo() - 1) * 10);
		vo.setLastIndex((vo.getCurrentPageNo()) * 10);

		model.addAttribute("menuList", menuService.selectMenuList(vo));

		int totalPageCnt = menuService.selectMenuListTotalCnt(vo);
		model.addAttribute("totalPageCnt", totalPageCnt);
		paginationInfo.setTotalRecordCount(totalPageCnt); // 전체 게시물 건 수
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("vo", vo);

		model.addAttribute("success", "yes");

		return "jsonView";
	}

	@RequestMapping(value = "/menu/menu_info.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String select_menu_info(HttpServletRequest request, MenuVO vo, ModelMap model) {

		model.addAttribute("menuInfo", menuService.selectMenuInfo(vo));

		return "jsonView";
	}

	@RequestMapping(value = "/menu/upMenu_info.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String select_upmenu_info(HttpServletRequest request, MenuVO vo, ModelMap model) {

		List<?> list = menuService.selectUpMenuInfo(vo);
		model.addAttribute("upMenuList", list);

		return "jsonView";
	}

	/**
	 * 맵핑
	 *
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/adm/menu_edit.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String menu_map_ed(MenuVO vo, HttpServletRequest request, ModelMap model) {

		EgovMap loginVO = null;
		if (request.getSession().getAttribute("LoginVO") != null) {
			loginVO = (EgovMap) request.getSession().getAttribute("LoginVO");
			model.addAttribute("userVO", loginVO);
		} else {
			return AMSComm.logoutProcBySvNm(request);
		}

		if (vo.getCurrentPageNo() == 0) {
			vo.setCurrentPageNo(1);
		}
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(vo.getCurrentPageNo()); // 현재 페이지 번호
		paginationInfo.setRecordCountPerPage(10); // 한 페이지에 게시되는 게시물 건수
		paginationInfo.setPageSize(10); // 페이징 리스트의 사이즈

		vo.setFirstIndex((vo.getCurrentPageNo() - 1) * 10);
		vo.setLastIndex((vo.getCurrentPageNo()) * 10);

		model.addAttribute("mapList", menuService.selectMapList(vo));
		int totalPageCnt = menuService.selectMapListTotalCnt(vo);
		model.addAttribute("totalPageCnt", totalPageCnt);
		paginationInfo.setTotalRecordCount(totalPageCnt); // 전체 게시물 건 수
		model.addAttribute("mapPageInfo", paginationInfo);
		model.addAttribute("vo", vo);

		if ("Y".equals(vo.getSearchYn())) {
			return "jsonView";
		} else {
			return "adm/menu/menu_edit.main";
		}
	}

	@RequestMapping(value = "/adm/menu_list.do", method = RequestMethod.GET)
	public String map_menu_list(MenuVO vo, HttpServletRequest request, ModelMap model) {

		EgovMap loginVO = null;
		if (request.getSession().getAttribute("LoginVO") != null) {
			loginVO = (EgovMap) request.getSession().getAttribute("LoginVO");
			model.addAttribute("userVO", loginVO);
		} else {
			return AMSComm.logoutProcBySvNm(request);
		}

		model.addAttribute("menuList", menuService.selectEditMenuList(vo));
		model.addAttribute("vo", vo);

		return "jsonView";
	}

	@RequestMapping(value = "/adm/reg_map.do", method = RequestMethod.POST)
	public String reg_map(MenuVO vo, HttpServletRequest request, ModelMap model) {
		EgovMap loginVO = null;
		if (request.getSession().getAttribute("LoginVO") != null) {
			loginVO = (EgovMap) request.getSession().getAttribute("LoginVO");
			model.addAttribute("userVO", loginVO);
		} else {
			return AMSComm.logoutProcBySvNm(request);
		}

		vo.setAuthCd(vo.getAuthCd());
		menuService.deleteByAuthCdMap(vo);

		String mnuCd[] = vo.getMnuCds().split(":");
		String mnuSer[] = vo.getMnuSers().split(":");
		for (int i = 0; i < mnuCd.length; i++) {
			vo.setMnuCd(mnuCd[i]);
			vo.setMnuSer(Integer.parseInt(mnuSer[i]));
			int mapCnt = menuService.mapListCnt(vo);

			if (mapCnt == 0) {
				menuService.insertMap(vo);
			}
		}
		model.addAttribute("success", "yes");

		return "jsonView";
	}

	@RequestMapping(value = "/adm/del_map.do", method = RequestMethod.POST)
	public String delete_map(MenuVO vo, HttpServletRequest request, ModelMap model) {
		EgovMap loginVO = null;
		if (request.getSession().getAttribute("LoginVO") != null) {
			loginVO = (EgovMap) request.getSession().getAttribute("LoginVO");
			model.addAttribute("userVO", loginVO);
		} else {
			return AMSComm.logoutProcBySvNm(request);
		}

		String mapSer[] = vo.getMapSers().split(":");
		for (int i = 0; i < mapSer.length; i++) {
			vo.setMapSer(Integer.parseInt(mapSer[i]));
			menuService.deleteMap(vo);
		}
		if (vo.getCurrentPageNo() == 0) {
			vo.setCurrentPageNo(1);
		}
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(vo.getCurrentPageNo()); // 현재 페이지 번호
		paginationInfo.setRecordCountPerPage(10); // 한 페이지에 게시되는 게시물 건수
		paginationInfo.setPageSize(10); // 페이징 리스트의 사이즈

		vo.setFirstIndex((vo.getCurrentPageNo() - 1) * 10);
		vo.setLastIndex((vo.getCurrentPageNo()) * 10);

		model.addAttribute("mapList", menuService.selectMapList(vo));
		int totalPageCnt = menuService.selectMapListTotalCnt(vo);
		model.addAttribute("totalPageCnt", totalPageCnt);
		paginationInfo.setTotalRecordCount(totalPageCnt); // 전체 게시물 건 수
		model.addAttribute("mapPageInfo", paginationInfo);

		model.addAttribute("success", "yes");

		return "jsonView";
	}

	/**
	 * 권한별 메뉴 매핑 리스트
	 *
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/adm/authMenu_map_list.do", method = RequestMethod.POST)
	public String authMenu_map_list(MenuVO vo, HttpServletRequest request, ModelMap model) {

		EgovMap loginVO = null;
		if (request.getSession().getAttribute("LoginVO") != null) {
			loginVO = (EgovMap) request.getSession().getAttribute("LoginVO");
			model.addAttribute("userVO", loginVO);
		} else {
			return AMSComm.logoutProcBySvNm(request);
		}

		model.addAttribute("mapList", menuService.selectAuthMenuMapList(vo));
		model.addAttribute("vo", vo);

		return "jsonView";
	}
}
