package com.epasscni.util;

import java.security.MessageDigest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Component
public class StringHash {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    public String format(String text) throws Exception {

        MessageDigest md = MessageDigest.getInstance("SHA-256");
        md.update(text.getBytes());

        byte byteData[] = md.digest();

        //convert the byte to hex format method 2
        StringBuffer hexString = new StringBuffer();
        for (int i=0;i<byteData.length;i++) {
            String hex=Integer.toHexString(0xff & byteData[i]);
                if(hex.length()==1) hexString.append('0');
                hexString.append(hex);
        }

        return hexString.toString();
    }

    public static void main(String[]args) throws Exception {
        StringHash hash = new StringHash();
        System.out.println(hash.format("test1234"));
    }
}
