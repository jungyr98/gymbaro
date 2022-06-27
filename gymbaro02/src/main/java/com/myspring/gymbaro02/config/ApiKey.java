package com.myspring.gymbaro02.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import lombok.Getter;

@Getter
@Component
public class ApiKey {
	@Value("${kakaoMap}")
    private String kakaoMap;
	@Value("${kakaoLogin}")
    private String kakaoLogin;
	@Value("${googleMap}")
    private String googleMap;
	@Value("${coolKey}")
    private String coolKey;
	@Value("${coolSecret}")
    private String coolSecret;
	@Value("${iamport}")
    private String iamport;

    private static ApiKey instance = new ApiKey();

    private ApiKey() {
    }

	public static ApiKey getInstance() {
		return instance;
	}

	public static void setInstance(ApiKey instance) {
		ApiKey.instance = instance;
	}


//    public static ApiKey getInstance() {
//        if (instance == null) {
//            instance = new ApiKey();
//        }
//        return instance;
//    }
    
    
}
