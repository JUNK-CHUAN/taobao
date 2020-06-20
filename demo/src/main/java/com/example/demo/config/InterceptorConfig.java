package com.example.demo.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * @Author xxs
 * @Date 2020/4/22 17:16
 */

@Configuration
public class InterceptorConfig implements WebMvcConfigurer {
    /**
     * 添加静态资源文件，外部可以直接访问地址
     *  资源映射路径
     *  addResourceHandler：访问映射路径
     *  addResourceLocations：资源绝对路径
     * @param registry
     */
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/specialtyPic/**").addResourceLocations("file:F:/Study/JavaCode/shixi/taobao/demo/src/main/resources/static/specialtyPic/");
    }
}