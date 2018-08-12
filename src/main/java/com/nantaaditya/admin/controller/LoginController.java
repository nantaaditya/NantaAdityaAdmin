package com.nantaaditya.admin.controller;

import com.nantaaditya.admin.properties.UIPath;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
// @formatter:off
/**
 * Author : Pramuditya Ananta Nur
  * www.nantaaditya.com
  * personal@nantaaditya.com
  **/
// @formatter:on

@Controller
public class LoginController {

  @RequestMapping(value = UIPath.LOGIN, method = RequestMethod.GET)
  public ModelAndView loginPage() {
    return new ModelAndView("/login");
  }
}
