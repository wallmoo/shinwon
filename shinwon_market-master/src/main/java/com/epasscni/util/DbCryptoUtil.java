package com.epasscni.util;

//import com.softforum.xdbe.XdspClient;
//import com.softforum.xdbe.XdspNative;


public class DbCryptoUtil {

	private static DbCryptoUtil dbCryptoSingleTon;
	private DbCryptoUtil() {}
    
    public static DbCryptoUtil getInstance() {
    	if (dbCryptoSingleTon == null) {
    		dbCryptoSingleTon = new DbCryptoUtil();
    	}
    	
    	return dbCryptoSingleTon;
    }

   // private static XdspClient xclient = new XdspClient("sol64");
    
	public static String dbdecrypt(String tableName, String columnName, String ciperText) throws Exception
	{
	    /*
		if (ciperText == null || ciperText.trim().equals("")) {
			return "";
		}
		String column = columnName;

	    byte[] decryptedBytes = null;
	    String decryptedValue = "";
		int isWork = 0;
		
		try {
			//decryptedBytes = xclient.decrypt64("LOUISCLUB", "louisshop_test", tableName, column, ciperText);
			//decryptedBytes = xclient.decrypt64("db", "owner", tableName, column, ciperText);
			decryptedBytes = XdspNative.fast_sync_decrypt64("sol64", "db", "owner",  tableName, column, ciperText);
			decryptedValue = new String(decryptedBytes);
			isWork = 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if( isWork != 0 )
		{
			XdspNative.fast_close("db", "owner",  tableName, column);
		}
		
		return decryptedValue;
		*/
	    return ciperText;
	}

	public static String dbdecrypt(String ciperText) throws Exception
    {
//        if (ciperText == null || ciperText.trim().equals("")) {
//            return "";
//        }
//        String tableName ="table"; 
//        String column = "normal";
//
//        byte[] decryptedBytes = null;
//        String decryptedValue = "";
//		int isWork = 0;
//		
//        try {
//			decryptedBytes = XdspNative.fast_sync_decrypt64("sol64", "db", "owner",  tableName, column, ciperText);
//			decryptedValue = new String(decryptedBytes);
//			isWork = 1;
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        
//		if( isWork != 0 )
//		{
//			XdspNative.fast_close("db", "owner",  tableName, column);
//		}
        return ciperText;
    }


	public static String dbencrypt(String tableName, String columnName, String plainText) throws Exception
	{
//		if (plainText == null || plainText.trim().equals("")) {
//			return "";
//		}
//		
//	    String column = columnName;

//	    String encryptedValue = "";
//		
//		String sOutput64   = null;
//		int isWork = 0;
//		
//		try {
//			sOutput64 = XdspNative.fast_sync_encrypt64("sol64","db", "owner", tableName, column, plainText.getBytes());
//			encryptedValue = sOutput64;
//			isWork = 1;
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		
//		if( isWork != 0 )
//		{
//			XdspNative.fast_close("db", "owner", tableName, column);
//		}
		
		return plainText;
	}
	
	public static String dbencrypt(String plainText) throws Exception
    {
//        if (plainText == null || plainText.trim().equals("")) {
//            return "";
//        }
//        String tableName = "table";
//        String column = "normal";
//
//        String encryptedValue = "";
//		String sOutput64   = null;
//		int isWork = 0;
//		
//        try {
//            sOutput64 = XdspNative.fast_sync_encrypt64("sol64","db", "owner", tableName, column, plainText.getBytes());
//			encryptedValue = sOutput64;
//			isWork = 1;
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        
//		if( isWork != 0 )
//		{
//			XdspNative.fast_close("db", "owner", tableName, column);
//		}
//        
        return plainText;
    }
    
}
