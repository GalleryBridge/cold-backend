package com.laidor.gateway.common;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @Author: Laidor
 * @Description:
 * @Date:2025/1/8 下午 01:14
 */
@Configuration
public class GatewayConfig {

    @Bean
    public TokenFilter tokenFilter() {
        return new TokenFilter();
    }
}
