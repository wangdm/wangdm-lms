package com.wangdm.lms.config.service;

import com.wangdm.core.service.Service;
import com.wangdm.lms.config.dto.ModularConfig;

public interface ModularConfigService extends Service{

    public void setWebHostUrl(String value);

    public String getWebHostUrl();
    
    public void setMobileHostUrl(String value);
    
    public String getMobileHostUrl();
    
    public void setAdminHostUrl(String value);
    
    public String getAdminHostUrl();
    
    public void setSdkHostUrl(String value);
    
    public String getSdkHostUrl();
    
    public void saveModularConfig(ModularConfig config);
    
    public ModularConfig getModularConfig();
}
