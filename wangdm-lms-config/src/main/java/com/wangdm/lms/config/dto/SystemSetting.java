package com.wangdm.lms.config.dto;

public class SystemSetting {
    
    //登陆用户才能访问平台
    private Boolean accessAuthc = false;
    
    //开启注册功能
    private Boolean enableRegister = true;
    
    //注册用户需要审核
    private Boolean verifyRegister = true;
    
    //开启评论功能
    private Boolean enableComment = true;
    
    //评论需要审核才能发布
    private Boolean verifyConment = true;
    
    //专辑需要审核才能发布
    private Boolean verifyNewCourse = true;
    
    //专辑修改后需要重新审核
    private Boolean verifyEditCourse = true;
    
    //直播需要审核才能发布
    private Boolean verifyNewLive = true;
    
    //直播修改后需要重新审核
    private Boolean verifyEditLive = true;
    
    //视频需要审核才能发布
    private Boolean verifyNewVideo = true;
    
    //视频修改后需要重新审核
    private Boolean verifyEditVideo = true;

    
    public Boolean getAccessAuthc() {
    
        return accessAuthc;
    }

    
    public void setAccessAuthc( Boolean accessAuthc ) {
    
        this.accessAuthc = accessAuthc;
    }

    
    public Boolean getEnableRegister() {
    
        return enableRegister;
    }

    
    public void setEnableRegister( Boolean enableRegister ) {
    
        this.enableRegister = enableRegister;
    }

    
    public Boolean getVerifyRegister() {
    
        return verifyRegister;
    }

    
    public void setVerifyRegister( Boolean verifyRegister ) {
    
        this.verifyRegister = verifyRegister;
    }

    
    public Boolean getEnableComment() {
    
        return enableComment;
    }

    
    public void setEnableComment( Boolean enableComment ) {
    
        this.enableComment = enableComment;
    }

    
    public Boolean getVerifyConment() {
    
        return verifyConment;
    }

    
    public void setVerifyConment( Boolean verifyConment ) {
    
        this.verifyConment = verifyConment;
    }

    
    public Boolean getVerifyNewCourse() {
    
        return verifyNewCourse;
    }

    
    public void setVerifyNewCourse( Boolean verifyNewCourse ) {
    
        this.verifyNewCourse = verifyNewCourse;
    }

    
    public Boolean getVerifyEditCourse() {
    
        return verifyEditCourse;
    }

    
    public void setVerifyEditCourse( Boolean verifyEditCourse ) {
    
        this.verifyEditCourse = verifyEditCourse;
    }

    
    public Boolean getVerifyNewLive() {
    
        return verifyNewLive;
    }

    
    public void setVerifyNewLive( Boolean verifyNewLive ) {
    
        this.verifyNewLive = verifyNewLive;
    }

    
    public Boolean getVerifyEditLive() {
    
        return verifyEditLive;
    }

    
    public void setVerifyEditLive( Boolean verifyEditLive ) {
    
        this.verifyEditLive = verifyEditLive;
    }

    
    public Boolean getVerifyNewVideo() {
    
        return verifyNewVideo;
    }

    
    public void setVerifyNewVideo( Boolean verifyNewVideo ) {
    
        this.verifyNewVideo = verifyNewVideo;
    }

    
    public Boolean getVerifyEditVideo() {
    
        return verifyEditVideo;
    }

    
    public void setVerifyEditVideo( Boolean verifyEditVideo ) {
    
        this.verifyEditVideo = verifyEditVideo;
    }
    
}
