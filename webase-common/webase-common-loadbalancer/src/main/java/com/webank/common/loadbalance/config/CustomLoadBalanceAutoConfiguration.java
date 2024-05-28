package com.webank.common.loadbalance.config;

import org.springframework.cloud.loadbalancer.annotation.LoadBalancerClients;

/**
 * 自定义负载均衡自动配置
 *
 * @author QCTC
 */
@LoadBalancerClients(defaultConfiguration = CustomLoadBalanceClientConfiguration.class)
public class CustomLoadBalanceAutoConfiguration {

}
