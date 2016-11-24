package com.wangdm.lms.course.constant;

public enum AccessLevel {
	PUBLIC(0,"公开"),PASSWORD(1,"访问密码"),ASSIGN(2,"指定用户"),FORBIDDEN (3,"禁止访问");
	
	private int code;
	private String name;
	
	private AccessLevel(int code, String name)
	{
		this.code = code;
		this.name = name;
	}
	
	public int toInt(){
		return this.code;
	}
	
	public String getName(){
		return this.name;
	}
	
	public static AccessLevel valueOf(int code){
		AccessLevel[] statuses = AccessLevel.values();
		for(AccessLevel status : statuses){
			if(status.code==code){
				return status;
			}
		}
		return null;
	}
}
