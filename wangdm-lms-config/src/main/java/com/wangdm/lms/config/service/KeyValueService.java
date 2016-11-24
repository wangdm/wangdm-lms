package com.wangdm.lms.config.service;

import com.wangdm.core.dto.Dto;
import com.wangdm.core.service.Service;

public interface KeyValueService extends Service {

	public Dto findbyKey(String key);
}
