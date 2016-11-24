package com.wangdm.lms.course.dto;

import java.util.Map;

import com.wangdm.core.constant.EntityStatus;
import com.wangdm.core.dto.BaseDto;
import com.wangdm.core.dto.annotation.DtoMapper;
import com.wangdm.lms.course.constant.LiveStatus;
import com.wangdm.lms.course.entity.Live;

public class LiveDto extends BaseDto {

	@DtoMapper(entity = Live.class, field = "id")
	private int id;

	 //收藏id
    private String fid;
    
	// 编号
	@DtoMapper(entity = Live.class, field = "sn")
	private String sn;

	// 标题
	@DtoMapper(entity = Live.class, field = "title")
	private String title;

	// 图片位置
	@DtoMapper(entity = Live.class, field = "image")
	private String image;

    // 图片路径
    private String imageurl;

	// 描述
	@DtoMapper(entity = Live.class, field = "description")
	private String description;

	// 收藏次数
	@DtoMapper(entity = Live.class, field = "favtimes")
	private int favtimes = 0;

	// 分享次数
	@DtoMapper(entity = Live.class, field = "sharetimes")
	private int sharetimes = 0;

	//直播地址
	private String livePath;

    //rtmp播放地址
    private String rtmpUrl;

    //hls播放地址
    private String hlsUrl;

	@DtoMapper(entity = Live.class, field = "uuid")
	private String uuid;

	// 状态
	@DtoMapper(entity = Live.class, field = "status")
	private EntityStatus status;

	// 状态
	@DtoMapper(entity = Live.class, field = "liveStatus")
	private LiveStatus liveStatus;

	// 关联课程
	@DtoMapper(entity = Live.class, field = "course.id")
	private String courseId;
	
	@DtoMapper(entity = Live.class, field = "course.title")
	private String courseName;

	// 所属用户
	@DtoMapper(entity = Live.class, field = "user.id")
	private String userId;

	
	// 所属分类
	@DtoMapper(entity = Live.class, field = "category.id")
	private String categoryId;

	// 公开 0是 1否
	@DtoMapper(entity = Live.class, field = "publiced")
	private int publiced;

	// 是否评论 0是 1否
	@DtoMapper(entity = Live.class, field = "commented")
	private int commented;

	// 是否转发 0是 1否
	@DtoMapper(entity = Live.class, field = "fowarded")
	private int fowarded;

	@DtoMapper(entity = Live.class, field = "startTime")
	private String startTime;

	@DtoMapper(entity = Live.class, field = "createTime")
	private String createTime;
	
	@DtoMapper(entity = Live.class, field = "updateTime")
    private String updateTime;
	

    @DtoMapper(entity = Live.class, field = "endTime")
	private String endTime;
	
	@DtoMapper(entity = Live.class, field = "uuidTime")
    private String uuidTime;

	/**
	 * 其他关联属性
	 */
	
    private String subjectName;

	private String gradeName;
   
	private String userName;
	
   private String email;
   
	private String [] queryArray;
	
	private String[] queryName;
	
	private String  avatar;
	
	public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    private   Map<String,Object>  attributeMap;
	
    public Map<String, Object> getAttributeMap() {
        return attributeMap;
    }

    public void setAttributeMap(Map<String, Object> attributeMap) {
        this.attributeMap = attributeMap;
    }

    public String[] getQueryArray() {
        return queryArray;
    }

    public void setQueryArray(String[] queryArray) {
        this.queryArray = queryArray;
    }

    public String[] getQueryName() {
        return queryName;
    }

    public void setQueryName(String[] queryName) {
        this.queryName = queryName;
    }


	public String getSubjectName() {
		return subjectName;
	}

	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}

	public String getGradeName() {
		return gradeName;
	}

	public void setGradeName(String gradeName) {
		this.gradeName = gradeName;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	@Override
	public Long getEntityId() {
		return Long.valueOf(id);
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getSn() {
		return sn;
	}

	public void setSn(String sn) {
		this.sn = sn;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

    public String getImageurl() {
        return imageurl;
    }

    public void setImageurl(String imageurl) {
        this.imageurl = imageurl;
    }

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getFavtimes() {
		return favtimes;
	}

	public void setFavtimes(int favtimes) {
		this.favtimes = favtimes;
	}

	public int getSharetimes() {
		return sharetimes;
	}

	public void setSharetimes(int sharetimes) {
		this.sharetimes = sharetimes;
	}


	public String getLivePath() {
		return livePath;
	}

	public void setLivePath(String livePath) {
		this.livePath = livePath;
	}

	
    public String getRtmpUrl() {
    
        return rtmpUrl;
    }

    
    public void setRtmpUrl( String rtmpUrl ) {
    
        this.rtmpUrl = rtmpUrl;
    }

    
    public String getHlsUrl() {
    
        return hlsUrl;
    }

    
    public void setHlsUrl( String hlsUrl ) {
    
        this.hlsUrl = hlsUrl;
    }

    public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public EntityStatus getStatus() {
		return status;
	}

	public void setStatus(EntityStatus status) {
		this.status = status;
	}

	public LiveStatus getLiveStatus() {
		return liveStatus;
	}

	public void setLiveStatus(LiveStatus liveStatus) {
		this.liveStatus = liveStatus;
	}

	public String getCourseId() {
		return courseId;
	}

	public void setCourseId(String courseId) {
		this.courseId = courseId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getCategoryId() {
		return categoryId;
	}

	
	   public String getCreateTime() {
	        return createTime;
	    }

	    public void setCreateTime(String createTime) {
	        this.createTime = createTime;
	    }
	    
    	public String getStartTime() {
    		return startTime;
    	}
    
    	public String getUpdateTime() {
            return updateTime;
        }
    
        public void setUpdateTime(String updateTime) {
            this.updateTime = updateTime;
        }
    
        public String getUuidTime() {
            return uuidTime;
        }
    
        public void setUuidTime(String uuidTime) {
            this.uuidTime = uuidTime;
        }
        
    	public void setStartTime(String startTime) {
    		this.startTime = startTime;
    	}
    
    	public String getEndTime() {
    		return endTime;
    	}
    
    	public void setEndTime(String endTime) {
    		this.endTime = endTime;
    	}
    
    	public void setCategoryId(String categoryId) {
    		this.categoryId = categoryId;
    	}
    
    	public int getPubliced() {
    		return publiced;
    	}
    
    	public void setPubliced(int publiced) {
    		this.publiced = publiced;
    	}
    
    	public int getCommented() {
    		return commented;
    	}

    	public void setCommented(int commented) {
    		this.commented = commented;
    	}
    
    	public int getFowarded() {
    		return fowarded;
    	}
    
    	public void setFowarded(int fowarded) {
    		this.fowarded = fowarded;
    	}

    	public String getCourseName() {
    		return courseName;
    	}
    
    	public void setCourseName(String courseName) {
    		this.courseName = courseName;
    	}
    
    	public String getFid() {
    		return fid;
    	}

    	public void setFid(String fid) {
    		this.fid = fid;
    	}
    	
    	public String getEmail() {
    	       return email;
    	    }
    
    	    public void setEmail(String email) {
    	        this.email = email;
    	    }
	 
}


