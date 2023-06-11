package com.bezkoder.spring.security.modules.login.config;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

@Configuration
@ConfigurationProperties(prefix = "file")
public class FileStorageConfig 
{
    
    private String uplaodDir;

    public String getUploadDir()
    {
        return this.uplaodDir;
    }

    public void setUploadDir(String uploadDir)
    {
        this.uplaodDir = uploadDir;
    }

}