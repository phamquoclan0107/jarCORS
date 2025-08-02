package com.stu.attendance.config;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;
import lombok.Data;

@Configuration
@ConfigurationProperties(prefix = "zalo")
@Data
public class ZaloConfig {
    
    private String appId;
    private String appSecret;
    private String redirectUri;
    
    // Zalo API endpoints
    public static final String ZALO_OAUTH_URL = "https://oauth.zaloapp.com/v4/access_token";
    public static final String ZALO_GRAPH_URL = "https://graph.zalo.me/v2.0/me";
} 