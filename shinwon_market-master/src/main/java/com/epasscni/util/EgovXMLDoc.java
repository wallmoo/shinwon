/**
 *  Class Name : EgovXMLDoc.java
 *  Description : XML파일을 파싱하여 구조체 형태로 반환 또는 구조체 형태의 데이터를 XML파일로 저장하는 Business Interface class
 *  Modification Information
 *
 *     수정일         수정자                   수정내용
 *   -------    --------    ---------------------------
 *   2009.02.03    박지욱          최초 생성
 *
 *  @author 공통 서비스 개발팀 박지욱
 *  @since 2009. 02. 03
 *  @version 1.0
 *  @see
 *
 *  Copyright (C) 2009 by MOPAS  All right reserved.
 */
package com.epasscni.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.StringWriter;
import java.util.HashMap;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Result;
import javax.xml.transform.Source;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathFactory;

import org.w3c.dom.CharacterData;
import org.w3c.dom.CDATASection;
import org.w3c.dom.DOMException;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.w3c.dom.Text;


public class EgovXMLDoc {

	// 파일구분자
    static final char FILE_SEPARATOR     = File.separatorChar;

    // 최대 문자길이
    static final int MAX_STR_LEN = 1024;

    // Log
   //protected static final Log log = LogFactory.getLog(EgovXMLDoc.class);
    /**
	 * XML스키마를 자바클래스(임의)로 생성
	 * @param String xml XML스키마
	 * @param String ja 생성될JAR파일의 위치
	 * @return boolean result 생성여부 True/False
	 * @exception Exception
	
	public static boolean creatSchemaToClass(String xml, String ja) throws Exception {

		boolean result = false;

		// 1. 스키마가 없으면 에러
		String file = xml.replace('\\', FILE_SEPARATOR).replace('/', FILE_SEPARATOR);
		File xmlFile = new File(file);
		if (!xmlFile.exists() || !xmlFile.isFile()) {
			//log.debug("+++ 지정된 위치에 스키마 파일이 없습니다.");
			return false;
		}

		// 2. 동일한 jar파일이 이미 존재하면 에러
		String jar = ja.replace('\\', FILE_SEPARATOR).replace('/', FILE_SEPARATOR);
		File jarFile = new File(jar);
		if (jarFile.exists()) {
			//log.debug("+++ 동일한 JAR 파일이 존재합니다.");
			return false;
		}

		// 3. scomp -src [소스생성위치] [xsd파일] : 입력받은 스키마를 컴파일하여 JAVA 소스파일로 생성
		Process p = null;
		String cmdStr = EgovProperties.getPathProperty(Globals.SHELL_FILE_PATH, "SHELL."+Globals.OS_TYPE+".compileSchema");
        String[] command = {cmdStr.replace('\\', FILE_SEPARATOR).replace('/', FILE_SEPARATOR),
        					jar,
        					file};
		p = Runtime.getRuntime().exec(command);
	    //프로세스가 처리될때까지 대기
	    p.waitFor();

	    //프로세스 에러시 종료
	    if (p.exitValue() != 0) {
	        BufferedReader b_err = new BufferedReader (new InputStreamReader(p.getErrorStream()));
	        while (b_err.ready()) {
	        	String line = b_err.readLine();
            	//if (line.length() <= MAX_STR_LEN) log.debug("ERR\n" + line);
	        }
	        b_err.close();
	    }
	    //프로세스 실행 성공시 결과 확인
	    else {
	    	result = true;
	    }
	    p.destroy();
		return result;
	}
	*/
	/**
	 * XML파일을 파싱하여 메일발송 클래스(임의)에 내용을 담아 반환
	 * @param String file XML파일
	 * @return SndngMailDocument mailDoc 메일발송 클래스(XML스키마를 통해 생성된 자바클래스)
	 * @exception Exception

	public static SndngMailDocument getXMLToClass(String file) throws Exception {

		File xmlFile = null;
		FileInputStream fis = null;
		SndngMailDocument mailDoc = null;
        try {
        	String file1 = file.replace('\\', FILE_SEPARATOR).replace('/', FILE_SEPARATOR);
        	xmlFile = new File(EgovWebUtil.filePathBlackList(file1));
	        if (xmlFile.exists() && xmlFile.isFile()) {
	        	fis = new FileInputStream(xmlFile);
	        	mailDoc = SndngMailDocument.Factory.parse(xmlFile);

        	}// else {
        		//log.debug("+++ File Not Found or Not File..");
        	//}
        } catch(Exception e) {
    	    //e.printStackTrace();
    	    throw e;	// 2011.10.10 보안점검 후속조치
        } finally {
            if (fis != null) fis.close();
        }

		return mailDoc;
	}
	 */
	/**
	 * XML데이터를 XML파일로 저장
	 * @param UserinfoDocument userDoc 사용자 임의 클래스(XML스키마를 통해 생성된 자바클래스)
	 * @param String fiile 저장될 파일
	 * @return boolean 저장여부 True / False
	 * @exception Exception
	
	public static boolean getClassToXML(SndngMailDocument mailDoc, String file) throws Exception {

		boolean result = false;

		FileOutputStream fos = null;

		try {

			String file1 = file.replace('\\', FILE_SEPARATOR).replace('/', FILE_SEPARATOR);
			file1 = EgovFileTool.createNewFile(file1);
			File xmlFile = new File(EgovWebUtil.filePathBlackList(file1));
	        fos = new FileOutputStream(xmlFile);

	        XmlOptions xmlOptions = new XmlOptions();
            xmlOptions.setSavePrettyPrint();
            xmlOptions.setSavePrettyPrintIndent(4);
            xmlOptions.setCharacterEncoding("UTF-8");
	        String xmlStr = mailDoc.xmlText(xmlOptions);

	        fos.write(xmlStr.getBytes("UTF-8"));
			result = true;

		} catch (Exception ex) {
			//ex.printStackTrace();
    	    throw ex;	// 2011.10.10 보안점검 후속조치
		} finally {
            if (fos != null) fos.close();
        }

		return result;
	}
	*/
	
