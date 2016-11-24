package com.wangdm.lms.config.dto;

public class MediaServer {
	
	private String serverHost;
	
	private String serverPort;
	
	private String liveApp;
	
	private String vodApp;
	
	private String vodFilepath;
	
	private String tmpFilepath;

	public String getServerHost() {
		return serverHost;
	}

	public void setServerHost(String serverHost) {
		this.serverHost = serverHost;
	}

	public String getServerPort() {
		return serverPort;
	}

	public void setServerPort(String serverPort) {
		this.serverPort = serverPort;
	}

	public String getLiveApp() {
		return liveApp;
	}

	public void setLiveApp(String liveApp) {
		this.liveApp = liveApp;
	}

	public String getVodApp() {
		return vodApp;
	}

	public void setVodApp(String vodApp) {
		this.vodApp = vodApp;
	}

	public String getVodFilepath() {
		return vodFilepath;
	}

	public void setVodFilepath(String vodFilepath) {
		this.vodFilepath = vodFilepath;
	}

	public String getTmpFilepath() {
		return tmpFilepath;
	}

	public void setTmpFilepath(String tmpFilepath) {
		this.tmpFilepath = tmpFilepath;
	}
	
	public String getVodAppPath(){
		return "rtmp://"+this.serverHost+":"+this.serverPort+"/"+this.vodApp + "/";
	}
	
	public String getLiveAppPath(){
		return "rtmp://"+this.serverHost+":"+this.serverPort+"/"+this.liveApp + "/";
	}
}
