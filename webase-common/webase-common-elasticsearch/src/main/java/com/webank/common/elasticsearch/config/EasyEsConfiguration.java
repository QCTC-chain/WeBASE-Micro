package com.webank.common.elasticsearch.config;

import cn.easyes.starter.register.EsMapperScan;
import org.springframework.boot.autoconfigure.AutoConfiguration;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;

/**
 * easy-es 配置
 *
 * @author QCTC
 */
@AutoConfiguration
@ConditionalOnProperty(value = "easy-es.enable", havingValue = "true")
@EsMapperScan("com.webank.**.esmapper")
public class EasyEsConfiguration {

}
