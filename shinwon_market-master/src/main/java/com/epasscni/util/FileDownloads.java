package com.epasscni.util;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import egovframework.rte.fdl.property.EgovPropertyService;

@Component
public class FileDownloads {
	@Resource(name = "propertiesService") private EgovPropertyService propertiesService;

	/**
	 * 업로드 폴더의 웹경로를 반환 한다.
	 * @param uploadPropKey 업로드 폴더 Propertie 키
	 * @return
	 */
	public String getWebPath(String uploadPropKey)
	{
		return getWebPath(uploadPropKey, null);
	}
	
	/**
	 * 업로드 폴더의 웹경로에 파일명을 추가하여 반환한다.
	 * @param uploadPropKey 업로드 폴더 Propertie 키
	 * @param filename 업로드 된 서버파일명
	 * @return
	 */
	public String getWebPath(String uploadPropKey, String filename)
	{
		String webpath = "/";
		
		// 업로드 폴더 생성 //
		int i = 0;
		for(String folderName : propertiesService.getString(uploadPropKey).split("\\\\"))
		{
			if (i > 0)
				webpath = webpath + folderName + "/";
			
			i++;
		}
		
		// 파일명 존재 시 파일명을 웹경로에 포함 시킨다. //
		if (filename != null)
			webpath = webpath + filename;		
		
		return webpath;
	}
}
