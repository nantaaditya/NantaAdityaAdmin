package com.nantaaditya.admin.properties;

import lombok.Data;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

// @formatter:off
/**
 * Author : Pramuditya Ananta Nur
  * www.nantaaditya.com
  * personal@nantaaditya.com
  **/
// @formatter:on

@Component
@Data
public class ContextPathProperties {

  @Value("${server.servlet.context-path}")
  private String contextPath;
}
