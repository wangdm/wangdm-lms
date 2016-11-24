package com.wangdm.lms.course.entity;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

import com.wangdm.core.entity.BaseEntity;
import com.wangdm.user.entity.User;

/*
 * 视频实体
 */
@Entity
@Table(name = "video")
public class Video extends BaseEntity{

	private static final long serialVersionUID = 6576483911894344254L;

	//标题
	@Column(name="title", nullable=false, length=100)
	private String title;
	
	//图片
	@Column(name="poster", length=256)
	private String poster;
	
	//简介
	@Column(name="description", length=1024)
	private String desc;

	//文件名
	@Column(name="filename", length=256)
	private String filename;
	
	//播放次数
	@Column(name="play_cnt", nullable=false)
	private Integer playCnt = 0;
	
	//点赞次数
	@Column(name="great_cnt", nullable=false)
	private Integer greatCnt = 0;
	
	//收藏次数
	@Column(name="favtimes", nullable=false)
	private Integer favtimes = 0;
	
	//分享次数
	@Column(name="sharetimes", nullable=false)
	private Integer sharetimes = 0;
    
	//所属用户
    @ManyToOne
    @JoinColumn(name="uid", nullable=false)
    @NotFound(action = NotFoundAction.IGNORE)
    private User user;
    
    //分类
    @ManyToOne
    @JoinColumn(name="categoryId", nullable=true)
    @NotFound(action = NotFoundAction.IGNORE)
    private Category category;
    
    //所属课程
    @ManyToOne
    @JoinColumn(name="cid", nullable=true)
    @NotFound(action = NotFoundAction.IGNORE)
    private Course course;
    
    //创建时间
	@Column(name="create_time", nullable=false)
    private Timestamp createTime;
    
    //是否允许评论 0是 1否
    @Column(name="enableComment", nullable=false)
    private Boolean enableComment = true;
    
    //是否允许转发 0是 1否
    @Column(name="enableShare", nullable=false)
    private Boolean enableShare = true;
    
    //是否转发 0是 1否
    @Column(name="enableDownload", nullable=false)
    private Boolean enableDownload = false;

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

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public Integer getPlayCnt() {
        return playCnt;
    }

    public void setPlayCnt(Integer playCnt) {
        this.playCnt = playCnt;
    }

    public Integer getGreatCnt() {
        return greatCnt;
    }

    public void setGreatCnt(Integer greatCnt) {
        this.greatCnt = greatCnt;
    }

    public Integer getFavtimes() {
        return favtimes;
    }

    public void setFavtimes(Integer favtimes) {
        this.favtimes = favtimes;
    }

    public int getSharetimes() {
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

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
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

    public Boolean getEnableDownload() {
        return enableDownload;
    }

    public void setEnableDownload(Boolean enableDownload) {
        this.enableDownload = enableDownload;
    }

    
    
}