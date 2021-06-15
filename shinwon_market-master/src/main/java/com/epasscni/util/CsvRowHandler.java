package com.epasscni.util;

import java.io.File;
import java.io.FileWriter;
import java.util.Map;
import com.ibatis.sqlmap.client.event.RowHandler;
import com.opencsv.CSVWriter;

public class CsvRowHandler implements RowHandler{
	String filePath = "";
	String fileName = "";
	String fullFilePath = "";
	String[] dataNameArr;
	String[] rowTitleArr;
	int row = 0;
	
	public CsvRowHandler(){
		
	}
	
	//csv 파일 기본값 셋팅
	public CsvRowHandler(Map<String, Object> commandMap){
		//파일 생성
		this.filePath = (String) commandMap.get("filePath");
		 File destFile = new File(filePath);
         if(!destFile.exists()){
             destFile.mkdirs();
         }
         
        this.fileName = (String) commandMap.get("fileName");
 		this.fullFilePath = (String) commandMap.get("fullFilePath");
		
		//컬럼 제목
		this.rowTitleArr = (String[]) commandMap.get("rowTitleArr");
		
		//컬럼명 배열
		this.dataNameArr = (String[]) commandMap.get("dataNameArr");
	}

	@SuppressWarnings("unchecked")
	public void handleRow(Object valueObject) {
		Map<String, Object> m = (Map<String, Object>) valueObject;
		
		//System.out.println("#################valueObject========="+m);
		try {
            /**
             * csv 파일을 쓰기위한 설정
             * 설명
             * D:\\test.csv : csv 파일저장할 위치+파일명
             * EUC-KR : 한글깨짐설정을 방지하기위한 인코딩설정(UTF-8로 지정해줄경우 한글깨짐)
             * ',' : 배열을 나눌 문자열
             * '"' : 값을 감싸주기위한 문자
             **/
            CSVWriter cw = new CSVWriter(new FileWriter(fullFilePath, true));
            try {
                //배열을 이용하여 row를 CSVWriter 객체에 write
            	if(row == 0){//첫번째 row인 경우 엑셀 제목 입력
            		cw.writeNext(rowTitleArr);
            	}
                cw.writeNext(this.getDataArr(m));
                row++;
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                //무조건 CSVWriter 객체 close
                cw.close();
            }   
        } catch (Exception e) {
            e.printStackTrace();
        }
		
	}
	
	//맵에서 데이터를 꺼내 배열로 반환
	public String[] getDataArr(Map<String, Object> dataMap){
		String[] dataValueArr = new String[dataNameArr.length];
		
		for(int i=0; i<dataNameArr.length; i++){
			dataValueArr[i] = String.valueOf(dataMap.get(dataNameArr[i]));
		}
		
		return dataValueArr;
	}

}
