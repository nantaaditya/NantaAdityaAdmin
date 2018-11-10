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
public class AdministratorController {

  @Autowired
  private ContextPathProperties properties;

  @RequestMapping(value = UIPath.DASHBOARD, method = RequestMethod.GET)
  public ModelAndView dashboardPage() {
    ModelAndView modelAndView = new ModelAndView();
    modelAndView.addObject("path", properties.getContextPath());
    modelAndView.setViewName("/administrator/dashboard");
    return modelAndView;
  }

  @RequestMapping(value = UIPath.HOME_DASHBOARD, method = RequestMethod.GET)
  public ModelAndView homePage() {
    ModelAndView modelAndView = new ModelAndView();
    modelAndView.addObject("path", properties.getContextPath());
    modelAndView.setViewName("/administrator/home-dashboard");
    return modelAndView;
  }

  @RequestMapping(value = UIPath.CONTACT_DASHBOARD, method = RequestMethod.GET)
  public ModelAndView contactPage() {
    ModelAndView modelAndView = new ModelAndView();
    modelAndView.addObject("path", properties.getContextPath());
    modelAndView.setViewName("/administrator/contact-dashboard");
    return modelAndView;
  }

  @RequestMapping(value = UIPath.BLOG_DASHBOARD, method = RequestMethod.GET)
  public ModelAndView blogPage() {
    ModelAndView modelAndView = new ModelAndView();
    modelAndView.addObject("path", properties.getContextPath());
    modelAndView.setViewName("/administrator/blog-dashboard");
    return modelAndView;
  }

  @RequestMapping(value = UIPath.IMAGE_DASHBOARD, method = RequestMethod.GET)
  public ModelAndView imagePage() {
    ModelAndView modelAndView = new ModelAndView();
    modelAndView.addObject("path", properties.getContextPath());
    modelAndView.setViewName("/administrator/image-dashboard");
    return modelAndView;
  }
}
