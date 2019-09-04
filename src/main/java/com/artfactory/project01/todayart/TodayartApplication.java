package com.artfactory.project01.todayart;


import com.artfactory.project01.todayart.util.FileStorageProperties;

import org.springframework.boot.SpringApplication;



import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;

@EnableConfigurationProperties(value = FileStorageProperties.class)
@SpringBootApplication
 public class TodayartApplication {

    public static void main(String[] args) {
        SpringApplication.run(TodayartApplication.class, args);
    }
}
