package com.market.mall.am.common.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import net.sf.json.JSONObject;

import org.codehaus.jackson.JsonNode;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.w3c.dom.Document;
import org.w3c.dom.Element;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.util.EgovXMLDoc;
import com.epasscni.util.FileUpload;
import com.epasscni.util.StringUtil;
import com.epasscni.viewer.JSON;
import com.market.mall.am.common.service.CommonService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.common.annotations.AccessLevelAdmin;
import com.market.mall.common.annotations.FrontBannerSkip;
import com.market.mall.ifcomm.email.Mail;
import com.market.mall.ifcomm.sms.Sms;
import com.market.mall.model.Admin;
import com.market.mall.model.Admin.ROLEADMIN;
import com.market.util.ServerOsValidator;
import com.market.mall.model.Code;

import egovframework.rte.fdl.property.EgovPropertyService;

@Controller
@AccessLevelAdmin(ROLEADMIN.administrator)
public class CommonController {

	@Autowired
	private FileUpload fileUpload;

	@Resource(name = "commonService")
	private CommonService commonService;

	@Resource(name = "propertiesService")
	private EgovPropertyService propertiesService;

	@Resource
	protected Sms sms;
	
	@Resource
	protected Mail mail;

	/**
	 * <pre>
	 * 1. MethodName : commonFileDownload
	 * 2. ClassName  : CommonController.java
	 * 3. Comment    : ???????????? ???????????? 
	 * 4. ?????????       : kanghk
	 * 5. ?????????       : 2014. 4. 7.
	 * </pre>
	 * 
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/am/common/commonFileDownload")
	public ModelAndView commonFileDownload(HttpServletRequest request,
			@RequestParams Map<String, Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("downloadView");
		if (!"".equals(StringUtil.getString(commandMap.get("CMM_FLE_IDX"), ""))) {
			// ?????? ???????????? ??? ??????
			int result = this.commonService.updateCommonFileDownCount(commandMap);
			
			if (result > 0) {
				String webPath = StringUtil.getString(commandMap.get("CMM_FLE_SAVE_PATH"), "");
				String orgFileName = StringUtil.getString(commandMap.get("CMM_FLE_ORG_NM"), "");
				File file = new File(webPath);
				mv.addObject("downloadFile", file);
				mv.addObject("orgFileName", orgFileName);
			}
		}

		return mv;
	}

	// ???????????????
	@RequestMapping(value = "/upload/uploadJson")
	public ModelAndView uploadJson(HttpServletRequest request,
			HttpServletResponse response,
			@RequestParams() Map<String, Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();

		String pathType = StringUtil.getString(commandMap.get("pathType"),
				"default");
		String Allow = StringUtil.getString(commandMap.get("Allow"), "");
		String dateFolderFlag = StringUtil.getString(
				commandMap.get("dateFolderFlag"), "");

		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		CommonsMultipartFile file = (CommonsMultipartFile) multipartRequest
				.getFile("upload");

		if (file != null) {
			commandMap = fileUpload.execute(commandMap, file, pathType, Allow,
					dateFolderFlag);
		}

		JSONObject jsonObject = JSONObject.fromObject(commandMap);

		mv.addObject("jsonObject", jsonObject.toString());
		mv.setViewName("am/common/resultFile");

		return mv;
	}

	/**
	 * <pre>
	 * 1. MethodName : sampleFileDownload
	 * 2. ClassName  : CommonController.java
	 * 3. Comment    : ?????? ?????? ?????? ????????????
	 * 4. ?????????       : kanghk
	 * 5. ?????????       : 2014. 8. 28.
	 * </pre>
	 * 
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/am/common/sampleFileDownload")
	public ModelAndView sampleFileDownload(HttpServletRequest request,
			@RequestParams Map<String, Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("downloadView");
		String fileName = StringUtil.getString(commandMap.get("fileName"), "");

		if (!"".equals(fileName)) {
			String webPath = this.propertiesService
					.getString("file.excel.image.uploadPath") + "/" + fileName;

			File file = new File(webPath);
			mv.addObject("downloadFile", file);
			mv.addObject("orgFileName", fileName);
		}

		return mv;
	}

	/**
	 * <pre>
	 * 1. MethodName : commonSmsPopup
	 * 2. ClassName  : CommonController.java
	 * 3. Comment    : sms ?????? ??????
	 * 4. ?????????       : kanghk
	 * 5. ?????????       : 2015. 2. 4.
	 * </pre>
	 * 
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/am/common/commonSmsPopup")
	public ModelAndView commonSmsPopup(HttpServletRequest request,
			@RequestParams Map<String, Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.addObject("commandMap", commandMap);
		mv.setViewName("/am/common/sms/commonSmsPopup");
		return mv;
	}

	/**
	 * <pre>
	 * 1. MethodName : commonEmailPopup
	 * 2. ClassName  : CommonController.java
	 * 3. Comment    : Email ?????? ??????
	 * 4. ?????????       : DEV_LEEKWANGWOON
	 * 5. ?????????       : 2016. 2. 29.
	 * </pre>
	 * 
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/am/common/commonEmailPopup")
	public ModelAndView commonEmailPopup(HttpServletRequest request,
			@RequestParams Map<String, Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.addObject("commandMap", commandMap);
		mv.setViewName("/am/common/email/commonEmailPopup");
		return mv;
	}
	
	
	/**
	 * <pre>
	 * 1. MethodName : commonEmailPopup2
	 * 2. ClassName  : CommonController.java
	 * 3. Comment    : Email ?????? ??????
	 * 4. ?????????       : DEV_LEEKWANGWOON
	 * 5. ?????????       : 2016. 2. 29.
	 * </pre>
	 * 
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/am/common/commonEmailPopup2")
	public ModelAndView commonEmailPopup2(HttpServletRequest request,
			@RequestParams Map<String, Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.addObject("commandMap", commandMap);
		mv.setViewName("/am/common/email/commonEmailPopup2");
		return mv;
	}	

	/**
	 * <pre>
	 * 1. MethodName : commonSmsProc
	 * 2. ClassName  : CommonController.java
	 * 3. Comment    : sms ??????
	 * 4. ?????????       : kanghk
	 * 5. ?????????       : 2015. 2. 4.
	 * </pre>
	 * 
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/am/common/commonSmsProc")
	public ModelAndView commonSmsProc(HttpServletRequest request,
			@RequestParams Map<String, Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();
		int successCnt = 0;

		// ????????? id
		Admin admin = SessionsAdmin.getSessionAdmin(request);
		commandMap.put("REG_ID", admin.getADM_MST_ID());

		// ????????????
		String sendType = StringUtil.getString(commandMap.get("SEND_TYPE"), "");

		String phoneNos = StringUtil.getString(commandMap.get("PHONE_NOs"), "");
		String[] phoneArr = phoneNos.split(",");

		Map<String, Object> resultmap = new HashMap<String, Object>();

		// ?????? ??????
		for (String phoneNo : phoneArr) {
			// commandMap.put("TR_PHONE", phoneNo);

			// System.out.println("phoneNo>> " + phoneNo);

			//String[] PhoneNoArray = StringUtil.split(phoneNo, "^");
			// System.out.println("PhoneNoArray 1>> " + PhoneNoArray[0]);
			// System.out.println("PhoneNoArray 1>> " + PhoneNoArray[1]);
			//if (PhoneNoArray != null) {
			//	commandMap.put("TR_NAME", PhoneNoArray[0]);
			//	commandMap.put("TR_PHONE", PhoneNoArray[1]);
			//}
			
			commandMap.put("TR_NAME", "???????????????");
			commandMap.put("TR_PHONE", phoneNo);

			// ???????????? ??????
			if ("lms".equals(sendType)) {
				resultmap = this.sms.sendLongMessage(commandMap);
			} else {
				resultmap = this.sms.sendShortMessage(commandMap);
			}

			if ("0".equals(StringUtil.getString(resultmap.get("resultCode"), ""))) {
				successCnt++;
			} else {
				break;
			}
		}

		String resultMsg = StringUtil.getString(resultmap.get("resultMsg"), "");
		resultMsg = resultMsg.replaceAll("\r\n", "");

		mv.addObject("closeMsg", successCnt + "??? [" + resultMsg + "]");
		mv.setViewName("/am/common/result");

		return mv;
	}

	/**
	 * <pre>
	 * 1. MethodName : commonEmailSendProc
	 * 2. ClassName  : CommonController.java
	 * 3. Comment    : Email ?????? (????????? ??????)
	 * 4. ?????????       : DEV_LEEKWANGWOON
	 * 5. ?????????       : 2016. 2. 29.
	 * </pre>
	 * 
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/am/common/commonEmailSendProc")
	public ModelAndView commonEmailSendProc(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();
		int successCnt = 0;

		Map<String, Object> resultmap = new HashMap<String, Object>();

		// ????????? ??????
		resultmap = this.mail.mailSend(commandMap);

		if ("0".equals(StringUtil.getString(resultmap.get("resultCode"), ""))) {
			successCnt++;
		}

		String resultMsg = StringUtil.getString(resultmap.get("resultMsg"), "");
		resultMsg = resultMsg.replaceAll("\r\n", "");

		mv.addObject("closeMsg", successCnt + "??? [" + resultMsg + "]");
		mv.setViewName("/am/common/result");

		return mv;
	}

	
	/**
	 * <pre>
	 * 1. MethodName : commonEmailSendFormProc
	 * 2. ClassName  : CommonController.java
	 * 3. Comment    : Email ?????? ( ????????? ??????)
	 * 4. ?????????       : DEV_LEEKWANGWOON
	 * 5. ?????????       : 2016. 3. 2.
	 * </pre>
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/am/common/commonEmailSendFormProc")
	public ModelAndView commonEmailSendFormProc(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();
		int successCnt = 0;

		Map<String, Object> resultmap = new HashMap<String, Object>();

		// ????????? ??????
		resultmap = this.mail.mailSendForm(commandMap);

		if ("0".equals(StringUtil.getString(resultmap.get("resultCode"), ""))) {
			successCnt++;
		}

		String resultMsg = StringUtil.getString(resultmap.get("resultMsg"), "");
		resultMsg = resultMsg.replaceAll("\r\n", "");

		mv.addObject("closeMsg", successCnt + "??? [" + resultMsg + "]");
		mv.setViewName("/am/common/result");

		return mv;
	}	
	
	

	// ???????????????
	@RequestMapping(value = "/upload/SmartEditorUpload")
	public String SmartEditorUpload(HttpServletRequest request,
			HttpServletResponse response, Map<String, Object> commandMap)
			throws Exception {
		String pathType = StringUtil.getString(commandMap.get("pathType"),
				"default");
		String Allow = StringUtil.getString(commandMap.get("Allow"), "");
		String dateFolderFlag = StringUtil.getString(
				commandMap.get("dateFolderFlag"), "");

		String return1 = StringUtil.getString(commandMap.get("callback"), "");
		String return2 = "?callback_func="
				+ StringUtil.getString(commandMap.get("callback_func"), "");
		String return3 = "&errstr=error";

		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		CommonsMultipartFile file = (CommonsMultipartFile) multipartRequest
				.getFile("upload");

		Map<String, Object> tempMap = commandMap;
		if (file != null) {
			tempMap = fileUpload.execute(commandMap, file, pathType, Allow,
					dateFolderFlag);
			return3 = "&bNewLine=true&sFileName="
					+ StringUtil.getString(tempMap.get("ORG_NAME"), "")
					+ "&sFileURL="
					+ StringUtil.getString(tempMap.get("file_url"), "");
		}
		// mv.setViewName("/admin/common/resultFile");
		// JSONObject jsonObject = JSONObject.fromObject(tempMap);
		return "redirect:" + return1 + return2 + return3;
	}
		
	// html5 ???????????????
	@RequestMapping(value = "/upload/SmartEditorHtml5Upload")
	public void SmartEditorHtml5Upload(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String pathType = "editor";
		String dateFolderFlag = "Y";

		String destFileDir = propertiesService.getString("file.uploadPath");
		String webPathDomain = propertiesService
				.getString("server.upload.path");
		// webPathDomain = "/";
		String path = "";
		path += path + pathType + "/"; // ?????? ????????????

		if ("Y".equals(dateFolderFlag)) {
			String month = String.valueOf(Calendar.getInstance().get(
					Calendar.MONTH) + 1);
			if (month.length() == 1)
				month = "0" + month;

			String day = String.valueOf(Calendar.getInstance().get(
					Calendar.DATE));
			if (day.length() == 1)
				day = "0" + day;

			path += Calendar.getInstance().get(Calendar.YEAR);
			path += "/" + month + "/";
			path += day + "/";
		}
		destFileDir = destFileDir + path;
		File destFile = new File(destFileDir);
		if (!destFile.exists()) {
			destFile.mkdirs();
		}

		try {
			// ????????????
			String sFileInfo = "";
			// ???????????? ????????? - ?????? ???????????????
			String filename = request.getHeader("file-name");
			// ?????? ?????????
			String filename_ext = filename
					.substring(filename.lastIndexOf(".") + 1);
			// ???????????????????????? ??????
			filename_ext = filename_ext.toLowerCase();

			// ????????? ?????? ????????????
			String[] allow_file = { "jpg", "png", "bmp", "gif" };

			// ???????????? ???????????? ???????????????
			int cnt = 0;
			for (int i = 0; i < allow_file.length; i++) {
				if (filename_ext.equals(allow_file[i])) {
					cnt++;
				}
			}

			// ???????????? ??????
			if (cnt == 0) {
				PrintWriter print = response.getWriter();
				print.print("NOTALLOW_" + filename);
				print.flush();
				print.close();
			} else {
				// ?????????????????? ?????? ????????? ???????????? ?????? ??? ?????????
				// ?????? ????????????
				// ?????? ???????????? _ ????????????
				String filePath = destFileDir;
				File file = new File(filePath);
				if (!file.exists()) {
					file.mkdirs();
				}
				String realFileNm = "";
				realFileNm = UUID.randomUUID().toString() + "." + filename_ext;
				String rlFileNm = filePath + realFileNm;

				System.out.println("rlFileNm : " + rlFileNm);
				// /////////////// ????????? ???????????? /////////////////
				InputStream is = request.getInputStream();
				OutputStream os = new FileOutputStream(rlFileNm);
				int numRead;

				System.out.println(Integer.parseInt(request
						.getHeader("file-size")));
				byte b[] = new byte[Integer.parseInt(request
						.getHeader("file-size"))];
				while ((numRead = is.read(b, 0, b.length)) != -1) {
					os.write(b, 0, numRead);
				}
				if (is != null) {
					is.close();
				}
				os.flush();
				os.close();
				// /////////////// ????????? ???????????? /////////////////

				// ?????? ??????
				sFileInfo += "&bNewLine=true";
				// img ????????? title ????????? ????????????????????? ?????????????????? ??????
				sFileInfo += "&sFileName=" + filename;
				sFileInfo += "&sFileURL=" + "/upload/" + path + realFileNm;
				PrintWriter print = response.getWriter();
				print.print(sFileInfo);
				print.flush();
				print.close();
			}
		} catch (Exception e) {
			System.out.println("ddddddd");
			e.printStackTrace();
		}

	}

	// xml ????????? ??????
	@RequestMapping(value = "/util/xmlCreat")
	public void XmlCreate(HttpServletRequest request,
			HttpServletResponse response, Map<String, Object> commandMap)
			throws Exception {

		DocumentBuilderFactory docFactory = DocumentBuilderFactory
				.newInstance();
		DocumentBuilder docBuilder = docFactory.newDocumentBuilder();

		// new document
		Document document = docBuilder.newDocument();

		// ????????? root
		Element rt = document.createElement("Shoplinker");

		// ?????? root
		Element testXml = EgovXMLDoc.insertElement(document, rt,
				"MessageHeader");

		// sub root
		Element tempXml1 = EgovXMLDoc.insertElement(document, testXml,
				"firstRoot");
		Element tempXml2 = EgovXMLDoc.insertElement(document, testXml,
				"secRoot");

		// data
		EgovXMLDoc.insertElement(document, tempXml1, "send_id", "1", false);
		EgovXMLDoc.insertElement(document, tempXml1, "send_date", "???????????????1",
				true);
		EgovXMLDoc.insertElement(document, tempXml1, "send_flag");

		// data
		EgovXMLDoc.insertElement(document, tempXml2, "send_id", "2", false);
		EgovXMLDoc.insertElement(document, tempXml2, "send_date",
				"????????? & ?????? 22", true);

		// xml print out
		response.setContentType("text/xml;charset=euc-kr");
		PrintWriter pw = response.getWriter();
		try {
			String xmlOutStr = EgovXMLDoc.getXmlElementToString(rt);
			pw.write(xmlOutStr);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pw.close();
		}
	}

	// ????????????
	@RequestMapping(value = "/util/xmlGet")
	public void XmlGet(HttpServletRequest request,
			HttpServletResponse response, Map<String, Object> commandMap)
			throws Exception {

		String url = "http://local.bymall.com:8080/util/xmlCreat.do";

		Document document = EgovXMLDoc.getXMLUrlToDocument(url);

		/*
		 * System.out.println(
		 * "======================== result =====================");
		 * System.out.println("=== documnet ==="+document); System.out.println(
		 * "=====================================================");
		 * 
		 * XPath xpath = XPathFactory.newInstance().newXPath();
		 * 
		 * Element rootElement = EgovXMLDoc.getRootElement(document); String
		 * rootStr = rootElement.getTagName();
		 * System.out.println("====================================");
		 * System.out.println("====  rootStr  ===="+rootStr);
		 * System.out.println("===================================="); NodeList
		 * childNodes = rootElement.getChildNodes();
		 * 
		 * NodeList cols = (NodeList)xpath.evaluate("//firstRoot", document,
		 * XPathConstants.NODESET);
		 * 
		 * NodeList childNodes1 = cols.item(0).getChildNodes();
		 * 
		 * System.out.println("====  childNodes size  ===="+childNodes1.getLength
		 * ()); for(int i = 0; i < childNodes1.getLength() ; i++) {
		 * System.out.println("====  childNodes sub  ===="+childNodes1.item(i));
		 * System
		 * .out.println("====  childNodes sub  node type ===="+childNodes1.
		 * item(i).getNodeType()); }
		 */
		HashMap<String, Object> retMap = EgovXMLDoc.getXmlElementToMap(
				document, "MessageHeader");

