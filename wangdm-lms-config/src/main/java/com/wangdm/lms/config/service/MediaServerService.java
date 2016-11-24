package com.wangdm.lms.config.service;

import com.wangdm.core.service.Service;

public interface MediaServerService extends Service{
	
	public void setServerHost(String url);
	
	public String getServerHost();

	public void setServerPort(String url);
	
	public String getServerPort();
	
	public void setVodApp(String url);
	
	public String getVodApp();
	
	public void setLiveApp(String url);
	
	public String getLiveApp();
	
	public void setVodFilePath(String url);
	
	public String getVodFilePath(String defaultPath);
	
	public void setTmpFilePath(String url);
	
	public String getTmpFilePath(String defaultPath);
	
	public String getVodPath();
	
	public String getLivePath();
}
