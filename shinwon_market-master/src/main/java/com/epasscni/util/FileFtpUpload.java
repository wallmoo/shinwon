package com.epasscni.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;
import java.util.regex.Matcher;

import javax.servlet.ServletContext;

import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPReply;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.io.FileNotFoundException;




import com.jcraft.jsch.Channel;

import com.jcraft.jsch.ChannelSftp;

import com.jcraft.jsch.JSch;

import com.jcraft.jsch.JSchException;

import com.jcraft.jsch.Session;

import com.jcraft.jsch.SftpException;
import com.market.util.ServerOsValidator;

@Component
public class FileFtpUpload {
	
    /**
    * <pre>
    * 1. MethodName : sendFtpServer
    * 2. ClassName : FileFtpUpload.java
    * 3. Comment : 파일 업로드 FTP 이용
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2015. 10. 15.
    * </pre>
    *
    * @param ip         ftp서버ip
    * @param port       ftp서버port
    * @param id         사용자id
    * @param password   사용자password 
    * @param folder     ftp서버에생성할폴더
    * @param files      업로드list
    * @return
    */
    public static boolean sendFtpServer(String ip, int port, String id, String password,
                          String folder,String localPath, String filesName,String base) {
        boolean isSuccess = false;
        FTPClient ftp = null;
        int reply;
        
        System.out.println("FTP Class 시작!!!!!!!!!!!!!!====================================<br>");
        try {
            ftp = new FTPClient();
            ftp.connect(ip, port);
            System.out.println("Connected to " + ip + " on "+ftp.getRemotePort());
            
            // After connection attempt, you should check the reply code to verify
            // success.
            reply = ftp.getReplyCode();
            if (!FTPReply.isPositiveCompletion(reply)) {
                ftp.disconnect();
                System.err.println("FTP server refused connection.");
                System.exit(1);
            }
            
            if(!ftp.login(id, password)) {
                ftp.logout();
                throw new Exception("ftp 서버에 로그인하지 못했습니다.");
            }
            
            ftp.setFileType(FTP.BINARY_FILE_TYPE);
            ftp.enterLocalPassiveMode();
            

//            System.out.println(ftp.printWorkingDirectory());
            try{
//                ftp.makeDirectory(localPath);
                
                String[] spllit = folder.split("/");
                String directoryPath = "";
                for(int i=0;i<spllit.length;i++) {
                	
                	if(spllit[i]!=null && !spllit[i].isEmpty()) {
                		directoryPath = directoryPath+"/"+spllit[i];
                		ftp.makeDirectory(directoryPath);
                		//showServerReply(ftp);
                	}
                	
                }
                
            }catch(Exception e){
                e.printStackTrace();
            }
//            ftp.changeWorkingDirectory(localPath);
            ftp.changeWorkingDirectory(folder);
//            System.out.println(ftp.printWorkingDirectory());
            
            
            //ftp서버에 한글파일을 쓸때 한글깨짐 방지
//            String tempFileName = new String(filesName.getBytes("utf-8"),"iso_8859_1");
            
            String sourceFile = base +localPath + filesName;     
            sourceFile = sourceFile.replaceAll(Matcher.quoteReplacement(File.separator), "/");
            File uploadFile = new File(sourceFile);
            FileInputStream fis = null;
            try {
                fis = new FileInputStream(uploadFile);
                System.out.println(sourceFile + " : 전송시작 = >");
//                isSuccess = ftp.storeFile(tempFileName, fis);
                isSuccess = ftp.storeFile(filesName, fis);
                System.out.println(sourceFile + " : 전송결과 = >" + isSuccess);
            } catch(IOException e) {
                e.printStackTrace();
                isSuccess = false;
            } finally {
                if (fis != null) {
                    try {fis.close(); } catch(IOException e) {}
                }
            }//end try
            
            ftp.logout();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ftp != null && ftp.isConnected()) {
                try { ftp.disconnect(); } catch (IOException e) {}
            }
        }
        return isSuccess;
    }
    
    private Session session = null;



    private Channel channel = null;



    private ChannelSftp channelSftp = null;



    /**

     * 서버와 연결에 필요한 값들을 가져와 초기화 시킴

     *

     * @param host

     *            서버 주소

     * @param userName

     *            접속에 사용될 아이디

     * @param password

     *            비밀번호

     * @param port

     *            포트번호

     */

    public void sftpLink(String host, String userName, String password, int port) {

        JSch jsch = new JSch();

        try {

            session = jsch.getSession(userName, host, port);

            session.setPassword(password);




            java.util.Properties config = new java.util.Properties();

            config.put("StrictHostKeyChecking", "no");

            session.setConfig(config);

            session.connect();



            channel = session.openChannel("sftp");

            channel.connect();

        } catch (JSchException e) {

            e.printStackTrace();

        }



        channelSftp = (ChannelSftp) channel;



    }



    /**

     * 하나의 파일을 업로드 한다.

     *

     * @param dir

     *            저장시킬 주소(서버)

     * @param file

     *            저장할 파일

     */

    public void upload(String dir, File file) {



        FileInputStream in = null;

        try {

            in = new FileInputStream(file);

            channelSftp.cd(dir);

            channelSftp.put(in, file.getName());

        } catch (SftpException e) {

            e.printStackTrace();

        } catch (FileNotFoundException e) {

            e.printStackTrace();

        } finally {

            try {

                in.close();

            } catch (IOException e) {

                e.printStackTrace();

            }

        }

    }



    /**

     * 하나의 파일을 다운로드 한다.

     *

     * @param dir

     *            저장할 경로(서버)

     * @param downloadFileName

     *            다운로드할 파일

     * @param path

     *            저장될 공간

     */

    /*public void download(String dir, String downloadFileName, String path) {

        InputStream in = null;

        FileOutputStream out = null;

        try {

            channelSftp.cd(dir);

            in = channelSftp.get(downloadFileName);

        } catch (SftpException e) {

            // TODO Auto-generated catch block

            e.printStackTrace();

        }



        try {

            out = new FileOutputStream(new File(path));

            int i;



            while ((i = in.read()) != -1) {

                out.write(i);

            }

        } catch (IOException e) {

            // TODO Auto-generated catch block

            e.printStackTrace();

        } finally {

            try {

                out.close();

                in.close();

            } catch (IOException e) {

                e.printStackTrace();

            }



        }



    }*/



    /**

     * 서버와의 연결을 끊는다.

     */

    public void disconnection() {

        channelSftp.quit();



    }
    private static void showServerReply(FTPClient ftpClient) {
        String[] replies = ftpClient.getReplyStrings();
        if (replies != null && replies.length > 0) {
            for (String aReply : replies) {
                System.out.println("SERVER: " + aReply);
            }
        }
    }



	public static void sendFtpServer(Map<String, Object> commandMap) {
		if(commandMap.containsKey("ip") && commandMap.containsKey("port") &&commandMap.containsKey("id") &&
				commandMap.containsKey("password") &&commandMap.containsKey("folder") &&
				commandMap.containsKey("localPath") && commandMap.containsKey("filesName") && commandMap.containsKey("base")){
			String ip =	commandMap.get("ip").toString();
			int port =	Integer.parseInt(commandMap.get("port").toString());
			String id =	commandMap.get("id").toString();
			String password =	commandMap.get("password").toString();
			String folder =	commandMap.get("folder").toString();
			String localPath =	commandMap.get("localPath").toString();
			String filesName =	commandMap.get("filesName").toString();
			String base =	commandMap.get("base").toString();
			sendFtpServer(ip, port, id, password, folder, localPath, filesName, base);
		}
	}

}
