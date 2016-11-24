package com.wangdm.lms.course.entity;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import com.wangdm.core.entity.BaseEntity;
import com.wangdm.lms.course.constant.AccessLevel;
import com.wangdm.lms.course.constant.CourseStatus;
import com.wangdm.lms.course.constant.CourseType;
import com.wangdm.user.entity.User;

/*
 * 课程的实体
 */
@Entity
@Table(name = "course")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Course extends BaseEntity{

	private static final long serialVersionUID = -3485220579672662605L;

	
	//编号
	@Column(name="sn", nullable=false, unique=true, length=20)
	private String sn;
	
	//标题
	@Column(name="title", nullable=false, length=100)
	private String title;
	
	//封面
	@Column(name="poster", length=256)
	private String poster;
	
	//描述
	@Column(name="description", length=1024)
	private String desc;
	
	//详细介绍
	@Lob
	@Column(name="detail", length=1024)
	private String detail;
    
    //评分
    @Column(name="score", nullable=false)
    private Integer score = 0;
    
    //评分次数
    @Column(name="scoretimes", nullable=false)
    private Integer scoretimes = 0;
	
	//收藏次数
	@Column(name="favtimes", nullable=false)
	private Integer favtimes = 0;
	
	//分享次数
	@Column(name="sharetimes", nullable=false)
	private Integer sharetimes = 0;

	//所属用户
    @ManyToOne
    @JoinColumn(name="userId", nullable=false)
    private User user;
    
    //所属分类
    @ManyToOne
    @JoinColumn(name="categoryId")
    private Category category;
    
    //课程创建时间
	@Column(name="create_time", nullable=false)
    private Timestamp createTime;
    
	//课程信息最新修改时间
	@Column(name="modify_time", nullable=false)
    private Timestamp modifyTime;
    
	//预计开课时间
	@Column(name="start_time", nullable=false)
    private Timestamp startTime;
    
	//预计结课时间
	@Column(name="end_time", nullable=false)
    private Timestamp endTime;
    
	//课程最新视频更新时间
	@Column(name="update_time", nullable=false)
    private Timestamp updateTime;

	//已更新课时
    @Column(name="updatedLesson", nullable=false)
    private Integer updatedLesson = 0;
    
	//预计课时
    @Column(name="totallesson", nullable=false)
    private Integer totalLesson = 0;
    
	//课程类型（直播 or 录播）
    @Column(name="courseType", nullable=false)
    private CourseType courseType = CourseType.VIDEO;
    
	//课程状态
    @Column(name="courseStatus", nullable=false)
    private CourseStatus courseStatus = CourseStatus.Draft;
    
 	//访问级别 0是 1否
    @Column(name="accessLevel", nullable=false)
    private AccessLevel accessLevel = AccessLevel.PUBLIC;

    //访问密码
    @Column(name="password", length=20)
    private String password;
    
    //是否允许评论 0是 1否
    @Column(name="enableComment", nullable=false)
    private Boolean enableComment = true;
    
    //是否允许转发 0是 1否
    @Column(name="enableShare", nullable=false)
    private Boolean enableShare = true;

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

    public String getPoster() {
        return poster;
    }

    public void setPoster(String poster) {
        this.poster = poster;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    public Integer getScoretimes() {
        return scoretimes;
    }

    public void setScoretimes(Integer scoretimes) {
        this.scoretimes = scoretimes;
    }

    public Integer getFavtimes() {
        return favtimes;
    }

    public void setFavtimes(Integer favtimes) {
        this.favtimes = favtimes;
    }

    public Integer getSharetimes() {
        return sharetimes;
    }

    public void setSharetimes(Integer sharetimes) {
        this.sharetimes = sharetimes;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }

    public Timestamp getModifyTime() {
        return modifyTime;
    }

    public void setModifyTime(Timestamp modifyTime) {
        this.modifyTime = modifyTime;
    }

    public Timestamp getStartTime() {
        return startTime;
    }

    public void setStartTime(Timestamp startTime) {
        this.startTime = startTime;
    }

    public Timestamp getEndTime() {
        return endTime;
    }

    public void setEndTime(Timestamp endTime) {
        this.endTime = endTime;
    }

    public Timestamp getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Timestamp updateTime) {
        this.updateTime = updateTime;
    }

    public Integer getUpdatedLesson() {
        return updatedLesson;
    }

    public void setUpdatedLesson(Integer updatedLesson) {
        this.updatedLesson = updatedLesson;
    }

    public Integer getTotalLesson() {
        return totalLesson;
    }

    public void setTotalLesson(Integer totalLesson) {
        this.totalLesson = totalLesson;
    }

    public CourseType getCourseType() {
        return courseType;
    }

    public void setCourseType(CourseType courseType) {
        this.courseType = courseType;
    }

    public CourseStatus getCourseStatus() {
        return courseStatus;
    }

    public void setCourseStatus(CourseStatus courseStatus) {
        this.courseStatus = courseStatus;
    }

    public AccessLevel getAccessLevel() {
        return accessLevel;
    }

    public void setAccessLevel(AccessLevel accessLevel) {
        this.accessLevel = accessLevel;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Boolean getEnableComment() {
        return enableComment;
    }

    public void setEnableComment(Boolean enableComment) {
        this.enableComment = enableComment;
    }

    public Boolean getEnableShare() {
        return enableShare;
    }

    public void setEnableShare(Boolean enableShare) {
        this.enableShare = enableShare;
    }

    
}