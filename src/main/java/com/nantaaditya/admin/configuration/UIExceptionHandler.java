package com.nantaaditya.admin.configuration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;
// @formatter:off
/**
 * Author : Pramuditya Ananta Nur
  * www.nantaaditya.com
  * personal@nantaaditya.com
  **/
// @formatter:on

@Slf4j
@ControllerAdvice(basePackages = {"com.nantaaditya.admin"})
public class UIExceptionHandler {

  @ExceptionHandler(Exception.class)
  @ResponseStatus(HttpStatus.NOT_FOUND)
  public ModelAndView pageNotFoundHandler(HttpServletRequest request,
      HttpServletResponse response) {
    log.error("page not found: {}", request.getRequestURI());
    ModelAndView modelAndView = new ModelAndView();
    modelAndView.setViewName("/404");
    return modelAndView;
  }
}
