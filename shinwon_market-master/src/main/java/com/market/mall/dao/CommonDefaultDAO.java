package com.market.mall.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.epasscni.util.StringUtil;
import com.market.mall.common.constants.code.SERVICE_RESULT_CODE;
import com.market.util.JsonUtil;

import net.sf.json.util.JSONUtils;

@Repository("defaultDAO")
public class CommonDefaultDAO { 

    @Autowired
    @Resource(name="sqlSession")
    private SqlSession sqlSession;
    
    /**
     * 데이터 등록한다.
     * @param param - 등록할 정보가 담긴 param
     * @return 등록 결과
     * @exception Exception
     */
    @SuppressWarnings("rawtypes")
    public int insert(String queryID,  Map param) throws Exception {
        return (Integer)StringUtil.getInt(sqlSession.insert(queryID, (Object)param), 1);
    }
    @SuppressWarnings("rawtypes")
    public int insertNoException(String queryID,  Map param){
        int result = SERVICE_RESULT_CODE.DB_FAIL;
        try{
            result = sqlSession.insert(queryID, (Object)param);
        }catch (Exception ex){
            ex.printStackTrace();
        }finally{
            return result;
        }    
    }
    
    @SuppressWarnings("rawtypes")
    public String insertStr(String queryID,  Map param) throws Exception {
        return StringUtil.getString(sqlSession.insert(queryID, (Object)param),"");
    }
    
    @SuppressWarnings("rawtypes")
    public void insertNoReturn(String queryID,  Map param) throws Exception {
        sqlSession.insert(queryID, (Object)param);
    }
    
    public int insertObject(String queryID, Object param){
        int result = -1;
        try {
            result = sqlSession.insert(queryID, param);
        } catch (Exception ex){
            ex.printStackTrace();
        }
        return result;
    } 

    /**
     * 데이터 수정한다.
     * @param param - 수정할 정보가 담긴 param
     * @return 삭제 결과
     * @exception Exception
     */
    @SuppressWarnings("rawtypes")
    public int update(String queryID, Map param) throws Exception {
        return (int)sqlSession.update(queryID, (Object)param);
    }
    
    @SuppressWarnings("rawtypes")
    public int update(String queryID, int param) throws Exception {
        return (int)sqlSession.update(queryID, (Object)param);
    }
    
    @SuppressWarnings("rawtypes")
    public int update(String queryID, String param) throws Exception {
        return (int)sqlSession.update(queryID, (Object)param);
    }
    public int updateObject(String queryID, Object param){
        int result = -1;
        try {
            result = sqlSession.insert(queryID, param);
        } catch (Exception ex){
            ex.printStackTrace();
        }
        return result;
    }
    
    /**
     * 데이터 삭제한다.
     * @param param - 삭제할 정보가 담긴 param
     * @return 삭제 결과 
     * @exception Exception
     */
    @SuppressWarnings("rawtypes")
    public int delete(String queryID, Map param) throws Exception {
        return (int)sqlSession.delete(queryID, (Object)param);
    }

    /**
     * 데이터 삭제한다.
     * @param param - 삭제할 정보가 담긴 param
     * @return 삭제 결과 
     */
    @SuppressWarnings("rawtypes")
    public int deleteNoException(String queryID, Map param) {
        return (int)sqlSession.delete(queryID, (Object)param);
    }
    
    @SuppressWarnings("rawtypes")
    public int deleteNoException(String queryID, List<Map<String, Object>> param) {
        return (int)sqlSession.delete(queryID, (Object)param);
    }
    
    /**
     * 데이터 조회한다.
     * @param vo - 조회할 정보가 담긴 param
     * @return 조회한 글
     * @exception Exception
     */
    @SuppressWarnings("rawtypes")
    public Map select(String queryID, Map param) throws Exception {
        return (Map) sqlSession.selectOne(queryID, param);
    }
    
    @SuppressWarnings("rawtypes")
    public Map selectWithException(String queryID, Map param) {
        return (Map) sqlSession.selectOne(queryID, param);
    }
    
    public Object select(String queryID,Object param) throws Exception {
        return (Object) sqlSession.selectOne(queryID, param);
    }
    
    public String selectStr(String queryID,Object param) throws Exception {
        return (String) sqlSession.selectOne(queryID, param);
    }       

    /**
     * 데이터 목록을 조회한다.
     * @param param - 조회할 정보가 담긴 param
     * @return 글 목록
     * @exception Exception
     */
    @SuppressWarnings("rawtypes")
    public List selectList(String queryID, Map param) {
        List returnList =  sqlSession.selectList(queryID, param);
        if(returnList == null) {
            returnList = new ArrayList();
        }
        return returnList;
    }
    
    public JSONArray selectListJsonWrapper(String queryID, Map param){
        return JsonUtil.getJsonArrayFromList(selectList(queryID, param));
        
    }
    
    @SuppressWarnings("rawtypes")
    public List selectList(String queryID,Object param) throws Exception {
        List returnList =  sqlSession.selectList(queryID, param);
        if(returnList == null) {
            returnList = new ArrayList();
        }
        return returnList;
    }   

    /**
     * 데이터 총 갯수를 조회한다.
     * @param param - 조회할 정보가 담긴 param
     * @return 글 총 갯수
     * @exception
     */
    @SuppressWarnings("rawtypes")
    public int selectCount(String queryID, Map param) {
        return (Integer)sqlSession.selectOne(queryID, param);
    }
}