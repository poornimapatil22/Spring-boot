package com.xworkz.gym.initialization;

import com.xworkz.gym.configuration.WebConfiguaration;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

public class WebInit extends AbstractAnnotationConfigDispatcherServletInitializer implements WebMvcConfigurer {
    @Override
    protected Class<?>[] getRootConfigClasses() {
        return new Class[0];
    }

    @Override
    protected Class<?>[] getServletConfigClasses() {
        return new Class[]{WebConfiguaration.class};
    }

    @Override
    protected String[] getServletMappings() {
        logger.info("For handelling dynamic requests  like form actions");
        return new String[]{"/"};
    }

    @Override
    public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
        logger.info("For handelling static requests by the server itself");
        configurer.enable();
    }
}
