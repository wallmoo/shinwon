package com.market.util;

import java.io.File;
import java.util.regex.Matcher;

public class ServerOsValidator {
	private static String OS = System.getProperty("os.name").toLowerCase();
	
	public static boolean isWindows() {
        return (OS.indexOf("win") >= 0);  
    }

    public static boolean isMac() {
        return (OS.indexOf("mac") >= 0);
    }
  
    public static boolean isUnix() {
        return (OS.indexOf("nix") >= 0 || OS.indexOf("nux") >= 0 || OS.indexOf("aix") > 0 );
    }
  
    public static boolean isSolaris() {
        return (OS.indexOf("sunos") >= 0);
    }
    public static String getFilePathByOs(String destFileDir) {
    	String result = null;
    	if(ServerOsValidator.isWindows()) {
    		result =  destFileDir.replaceAll("/", Matcher.quoteReplacement(File.separator));
        }
        else {
        	result = destFileDir.replaceAll(Matcher.quoteReplacement(File.separator), "/");
        }
    	return result;
    }
}
