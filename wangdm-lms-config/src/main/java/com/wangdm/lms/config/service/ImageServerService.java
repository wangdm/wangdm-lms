package com.wangdm.lms.config.service;

import com.wangdm.core.service.Service;
import com.wangdm.lms.config.dto.ImageServer;

public interface ImageServerService extends Service{

    public void setImageUploadUrl(String value);

    public String getImageUploadUrl();

    public String getImageUploadUrl(String value);

    public void setImageServerUrl(String value);

    public String getImageServerUrl();

    public String getImageServerUrl(String value);
    
    public void setImageLocalPath(String value);
    
    public String getImageLocalPath();
    
    public String getImageLocalPath(String value);
    
    public void setImageSupportFormat(String value);
    
    public String getImageSupportFormat();
    
    public void setImageUploadMaxsize(String value);
    
    public String getImageUploadMaxsize();
    
    public void setImageDirectoryType(String value);
    
    public String getImageDirectoryType();
    
    public void saveImageServer(ImageServer config);
    
    public ImageServer getImageServer();
}
