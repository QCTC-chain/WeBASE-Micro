package com.webank.host;

import org.apache.dubbo.config.spring.context.annotation.EnableDubbo;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.metrics.buffering.BufferingApplicationStartup;

/**
 * 主机管理模块
 *
 * @author webase
 */
@EnableDubbo
@SpringBootApplication
public class WebaseHostMgrApplication {
    public static void main(String[] args) {
        SpringApplication application = new SpringApplication(WebaseHostMgrApplication.class);
        application.setApplicationStartup(new BufferingApplicationStartup(2048));
        application.run(args);
        System.out.println("(♥◠‿◠)ﾉﾞ  主机管理模块启动成功   ლ(´ڡ`ლ)ﾞ  ");
    }
}
