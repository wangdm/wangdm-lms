package com.wangdm.lms.sdk.util;

public class PageUtil {
 public static String getPagation(int totalPage,int currentPage){
     if(totalPage==0){
         return "<p >亲,暂无相关数据哦</p>";
     }
     StringBuffer pageCode=new StringBuffer();
     pageCode.append("<li page-num='1'><a>首页</li>");
     if(currentPage==1){
         pageCode.append("<li page-num='1' class='disabled'><a href='#'>上一页</a></li>");
     }else{
         if(currentPage>1){
             if(currentPage==2){
                 pageCode.append("<li  page-num='1'><a>上一页</a></li>");  
             }else{
                 pageCode.append("<li page-num='"+(currentPage-1)+"'><a>上一页</a></li>");
             }       
         }    
     }
     for(int i=currentPage-2;i<currentPage+2;i++){
         if(i<1||i>totalPage){
             continue;
         }
         if(i==currentPage){
             pageCode.append("<li page-num="+i+" class='active'><a href='#'>"+i+"</a></li>");  
         }else{
             if(i==1){
                 pageCode.append("<li page-num="+i+"><a>"+i+"</a></li>");  
             }else{
                 pageCode.append("<li page-num="+ (i)+"><a>"+i+"</a></li>");  
             }          
         }        
     }
     if(currentPage==totalPage){
         pageCode.append("<li page-num="+(totalPage)+" class='disabled'><a href='#'>下一页</a></li>");
     }else{
         pageCode.append("<li page-num="+(currentPage+1)+"><a>下一页</a></li>");  
     }
     if(totalPage==1){
         pageCode.append("<li page-num='1'><a>尾页</a></li>");
     }else{
         pageCode.append("<li page-num="+(totalPage)+"><a>尾页</a></li>");
     }
     
     return pageCode.toString();
  }
}
