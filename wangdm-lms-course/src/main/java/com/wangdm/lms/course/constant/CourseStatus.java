package com.wangdm.lms.course.constant;

public enum CourseStatus {
	Draft(0,"草稿"),Verified(1,"即将开课"),Ongoing(2,"正在开课"),Finish(3,"课程结束");
	
	private int code;
	private String name;
	
	private CourseStatus(int code, String name)
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
	
	public static CourseStatus valueOf(int code){
		CourseStatus[] statuses = CourseStatus.values();
		for(CourseStatus status : statuses){
			if(status.code==code){
				return status;
			}
		}
		return null;
	}
}
