package com.wangdm.lms.course.constant;

public enum LiveType {
	VIDEO(0,"录播课"),LIVE(1,"直播课"),SCHEDULE(2,"计划课");
	
	private int code;
	private String name;
	
	private LiveType(int code, String name)
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
	
	public static LiveType valueOf(int code){
		LiveType[] types = LiveType.values();
		for(LiveType type : types){
			if(type.code==code){
				return type;
			}
		}
		return null;
	}
}
