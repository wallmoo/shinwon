/**
 * @PackageName: com.market.mall.ifcomm.ep.service.impl
 * @FileName : AbstractEPServiceImpl.java
 * @Date : 2015. 12. 22.
 * @프로그램 설명 : EP 처리하는  Abstract Service implement Class
 * @author freelsj
 */

package com.market.mall.ifcomm.ep.service.impl;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.nio.charset.Charset;
import java.util.zip.GZIPOutputStream;

import javax.annotation.Resource;

import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.ifcomm.ep.service.EPService;

import egovframework.rte.fdl.property.EgovPropertyService;

public abstract class AbstractEPServiceImpl implements EPService {

	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	@Resource(name = "defaultDAO")
	protected CommonDefaultDAO defaultDAO;

	public abstract void makeAllProductEP();

	public abstract void makeSomeProductEP();

	@SuppressWarnings("resource")
	protected OutputStreamWriter getOutputStreamWriter(String fileName, boolean gzipFlag)
			throws IOException {

		// TODO replace with property
		String baseDir = propertiesService.getString("file.ep.path");
		
		System.out.println("****baseDir : " + baseDir);
		
		fileName = fileName + (gzipFlag == true ? ".txt.gz" : ".txt");
		
		System.out.println("****fileName : " +fileName);

		File outFile = null;
		OutputStreamWriter out = null;
		outFile = new File(baseDir, fileName);

		if (gzipFlag) {

			FileOutputStream fileStream = new FileOutputStream(outFile);
			GZIPOutputStream gzipStream = new GZIPOutputStream(fileStream);
			out = new OutputStreamWriter(gzipStream, Charset.forName("EUC-KR")
					.newEncoder());
		} else {
			out = new OutputStreamWriter(new FileOutputStream(outFile), Charset
					.forName("EUC-KR").newEncoder());
		}

		return out;
	}

}
