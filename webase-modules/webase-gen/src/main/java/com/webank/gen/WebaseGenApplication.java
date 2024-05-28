package com.webank.gen;

import org.apache.dubbo.config.spring.context.annotation.EnableDubbo;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.metrics.buffering.BufferingApplicationStartup;

/**
 * 代码生成
 *
 * @author webase
 */
@EnableDubbo
@SpringBootApplication
public class WebaseGenApplication {
    public static void main(String[] args) {
        SpringApplication application = new SpringApplication(WebaseGenApplication.class);
        application.setApplicationStartup(new BufferingApplicationStartup(2048));
        application.run(args);
        System.out.println("(♥◠‿◠)ﾉﾞ  代码生成模块启动成功   ლ(´ڡ`ლ)ﾞ  ");
    }
}
