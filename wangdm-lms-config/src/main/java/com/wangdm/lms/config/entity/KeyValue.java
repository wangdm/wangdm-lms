package com.wangdm.lms.config.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import com.wangdm.core.entity.BaseEntity;

/*
 * Key-Value配置信息的实体 
 */
@Entity
@Table(name = "KeyValue")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class KeyValue extends BaseEntity{

	private static final long serialVersionUID = 4327070830313384959L;
	
	@Column(name="k", nullable=false, unique=true, length=100)
	private String key;
    
	@Column(name="v", nullable=false, length=1024)
	private String value;
	
	//默认注册用户
	public static String defaultUserRole = "defaultUserRole";
    //管理员角色对应的角色
    public static String adminRole = "adminRole";
    //老师对应的角色
    public static String teacherRole = "teacherRole";
    //学生对应的角色
    public static String studentRole = "studentRole";
	
	//课程视频相关设置
	public static String courseReview = "courseReview";
    //课程视频相关设置
    public static String liveReview = "liveReview";
    //课程视频相关设置
    public static String videoReview = "videoReview";
    //课程视频相关设置
    public static String commentReview = "commentReview";
	
	//播放器选择
	public static String jwplayerUrl = "jwplayerUrl";
	//播放器设置
	public static String jwplayerKey = "jwplayerKey";
	//播放器设置
	public static String jwplayerConfig = "jwplayerConfig";
	
	//流媒体服务器主机
	public static String mediaServerHost = "mediaServerHost";
	//流媒体服务器端口
	public static String mediaServerPort = "mediaServerPost";
	//点播对应的应用
	public static String mediaServerVodApp = "mediaServerVodApp";
	//直播对应的应用
	public static String mediaServerLiveApp = "mediaServerLiveApp";
	//点播文件路径
	public static String mediaServerVodFilePath = "mediaServerVodFilePath";
	//临时文件路径
	public static String mediaServerTmpFilePath = "mediaServerTmpFilePath";
    //最大视频上传大小
    public static String uploadMaxVideoSize = "uploadMaxVideoSize";
	
	//系统标题
	public static String systemInfoTitle = "systemInfoTitle";
	//备案信息
	public static String systemInfoICP = "systemInfoICP";
	//版权说明
	public static String systemInfoCopyright = "systemInfoCopyright";
	//地址
	public static String systemInfoAddress = "systemInfoAddress";

    //图片上传地址
    public static String imageUploadUrl = "imageUploadUrl";
    //图片服务器地址
    public static String imageServerUrl = "imageServerUrl";
    //图片存储路径
    public static String imageLocalPath = "imageLocalPath";
    //图片保存路径
    public static String imageSupportFormat = "imageSupportFormat";
    //图片保存路径
    public static String imageUploadMaxsize = "imageUploadMaxsize";
    //图片保存路径
    public static String imageDirectoryType = "imageDirectoryType";

    //Web URL
    public static String webHostUrl = "webHostUrl";
    //Mobile URL
    public static String mobileHostUrl = "mobileHostUrl";
    //Admin URL
    public static String adminHostUrl = "adminHostUrl";
    //SDK URL
    public static String sdkHostUrl = "sdkHostUrl";
    
    //登陆用户才能访问平台
    public static String accessAuthc = "accessAuthc";
    //开启注册功能
    public static String enableRegister = "enableRegister";
    //注册用户需要审核
    public static String verifyRegister = "verifyRegister";
    //开启评论功能
    public static String enableComment = "enableComment";
    //评论需要审核才能发布
    public static String verifyConment = "verifyConment";
    //专辑需要审核才能发布
    public static String verifyNewCourse = "verifyNewCourse";
    //专辑修改后需要重新审核
    public static String verifyEditCourse = "verifyEditCourse";
    //直播需要审核才能发布
    public static String verifyNewLive = "verifyNewLive";
    //直播修改后需要重新审核
    public static String verifyEditLive = "verifyEditLive";
    //视频需要审核才能发布
    public static String verifyNewVideo = "verifyNewVideo";
    //视频修改后需要重新审核
    public static String verifyEditVideo = "verifyEditVideo";
	
	  //系统状态
    public static String systemStatus= "systemStatus";
    
    public KeyValue(){
    }
	
	public KeyValue(String key, String value){
		this.key = key;
		this.value = value;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}
}