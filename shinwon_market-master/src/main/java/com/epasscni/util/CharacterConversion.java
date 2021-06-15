package com.epasscni.util;

import java.io.UnsupportedEncodingException;

/**
 * <b>CharacterConversion.java</b>
 *
 * @author  Joon-Gon Kim
 * @version 1.0, 2005/04/20, initial version
 */

public final class CharacterConversion {
    /**
     * 문자열을 인코딩한다
     * @param str 변환할 문자열
     * @param oCharsetName 원래 문자셋
     * @param tCharsetName 변환될 문자셋
     * @return 변환된 문자열
     */
    public static synchronized String convert( String str, String oCharsetName, String tCharsetName )
    {
        String retStr = null;

        if (str == null ) return null;

        try {
            retStr = new String(new String(str.getBytes(oCharsetName), tCharsetName));
        }
        catch( java.io.UnsupportedEncodingException e ){
            retStr = new String(str);
        }

        return retStr;
    }

    /**
     * 8859_1 --> KSC5601
     * @param str 변환할 문자열
     * @return 변환된 문자열
     */
    public static synchronized String E2K( String str )
    {
        return convert(str,"8859_1", "KSC5601");
    }

    /**
     * KSC5601 --> 8859_1
     * @param str 변환할 문자열
     * @return 변환된 문자열
     */
    public static synchronized String K2E( String str )
    {

        return convert(str,"KSC5601", "8859_1");
    }

    /**
     * 8859_1 --> UTF-8
     * @param str 변환할 문자열
     * @return 변환된 문자열
     */
    public static synchronized String E2U( String str )
    {
        return convert(str,"8859_1", "utf-8");
    }

    /**
     * UTF-8 --> 8859_1
     * @param str 변환할 문자열
     * @return 변환된 문자열
     */
    public static synchronized String U2E( String str )
    {
        return convert(str,"utf-8", "8859_1");
    }
    /**
     * UTF-8 --> KSC5601
     * @param str 변환할 문자열
     * @return 변환된 문자열
     */
    public static synchronized String U2K( String str )
    {
        return convert(str,"utf-8", "KSC5601");
    }

    public static synchronized String U2EU( String str )
    {
        return convert(str,"utf-8", "EUC-KR");
    }

    public static synchronized String EU2U( String str )
    {
        return convert(str,"EUC-KR", "utf-8");
    }

    public static synchronized String unesacpeE2U( String str ) throws UnsupportedEncodingException
    {
        return unesacpe(str, "8859_1", "utf-8");
    }

    public static synchronized String unesacpeU2EU( String str ) throws UnsupportedEncodingException
    {
        return unesacpe(str, "utf-8", "EUC-KR");
    }

    public static synchronized String unesacpeEU2U( String str ) throws UnsupportedEncodingException
    {
        return unesacpe(str, "EUC-KR", "utf-8");
    }

    public static synchronized String unicodeToChar(String unicode) {
        StringBuffer str = new StringBuffer();

        char ch = 0;

        for( int i= unicode.indexOf("\\u"); i > -1; i = unicode.indexOf("\\u") ){
            ch = (char)Integer.parseInt( unicode.substring( i + 2, i + 6 ) ,16);
            str.append( unicode.substring(0, i) );
            str.append( String.valueOf(ch) );
            unicode = unicode.substring(i + 6);
        }
        str.append( unicode );

        return str.toString();
    }

    private static String unesacpe(
            String jsEscapedString, String sourceCharset,
            String targetCharset) throws UnsupportedEncodingException
    {
        StringBuffer sb = new StringBuffer();
        int iChar=0;
        int stat=0;
        for (char c: jsEscapedString.toCharArray())
        {
            switch (stat)
            {
            case 0:
                if( c== '%' )
                {
                    stat = 1;
                }
                else
                {
                    sb.append(c);
                }
                break;
            case 1:
                iChar=hexToInt(c)*16;
                stat = 2;
                break;
            case 2:
                iChar+=hexToInt(c);
                sb.append( (char)iChar );
                stat = 0;
                break;
            }
        }

        return new String( sb.toString().getBytes(sourceCharset), targetCharset );
    }
    
    /**
     * hexToInt
     * @param c
     * @return
     */
    private static int hexToInt(char c)
    {
        int ic=c;
        if( c >= 'A' && c <= 'F' ) ic=c-'A'+10;
        else if( c >= '0' && c <= '9') ic=c-'0';
        return ic;
    }



}