package com.wangdm.lms.config.dto;

public class ImageServer {

    private String imageUploadUrl;
    
    private String imageServerUrl;
    
    private String imageLocalPath;
    
    private String imageSupportFormat;
    
    private String imageUploadMaxsize;
    
    private String imageDirectoryType;

    
    public String getImageUploadUrl() {
    
        return imageUploadUrl;
    }

    
    public void setImageUploadUrl( String imageUploadUrl ) {
    
        this.imageUploadUrl = imageUploadUrl;
    }

    
    public String getImageServerUrl() {
    
        return imageServerUrl;
    }

    
    public void setImageServerUrl( String imageServerUrl ) {
    
        this.imageServerUrl = imageServerUrl;
    }

    
    public String getImageLocalPath() {
    
        return imageLocalPath;
    }

    
    public void setImageLocalPath( String imageLocalPath ) {
    
        this.imageLocalPath = imageLocalPath;
    }

    
    public String getImageSupportFormat() {
    
        return imageSupportFormat;
    }

    
    public void setImageSupportFormat( String imageSupportFormat ) {
    
        this.imageSupportFormat = imageSupportFormat;
    }

    
    public String getImageUploadMaxsize() {
    
        return imageUploadMaxsize;
    }

    
    public void setImageUploadMaxsize( String imageUploadMaxsize ) {
    
        this.imageUploadMaxsize = imageUploadMaxsize;
    }

    
    public String getImageDirectoryType() {
    
        return imageDirectoryType;
    }

    
    public void setImageDirectoryType( String imageDirectoryType ) {
    
        this.imageDirectoryType = imageDirectoryType;
    }

    
}
