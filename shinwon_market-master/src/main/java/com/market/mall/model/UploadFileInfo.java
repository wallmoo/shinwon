package com.market.mall.model;

public class UploadFileInfo {
	private boolean isUpload = false;	
	private String originalFilename;
	private String uploadFilename;
	private String uploadFolder;
	private long fileSize;
	private String contentType;
	private String webpath;
	private String message;
	
	/**
	 * 업로드 상태
	 * @return true:업로드 성공, false:업로드 실패
	 */
	public boolean isUpload() {
		return isUpload;
	}
	
	/**
	 * 업로드 상태
	 * @param isUpload
	 */
	public void setUpload(boolean isUpload) {
		this.isUpload = isUpload;
	}
	
	/**
	 * 업로드요청 실제 파일명
	 * @return
	 */
	public String getOriginalFilename() {
		return originalFilename;
	}
	
	/**
	 * 업로드요청 실제 파일명
	 * @param originalFilename
	 */
	public void setOriginalFilename(String originalFilename) {
		this.originalFilename = originalFilename;
	}
	
	/**
	 * 서버에 업로드 된 파일명
	 * @return
	 */
	public String getUploadFilename() {
		return uploadFilename;
	}
	
	/**
	 * 서버에 업로드 된 파일명
	 * @param uploadFilename
	 */
	public void setUploadFilename(String uploadFilename) {
		this.uploadFilename = uploadFilename;
	}
	
	/**
	 * 파일이 업로드 된 폴더 전체 경로
	 * @return
	 */
	public String getUploadFolder() {
		return uploadFolder;
	}
	
	/**
	 * 파일이 업로드 된 폴더 전체 경로
	 * @param uploadFolder
	 */
	public void setUploadFolder(String uploadFolder) {
		this.uploadFolder = uploadFolder;
	}
	
	/**
	 * 업로듸 된 파일의 용량
	 * @return
	 */
	public long getFileSize() {
		return fileSize;
	}
	
	/**
	 * 업로듸 된 파일의 용량
	 * @param fileSize
	 */
	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}
	
	/**
	 * 업로드 된 파일의 ContentsType
	 * @return
	 */
	public String getContentType() {
		return contentType;
	}
	
	/**
	 * 업로드 된 파일의 ContentsType
	 * @param contentType
	 */
	public void setContentType(String contentType) {
		this.contentType = contentType;
	}
	
	/**
	 * 업로드파일 웹경로반환
	 * @return
	 */
	public String getWebpath() {
		return webpath;
	}
	
	
	/**
	 * 업로드파일 웹경로입력
	 * @param webpath
	 */
	public void setWebpath(String webpath) {
		this.webpath = webpath;
	}
	
	/**
	 * 업로드 처리 중 발생한 메세지 정보
	 * @return
	 */
	public String getMessage() {
		return message;
	}
	
	/**
	 * 업로드 처리 중 발생한 메세지 정보
	 * @param message
	 */
	public void setMessage(String message) {
		this.message = message;
	}
}

