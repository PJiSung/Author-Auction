package com.kh.auction.common.config;

import org.springframework.boot.web.embedded.tomcat.TomcatConnectorCustomizer;
import org.springframework.boot.web.embedded.tomcat.TomcatServletWebServerFactory;
import org.springframework.boot.web.server.WebServerFactoryCustomizer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class TomcatWebCustomConfig {

    @Bean
    public WebServerFactoryCustomizer<TomcatServletWebServerFactory> webServerFactoryCustomizer() {
        return factory -> {
            if (factory instanceof TomcatServletWebServerFactory) {
                ((TomcatServletWebServerFactory) factory).addConnectorCustomizers((TomcatConnectorCustomizer) connector -> {
                    connector.setProperty("relaxedQueryChars", "<>[\\]^`{|}");
                });
            }
        };
    }
}
