package com.market.mall.am.erp.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.market.mall.am.erp.service.ErpProductService;
import com.market.mall.dao.CommonDefaultDAO;

@Service("erpProductService")
public class ErpProductServiceImpl implements ErpProductService {

	@Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;
	
	@Override
	public Map<String, Object> updateProduct(String PRD_MST_CD) {
//		ErpRequest erpRequest = new ErpRequest();
//		List<Map<String,Object>> productMaster = erpRequest.requestProductMaster(PRD_MST_CD);
//		if(productMaster==null || productMaster.size()<1) {return null;}
//		List<String> colorList = getColorListByProductMaster(productMaster);
//		Map<String,List<String>> sizeList = getSizeListByProductMasterAndColorList(productMaster,colorList);
		
		return null;
	}
	private List<String> getColorListByProductMaster(List<Map<String,Object>> productMaster){
		List<String> colorList = new ArrayList<String>();
		for(int colorIndex=0;colorIndex<productMaster.size();colorIndex++) {
			Map<String,Object> product = productMaster.get(colorIndex);
			String color = product.get("COLOR_CODE").toString();
			if(!colorList.contains(color)) {
				colorList.add(color);
			}
		}
		return colorList;
	}
	private Map<String,List<String>> getSizeListByProductMasterAndColorList(List<Map<String,Object>> productMaster,List<String> colorList){
		Map<String,List<String>> sizeList = new HashMap<String,List<String>>();
		for(int colorIndex=0;colorIndex<colorList.size();colorIndex++) {
			String color = colorList.get(colorIndex);
			if(sizeList.containsKey(color)) {
				sizeList.put(color, new ArrayList<String>());
			}
			ArrayList<String> sizeArrayList = (ArrayList<String>)sizeList.get(color);
			String size = productMaster.get(colorIndex).get("SIZE_CODE").toString();
			if(sizeArrayList.contains(size)) {
				sizeArrayList.add(size);
			}
		}
		return sizeList;
	}
	private Map<String,String> insertColor(List<String> colorList,String PRD_MST_CD) throws Exception{
		Map<String,String> result = new HashMap<String,String>();
		for(int colorListindex=0;colorListindex<colorList.size();colorListindex++) {
			String color = colorList.get(colorListindex);
			Map<String,Object> queryParam = new HashMap<String,Object>();
			queryParam.put("PRD_MST_CD", PRD_MST_CD);
			
			String idx = Integer.toString(defaultDAO.insert("", queryParam));
			result.put(color, idx);
	
		}
		
		return null;
	}
	
}