	/**
	 * XML 파일을 파싱하여 데이터를 조작할 수 있는 Document 객체를 반환
	 * @param String file XML파일
	 * @return Document document 문서객체
	 * @exception Exception
	*/
	public static Document getXMLDocument(String xml) throws Exception {

		Document xmlDoc = null;

		String file = xml.replace('\\', FILE_SEPARATOR).replace('/', FILE_SEPARATOR);
        File srcFile = new File(file);
        FileInputStream fis = null;
        try {
        	if (srcFile.exists() && srcFile.isFile()) {

            	fis = new FileInputStream(srcFile);
            	DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
                DocumentBuilder builder = null;
                try {
                	factory.setValidating(true);
                    builder = factory.newDocumentBuilder();
                    xmlDoc = builder.parse(fis);
                } catch (Exception ex) {
                	//ex.printStackTrace();
            	    throw ex;	// 2011.10.10 보안점검 후속조치
                }
            }
        }catch(Exception e){
        	//e.printStackTrace();
    	    throw e;	// 2011.10.10 보안점검 후속조치
		}finally{
			if(fis!=null) fis.close();
		}

		return xmlDoc;
	}

	/**
	 * Document의 최상의 Element로 이동
	 * @param Document document XML데이터
	 * @return Element root 루트
	 * @exception Exception
	*/
	public static Element getRootElement(Document document) throws Exception {

		Element root = document.getDocumentElement();
		return root;
	}

	/**
	 * 하위에 새로운 Elemenet를 생성
	 * @param Document document XML데이터
	 * @prarm Element rt 추가될위치
	 * @param id 생성될 Element의 ID
	 * @return Element element 추가된 Element
	 * @exception Exception
	*/
	public static Element insertElement(Document document, Element rt, String id) throws Exception {

		Element child = null;
		Element root = null;
		try {
			if (rt == null) {
				root = getRootElement(document);
			} else {
				root = rt;
			}
			child = document.createElement(id);
			root.appendChild(child);
		} catch (DOMException ex) {
        	//ex.printStackTrace();
    	    throw ex;	// 2011.10.10 보안점검 후속조치
		}
		return child;
	}

