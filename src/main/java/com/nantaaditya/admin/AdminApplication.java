package com.nantaaditya.admin;

import org.apache.coyote.http11.AbstractHttp11Protocol;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.context.embedded.EmbeddedServletContainerCustomizer;
import org.springframework.boot.context.embedded.tomcat.TomcatConnectorCustomizer;
import org.springframework.boot.context.embedded.tomcat.TomcatEmbeddedServletContainerFactory;
import org.springframework.boot.web.support.SpringBootServletInitializer;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
public class AdminApplication extends SpringBootServletInitializer {

  public static void main(String[] args) {
    SpringApplication.run(AdminApplication.class, args);
  }

  @Override
  protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
    return application.sources(AdminApplication.class);
  }

  @Bean
  public TomcatEmbeddedServletContainerFactory tomcatEmbedded() {
    TomcatEmbeddedServletContainerFactory tomcat = new TomcatEmbeddedServletContainerFactory();
    tomcat.addConnectorCustomizers((TomcatConnectorCustomizer) connector -> {
      if ((connector.getProtocolHandler() instanceof AbstractHttp11Protocol<?>)) {
        ((AbstractHttp11Protocol<?>) connector.getProtocolHandler()).setMaxSwallowSize(-1);
      }
    });
    return tomcat;
  }

  @Bean
  public EmbeddedServletContainerCustomizer embeddedServletContainerCustomizer() {
    return container -> container.setContextPath("/admin");
  }
}
