/**
 * @PackageName: com.market.util
 * @FileName : ShoplinkerUtil.java
 * @Date : 2015. 12. 9.
 * @프로그램 설명 : ***** 처리하는 Controller Class
 * @author moon
 */

package com.market.util;

import java.util.regex.Pattern;

/**
 * @PackageName: com.market.util
 * @FileName : ShoplinkerUtil.java
 * @Date : 2015. 12. 9.
 * @프로그램 설명 : Shoplinker Option String escape Util Class
 * @author freelsj
 */
public class ShoplinkerUtil {

	private static Pattern optionEscapeRegex = Pattern.compile("[()/^,]");

	private static String nfiDvsSring = "##";
	private static Pattern nfiDvsRegex = Pattern.compile(nfiDvsSring);

	private static Pattern telSplitRegex = Pattern.compile("-");
	private static Pattern zipCodeEscapeRegex = Pattern.compile("[-/]");
	private static Pattern addrSplitRegex = Pattern.compile(" ");

	/**
	 * <pre>
	 * 1. MethodName : optionEscape
	 * 2. ClassName  : ShoplinkerUtil.java
	 * 3. Comment    : http://apiweb.shoplinker.co.kr/ShoplinkerApi/Docs2/Product_insert.html
	 * 				    조합옵션명||조합옵션1^^수량<**>가격,조합옵션2^^수량<**>가격~~
	 * 				    옵션내용중 ‘(’ , ‘)’ , ‘/’ , ‘^’ , ‘,’ 는 샵링커내 분리 구분자로 사용하오니 옵션내용에 포함하시면 안됩니다.
	 * 4. 작성자       : freelsj
	 * 5. 작성일       : 2015. 12. 14.
	 * </pre>
	 *
	 * @param inputString
	 * @return
	 */
	public static String optionEscape(String inputString) {
		if (inputString == null)
			return "";

		return optionEscapeRegex.matcher(inputString).replaceAll(" ");
	}

	/**
	 * <pre>
	 * 1. MethodName : getNfiDvsFilledString
	 * 2. ClassName  : ShoplinkerUtil.java
	 * 3. Comment    : 상품고시정보 ##으로 분리 충족하기 위한 Util
	 * 				     예)치수(입력방식 - 발길이##굽높이), 크기(입력방식 - 가로##세로##높이) 
	 * 4. 작성자       : freelsj
	 * 5. 작성일       : 2015. 12. 14.
	 * </pre>
	 *
	 * @param inputString
	 * @param dvsCnt
	 * @return
	 */
	public static String getNfiDvsFilledString(String inputString, int dvsCnt) {

		StringBuffer nfiDvsStringBuffer = new StringBuffer();

		if (inputString == null)
			nfiDvsStringBuffer.append("상세설명참조");
		else
			nfiDvsStringBuffer.append(inputString);

		String[] splitList = nfiDvsRegex.split(nfiDvsStringBuffer, 0);

		if (splitList == null) {
			for (int i = 0; i < dvsCnt; i++) {
				nfiDvsStringBuffer.append(nfiDvsSring);
			}
		} else {

			int toAddDvsCnt = dvsCnt - (splitList.length - 1);

			for (int i = 0; i < toAddDvsCnt; i++) {
				nfiDvsStringBuffer.append(nfiDvsSring);
			}
		}

		return nfiDvsStringBuffer.toString();
	}

	/**
	* <pre>
	* 1. MethodName : getTelList
	* 2. ClassName  : ShoplinkerUtil.java
	* 3. Comment    : Tel 010-1234-5678 ->  Tel1, Tel2, Tel3 분리
	* 4. 작성자       : freelsj
	* 5. 작성일       : 2015. 12. 14.
	* </pre>
	*
	* @param inputString
	* @return
	 */
	public static String[] getTelList(String inputString) {

		if (inputString == null || "".equals(inputString)
				|| "--".equals(inputString))
			return new String[] { "", "", "" };

		String[] splitList = telSplitRegex.split(inputString, 0);

		return splitList;
	}

	/**
	* <pre>
	* 1. MethodName : zipCodeEscape
	* 2. ClassName  : ShoplinkerUtil.java
	* 3. Comment    : 우편번호 123-456 -> 123456 
	* 4. 작성자       : freelsj
	* 5. 작성일       : 2015. 12. 14.
	* </pre>
	*
	* @param inputString
	* @return
	 */
	public static String zipCodeEscape(String inputString) {
		if (inputString == null)
			return "";

		return zipCodeEscapeRegex.matcher(inputString).replaceAll("");
	}

	/**
	* <pre>
	* 1. MethodName : getAddrList
	* 2. ClassName  : ShoplinkerUtil.java
	* 3. Comment    : 주소 1개 필드를 2개 필드로 분리 
	* 4. 작성자       : freelsj
	* 5. 작성일       : 2015. 12. 14.
	* </pre>
	*
	* @param inputString
	* @return
	 */
	public static String[] getAddrList(String inputString) {

		String[] addrList = new String[] { "", "" };
		
		if (inputString == null || "".equals(inputString))
			return addrList;

		String[] splitList = addrSplitRegex.split(inputString, 0);
		
		StringBuffer sbf = new StringBuffer();
		
		int i=0;
		
		for (; i<3; i++) {
			if (i > 0)	sbf.append(" ");
			sbf.append(splitList[i]);
		}
		
		addrList[0] = sbf.toString();
		
		sbf = new StringBuffer();
		
		for (; i<splitList.length; i++) {
			
			if (i>3) sbf.append(" ");
			sbf.append(splitList[i]);
		}
		
		addrList[1] = sbf.toString();

		return addrList;
	}

/*	public static void main(String[] args) throws URISyntaxException {

		String input = "경기 화성시 청계동 동탄순환대로21길 53 롯데캐슬알바트로스 1305동 2801호";

		String[] addrList = ShoplinkerUtil.getAddrList(input);

		for (String addr : addrList) {
			System.out.println("addr=[" + addr + "]");
		}

	}*/
}
