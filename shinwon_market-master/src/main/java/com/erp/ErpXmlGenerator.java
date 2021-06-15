package com.erp;

import java.io.StringWriter;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.springframework.web.bind.annotation.RequestBody;
import org.w3c.dom.Document;
import org.w3c.dom.Element;

public class ErpXmlGenerator {
	private DocumentBuilderFactory docFactory;
	private DocumentBuilder docBuilder;
	public ErpXmlGenerator() {
		docFactory = DocumentBuilderFactory.newInstance();
		try {
			docBuilder = docFactory.newDocumentBuilder();
		} catch (ParserConfigurationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	private Element createBody(String name, Map<String,Object> params) {
		Document document = docBuilder.newDocument();
		Element body = document.createElement("soap:Body");
		//envelope.appendChild(body);
		Element requestBodyElement = document.createElement(name);
		return body;
	}
	public static String getXmlString(String requestBodyName, Map<String,Object> requestBodyMap) {
		String xmlString = null;
		try {
		DocumentBuilderFactory docFactory = DocumentBuilderFactory.newInstance();
        DocumentBuilder docBuilder;
		docBuilder = docFactory.newDocumentBuilder();
        Document doc = docBuilder.newDocument();
        Element envelope = doc.createElement("soap:Envelope");
        envelope.setAttribute("xmlns:xsi", "http://www.w3.org/2001/XMLSchema-instance");
        envelope.setAttribute("xmlns:xsd", "http://www.w3.org/2001/XMLSchema");
        envelope.setAttribute("xmlns:soap", "http://schemas.xmlsoap.org/soap/envelope/");
        doc.appendChild(envelope);
        
        Element body = doc.createElement("soap:Body");
        envelope.appendChild(body);
        
        Element requestBodyElement = doc.createElement(requestBodyName);
        requestBodyElement.setAttribute("xmlns", "http://tempuri.org/");
        body.appendChild(requestBodyElement);
        if(requestBodyMap != null) {
	        Iterator requestBodyIterator = requestBodyMap.keySet().iterator();
	        while(requestBodyIterator.hasNext()) {
	        	String key = (String) requestBodyIterator.next();
	        	Element requestItem = doc.createElement(key);
	        	requestBodyMap.put(key, requestBodyMap.get(key).toString());
	        	requestItem.setTextContent(requestBodyMap.get(key).toString());
	            requestBodyElement.appendChild(requestItem);
	        }        
        }
        
        TransformerFactory transformerFactory = TransformerFactory.newInstance();
        Transformer transformer = transformerFactory.newTransformer();
		transformer = transformerFactory.newTransformer();
		transformer.setOutputProperty("{http://xml.apache.org/xslt}indent-amount", "4"); //정렬 스페이스4칸
        transformer.setOutputProperty(OutputKeys.ENCODING, "UTF-8");
        transformer.setOutputProperty(OutputKeys.INDENT, "yes"); //들여쓰기
        transformer.setOutputProperty(OutputKeys.DOCTYPE_PUBLIC, "yes");
        DOMSource source = new DOMSource(doc);
        StringWriter writer = new StringWriter();
        transformer.transform(source, new StreamResult(writer));
        xmlString = writer.getBuffer().toString();
		} catch (ParserConfigurationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (TransformerException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return xmlString;
	}

}
