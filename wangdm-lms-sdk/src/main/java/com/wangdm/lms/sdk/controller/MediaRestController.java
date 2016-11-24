package com.wangdm.lms.sdk.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wangdm.lms.config.dto.JWPlayer;
import com.wangdm.lms.config.dto.MediaServer;
import com.wangdm.lms.config.service.MediaServerService;
import com.wangdm.lms.config.service.PlayerConfigService;

@Controller
@RequestMapping(value="/v1", produces="application/json; charset=UTF-8")
public class MediaRestController {
	
	@Autowired
	PlayerConfigService playerService;
	
	@Autowired
	MediaServerService serverService;
	
	@RequestMapping(value="/player",method=RequestMethod.GET)
	@ResponseBody
	public JWPlayer getPlayer(){
		JWPlayer player = new JWPlayer();
		player.setUrl(playerService.getJWPlayerUrl());
		player.setKey(playerService.getJWPlayerKey());
		player.setConfig(playerService.getJWPlayerConfig());
		return player;
	}
	
	@RequestMapping(value="/player",method=RequestMethod.POST)
	@ResponseBody
	public String savePlayer(@RequestBody JWPlayer player){
		if(player==null)
		{
			return "{\"result\":\"failed\"}";
		}
		String v = null;
		
		v = player.getUrl();
		if(v!=null && !"".equals(v)){
			playerService.setJWPlayerUrl(v);
		}
		
		v = player.getKey();
		if(v!=null && !"".equals(v)){
			playerService.setJWPlayerKey(v);
		}
		
		v = player.getConfig();
		if(v!=null && !"".equals(v)){
			playerService.setJWPlayerConfig(v);
		}

		return "{\"result\":\"success\"}";
	}
	@RequestMapping(value="/server",method=RequestMethod.GET)
	@ResponseBody
	public MediaServer getServer(HttpServletRequest request){
		MediaServer server = new MediaServer();
		server.setServerHost(serverService.getServerHost());
		server.setServerPort(serverService.getServerPort());
		server.setVodApp(serverService.getVodApp());
		server.setLiveApp(serverService.getLiveApp());
		server.setVodFilepath(serverService.getVodFilePath(request.getServletContext().getRealPath("/vods")));
		server.setTmpFilepath(serverService.getTmpFilePath(request.getServletContext().getRealPath("/vods")));
		return server;
	}
	
	@RequestMapping(value="/server",method=RequestMethod.POST)
	@ResponseBody
	public String saveServer(@RequestBody MediaServer server){
		if(server==null)
		{
			return "{\"result\":\"failed\"}";
		}
		String v = null;
		
		v = server.getServerHost();
		if(v!=null && !"".equals(v)){
			serverService.setServerHost(v);
		}
		
		v = server.getServerPort();
		if(v!=null && !"".equals(v)){
			serverService.setServerPort(v);
		}
		
		v = server.getVodApp();
		if(v!=null && !"".equals(v)){
			serverService.setVodApp(v);
		}
		
		v = server.getLiveApp();
		if(v!=null && !"".equals(v)){
			serverService.setLiveApp(v);
		}
		
		v = server.getVodFilepath();
		if(v!=null && !"".equals(v)){
			serverService.setVodFilePath(v);
		}
		
		v = server.getTmpFilepath();
		if(v!=null && !"".equals(v)){
			serverService.setTmpFilePath(v);
		}

		return "{\"result\":\"success\"}";
	}
}