	/**
	 * 하위에 문자열을 가지는 새로운 Elemenet를 생성
	 * @param Document document XML데이터
	 * @prarm Element rt 추가 위치
	 * @param id 생성될 Element의 ID
	 * @param text Element 하위에 들어갈 문자열
	 * @param useCdate CDATE 사용 여부 
	 * @return Element element 추가된 Element
	 * @exception Exception
	*/
	public static Element insertElement(Document document, Element rt, String id, String text , boolean useCdate) throws Exception {

		Element echild = null;
		Text tchild = null;
		CDATASection tCdate = null;
		Element root = null;

		try {
			if (rt == null) {
				root = getRootElement(document);
			} else {
				root = rt;
			}
			echild = document.createElement(id);
			root.appendChild(echild);
			// 특수문자를 알아서 치환해 버리네???
			// CDATE가 필요한 경우 분기 처리 
			if(useCdate){
				tCdate = document.createCDATASection(text);
				echild.appendChild(tCdate);
			}
			else
			{
				tchild = document.createTextNode(text);
				echild.appendChild(tchild);
			}
		} catch (DOMException ex) {
        	//ex.printStackTrace();
    	    throw ex;	// 2011.10.10 보안점검 후속조치
		}
		return echild;
	}

	/**
	 * 하위에 문자열을 추가
	 * @param Document document XML데이터
	 * @prarm Element rt 추가 위치
	 * @param id 생성될 Element의 ID
	 * @param text Element 하위에 들어갈 문자열
	 * @return Element element 추가된 Element
	 * @exception Exception
	*/
	public static Text insertText(Document document, Element rt, String text) throws Exception {

		Text tchild = null;
		Element root = null;
		try {
			if (rt == null) {
				root = getRootElement(document);
			} else {
				root = rt;
			}
			tchild = document.createTextNode(text);
			root.appendChild(tchild);
		} catch (DOMException ex) {
        	//ex.printStackTrace();
    	    throw ex;	// 2011.10.10 보안점검 후속조치
		}
		return tchild;
	}

	/**
	 * 마지막으로 입력되었거나 참조된 XML Node의 상위 Element를 리턴
	 * @prarm Element current 현재노드
	 * @return Element parent 상위노드
	 * @exception Exception
	*/
	public static Element getParentNode(Element current) throws Exception {

		Node parent = current.getParentNode();
		return (Element)parent;
	}

	/**
	 * Document 객체를 XML파일로 저장
	 * @param Document document 문서객체
	 * @param String fiile 저장될 파일
	 * @return boolean 저장여부 True / False
	 * @exception Exception
	*/
	public static boolean getXMLFile(Document document, String file) throws Exception {

		boolean retVal = false;

		try {

			String file1 = file.replace('\\', FILE_SEPARATOR).replace('/', FILE_SEPARATOR);
	        File srcFile = new File(file1);
	        if (srcFile.exists() && srcFile.isFile()) {

	        	Source source = new DOMSource(document);
				Result result = new StreamResult(srcFile);
				Transformer transformer = TransformerFactory.newInstance().newTransformer();
				transformer.setOutputProperty(OutputKeys.METHOD,"xml");
				transformer.setOutputProperty(OutputKeys.INDENT,"yes");
				transformer.transform(source,result);
	        }

		} catch (Exception ex) {
        	//ex.printStackTrace();
    	    throw ex;	// 2011.10.10 보안점검 후속조치
		}
		return retVal;
	}
	
	/**
	 * XML파일을 파싱하여 Document 에 내용을 담아 반환
	 * @param String file XML파일
	 * @return  Document document 문서객체
	 * @exception Exception
	 */
	public static Document getXMLFileToDocument(String file) throws Exception {

		File xmlFile = null;
		FileInputStream fis = null;
		Document xmlDoc = null;
        try {
        	String file1 = file.replace('\\', FILE_SEPARATOR).replace('/', FILE_SEPARATOR);
        	xmlFile = new File(filePathBlackList(file1));
	        if (xmlFile.exists() && xmlFile.isFile()) {
	        	fis = new FileInputStream(xmlFile);
	        	xmlDoc = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(fis);

        	}// else {
        		//log.debug("+++ File Not Found or Not File..");
        	//}
        } catch(Exception e) {
    	    //e.printStackTrace();
    	    throw e;	// 2011.10.10 보안점검 후속조치
        } finally {
            if (fis != null) fis.close();
        }

		return xmlDoc;
	}

