package com.wangdm.lms.admin.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.wangdm.lms.config.service.ImageServerService;
import com.wangdm.lms.config.service.MediaServerService;


@Controller
@RequestMapping(value="/upload")
public class UploadController {
	
	@Autowired
	MediaServerService mediaServerService;
	
    @Autowired
    ImageServerService imageServerService;
	
	@RequestMapping(value="/video")
	@ResponseBody
	public String uploadVideo(@RequestParam MultipartFile videofile, HttpServletRequest request) throws IOException{
		System.out.println("文件名:" + videofile.getOriginalFilename());
		System.out.println("文件类型:" + videofile.getContentType());
		System.out.println("文件大小:" + videofile.getSize());
		
		String filename = null;
		String filepath = mediaServerService.getTmpFilePath(request.getServletContext().getRealPath("/vods"));
		String md5 = DigestUtils.md5Hex(videofile.getInputStream());
		if("video/mp4".equals(videofile.getContentType())){
			filename = md5 + ".mp4";
		}else{
			return "{\"result\":\"failed\",\"desc\":\"Unsurport file type\"}";
		}
		File file = new File(filepath,filename);
		if(!file.exists()){
			FileUtils.copyInputStreamToFile(videofile.getInputStream(), file);
		}
		System.out.println("目标路径:" + file.getAbsolutePath());

		return "{\"result\":\"success\",\"filename\":\""+filename+"\"}";
	}
    
    @RequestMapping(value="/image")
    @ResponseBody
    public String uploadImage(@RequestParam MultipartFile imagefile, HttpServletRequest request) throws IOException{
        System.out.println("文件名:" + imagefile.getOriginalFilename());
        System.out.println("文件类型:" + imagefile.getContentType());
        System.out.println("文件大小:" + imagefile.getSize());

        String filetype = null;
        String filename = null;
        String filepath = null;
        String rootdir = imageServerService.getImageLocalPath(request.getServletContext().getRealPath("/images"));
        
        Long maxsize = 1024*Long.parseLong(imageServerService.getImageUploadMaxsize());
        if(imagefile.getSize()>maxsize){
            return "{\"result\":\"failed\",\"desc\":\"Picture size is too big\"}";
        }
        
        String md5 = DigestUtils.md5Hex(imagefile.getInputStream());
        String filedir = "";
        String dirtype = imageServerService.getImageDirectoryType();
        if("date".equals(dirtype)){
            SimpleDateFormat sdf = new SimpleDateFormat("/yyyy/MM/");
            Date now = new Date();
            filedir = sdf.format(now);
        }else if("hash".equals(dirtype)){
            filedir = "/"+md5.substring(0, 1)+"/";
        }
        
        if("image/jpeg".equals(imagefile.getContentType())){
            filetype = "jpg";
            filename = md5 + ".jpg";
        }else if("image/png".equals(imagefile.getContentType())){
            filetype = "png";
            filename = md5 + ".png";
        }else{
            return "{\"result\":\"failed\",\"desc\":\"Unsurport file type\"}";
        }
        filepath = filedir + filename;
        File file = new File(rootdir,filepath);
        if(!file.exists()){
            FileUtils.copyInputStreamToFile(imagefile.getInputStream(), file);
        }
        System.out.println("目标路径:" + file.getAbsolutePath());
        String result =  "{ \"result\":\"success\""
                        +", \"originalName\": \""+ imagefile.getOriginalFilename() +"\""
                        +", \"filesize\": " + imagefile.getSize()
                        +", \"filetype\": \"" + filetype +"\""
                        +", \"filename\": \"" + filename +"\""
                        +", \"filepath\": \"" + filepath +"\""
                        +", \"url\": \""+ imageServerService.getImageServerUrl(request.getContextPath() + "/images") + filepath +"\""
                        +"}";
        result = result.replaceAll( "\\\\", "\\\\" );
        return result;
    }
	
}