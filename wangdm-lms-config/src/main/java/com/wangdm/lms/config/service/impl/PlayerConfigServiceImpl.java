package com.wangdm.lms.config.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wangdm.lms.config.entity.KeyValue;
import com.wangdm.lms.config.service.PlayerConfigService;

@Service("playerConfigService")
@Transactional
public class PlayerConfigServiceImpl extends ConfigServiceImpl implements PlayerConfigService {

    public void setJWPlayerUrl( String url ) {

        saveConfig(KeyValue.jwplayerUrl, url);
    }

    public String getJWPlayerUrl() {

        return getConfig(KeyValue.jwplayerUrl, "/touchschoolcms/assets/plugins/jwplayer/jwplayer.js");
    }

    public void setJWPlayerKey( String key ) {

        saveConfig(KeyValue.jwplayerKey, key);
    }

    public String getJWPlayerKey() {

        return getConfig(KeyValue.jwplayerKey, "5pcniCatLq4er9Y40pB9uiPEPVo3rxWLoqpQCw==");
    }

    public void setJWPlayerConfig( String config ) {

        saveConfig(KeyValue.jwplayerConfig, config);
    }

    public String getJWPlayerConfig() {

        String defaultConfig = "{" + "autostart : \"true\"," + "aspectratio : \"16:9\"," + "width : \"100%\"," + "}";
        return getConfig(KeyValue.jwplayerConfig, defaultConfig);
    }
}
