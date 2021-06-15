package com.epasscni.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.spec.SecretKeySpec;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class AesCrypto {

    private static final String TRANSFORM = "AES/ECB/PKCS5Padding";
    private static final String STATIC_KEY = "www.lsnmall.com0";  // must be 16bytes
    private  static final Logger LOGGER = LoggerFactory.getLogger(AesCrypto.class);

    public static String encrypt(String plainText) throws Exception {
        KeyGenerator kgen = KeyGenerator.getInstance("AES");
        kgen.init(128);

        byte[] raw = AesCrypto.STATIC_KEY.getBytes();
        SecretKeySpec skeySpec = new SecretKeySpec(raw, "AES");
        Cipher cipher = Cipher.getInstance(TRANSFORM);

        cipher.init(Cipher.ENCRYPT_MODE, skeySpec);
        byte[] encrypted = cipher.doFinal(plainText.getBytes());

        LOGGER.debug("request encrypt : " + plainText +" -> " + asHex(encrypted));

        return asHex(encrypted);
    }

    public static String decrypt(String cipherText) throws Exception {
        KeyGenerator kgen = KeyGenerator.getInstance("AES");
        kgen.init(128);

        byte[] raw = AesCrypto.STATIC_KEY.getBytes("UTF-8");
        SecretKeySpec skeySpec = new SecretKeySpec(raw, "AES");
        Cipher cipher = Cipher.getInstance(TRANSFORM);

        cipher.init(Cipher.DECRYPT_MODE, skeySpec);
        byte[] original = cipher.doFinal(fromString(cipherText));
        String originalString = new String(original);

        LOGGER.debug("request decrypt : " + cipherText +" -> " + originalString);

        return originalString;
    }

    private static String asHex(byte buf[]) {
        StringBuffer strbuf = new StringBuffer(buf.length * 2);
        int i;

        for (i = 0; i < buf.length; i++) {
            if (((int) buf[i] & 0xff) < 0x10)
                strbuf.append("0");

            strbuf.append(Long.toString((int) buf[i] & 0xff, 16));
        }

        return strbuf.toString();
    }

    private static byte[] fromString(String hex) {
        int len = hex.length();
        byte[] buf = new byte[((len + 1) / 2)];

        int i = 0, j = 0;
        if ((len % 2) == 1)
            buf[j++] = (byte) fromDigit(hex.charAt(i++));

        while (i < len) {
            buf[j++] = (byte) ((fromDigit(hex.charAt(i++)) << 4) | fromDigit(hex
                    .charAt(i++)));
        }
        return buf;
    }

    private static int fromDigit(char ch) {
        if (ch >= '0' && ch <= '9')
            return ch - '0';
        if (ch >= 'A' && ch <= 'F')
            return ch - 'A' + 10;
        if (ch >= 'a' && ch <= 'f')
            return ch - 'a' + 10;

        throw new IllegalArgumentException("invalid hex digit '" + ch + "'");
    }

    public static String encryptOnly(String plainText) throws NoSuchAlgorithmException {
         String output = "";

         StringBuffer sb = new StringBuffer();
         MessageDigest md = MessageDigest.getInstance("SHA-512");

         md.update(plainText.getBytes());
         byte[] msgb = md.digest();

         for (int i = 0; i < msgb.length; i++) {
             byte temp = msgb[i];
             String str = Integer.toHexString(temp & 0xFF);
             while (str.length() < 2) {
                 str = "0" + str;
             }
             str = str.substring(str.length() - 2);
             sb.append(str);
         }

         output = sb.toString();

         return output;
    }

    public static void main(String[] args) throws Exception {
        String e = AesCrypto.encrypt("01087294345");
        LOGGER.debug("################## e ="+e);
        LOGGER.debug("################## AesCrypto.decrypt ="+AesCrypto.decrypt(e));

        String e2 = AesCrypto.encryptOnly("test");
        LOGGER.debug("################## e2 ="+e2);
    }
    
    /**
     * SHA-1 방식의 단방향 암호화 처리 
     * 
     * @param   String format
     * @return  String
     *    
     * encryptToSHA1("password");
     *
     */
    public static String encryptToSHA1(String str){
        String result = "";
        MessageDigest md = null ;

        try {
            md = MessageDigest.getInstance("SHA-1");
            result = "";

            md.update( str.getBytes() );
            byte [] mdbyteArr = md.digest();

            for (int i = 0; i < mdbyteArr.length; i++) {
                result +=Integer.toString((mdbyteArr[i] & 0xf0) >> 4, 16);
                result +=Integer.toString(mdbyteArr[i] & 0x0f, 16);
            }
        } catch(Exception e) {		
            LOGGER.debug("Error");
        }
        return result;
    }    
}
