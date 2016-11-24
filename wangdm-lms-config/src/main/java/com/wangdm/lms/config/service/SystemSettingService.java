package com.wangdm.lms.config.service;

import com.wangdm.core.service.Service;
import com.wangdm.lms.config.dto.SystemSetting;

public interface SystemSettingService extends Service{

    public boolean isAccessAuthc();
    
    public boolean isEnableRegister();
    
    public boolean isVerifyRegister();
    
    public boolean isEnableComment();
    
    public boolean isVerifyConment();
    
    public boolean isVerifyNewCourse();
    
    public boolean isVerifyEditCourse();
    
    public boolean isVerifyNewLive();
    
    public boolean isVerifyEditLive();
    
    public boolean isVerifyNewVideo();
    
    public boolean isVerifyEditVideo();
    
	public void saveSystemSetting(SystemSetting system);
	
	public SystemSetting getSystemSetting();
	
}
