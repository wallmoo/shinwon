package com.market.mall.am.site.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.market.mall.am.site.service.DelivCompanyService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.Admin;

/**
 * @PackageName: com.market.mall.am.site.service.impl
 * @FileName : DelivCompanyServiceImpl.java
 * @Date : 2014. 4. 1.
 * @프로그램 설명 : 관리자 > 사이트 관리 > 배송업체 관리를 처리하는 Service Implement Class
 * @author jangsin
 */
@Service("delivCompanyService")
public class DelivCompanyServiceImpl implements DelivCompanyService{

    @Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;
    
    
    /**
    * <pre>
    * 1. MethodName : selectDelivCompanyListCount
    * 2. ClassName  : DelivCompanyServiceImpl.java
    * 3. Comment    : 관리자 > 사이트 관리 > 배송업체 관리 목록 갯수 
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 4. 1.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectDelivCompanyListCount (Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.selectCount("DelivCompany.selectDelivCompanyListCount", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectDelivCompanyList
    * 2. ClassName  : DelivCompanyServiceImpl.java
    * 3. Comment    : 관리자 > 사이트 관리 > 배송업체 관리 목록 
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 4. 1.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectDelivCompanyList (Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.selectList("DelivCompany.selectDelivCompanyList", commandMap);
    }
    
    /**
     * <pre>
     * 1. MethodName : selectDelivCompanyInfo
     * 2. ClassName  : DelivCompanyServiceImpl.java
     * 3. Comment    : 관리자 > 사이트 관리 > 배송업체 관리 상세정보 
     * 4. 작성자       : jangsin
     * 5. 작성일       : 2014. 4. 2.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
     @SuppressWarnings("unchecked")
    public Map<String, Object> selectDelivCompanyInfo (Map<String, Object> commandMap) throws Exception
     {
         return defaultDAO.select("DelivCompany.selectDelivCompanyInfo", commandMap);
     }
     
     /**
     * <pre>
     * 1. MethodName : insertDelivCompany
     * 2. ClassName  : DelivCompanyServiceImpl.java
     * 3. Comment    : 관리자 > 사이트 관리 > 배송업체 관리 등록 
     * 4. 작성자       : jangsin
     * 5. 작성일       : 2014. 4. 2.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
     public int insertDelivCompany (HttpServletRequest request, Map<String, Object> commandMap) throws Exception
     {
         Admin admin = SessionsAdmin.getSessionAdmin(request);
         commandMap.put("DLV_CPN_REG_IP", request.getRemoteAddr());
         commandMap.put("DLV_CPN_REG_ID", admin.getADM_MST_ID());
         return defaultDAO.insert("DelivCompany.insertDelivCompany", commandMap);
     }
     
     /**
     * <pre>
     * 1. MethodName : updateDelivCompany
     * 2. ClassName  : DelivCompanyServiceImpl.java
     * 3. Comment    : 관리자 > 사이트 관리 > 배송업체 관리 수정 
     * 4. 작성자       : jangsin
     * 5. 작성일       : 2014. 4. 2.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
     public int updateDelivCompany (HttpServletRequest request, Map<String, Object> commandMap) throws Exception
     {
         Admin admin = SessionsAdmin.getSessionAdmin(request);
         commandMap.put("DLV_CPN_UPD_IP", request.getRemoteAddr());
         commandMap.put("DLV_CPN_UPD_ID", admin.getADM_MST_ID());
         return defaultDAO.update("DelivCompany.updateDelivCompany", commandMap);
     }
     
     
     /**
    * <pre>
    * 1. MethodName : selectSimpleDelivCompanyList
    * 2. ClassName  : DelivCompanyServiceImpl.java
    * 3. Comment    : 택배사 리스트(주문 팝업에서 사용)
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2015. 5. 12.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
     public List<Map<String, Object>> selectSimpleDelivCompanyList (Map<String, Object> commandMap) throws Exception
     {
         return defaultDAO.selectList("DelivCompany.selectSimpleDelivCompanyList", commandMap);
     }
     
}
