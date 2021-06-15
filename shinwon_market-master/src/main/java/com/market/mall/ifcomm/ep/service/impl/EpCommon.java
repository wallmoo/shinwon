package com.market.mall.ifcomm.ep.service.impl;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.nio.charset.Charset;
import java.util.zip.GZIPOutputStream;

import javax.annotation.Resource;

import egovframework.rte.fdl.property.EgovPropertyService;


public class EpCommon {

	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	public OutputStreamWriter getOutputStreamWriter(String fileName, boolean gzipFlag)
			throws IOException {
		
		System.out.println(">>>>>>>>>>>>> : "+propertiesService.getString("file.ep.path"));
		
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
