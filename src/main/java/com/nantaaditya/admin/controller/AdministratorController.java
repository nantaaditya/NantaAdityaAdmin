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
public class AdministratorController {

  @RequestMapping(value = UIPath.DASHBOARD, method = RequestMethod.GET)
  public ModelAndView dashboardPage() {
    return new ModelAndView("/administrator/dashboard");
  }

  @RequestMapping(value = UIPath.HOME_DASHBOARD, method = RequestMethod.GET)
  public ModelAndView homePage() {
    return new ModelAndView("/administrator/home-dashboard");
  }

  @RequestMapping(value = UIPath.CONTACT_DASHBOARD, method = RequestMethod.GET)
  public ModelAndView contactPage() {
    return new ModelAndView("/administrator/contact-dashboard");
  }

  @RequestMapping(value = UIPath.BLOG_DASHBOARD, method = RequestMethod.GET)
  public ModelAndView blogPage() {
    return new ModelAndView("/administrator/blog-dashboard");
  }
}
