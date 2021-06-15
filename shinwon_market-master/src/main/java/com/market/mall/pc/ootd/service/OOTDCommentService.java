package com.market.mall.pc.ootd.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface OOTDCommentService {
    
    //ootd 댓글 등록
    public String insertOOTDComment (Map<String, Object> commandMap) throws Exception;
    
    //ootd 댓글 리스트
    public List<Map<String, Object>> selectOOTDCommentList (Map<String, Object> commandMap) throws Exception;
    
    public List<Map<String, Object>> selectOOTDCommentHierachy (Map<String, Object> commandMap) throws Exception;
    
    //ootd 댓글 수
    public int selectOOTDCommentListCount (Map<String, Object> commandMap) throws Exception;
    
    //본인 댓글이 맞는지 체크
    public int selectOOTDCount (Map<String, Object> commandMap) throws Exception;
    
    //ootd 댓글 수정
    public int updateOOTDComment (Map<String, Object> commandMap) throws Exception;
    
    //ootd 댓글 삭제
    public int deleteOOTDComment (Map<String, Object> commandMap) throws Exception;
    


}
