package com.wangdm.lms.config.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wangdm.lms.config.dto.SystemSetting;
import com.wangdm.lms.config.entity.KeyValue;
import com.wangdm.lms.config.service.SystemSettingService;

@Service("systemSettingService")
@Transactional
public class SystemSettingServiceImpl extends ConfigServiceImpl implements SystemSettingService {

    @Override
    public boolean isAccessAuthc() {

        return Boolean.valueOf(getConfig(KeyValue.accessAuthc, "false"));
    }

    @Override
    public boolean isEnableRegister() {

        return Boolean.valueOf(getConfig(KeyValue.enableRegister, "true"));
    }

    @Override
    public boolean isVerifyRegister() {

        return Boolean.valueOf(getConfig(KeyValue.verifyRegister, "true"));
    }

    @Override
    public boolean isEnableComment() {

        return Boolean.valueOf(getConfig(KeyValue.enableComment, "true"));
    }

    @Override
    public boolean isVerifyConment() {

        return Boolean.valueOf(getConfig(KeyValue.verifyConment, "true"));
    }

    @Override
    public boolean isVerifyNewCourse() {

        return Boolean.valueOf(getConfig(KeyValue.verifyNewCourse, "true"));
    }

    @Override
    public boolean isVerifyEditCourse() {

        return Boolean.valueOf(getConfig(KeyValue.verifyEditCourse, "true"));
    }

    @Override
    public boolean isVerifyNewLive() {

        return Boolean.valueOf(getConfig(KeyValue.verifyNewLive, "true"));
    }

    @Override
    public boolean isVerifyEditLive() {

        return Boolean.valueOf(getConfig(KeyValue.verifyEditLive, "true"));
    }

    @Override
    public boolean isVerifyNewVideo() {

        return Boolean.valueOf(getConfig(KeyValue.verifyNewVideo, "true"));
    }

    @Override
    public boolean isVerifyEditVideo() {

        return Boolean.valueOf(getConfig(KeyValue.verifyEditVideo, "true"));
    }

    @Override
    public void saveSystemSetting( SystemSetting setting ) {
        
        saveConfig(KeyValue.accessAuthc, setting.getAccessAuthc().toString());
        saveConfig(KeyValue.enableRegister, setting.getEnableRegister().toString());
        saveConfig(KeyValue.verifyRegister, setting.getVerifyRegister().toString());
        saveConfig(KeyValue.enableComment, setting.getEnableComment().toString());
        saveConfig(KeyValue.verifyConment, setting.getVerifyConment().toString());
        saveConfig(KeyValue.verifyNewCourse, setting.getVerifyNewCourse().toString());
        saveConfig(KeyValue.verifyEditCourse, setting.getVerifyEditCourse().toString());
        saveConfig(KeyValue.verifyNewLive, setting.getVerifyNewLive().toString());
        saveConfig(KeyValue.verifyEditLive, setting.getVerifyEditLive().toString());
        saveConfig(KeyValue.verifyNewVideo, setting.getVerifyNewVideo().toString());
        saveConfig(KeyValue.verifyEditVideo, setting.getVerifyEditVideo().toString());
    }

    @Override
    public SystemSetting getSystemSetting() {

        SystemSetting setting = new SystemSetting();
        setting.setAccessAuthc(isAccessAuthc());
        setting.setEnableRegister(isEnableRegister());
        setting.setVerifyRegister(isVerifyRegister());
        setting.setEnableComment(isEnableComment());
        setting.setVerifyConment(isVerifyConment());
        setting.setVerifyNewCourse(isVerifyNewCourse());
        setting.setVerifyEditCourse(isVerifyEditCourse());
        setting.setVerifyNewLive(isVerifyNewLive());
        setting.setVerifyEditLive(isVerifyEditLive());
        setting.setVerifyNewVideo(isVerifyNewVideo());
        setting.setVerifyEditVideo(isVerifyEditVideo());
        return setting;
    }
    

}
