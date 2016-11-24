package com.wangdm.lms.config.dto;

public class ModularConfig {

    private String webHostUrl;
    
    private String mobileHostUrl;
    
    private String adminHostUrl;
    
    private String sdkHostUrl;

    
    public String getWebHostUrl() {
    
        return webHostUrl;
    }

    
    public void setWebHostUrl( String webHostUrl ) {
    
        this.webHostUrl = webHostUrl;
    }

    
    public String getMobileHostUrl() {
    
        return mobileHostUrl;
    }

    
    public void setMobileHostUrl( String mobileHostUrl ) {
    
        this.mobileHostUrl = mobileHostUrl;
    }

    
    public String getAdminHostUrl() {
    
        return adminHostUrl;
    }

    
    public void setAdminHostUrl( String adminHostUrl ) {
    
        this.adminHostUrl = adminHostUrl;
    }

    
    public String getSdkHostUrl() {
    
        return sdkHostUrl;
    }

    
    public void setSdkHostUrl( String sdkHostUrl ) {
    
        this.sdkHostUrl = sdkHostUrl;
    }
    
}
