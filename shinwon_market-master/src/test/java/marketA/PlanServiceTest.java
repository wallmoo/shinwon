package marketA;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.support.DefaultMultipartHttpServletRequest;

import com.epasscni.util.StringUtil;
import com.market.mall.am.marketing.service.PlanService;
import com.market.mall.dao.CommonDefaultDAO;
@ContextConfiguration(locations = { 
		"file:src/main/webapp/WEB-INF/config/dispatcher-servlet.xml",
		"file:src/main/resources/egovframework/spring/context-aspect.xml",
		"file:src/main/resources/egovframework/spring/context-common.xml",
		"file:src/main/resources/egovframework/spring/context-datasource.xml",
		"file:src/main/resources/egovframework/spring/context-properties.xml",
		"file:src/main/resources/egovframework/spring/context-sqlMap.xml",
		"file:src/main/resources/egovframework/spring/context-transaction.xml"
		})
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
public class PlanServiceTest {

    @Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;
    
	@Autowired PlanService planService;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//기획전 기본 정보 등록
	@Test
	public void testInsertPlanData() throws Exception{
	    
	    Map<String, Object> commandMap = new HashMap<String, Object>();
	    
	    //기획전 기본 정보
	    commandMap.put("PLN_MST_REG_IP","127.0.0.1");
	    commandMap.put("PLN_MST_REG_ID","hyewon");
	    
	    commandMap.put("PLN_MST_TITLE", "테스트타이틀");
	    commandMap.put("PLN_MST_ST_DT", "20200223");
	    commandMap.put("PLN_MST_ST_HH", "00");
	    commandMap.put("PLN_MST_ST_MI", "00");
	    commandMap.put("PLN_MST_ED_DT", "20200423");
	    commandMap.put("PLN_MST_ED_HH", "23");
	    commandMap.put("PLN_MST_ED_MI", "59");
	    
	    commandMap.put("PLN_MST_USE_YN", "Y");
	    
	    commandMap.put("PLN_MST_DETAIL_TYPE", "E");
	    commandMap.put("PLN_MST_PC_BANNER", "에디터영역");
	    commandMap.put("PLN_MST_MOBILE_BANNER", "에디터영역");

	    String[] groupNum = new String[1];
	    groupNum[0] = "0";

        commandMap.put("groupNum", groupNum);
        int size = groupNum.length;
        
        String[] testPrdCD1 = new String[2];
        testPrdCD1[0] = "S0011935";
        testPrdCD1[1] = "S0011936";
        Arrays.sort(testPrdCD1);
        
        for(int index=0; index < groupNum.length; index++){
            
            commandMap.put("PLN_GRP_TITLE"+Integer.toString(index), "그룹타이틀테스트"+Integer.toString(index));
            commandMap.put("PLN_GRP_COL"+Integer.toString(index), 4);
            commandMap.put("PLN_GRP_SORT"+Integer.toString(index), index);
            
            commandMap.put("PLN_PRD_MST_CD0", testPrdCD1);
        }

	    int expectedPlanIDX = planService.insertPlanData(null, commandMap);
	    
	    Map<String, Object> param = new HashMap<String, Object>();
	    param.put("PLN_MST_IDX", expectedPlanIDX);
	    
	    //기획전 정보
	    Map<String, Object> resultMap = planService.selectPlanInfo(param);
	    Map<String, Object> row = (Map<String, Object>)resultMap.get("row");
	    
	    int planIDX = Integer.parseInt(row.get("PLN_MST_IDX")+"");
	    assertEquals(expectedPlanIDX, planIDX);
	    planService.deletePlanData(param);
	    
	    //기획전 상품구성 그룹 목록
	    List<Map<String,Object>> detailGroupList = defaultDAO.selectList("Plan.selectPlanDetailGroupList", param);
	    
	    //기획전 상품구성 상세 목록
        List<Map<String,Object>> detailProductList= null;
        
	    int grpIDX = 0;
        String[] prdCD1 = new String[2];
        
	    for(int index=0; index < detailGroupList.size(); index++){
	        grpIDX = Integer.parseInt(detailGroupList.get(index).get("PLN_GRP_IDX")+"");
	        int grpPlnIDX = Integer.parseInt(detailGroupList.get(index).get("PLN_MST_IDX")+"");
	        
	        param.put("PLN_GRP_IDX", grpIDX);
	        
	        detailProductList = defaultDAO.selectList("Plan.selectPlanDetailProductList", param);
	        
	        for(int j=0; j<detailProductList.size(); j++){
	            prdCD1[j] = detailProductList.get(j).get("PLN_PRD_MST_CD").toString();
	        }
	        Arrays.sort(prdCD1);

	        assertEquals(expectedPlanIDX,grpPlnIDX);
	        assertTrue(Arrays.equals(testPrdCD1, prdCD1));
	    }

	    planService.deletePlanDetailGroup(param);

	    planService.deletePlanDetail(param);

	}	

}
