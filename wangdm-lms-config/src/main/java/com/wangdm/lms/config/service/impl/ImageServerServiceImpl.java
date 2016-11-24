package com.wangdm.lms.config.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wangdm.lms.config.dto.ImageServer;
import com.wangdm.lms.config.entity.KeyValue;
import com.wangdm.lms.config.service.ImageServerService;

@Service("imageServerService")
@Transactional
public class ImageServerServiceImpl extends ConfigServiceImpl implements ImageServerService {

    @Override
    public void setImageUploadUrl( String value ) {

        saveConfig(KeyValue.imageUploadUrl, value);

    }

    @Override
    public String getImageUploadUrl() {

        return getConfig(KeyValue.imageUploadUrl, "");
    }

    @Override
    public String getImageUploadUrl( String value ) {

        return getConfig(KeyValue.imageUploadUrl, value);
    }

    @Override
    public void setImageServerUrl( String value ) {

        saveConfig(KeyValue.imageServerUrl, value);

    }

    @Override
    public String getImageServerUrl() {

        return getConfig(KeyValue.imageServerUrl, "");
    }

    @Override
    public String getImageServerUrl( String value ) {

        return getConfig(KeyValue.imageServerUrl, value);
    }

    @Override
    public void setImageLocalPath( String value ) {

        saveConfig(KeyValue.imageLocalPath, value);
        
    }

    @Override
    public String getImageLocalPath() {

        return getConfig(KeyValue.imageLocalPath, "");
    }

    @Override
    public String getImageLocalPath( String value ) {

        return getConfig(KeyValue.imageLocalPath, value);
    }

    @Override
    public void setImageSupportFormat( String value ) {

        saveConfig(KeyValue.imageSupportFormat, value);

    }

    @Override
    public String getImageSupportFormat() {

        return getConfig(KeyValue.imageSupportFormat, "png|jpeg");
    }

    @Override
    public void setImageUploadMaxsize( String value ) {

        saveConfig(KeyValue.imageUploadMaxsize, value);

    }

    @Override
    public String getImageUploadMaxsize() {

        return getConfig(KeyValue.imageUploadMaxsize, "1000");
    }

    @Override
    public void setImageDirectoryType( String value ) {

        saveConfig(KeyValue.imageDirectoryType, value);

    }

    @Override
    public String getImageDirectoryType() {

        return getConfig(KeyValue.imageDirectoryType, "none");
    }

    @Override
    public void saveImageServer( ImageServer config ) {

        this.setImageUploadUrl(config.getImageUploadUrl());
        this.setImageServerUrl(config.getImageServerUrl());
        this.setImageLocalPath(config.getImageLocalPath());
        this.setImageSupportFormat(config.getImageSupportFormat());
        this.setImageUploadMaxsize(config.getImageUploadMaxsize());
        this.setImageDirectoryType(config.getImageDirectoryType());

    }

    @Override
    public ImageServer getImageServer() {

        ImageServer config = new ImageServer();
        config.setImageUploadUrl(this.getImageUploadUrl());
        config.setImageServerUrl(this.getImageServerUrl());
        config.setImageLocalPath(this.getImageLocalPath());
        config.setImageSupportFormat(this.getImageSupportFormat());
        config.setImageUploadMaxsize(this.getImageUploadMaxsize());
        config.setImageDirectoryType(this.getImageDirectoryType());
        return config;
    }

}
