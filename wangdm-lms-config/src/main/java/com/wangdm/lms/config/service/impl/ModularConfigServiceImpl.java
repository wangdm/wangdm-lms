package com.wangdm.lms.config.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wangdm.lms.config.dto.ModularConfig;
import com.wangdm.lms.config.entity.KeyValue;
import com.wangdm.lms.config.service.ModularConfigService;

@Service("modularConfigService")
@Transactional
public class ModularConfigServiceImpl extends ConfigServiceImpl implements ModularConfigService {

    @Override
    public void setWebHostUrl( String value ) {

        saveConfig(KeyValue.webHostUrl, value);
        
    }

    @Override
    public String getWebHostUrl() {

        return getConfig(KeyValue.webHostUrl, "/wangdm-lms-web");
    }

    @Override
    public void setMobileHostUrl( String value ) {

        saveConfig(KeyValue.mobileHostUrl, value);
        
    }

    @Override
    public String getMobileHostUrl() {

        return getConfig(KeyValue.mobileHostUrl, "/wangdm-lms-mobile");
    }

    @Override
    public void setAdminHostUrl( String value ) {

        saveConfig(KeyValue.adminHostUrl, value);
        
    }

    @Override
    public String getAdminHostUrl() {

        return getConfig(KeyValue.adminHostUrl, "/wangdm-lms-admin");
    }

    @Override
    public void setSdkHostUrl( String value ) {

        saveConfig(KeyValue.sdkHostUrl, value);
        
    }

    @Override
    public String getSdkHostUrl() {

        return getConfig(KeyValue.sdkHostUrl, "/wangdm-lms-sdk/v1");
    }

    @Override
    public void saveModularConfig( ModularConfig config ) {

        this.setWebHostUrl(config.getWebHostUrl());
        this.setMobileHostUrl(config.getMobileHostUrl());
        this.setAdminHostUrl(config.getAdminHostUrl());
        this.setSdkHostUrl(config.getSdkHostUrl());
        
    }

    @Override
    public ModularConfig getModularConfig() {

        ModularConfig config = new ModularConfig();
        config.setWebHostUrl(this.getWebHostUrl());
        config.setMobileHostUrl(this.getMobileHostUrl());
        config.setAdminHostUrl(this.getAdminHostUrl());
        config.setSdkHostUrl(this.getSdkHostUrl());
        return config;
    }

}
