package com.wangdm.lms.course.constant;

public enum LiveStatus {
		Upcoming(0,"即将直播"), Living(1,"正在直播"), Pause(2,"暂停"), Stop(3,"停止"), End(4,"结束"), Cancel(5,"取消");
		
		
	private int code;
	private String name;
	
	private LiveStatus(int code, String name)
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
	
	public static LiveStatus valueOf(int code){
		LiveStatus[] statuses = LiveStatus.values();
		for(LiveStatus status : statuses){
			if(status.code==code){
				return status;
			}
		}
		return null;
	}
}
