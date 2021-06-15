package com.market.mall.model;

import java.io.Serializable;

public class UploadFile implements Serializable{

	private static final long serialVersionUID = -1379573802067044269L;

	public UploadFile() {
	}
	
	private String fileName;
	private String originalFileName;
	private String serverFileName;
	private String attachPath;
	private String systemPath;
	private long fileSize;
	private String contentType;
	private String webpath;
	private boolean isEmpty = true;
	private String ext;
	
	public String getAttachPath() {
        return attachPath;
    }
    public void setAttachPath(String attachPath) {
        this.attachPath = attachPath;
    }
    public String getSystemPath() {
        return systemPath;
    }
    public void setSystemPath(String systemPath) {
        this.systemPath = systemPath;
    }
    public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getOriginalFileName() {
		return originalFileName;
	}
	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}
	public String getServerFileName() {
		return serverFileName;
	}
	public void setServerFileName(String serverFileName) {
		this.serverFileName = serverFileName;
	}
	public long getFileSize() {
		return fileSize;
	}
	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}
	public String getContentType() {
		return contentType;
	}
	public void setContentType(String contentType) {
		this.contentType = contentType;
	}
	public boolean isEmpty() {
		return isEmpty;
	}
	public void setEmpty(boolean isEmpty) {
		this.isEmpty = isEmpty;
	}
	public String getWebpath() {
		return webpath;
	}
	public void setWebpath(String webpath) {
		this.webpath = webpath;
	}
	public String getExt() {
		return ext;
	}
	public void setExt(String ext) {
		this.ext = ext;
	}
}
