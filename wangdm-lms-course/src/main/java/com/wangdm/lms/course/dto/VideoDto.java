package com.wangdm.lms.course.dto;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.wangdm.core.constant.EntityStatus;
import com.wangdm.core.dto.BaseDto;
import com.wangdm.core.dto.annotation.DtoMapper;
import com.wangdm.lms.course.entity.Video;

public class VideoDto extends BaseDto {

	@DtoMapper(entity = Video.class, field = "id")
	private String id;

	// 收藏id
	private String fid;
	// 状态
	@DtoMapper(entity = Video.class, field = "status")
	private EntityStatus status;

	// 标题
	@DtoMapper(entity = Video.class, field = "title")
	private String title;

	// 图片
	@DtoMapper(entity = Video.class, field = "image")
	private String image;

	// 图片路径
	private String imageurl;
	
	// 简介
	@DtoMapper(entity = Video.class, field = "description")
	private String description;

	// 文件名
	@DtoMapper(entity = Video.class, field = "filename")
	private String filename;

	// rtmp播放地址
	private String rtmpUrl;

	// hls播放地址
	private String hlsUrl;

	// 播放次数
	@DtoMapper(entity = Video.class, field = "playCnt")
	private int playCnt = 0;

	// 点赞次数
	@DtoMapper(entity = Video.class, field = "greatCnt")
	private int greatCnt = 0;

	// 收藏次数
	@DtoMapper(entity = Video.class, field = "favtimes")
	private int favtimes = 0;

	// 分享次数
	@DtoMapper(entity = Video.class, field = "sharetimes")
	private int sharetimes = 0;

	// 用户id
	@DtoMapper(entity = Video.class, field = "user.id")
	private String userId;

	// 用户名称
	@DtoMapper(entity = Video.class, field = "user.username")
	private String username;

	// 分类id
	@DtoMapper(entity = Video.class, field = "category.id")
	private String categoryId;

	// 分类名称
	@DtoMapper(entity = Video.class, field = "category.name")
	private String categoryName;

	// 所属课程id
	@DtoMapper(entity = Video.class, field = "course.id")
	private String courseId;

	@DtoMapper(entity = Video.class, field = "course.title")
	private String courseName;

	// 所属课程名称
	@DtoMapper(entity = Video.class, field = "course.title")
	private String coursetitle;

	// 创建时间
	@DtoMapper(entity = Video.class, field = "createTime")
	private String createTime;


	@DtoMapper(entity = Video.class, field = "publiced")
	private int publiced;

	@DtoMapper(entity = Video.class, field = "commented")
	private int commented;

	@DtoMapper(entity = Video.class, field = "fowarded")
	private int fowarded;

	@DtoMapper(entity = Video.class, field = "download")
	private int download;

	@DtoMapper(entity = Video.class, field = "user.email")
	private String email;

	private String avatar;

	/**
	 * 属性名id、值ids 主要用于详情页展示数据
	 */

	private Map<Long, List<Long>> attrNameValueIds = new HashMap<>();
	private Map<String, List<String>> attrNameValueStr = new LinkedHashMap<>();
	/**
	 * 属性id和name
	 */
	private Map<Long, String> attrName = new HashMap<>();
	private Map<Long, String> attrValue = new HashMap<>();

	/**
	 * attrValueId集合 用于添加时向后台传输属性值id集合，修改时回显数据
	 * 
	 * @return
	 */
	private List<Long> attrValueIdList = new ArrayList<Long>();

	public List<Long> getAttrValueIdList() {
		return attrValueIdList;
	}

	public void setAttrValueIdList(List<Long> attrValueIdList) {
		this.attrValueIdList = attrValueIdList;
	}

	public Map<Long, List<Long>> getAttrNameValueIds() {
		return attrNameValueIds;
	}

	public void setAttrNameValueIds(Map<Long, List<Long>> attrNameValueIds) {
		this.attrNameValueIds = attrNameValueIds;
	}

	public Map<String, List<String>> getAttrNameValueStr() {
		return attrNameValueStr;
	}

	public void setAttrNameValueStr(Map<String, List<String>> attrNameValueStr) {
		this.attrNameValueStr = attrNameValueStr;
	}

	public Map<Long, String> getAttrName() {
		return attrName;
	}

	public void setAttrName(Map<Long, String> attrName) {
		this.attrName = attrName;
	}

	public Map<Long, String> getAttrValue() {
		return attrValue;
	}

	public void setAttrValue(Map<Long, String> attrValue) {
		this.attrValue = attrValue;
	}

	@Override
	public Long getEntityId() {
		return Long.valueOf(id);
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

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getRtmpUrl() {
		return rtmpUrl;
	}

	public void setRtmpUrl(String rtmpUrl) {
		this.rtmpUrl = rtmpUrl;
	}

	public String getHlsUrl() {
		return hlsUrl;
	}

	public void setHlsUrl(String hlsUrl) {
		this.hlsUrl = hlsUrl;
	}

	public int getPlayCnt() {
		return playCnt;
	}

	public void setPlayCnt(int playCnt) {
		this.playCnt = playCnt;
	}

	public int getGreatCnt() {
		return greatCnt;
	}

	public void setGreatCnt(int greatCnt) {
		this.greatCnt = greatCnt;
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

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getCourseId() {
		return courseId;
	}

	public void setCourseId(String courseId) {
		this.courseId = courseId;
	}

	public String getCoursetitle() {
		return coursetitle;
	}

	public void setCoursetitle(String coursetitle) {
		this.coursetitle = coursetitle;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
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

	public int getDownload() {
		return download;
	}

	public void setDownload(int download) {
		this.download = download;
	}

	public String getFid() {
		return fid;
	}

	public void setFid(String fid) {
		this.fid = fid;
	}

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	public EntityStatus getStatus() {
		return status;
	}

	public void setStatus(EntityStatus status) {
		this.status = status;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public String getImageurl() {
		return imageurl;
	}

	public void setImageurl(String imageurl) {
		this.imageurl = imageurl;
	}

}
