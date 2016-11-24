package com.wangdm.lms.config.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wangdm.lms.config.entity.KeyValue;
import com.wangdm.lms.config.service.MediaServerService;

@Service("mediaServerService")
@Transactional
public class MediaServerServiceImpl extends ConfigServiceImpl implements MediaServerService {

    public void setServerHost( String url ) {

        saveConfig(KeyValue.mediaServerHost, url);
    }

    public String getServerHost() {

        return getConfig(KeyValue.mediaServerHost, "localhost");
    }

    public void setServerPort( String url ) {

        saveConfig(KeyValue.mediaServerPort, url);
    }

    public String getServerPort() {

        return getConfig(KeyValue.mediaServerPort, "1935");
    }

    public void setVodApp( String url ) {

        saveConfig(KeyValue.mediaServerVodApp, url);
    }

    public String getVodApp() {

        return getConfig(KeyValue.mediaServerVodApp, "vod");
    }

    public void setLiveApp( String url ) {

        saveConfig(KeyValue.mediaServerLiveApp, url);
    }

    public String getLiveApp() {

        return getConfig(KeyValue.mediaServerLiveApp, "live");
    }

    public void setVodFilePath( String url ) {

        saveConfig(KeyValue.mediaServerVodFilePath, url);
    }

    public String getVodFilePath( String defaultPath ) {

        return getConfig(KeyValue.mediaServerVodFilePath, defaultPath);
    }

    public void setTmpFilePath( String url ) {

        saveConfig(KeyValue.mediaServerTmpFilePath, url);
    }

    public String getTmpFilePath( String defaultPath ) {

        return getConfig(KeyValue.mediaServerTmpFilePath, defaultPath);
    }

    public String getVodPath() {

        StringBuilder str = new StringBuilder();
        str.append("rtmp://").append(this.getServerHost()).append(":").append(this.getServerPort()).append("/")
                .append(this.getVodApp()).append("/");
        return str.toString();
    }

    public String getLivePath() {

        StringBuilder str = new StringBuilder();
        str.append("rtmp://").append(this.getServerHost()).append(":").append(this.getServerPort()).append("/")
                .append(this.getLiveApp()).append("/");
        return str.toString();
    }
}
