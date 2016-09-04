package com.wangdm.lms.admin.dto;

import com.wangdm.core.dto.BaseDto;

public class StatusDto extends BaseDto {
	
	private int code = 0;
	
	private String message = "success";

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

}