	/**
	 * 파일 내부의 경로 처리 
	 * @param String file XML 경로 
	 * @return  String 
	 */
	public static String filePathBlackList(String value) {
		String returnValue = value;
		if (returnValue == null || returnValue.trim().equals("")) {
			return "";
		}

		returnValue = returnValue.replaceAll("\\.\\./", ""); // ../
		returnValue = returnValue.replaceAll("\\.\\.\\\\", ""); // ..\

		return returnValue;
	}
	
	/**
	 * XML URL 결과를  파싱하여 Document 에 내용을 담아 반환
	 * @param String full url
	 * @return  Document document 문서객체
	 * @exception Exception
	 */
	public static Document getXMLUrlToDocument(String url) throws Exception {

		Document xmlDoc = null;
		DocumentBuilderFactory docFactory = DocumentBuilderFactory.newInstance();
		DocumentBuilder docBuilder = docFactory.newDocumentBuilder();
		
		//  url에서 xml 받아오기!
		try
		{
			xmlDoc = docBuilder.parse(url);
		}
		catch(Exception e)
		{
			throw e;
		}	

		return xmlDoc;
	}
	
	/**
	 * XML Element 객체를 String 으로 변환 
	 * @param XML Element Object
	 * @return  String
	 * @exception Exception
	 */
	public static String getXmlElementToString(Element xmlDoc) throws Exception {
		
		String retStr = "";
		
		Source source = new DOMSource(xmlDoc);

		StringWriter writer = new StringWriter();
    	Result resultStr = new StreamResult(writer);

    	Transformer transformer = TransformerFactory.newInstance().newTransformer();
    	// xml 파일 인코딩 설정 
    	
    	transformer.setOutputProperty(OutputKeys.ENCODING,"euc-kr");
    	transformer.transform(source, resultStr);
    	retStr = writer.toString();

    	writer.close();
    	
		return retStr;
	}
	
	/**
	 * XML document 객체를 HashMap 으로 변환 
	 * @param XML Element Object, root_id
	 * @return  HashMap
	 * @exception Exception
	 */
	public static HashMap<String, Object> getXmlElementToMap(Document xmlDoc, String rootId) throws Exception {
		
		HashMap<String, Object> retMap = new HashMap<String, Object>();
		XPath  xpath = XPathFactory.newInstance().newXPath();
		NodeList nodeRt = (NodeList)xpath.evaluate("//"+rootId, xmlDoc, XPathConstants.NODESET);

		if(nodeRt == null || nodeRt.getLength() == 0)
		{
			return retMap;
		}
		else
		{
			NodeList childNodes = nodeRt.item(0).getChildNodes();
			for(int i = 0; i <  childNodes.getLength() ; i++ )
			{
				
				/*
				if(childNodes.item(i) instanceof CharacterData){
		            CharacterData child = (CharacterData) childNodes.item(i).getFirstChild();
		            data = child.getData();

		            if(data != null && data.trim().length() > 0)
		            	nodeVal =  child.getData();
		        }
				
				childElement = (Element) childNodes.item(i);
				String temp11 = childElement.getAttribute("data");
				System.out.println(" in data setting for loop toString = "+i+" : "+childNodes.item(i).toString());
				System.out.println(" in data setting for loop nodeVal = "+i+" : "+nodeVal);
				System.out.println(" in data setting for loop temp11 = "+i+" : "+temp11);
				System.out.println(" in data setting for loop getNodeName = "+i+" : "+childNodes.item(i).getNodeName());
				if(childNodes.item(i).hasChildNodes()){
					System.out.println(" in data setting for loop getNodeValue = "+i+" : "+childNodes.item(i).getFirstChild().getNodeValue());
				}
				System.out.println(" in data setting for loop getNodeType = "+i+" : "+childNodes.item(i).getNodeType());
				retMap.put(childNodes.item(i).getNodeName(), childNodes.item(i).toString());
				*/
				
				// 빈 노드의 경우에는 내부에 아무것도 없음 
				if(childNodes.item(i).hasChildNodes())
				{
					
					retMap.put(childNodes.item(i).getNodeName(), childNodes.item(i).getFirstChild().getNodeValue());
				}
			}//for
		}// else
		
		return retMap;
	}
	
}
