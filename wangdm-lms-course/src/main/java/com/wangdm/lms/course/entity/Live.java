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
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

import com.wangdm.core.entity.BaseEntity;
import com.wangdm.lms.course.constant.AccessLevel;
import com.wangdm.lms.course.constant.LiveStatus;
import com.wangdm.lms.course.constant.LiveType;
import com.wangdm.user.entity.User;

/*
 * 直播课程的实体
 */
@Entity
@Table(name = "live")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Live extends BaseEntity{

	private static final long serialVersionUID = 8918050313933934602L;

	//编号
	@Column(name="sn", nullable=false, unique=true, length=20)
	private String sn;

	//标题
	@Column(name = "title", nullable = false, length = 60)
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

	//收藏次数
	@Column(name="favtimes")
	private Integer favtimes = 0;
	
	//分享次数
	@Column(name="sharetimes")
	private Integer sharetimes = 0;
	
	@Column(name="uuid", nullable = false, unique=true)
	private String uuid;
    
    //uuid 生成时间
    @Column(name="uuidtime", nullable = false)
    private Timestamp uuidTime;

	//创建时间
	@Column(name = "createtime", nullable = false)
	private Timestamp createTime;
	
	 //修改时间
    @Column(name = "updatetime", nullable = false)
    private Timestamp updateTime;
    
	//开始时间
	@Column(name = "starttime", nullable = false)
	private Timestamp startTime;

    //结束时间
	@Column(name = "endtime", nullable = false)
	private Timestamp endTime;
    
    //直播类型（直播 or 录播）
    @Column(name="courseType", nullable=false)
    private LiveType liveType = LiveType.VIDEO;
    
	//状态
	@Column(name = "liveStatus", nullable = false)
	private LiveStatus liveStatus;

    //关联视频
    @ManyToOne
    @JoinColumn(name = "videoId")
    private Video video;

	//关联课程
	@ManyToOne
	@JoinColumn(name = "courseId")
	private Course course;

	//所属用户
	@ManyToOne
	@JoinColumn(name = "uid", nullable = false)
	private User user;
    
    //所属分类
    @ManyToOne
    @JoinColumn(name="categoryId")
    @NotFound(action = NotFoundAction.IGNORE)
    private Category category;
    
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

    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }

    public Timestamp getUuidTime() {
        return uuidTime;
    }

    public void setUuidTime(Timestamp uuidTime) {
        this.uuidTime = uuidTime;
    }

    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }

    public Timestamp getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Timestamp updateTime) {
        this.updateTime = updateTime;
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

    public LiveType getLiveType() {
        return liveType;
    }

    public void setLiveType(LiveType liveType) {
        this.liveType = liveType;
    }

    public LiveStatus getLiveStatus() {
        return liveStatus;
    }

    public void setLiveStatus(LiveStatus liveStatus) {
        this.liveStatus = liveStatus;
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