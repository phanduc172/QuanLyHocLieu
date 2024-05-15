package com.phanduc.QLHocLieu.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class AdditionalResourceWebConfiguration implements WebMvcConfigurer {

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/upload/images/**")
                .addResourceLocations("file:src/main/upload/images/");
        registry.addResourceHandler("/upload/documents/**")
                .addResourceLocations("file:src/main/upload/documents/");
    }
}
