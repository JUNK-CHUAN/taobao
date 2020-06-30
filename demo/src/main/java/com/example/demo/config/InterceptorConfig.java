package com.example.demo.config;

import org.springframework.context.annotation.Configuration;

import org.springframework.util.ResourceUtils;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.io.File;
import java.io.FileNotFoundException;

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
        File path = null;
        try {
            path = new File(ResourceUtils.getURL("classpath:").getPath());
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        if(!path.exists()) path = new File("");
        String pathString = path.getAbsolutePath();
//        System.out.println(pathString);
//        System.out.println("path:"+pathString.substring(0, pathString.length()-15));
        // windows
        registry.addResourceHandler("/specialtyPic/**").addResourceLocations("file:" + pathString.substring(0, pathString.length()-15) + "/src/main/resources/static/specialtyPic/");

        // macos
//        registry.addResourceHandler("/specialtyPic/**").addResourceLocations("file:" + pathString + "/src/main/resources/static/specialtyPic/");


    }
}