package com.wangdm.lms.config.service;

import com.wangdm.core.service.Service;

public interface ConfigService extends Service {

    public void saveConfig( String key, String value );

    public String getConfig( String key, String defaultValue );
}
