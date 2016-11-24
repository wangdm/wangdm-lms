package com.wangdm.lms.course.dto;



import org.apache.commons.lang.StringUtils;

import com.wangdm.core.constant.EntityStatus;
import com.wangdm.core.dto.BaseDto;
import com.wangdm.core.dto.annotation.DtoMapper;
import com.wangdm.core.entity.Entity;
import com.wangdm.lms.course.entity.Course;
import com.wangdm.lms.course.entity.Chapter;
import com.wangdm.lms.course.entity.Live;
import com.wangdm.lms.course.entity.Video;

/*
 * 直播课程的实体
 */
public class ChapterDto extends BaseDto{

	@DtoMapper(entity = Chapter.class, field = "id")
	private String id;

	// 标题
	@DtoMapper(entity = Chapter.class, field = "title")
	private String title;

	// 章节循序
	@DtoMapper(entity = Chapter.class, field = "index")
	private Long index;

	// 所属课程
	@DtoMapper(entity = Chapter.class, field = "course.id")
	private String courseId;

	// 对应的视频
	@DtoMapper(entity = Chapter.class, field = "video.id")
	private String videoId;
	
	@DtoMapper(entity = Chapter.class, field = "video.title")
	private String videoTitle;
	
	@DtoMapper(entity = Chapter.class, field = "video.description")
	private String videoDescription;

	@DtoMapper(entity = Chapter.class, field = "video.image")
	private String videoImgUrl;
	
	// 对应的直播
	@DtoMapper(entity = Chapter.class, field = "live.id")
	private String liveId;
	
	@DtoMapper(entity = Chapter.class, field = "live.image")
	private String liveImgUrl;

	@DtoMapper(entity = Chapter.class, field = "status")
	private EntityStatus status;
	
	public ChapterDto(String title, Long index, String courseId) {
		super();
		this.title = title;
		this.index = index;
		this.courseId = courseId;
	}
	
	public ChapterDto() {
		super();
	}
	
	
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Long getIndex() {
		return index;
	}

	public void setIndex(Long index) {
		this.index = index;
	}

	public String getCourseId() {
		return courseId;
	}

	public void setCourseId(String courseId) {
		this.courseId = courseId;
	}

	public String getVideoId() {
		return videoId;
	}

	public void setVideoId(String videoId) {
		this.videoId = videoId;
	}

	public String getVideoImgUrl() {
		return videoImgUrl;
	}

	public void setVideoImgUrl(String videoImgUrl) {
		this.videoImgUrl = videoImgUrl;
	}

	@Override
	public Long getEntityId() {
		return StringUtils.isBlank(id)?null:Long.valueOf(id);
	}

	public String getLiveId() {
		return liveId;
	}

	public void setLiveId(String liveId) {
		this.liveId = liveId;
	}

	public String getLiveImgUrl() {
		return liveImgUrl;
	}

	public void setLiveImgUrl(String liveImgUrl) {
		this.liveImgUrl = liveImgUrl;
	}

	@Override
    public Entity toEntity(Entity entity) {
		Chapter result=(Chapter)entity;
		if(getEntityId()!=null){
			result.setId(getEntityId());
		}
		result.setTitle(title);
		result.setIndex(index);
		result.setCourse(course);
		result.setLive(live);
		result.setVideo(video);
		return result;
	}
	
	private Course course=null;
	private Live live=null;
	private Video video=null;

	public Live getLive() {
		return live;
	}

	public void setLive(Live live) {
		this.live = live;
	}

	public Video getVideo() {
		return video;
	}

	public void setVideo(Video video) {
		this.video = video;
	}

	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	public EntityStatus getStatus() {
		return status;
	}

	public void setStatus(EntityStatus status) {
		this.status = status;
	}

	public String getVideoTitle() {
		return videoTitle;
	}

	public void setVideoTitle(String videoTitle) {
		this.videoTitle = videoTitle;
	}

	public String getVideoDescription() {
		return videoDescription;
	}

	public void setVideoDescription(String videoDescription) {
		this.videoDescription = videoDescription;
	}
	
}