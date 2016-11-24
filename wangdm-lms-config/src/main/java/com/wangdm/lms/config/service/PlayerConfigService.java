package com.wangdm.lms.config.service;

import com.wangdm.core.service.Service;

public interface PlayerConfigService extends Service{
	
	public void setJWPlayerUrl(String url);
	
	public String getJWPlayerUrl();
	
	public void setJWPlayerKey(String key);
	
	public String getJWPlayerKey();
	
	public void setJWPlayerConfig(String config);
	
	public String getJWPlayerConfig();
}
