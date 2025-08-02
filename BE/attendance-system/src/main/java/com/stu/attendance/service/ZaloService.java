package com.stu.attendance.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.Map;

@Service
@RequiredArgsConstructor
@Slf4j
public class ZaloService {

    private final RestTemplate restTemplate;

    @Value("${zalo.app.id}")
    private String zaloAppId;

    @Value("${zalo.app.secret}")
    private String zaloAppSecret;

    /**
     * Verify Zalo access token and get user info
     */
    public ZaloUserInfo verifyZaloToken(String zaloAccessToken) {
        try {
            String url = "https://graph.zalo.me/v2.0/me?access_token=" + zaloAccessToken + "&fields=id,name,picture";
            
            HttpHeaders headers = new HttpHeaders();
            headers.set("Content-Type", "application/json");
            
            HttpEntity<String> entity = new HttpEntity<>(headers);
            
            ResponseEntity<Map> response = restTemplate.exchange(url, HttpMethod.GET, entity, Map.class);
            
            if (response.getStatusCode().is2xxSuccessful() && response.getBody() != null) {
                Map<String, Object> data = response.getBody();
                
                ZaloUserInfo userInfo = new ZaloUserInfo();
                userInfo.setZaloId(data.get("id").toString());
                userInfo.setName((String) data.get("name"));
                
                if (data.containsKey("picture") && data.get("picture") instanceof Map) {
                    Map<String, Object> picture = (Map<String, Object>) data.get("picture");
                    if (picture.containsKey("data")) {
                        Map<String, Object> pictureData = (Map<String, Object>) picture.get("data");
                        userInfo.setPictureUrl((String) pictureData.get("url"));
                    }
                }
                
                return userInfo;
            }
        } catch (Exception e) {
            log.error("Error verifying Zalo token: {}", e.getMessage());
        }
        
        throw new RuntimeException("Không thể xác thực token Zalo");
    }

    /**
     * Get Zalo access token using authorization code (for web OAuth flow)
     * Note: This is not needed for ZMP SDK integration
     */
    public String getZaloAccessToken(String authorizationCode, String redirectUri) {
        try {
            String url = "https://oauth.zaloapp.com/v4/access_token";
            
            HttpHeaders headers = new HttpHeaders();
            headers.set("Content-Type", "application/x-www-form-urlencoded");
            headers.set("secret_key", zaloAppSecret);
            
            String body = String.format("app_id=%s&grant_type=authorization_code&code=%s&redirect_uri=%s",
                    zaloAppId, authorizationCode, redirectUri);
            
            HttpEntity<String> entity = new HttpEntity<>(body, headers);
            
            ResponseEntity<Map> response = restTemplate.exchange(url, HttpMethod.POST, entity, Map.class);
            
            if (response.getStatusCode().is2xxSuccessful() && response.getBody() != null) {
                Map<String, Object> data = response.getBody();
                return (String) data.get("access_token");
            }
        } catch (Exception e) {
            log.error("Error getting Zalo access token: {}", e.getMessage());
        }
        
        throw new RuntimeException("Không thể lấy access token từ Zalo");
    }

    public static class ZaloUserInfo {
        private String zaloId;
        private String name;
        private String pictureUrl;

        // Getters and Setters
        public String getZaloId() { return zaloId; }
        public void setZaloId(String zaloId) { this.zaloId = zaloId; }
        
        public String getName() { return name; }
        public void setName(String name) { this.name = name; }
        
        public String getPictureUrl() { return pictureUrl; }
        public void setPictureUrl(String pictureUrl) { this.pictureUrl = pictureUrl; }
    }
} 