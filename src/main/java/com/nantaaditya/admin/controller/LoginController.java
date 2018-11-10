package com.nantaaditya.admin.controller;

import com.nantaaditya.admin.properties.ContextPathProperties;
import com.nantaaditya.admin.properties.UIPath;
import org.springframework.beans.factory.annotation.Autowired;
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

  @Autowired
  private ContextPathProperties properties;

  @RequestMapping(value = "/", method = RequestMethod.GET)
  public ModelAndView rootPage() {
return new ModelAndView("redirect:" + UIPath.LOGIN);
  }

  @RequestMapping(value = UIPath.LOGIN, method = RequestMethod.GET)
  public ModelAndView loginPage() {
    ModelAndView modelAndView = new ModelAndView();
    modelAndView.addObject("path", properties.getContextPath());
    modelAndView.setViewName("login");
    return modelAndView;
  }
}
