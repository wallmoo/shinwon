/**
 * @PackageName: com.market.util
 * @FileName : MarshallUtil.java
 * @Date : 2015. 11. 19.
 * @프로그램 설명 : ***** 처리하는 Controller Class
 * @author moon
 */

package com.market.util;

/**
 * @author moon
 *
 */

import java.io.StringReader;
import java.io.StringWriter;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.bind.Unmarshaller;
import javax.xml.transform.stream.StreamSource;

import org.eclipse.persistence.jaxb.MarshallerProperties;

public class MarshallUtil {

	public static String MEDIA_TYPE_XML = "application/xml";
	public static String MEDIA_TYPE_JSON = "application/json";
	
	public static <T> String marshal(T object, String encoding, String mediaType) throws JAXBException {
		JAXBContext jAXBContext = JAXBContext.newInstance(object.getClass());
		Marshaller marshaller = jAXBContext.createMarshaller();

		marshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
		marshaller.setProperty(Marshaller.JAXB_ENCODING, encoding);
		marshaller.setProperty(MarshallerProperties.MEDIA_TYPE, mediaType);
        marshaller.setProperty(MarshallerProperties.JSON_INCLUDE_ROOT, false);

		StringWriter stringWriter = new StringWriter();
		marshaller.marshal(object, stringWriter);

		return stringWriter.toString();
	}

	public static <T> T unMarshal(String content, Class<T> clasz, String mediaType) throws JAXBException {
		JAXBContext jAXBContext = JAXBContext.newInstance(clasz);
		Unmarshaller unmarshaller = jAXBContext.createUnmarshaller();
		unmarshaller.setProperty(MarshallerProperties.MEDIA_TYPE, mediaType);
		unmarshaller.setProperty(MarshallerProperties.JSON_INCLUDE_ROOT, false);
		
		return unmarshaller.unmarshal(
				new StreamSource(new StringReader(content)), clasz).getValue();
	}
	
}