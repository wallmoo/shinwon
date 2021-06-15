package com.epasscni.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.Reader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVRecord;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.market.mall.dao.CommonDefaultDAO;

import egovframework.rte.fdl.property.EgovPropertyService;

@Component
public class CsvUtil {
	
	@Resource(name="propertiesService") protected EgovPropertyService propertiesService;
	@Resource(name="defaultDAO") private CommonDefaultDAO defaultDAO;
	
	public void csvDownload (String queryId, Map<String, Object> commandMap) {
		String filePath = propertiesService.getString("file.excel.image.uploadPath")+"/";
		commandMap.put("filePath", filePath);//csv 파일 생성 경로
		String fileName = UUID.randomUUID().toString() + ".csv";
		commandMap.put("fileName", fileName);//파일 이름
		String fullFilePath = filePath + fileName;
		commandMap.put("fullFilePath", fullFilePath);//file 풀 경로
		
		try {
		    /*
			defaultDAO.queryWithRowHandler(queryId, commandMap, new CsvRowHandler(commandMap)); //out of memory 방지 위해 맵에 담지 않고 한 row씩 바로바로 처리.
			
			HttpServletResponse response = (HttpServletResponse) commandMap.get("responseForCsv");
			String dnFileName = (String) commandMap.get("dnFileName");
			
			response.setContentType("text/csv");
			response.setHeader("Content-Disposition", "attachment;filename="+ dnFileName +".csv");
			
			File file = new File(fullFilePath);
			OutputStream out = response.getOutputStream();
			 
			FileInputStream fis = null;
		    fis = new FileInputStream(file);
		    FileCopyUtils.copy(fis, out);
		    if (fis != null){
		    	fis.close();
		    }
		    out.flush();
		    */
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	public List<Map<String,Object>> csvParse(CommonsMultipartFile file, String[] header){
		List<Map<String,Object>> result = new ArrayList<Map<String,Object>>();
		Iterable<CSVRecord> records = null;
		try {
			Reader in = new BufferedReader(new InputStreamReader(file.getInputStream()));
			records = CSVFormat.DEFAULT
			.withHeader(header)
			.withFirstRecordAsHeader()
			.parse(in);
			
			Iterator<CSVRecord> iterator = records.iterator();
			while(iterator.hasNext()) {
				Map<String, Object> map = new HashMap<String, Object>();
				CSVRecord record = iterator.next();
				Map<String, String> row = record.toMap();
				for( String key : row.keySet() ){
					map.put(key, row.get(key));
				}
				result.add(map);
			}
			return result;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return result;
		
	}

}
