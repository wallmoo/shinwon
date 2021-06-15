package com.market.util;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.apache.commons.codec.DecoderException;
import org.apache.commons.codec.binary.Hex;

public class LoginPasswordCipher {
	public static String CipherPassword(String password) throws NoSuchAlgorithmException {
		if(password!=null && !password.isEmpty()) {
        	String passwordResult = null;
            MessageDigest digest = MessageDigest.getInstance("SHA-1");
			digest.reset();
			digest.update(password.getBytes());
			passwordResult = String.format("%040x", new BigInteger(1, digest.digest()));
			digest.reset();
			try {
				digest.update(Hex.decodeHex(passwordResult.toCharArray()));
			} catch (DecoderException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			passwordResult = String.format("%040x", new BigInteger(1, digest.digest()));
            return "*"+passwordResult.toUpperCase();
        }
		return password;
        
	}
}
