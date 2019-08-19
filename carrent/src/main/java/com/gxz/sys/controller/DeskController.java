package com.gxz.sys.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("desk")
public class DeskController {

	@RequestMapping("toDesk")
	public String toDesk(){
		return "forward:/WEB-INF/view/system/desk.jsp";
	}
	
}
