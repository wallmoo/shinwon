package com.epasscni.util;

import java.io.File;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import egovframework.rte.fdl.property.EgovPropertyService;

/**
 * 업로드 된 서버의 파일 삭제
 * @author Administrator
 *
 */
@Component
public class FileDeletes {
	
	@Resource(name = "propertiesService") private EgovPropertyService propertiesService;
	
	/**
	 * 파일 삭제
	 * @param uploadPropKey 업로드 폴더의 Properties키
	 * @param fileName 삭제 할 파일명
	 * @return true - 삭제완료, false - 삭제실패
	 */
	public boolean execute(String uploadPropKey, String fileName)
	{
		boolean result = false;
		
		try
		{		
			// 업로드 폴더 정보 //
			String uploadFolder = propertiesService.getString(uploadPropKey);
			
			// 파일 객체 생성 //
			File file = new File(uploadFolder + fileName);
			
			// 파일 존재 시 삭제 처리 //
			if (file.exists())
				result = file.delete();
		} catch (Exception e) { }
		
		return result;
	}
}
