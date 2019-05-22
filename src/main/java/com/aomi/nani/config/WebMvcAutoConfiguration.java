package com.aomi.nani.config;

import com.aomi.nani.filter.MeshsiteFilter;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebMvcAutoConfiguration implements WebMvcConfigurer {

//    @Bean
//    public FilterRegistrationBean siteMeshFilter() {
//        FilterRegistrationBean fitler = new FilterRegistrationBean();
//
//        MeshsiteFilter siteMeshFilter = new MeshsiteFilter();
//
//        fitler.setFilter(siteMeshFilter);
//
//        return fitler;
//    }

}