		// map??? key?????? ???????????? object ?????? - ?????? Map??? ????????? ?????? ????????? ???????????? ???????????? ??????
		Iterator sessionKeys = retMap.keySet().iterator();
		String key = "";
		while (sessionKeys.hasNext()) {
			key = (String) sessionKeys.next();
			System.out.println("~~~~~~~~~~~~~~~~ key & value = " + key + " & "
					+ retMap.get(key));
		}

		// xml ????????? ?????? java document??? ???????????? ??? ??????!
		// Element outDoc = document.getDocumentElement();
		// System.out.println("====================================");
		// System.out.println("=== outDoc ==="+outDoc);
		// System.out.println("====================================");

	}

	/**
	 * <pre>
	 * 1. MethodName : commonZipCodePopup
	 * 2. ClassName  : CommonController.java
	 * 3. Comment    : ???????????? ??????
	 * 4. ?????????       : DEV_KIMSOYOUNG
	 * 5. ?????????       : 2015. 10. 19.
	 * </pre>
	 * 
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/am/common/commonZipCodePopup")
	public ModelAndView commonZipCodePopup(HttpServletRequest request,
			@RequestParams Map<String, Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();

		if (!"".equals(StringUtil.getString(commandMap.get("searchSido"), ""))) {
			// ???????????? ?????? ?????? ??????
			int totalCount = StringUtil.getString(commandMap.get("searchYn"),"N").equals("N") ? 0 : this.commonService.selectCommonZipCodeListCount(commandMap);

			// Paging paging = new Paging(totalCount, commandMap);
			// mv.addObject( "paging", paging );
			//
			// commandMap.put("startNum", paging.getStartNum());
			// commandMap.put("endNum", paging.getEndNum());

			List<Map<String, Object>> list = null;

			if (totalCount > 0) {
				// ???????????? ?????? ??????
				list = this.commonService.selectCommonZipCodeList(commandMap);
			}

			mv.addObject("list", list);

		}

		// ????????????
		mv.addObject("sidoList", this.commonService.selectCode("AREA_CD"));
		mv.addObject("commandMap", commandMap);

		// ???????????? ?????? tab
		String searchType = StringUtil.getString(commandMap.get("searchType"),
				"");

		 //????????????
		 if("BASIC".equals(searchType))
		 {
		 mv.setViewName("/am/common/zipcode/zipCodeBasic");
		 }
		 //???????????????
		if ("DORO".equals(searchType)) {
			mv.setViewName("/am/common/zipcode/zipCodeDoro");
		}
		// ????????????
		else if ("JIBUN".equals(searchType)) {
			mv.setViewName("/am/common/zipcode/zipCodeJibun");
		}
		// ???????????????
		else if ("BUILDING".equals(searchType)) {
			mv.setViewName("/am/common/zipcode/zipCodeBuilding");
		} else {
			 mv.setViewName("/am/common/zipcode/zipCodeBasic"); 
			// ?????? ?????? ????????? ???
			//mv.setViewName("/am/common/zipcode/zipCodeDoro");
		}

		return mv;
	}

	/**
	 * <pre>
	 * 1. MethodName : commonZipCodePopupSigunguAjax
	 * 2. ClassName  : CommonController.java
	 * 3. Comment    : ???/??? ????????? ?????? ???/???/??? ?????? ??????
	 * 4. ?????????       : DEV_KIMSOYOUNG
	 * 5. ?????????       : 2015. 10. 19.
	 * </pre>
	 * 
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/am/common/commonZipCodePopupSigunguAjax")
	public JSON commonZipCodePopupSigunguAjax(HttpServletRequest request,
			@RequestParams Map<String, Object> commandMap) throws Exception {
		JSON json = new JSON();

		if (!"".equals(StringUtil.getString(commandMap.get("SIDO"), ""))) {
			// ???/???/??? ?????? ??????
			json.put("list",
					this.commonService.selectZipcodeSigunguList(commandMap));
		}

		return json;
	}

    /**
     * <pre>
     * 1. MethodName : getSubCodeAjax
     * 2. ClassName  : CommonController.java
     * 3. Comment    : ???????????? ?????? ajax
     * 4. ?????????       : khcho
     * 5. ?????????       : 2016. 01. 06.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
     @RequestMapping("/am/common/getSubCodeAjax")
     public JSON getSubCodeAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
     {
         JSON json = new JSON();
         String code = (String)commandMap.get("code");
         
         List<Map<String, Object>> subCodeList =this.commonService.selectCodeByCode(code);
         
         json.put("list",  subCodeList);
 
         return json;
     }   
     
     
 
     /**
     * <pre>
     * 1. MethodName : getPostAddrApi
     * 2. ClassName  : CommonController.java
     * 3. Comment    : ???????????? / ????????? ?????? ??????
     * 4. ?????????       : DEV_LEESANGWOOK
     * 5. ?????????       : 2016. 8. 30.
     * </pre>
     *
     * @param req
     * @param response
     * @param commandMap
     * @throws Exception
     */
    @RequestMapping(value="/am/common/getPostAddrApi")
     public void getPostAddrApi(HttpServletRequest req, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception
     {
         String currentPage = StringUtil.getString(commandMap.get("currentPage"), "");
         String countPerPage = StringUtil.getString(commandMap.get("countPerPage"), "") ;
         String confmKey = Code.POST_API_KEY;
         String keyword = StringUtil.getString(commandMap.get("keyword"), "");
         String apiUrl = "http://www.juso.go.kr/addrlink/addrLinkApi.do?currentPage="+currentPage+"&countPerPage="+countPerPage+"&keyword="+URLEncoder.encode(keyword,"UTF-8")+"&confmKey="+confmKey;

         HttpURLConnection conn = null;
         URL url = null;
         try{
             String tokenString = "";
             String xmlString = "";
  
             url = new URL(apiUrl);
             conn = (HttpURLConnection)url.openConnection();
             conn.setRequestMethod("GET");
             conn.setRequestProperty("Cache-Control", "no-cache");
             conn.setRequestProperty("Content-Type", "application/xml");
             conn.setDoInput(true);
             conn.setDoOutput(true);
  
             if(conn.getResponseCode() == 200){
                 BufferedReader accessTokenResult = new BufferedReader(new InputStreamReader(conn.getInputStream()));
      
                 while((tokenString = accessTokenResult.readLine()) != null){
                     xmlString += tokenString;
                 }
                 response.setCharacterEncoding("UTF-8");
                 response.setContentType("text/xml;charset=utf-8");
                 response.getWriter().write(xmlString.toString());
                 
             }
             conn.disconnect();
         }catch(Exception e){
             if(conn!=null)
             {
                 try{
                     conn.disconnect();
                 }catch(Exception ex){}
             }
         }
     }
}