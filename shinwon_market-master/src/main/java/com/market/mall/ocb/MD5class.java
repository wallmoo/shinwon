package com.market.mall.ocb;

import java.security.GeneralSecurityException;
import java.security.MessageDigest;

public class MD5class {

    public static String MD5(String inpara) {

        byte[] bpara = new byte[inpara.length()]; 

        byte[] rethash;

        int i; 

 

        for (i=0; i < inpara.length(); i++) 

            bpara[i] = (byte)(inpara.charAt(i) & 0xff );

 

        try {

            MessageDigest md5er = MessageDigest.getInstance("MD5");

            rethash = md5er.digest(bpara);

        } catch (GeneralSecurityException e) { 

            throw new RuntimeException(e); 

        }

 

        StringBuffer r = new StringBuffer(32);

        for (i=0; i < rethash.length; i++) {

            //String x = Integer.toHexString(rethash[i] & 0xff).toUpperCase();
        	String x = Integer.toHexString(rethash[i] & 0xff);

            if (x.length()<2) 

                r.append("0");

            r.append(x);

        }

        return r.toString();

    }

}
