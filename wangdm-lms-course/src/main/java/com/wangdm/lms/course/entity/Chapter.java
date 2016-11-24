package com.wangdm.lms.course.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import com.wangdm.core.entity.BaseEntity;

/**
 * @author wangdm
 * @desc 课程章节的实体，每个课程对应多个章节，每个章节对应零个或一个视频，章节为一级结构，
 * @version 1.0
 * @created 2016.06.27
 */
@Entity
@Table(name = "CourseChapter")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Chapter extends BaseEntity{

	private static final long serialVersionUID = 422060347563350659L;

	//标题
	@Column(name="title", nullable=false, length=256)
	private String title;
	
	//章节循序
	@Column(name="idx", nullable=false)
	private Long index;
    
	//所属课程
    @ManyToOne
    @JoinColumn(name="courseId")
    private Course course;
    
    //对应的视频
    @OneToOne
    @JoinColumn(name="videoId")
    private Video video;
    
    //对应的直播
    @OneToOne
    @JoinColumn(name="liveId")
    private Live live;

	public Chapter(){

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

	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	public Video getVideo() {
		return video;
	}

	public void setVideo(Video video) {
		this.video = video;
	}


	public Live getLive() {
		return live;
	}


	public void setLive(Live live) {
		this.live = live;
	}
	

	
}