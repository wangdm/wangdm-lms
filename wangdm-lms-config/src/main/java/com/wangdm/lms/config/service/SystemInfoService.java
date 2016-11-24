package com.wangdm.lms.config.service;

import com.wangdm.core.service.Service;
import com.wangdm.lms.config.dto.SystemInfo;

public interface SystemInfoService extends Service{

	public void setSystemInfoTitle(String title);
	
	public String getSystemInfoTitle();
	
	public void setSystemInfoICP(String icp);
	
	public String getSystemInfoICP();
	
	public void setSystemInfoCopyright(String title);
	
	public String getSystemInfoCopyright();
	
	public void setSystemInfoAddress(String title);
	
	public String getSystemInfoAddress();
	
	public void saveSystemInfo(SystemInfo system);
	
	public SystemInfo getSystemInfo();
	
}
