package com.wangdm.lms.config.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wangdm.lms.config.dto.SystemInfo;
import com.wangdm.lms.config.entity.KeyValue;
import com.wangdm.lms.config.service.SystemInfoService;

@Service("systemInfoService")
@Transactional
public class SystemInfoServiceImpl extends ConfigServiceImpl implements SystemInfoService {

    public void setSystemInfoTitle( String title ) {

        saveConfig(KeyValue.systemInfoTitle, title);
    }

    public String getSystemInfoTitle() {

        return getConfig(KeyValue.systemInfoTitle, "学习管理系统");
    }

    public void setSystemInfoICP( String icp ) {

        saveConfig(KeyValue.systemInfoICP, icp);
    }

    public String getSystemInfoICP() {

        return getConfig(KeyValue.systemInfoICP, "粤ICP备15037391号");
    }

    public void setSystemInfoCopyright( String title ) {

        saveConfig(KeyValue.systemInfoCopyright, title);
    }

    public String getSystemInfoCopyright() {

        return getConfig(KeyValue.systemInfoCopyright, "Copyright © 2014-2016 深圳市拓奇录播技术有限公司 All rights reserved");
    }

    public void setSystemInfoAddress( String title ) {

        saveConfig(KeyValue.systemInfoAddress, title);
    }

    public String getSystemInfoAddress() {

        return getConfig(KeyValue.systemInfoAddress, "深圳市南山区科技南十二路方大大厦1405室");
    }

    public void saveSystemInfo( SystemInfo system ) {

        this.setSystemInfoTitle(system.getTitle());
        this.setSystemInfoICP(system.getIcp());
        this.setSystemInfoCopyright(system.getCopyright());
        this.setSystemInfoAddress(system.getAddress());
    }

    public SystemInfo getSystemInfo() {

        SystemInfo system = new SystemInfo();
        system.setTitle(this.getSystemInfoTitle());
        system.setIcp(this.getSystemInfoICP());
        system.setCopyright(this.getSystemInfoCopyright());
        system.setAddress(this.getSystemInfoAddress());
        return system;
    }

}
