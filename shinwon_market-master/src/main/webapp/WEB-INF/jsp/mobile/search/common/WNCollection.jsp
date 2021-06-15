<%@ page pageEncoding = "UTF-8" %><%!
    /**
    *  subject: 검색 환경 설정 페이지
    **/

    final static int CONNECTION_TIMEOUT = 20000;
	final static String CHARSET = "UTF-8";
	final static int REALTIME_COUNT=100;
	final static int PAGE_SCALE = 10; //view page list count

	final static int CONNECTION_KEEP = 0; //recevive mode
	final static int CONNECTION_REUSE = 2;
	final static int CONNECTION_CLOSE = 3;

	final static int ASC = 0; //order
	final static int DESC = 1; //order

	final static int USE_KMA_OFFOFF = 0; //synonym, morpheme
	final static int USE_KMA_ONON = 1;
	final static int USE_KMA_ONOFF = 2;
	
	final static int USE_RESULT_STRING = 0; //result data type	
	final static int USE_RESULT_XML = 1;
	final static int USE_RESULT_JSON = 2;
	final static int USE_RESULT_DUPLICATE_STRING = 3; //uid result data type	
	final static int USE_RESULT_DUPLICATE_XML = 4;
	final static int USE_RESULT_DUPLICATE_JSON = 5;

	final static int IS_CASE_ON = 1; //case on, off
	final static int IS_CASE_OFF = 0;

	final static int HI_SUM_OFFOFF = 0; //summarizing, highlighting
	final static int HI_SUM_OFFON = 1;
	final static int HI_SUM_ONOFF = 2;
	final static int HI_SUM_ONON = 3;
			
	final static int COMMON_OR_WHEN_NORESULT_OFF = 0;
	final static int COMMON_OR_WHEN_NORESULT_ON = 1;

	final static int INDEX_NAME = 0;
	final static int COLLECTION_NAME = 1;
	final static int PAGE_INFO = 2;
	final static int ANALYZER = 3;
	final static int SORT_FIELD = 4;
	final static int RANKING_OPTION = 5;
	final static int SEARCH_FIELD = 6;
	final static int RESULT_FIELD = 7;
	final static int DATE_RANGE = 8;
	final static int RANK_RANGE = 9;
	final static int EXQUERY_FIELD = 10;
	final static int COLLECTION_QUERY =11;
	final static int BOOST_QUERY =12;
	final static int FILTER_OPERATION = 13;
	final static int GROUP_BY = 14;
	final static int GROUP_SORT_FIELD = 15;
	final static int CATEGORY_BOOST = 16;
	final static int CATEGORY_GROUPBY = 17;
	final static int CATEGORY_QUERY = 18;
	final static int PROPERTY_GROUP = 19;
	final static int PREFIX_FIELD = 20;
	final static int FAST_ACCESS = 21;
	final static int MULTI_GROUP_BY = 22;
	final static int AUTH_QUERY = 23;
	final static int DEDUP_SORT_FIELD = 24;
	final static int COLLECTION_KOR = 25;	
	
	final static int MERGE_COLLECTION_NAME = 0;
	final static int MERGE_MAPPING_COLLECTION_NAME = 1;
	final static int MERGE_PAGE_INFO = 2;
	final static int MERGE_RESULT_FIELD = 3;
	final static int MERGE_MAPPING_RESULT_FIELD = 4;
	final static int MERGE_MULTI_GROUP_BY_FIELD = 5;
	final static int MERGE_MAPPING_MULTI_GROUP_BY_FIELD = 6;
	final static int MERGE_CATEGORY_GROUPBY_FIELD = 7;
	final static int MERGE_MAPPING_CATEGORY_GROUPBY_FIELD = 8;

	//가상 통합 컬렉션을 사용하지 않을 경우 아래와 같이MERGE_COLLECTIONS에 정의한다.
	public String[] MERGE_COLLECTIONS = new String[]{""};

	//가상 통합 컬렉션을 사용할 경우 아래와 같이MERGE_COLLECTIONS에 정의한다.
	//public String[] MERGE_COLLECTIONS = new String[]{"merge_sample_bbs"}; 
    /*
	public class WNCollection {
		  
		public String[][] MERGE_COLLECTION_INFO = null;
		
		WNCollection(){
			
			//가상 통합 컬렉션을 사용할 경우, mapping되는 collection들의 정보를 정의한다.
			MERGE_COLLECTION_INFO = new String[][]
			{
				{
					"merge_sample_bbs", // set merge collection name
					"sample_bbs/sample_edu", // set collection name, delimiter: /
					"0,3",  // set merge collection pageinfo (start,count)
					"DOCID,TITLE,WRITER,CONTENT",// set merge document field
					"DOCID,TITLE,WRITER,CONTENT/DOCID,TITLE,WRITER,CONTENT", // set document field, delimiter: /
					"", // set merge collection multi-group-by field
					"", // set merge collection multi-group-by field, delimiter: /
					"", // set merge collection category-group-by field
					""  // set collection multi-group-by field, delimiter: /
				}					
			};
	*/

	static String SEARCH_IP="220.73.141.189";
	static int SEARCH_PORT=7001;
	static String MANAGER_IP="220.73.141.189";
	static int MANAGER_PORT=7800;

	public String[] COLLECTIONS = new String[]{"m_product","cate_product","m_exhibitions","m_emagazine","m_review"};
	public String[] COLLECTIONS_NAME = new String[]{"m_product","cate_product","m_exhibitions","m_emagazine","m_review"};
	public class WNCollection{
	public String[][] MERGE_COLLECTION_INFO = null;
	public String[][] COLLECTION_INFO = null;
		WNCollection(){
			COLLECTION_INFO = new String[][]
			{
			{
			"m_product", // set index name
			"m_product", // set collection name
			"0,3",  // set pageinfo (start,count)
			"1,0,1,1,0", // set query analyzer (useKMA,isCase,useOriginal,useSynonym, duplcated detection)
			"RANK/DESC,DATE/DESC",  // set sort field (field,order) multi sort '/'
			"basic,rpfmo,100",  // set sort field (field,order) multi sort '/'
			"PRD_MST_NM,PRD_MST_NM_E,PRD_MST_MTA_TAG1,PRD_MST_MTA_TAG2,PRD_MST_MTA_TAG3,PRD_IMAGE_ALT",// set search field
			"DOCID,PRD_MST_CD,PRD_MST_NM,PRD_MST_PRC,PRD_IMAGE,PRD_IMAGE_ALT,PRD_MST_ERP_DSP_PRC,ERP_MST_DSP_PRC,PRD_MST_PRICE,PRD_MST_PC_CPN_PRC,PRD_MST_LNG_DIV_YN,PRD_MST_DLV_FEE,PRD_MST_O2O_YN,REP_POINT,REP_CNT,REP_POINT_GRD,PRD_NEW_ICO,PRD_MST_OPT_EST_CNT,PRD_MST_ICON_LIST,PRD_MST_SIKR_ICON,PRD_MST_ERP_PRC,PRD_MST_OFF_ALL_CNT,PRD_MST_SEL_STATE,DSP_PRD_CTG_IDX,CATE_LEV_1,CATE_LEV_2,CATE_LEV_3,CATE_LEV_4,CATE_LEV_5,CATE_LEV_NM_1,CATE_LEV_NM_2,CATE_LEV_NM_3,CATE_LEV_NM_4,CATE_LEV_NM_5,PRD_MST_MTA_TAG1,PRD_MST_MTA_TAG2,PRD_MST_MTA_TAG3,PRD_CTG_INFO,ONLINE_HIT,OFFLINE_HIT,PRD_MST_REG_DT,DATE,PRD_MST_CPR_PRC1,PRD_MST_CPR_PRC2,PRD_CPN_DST_POINT,PRD_NOW_DST_POINT,SEARCH_RED_PRICE,SEARCH_SILVER_PRICE,SEARCH_GOLD_PRICE,SEARCH_VIP_PRICE,SEARCH_PLATINUM_PRICE,SEARCH_SIMPLE_PRICE,PRD_MST_SEL_CNT,ALIAS",// set document field
			"", // set date range
			"", // set rank range
			"", // set prefix query, example: <fieldname:contains:value1>|<fieldname:contains:value2>/1,  (fieldname:contains:value) and ' ', or '|', not '!' / operator (AND:1, OR:0)
			"", // set collection query (<fieldname:contains:value^weight | value^weight>/option...) and ' ', or '|'
			"", // set boost query (<fieldname:contains:value> | <field3:contains:value>...) and ' ', or '|'
			"", // set filter operation (<fieldname:operator:value>)
			"", // set groupby field(field, count)
			"", // set sort field group(field/order,field/order,...)
			"", // set categoryBoost(fieldname,matchType,boostID,boostKeyword)
			"PRD_CTG_INFO", // set categoryGroupBy (fieldname:value)
			"", // set categoryQuery (fieldname:value)
			"", // set property group (fieldname,min,max, groupcount)
			"ALIAS,PRD_MST_LNG_DIV_YN,PRD_MST_O2O_YN", // use check prefix query filed
			"PRD_MST_CD,PRD_MST_PRC,PRD_MST_PRICE,PRD_MST_LNG_DIV_YN,PRD_MST_O2O_YN,ONLINE_HIT,OFFLINE_HIT,PRD_MST_REG_DT,PRD_MST_CPR_PRC1,PRD_MST_CPR_PRC2,SEARCH_RED_PRICE,SEARCH_SILVER_PRICE,SEARCH_GOLD_PRICE,SEARCH_VIP_PRICE,SEARCH_PLATINUM_PRICE,SEARCH_SIMPLE_PRICE", // set use check fast access field
			"", // set multigroupby field
			"", // set auth query (Auth Target Field, Auth Collection, Auth Reference Field, Authority Query)
			"", // set Duplicate Detection Criterion Field, RANK/DESC,DATE/DESC
			"m_product" // collection display name
			}
         ,
         	{
 			"cate_product", // set index name
 			"m_product", // set collection name
			"0,3",  // set pageinfo (start,count)
			"1,0,1,1,0", // set query analyzer (useKMA,isCase,useOriginal,useSynonym, duplcated detection)
			"RANK/DESC,DATE/DESC",  // set sort field (field,order) multi sort '/'
			"basic,rpfmo,100",  // set sort field (field,order) multi sort '/'
			"PRD_MST_NM,PRD_MST_NM_E,PRD_MST_MTA_TAG1,PRD_MST_MTA_TAG2,PRD_MST_MTA_TAG3,PRD_IMAGE_ALT",// set search field
			"DOCID,PRD_MST_CD,PRD_MST_NM/25,PRD_MST_PRC,PRD_IMAGE,PRD_IMAGE_ALT,PRD_MST_ERP_DSP_PRC,ERP_MST_DSP_PRC,PRD_MST_PRICE,PRD_MST_PC_CPN_PRC,PRD_MST_LNG_DIV_YN,PRD_MST_DLV_FEE,PRD_MST_O2O_YN,REP_POINT,REP_CNT,REP_POINT_GRD,PRD_NEW_ICO,PRD_MST_OPT_EST_CNT,PRD_MST_ICON_LIST,PRD_MST_SIKR_ICON,PRD_MST_ERP_PRC,PRD_MST_OFF_ALL_CNT,PRD_MST_SEL_STATE,DSP_PRD_CTG_IDX,CATE_LEV_1,CATE_LEV_2,CATE_LEV_3,CATE_LEV_4,CATE_LEV_5,CATE_LEV_NM_1,CATE_LEV_NM_2,CATE_LEV_NM_3,CATE_LEV_NM_4,CATE_LEV_NM_5,PRD_MST_MTA_TAG1,PRD_MST_MTA_TAG2,PRD_MST_MTA_TAG3,PRD_CTG_INFO,ONLINE_HIT,OFFLINE_HIT,PRD_MST_REG_DT,DATE,PRD_MST_CPR_PRC1,PRD_MST_CPR_PRC2,PRD_CPN_DST_POINT,PRD_NOW_DST_POINT,SEARCH_RED_PRICE,SEARCH_SILVER_PRICE,SEARCH_GOLD_PRICE,SEARCH_VIP_PRICE,SEARCH_PLATINUM_PRICE,SEARCH_SIMPLE_PRICE,PRD_MST_SEL_CNT,ALIAS",// set document field
			"", // set date range
			"", // set rank range
			"", // set prefix query, example: <fieldname:contains:value1>|<fieldname:contains:value2>/1,  (fieldname:contains:value) and ' ', or '|', not '!' / operator (AND:1, OR:0)
			"", // set collection query (<fieldname:contains:value^weight | value^weight>/option...) and ' ', or '|'
			"", // set boost query (<fieldname:contains:value> | <field3:contains:value>...) and ' ', or '|'
			"", // set filter operation (<fieldname:operator:value>)
			"", // set groupby field(field, count)
			"", // set sort field group(field/order,field/order,...)
			"", // set categoryBoost(fieldname,matchType,boostID,boostKeyword)
			"PRD_CTG_INFO", // set categoryGroupBy (fieldname:value)
			"", // set categoryQuery (fieldname:value)
			"", // set property group (fieldname,min,max, groupcount)
			"ALIAS,PRD_MST_LNG_DIV_YN,PRD_MST_O2O_YN", // use check prefix query filed
			"PRD_MST_CD,PRD_MST_PRC,PRD_MST_PRICE,PRD_MST_LNG_DIV_YN,PRD_MST_O2O_YN,ONLINE_HIT,OFFLINE_HIT,PRD_MST_REG_DT,PRD_MST_CPR_PRC1,PRD_MST_CPR_PRC2,SEARCH_RED_PRICE,SEARCH_SILVER_PRICE,SEARCH_GOLD_PRICE,SEARCH_VIP_PRICE,SEARCH_PLATINUM_PRICE,SEARCH_SIMPLE_PRICE", // set use check fast access field
			"", // set multigroupby field
			"", // set auth query (Auth Target Field, Auth Collection, Auth Reference Field, Authority Query)
			"", // set Duplicate Detection Criterion Field, RANK/DESC,DATE/DESC
			"cate_product" // collection display name
			}
          ,
          {
  			"m_exhibitions", // set index name
  			"m_exhibitions", // set collection name
  			"0,3",  // set pageinfo (start,count)
  			"1,0,0,0,0", // set query analyzer (useKMA,isCase,useOriginal,useSynonym, duplcated detection)
  			"RANK/DESC,DATE/DESC",  // set sort field (field,order) multi sort '/'
  			"basic,rpfmo,100",  // set sort field (field,order) multi sort '/'
  			"PLN_MST_TITLE,PLN_MST_MOBILE_BANNER,MOBILE_ALT_TXT",// set search field
  			"DOCID,PLN_MST_IDX,PLN_MST_CHANNEL_PC_YN,PLN_MST_CHANNEL_MOBILE_YN,PLN_MST_TITLE,PLN_MST_ST_DT,PLN_MST_ED_DT,PLN_MST_ST_HH,PLN_MST_ED_HH,PLN_MST_ST_MI,PLN_MST_ED_MI,PLN_MST_PC_BANNER,PLN_MST_MOBILE_BANNER,PC_ATT_PATH,PC_SYS_NM,PC_ALT_TXT,MOBILE_ATT_PATH,MOBILE_SYS_NM,MOBILE_ALT_TXT,PLN_MST_MTA_TAG1,PLN_MST_MTA_TAG2,PLN_MST_MTA_TAG3,PLN_MST_MEMO,ALIAS",// set document field
  			"", // set date range
  			"", // set rank range
  			"", // set prefix query, example: <fieldname:contains:value1>|<fieldname:contains:value2>/1,  (fieldname:contains:value) and ' ', or '|', not '!' / operator (AND:1, OR:0)
  			"", // set collection query (<fieldname:contains:value^weight | value^weight>/option...) and ' ', or '|'
  			"", // set boost query (<fieldname:contains:value> | <field3:contains:value>...) and ' ', or '|'
  			"", // set filter operation (<fieldname:operator:value>)
  			"", // set groupby field(field, count)
  			"", // set sort field group(field/order,field/order,...)
  			"", // set categoryBoost(fieldname,matchType,boostID,boostKeyword)
  			"", // set categoryGroupBy (fieldname:value)
  			"", // set categoryQuery (fieldname:value)
  			"", // set property group (fieldname,min,max, groupcount)
  			"PLN_MST_CHANNEL_PC_YN,PLN_MST_CHANNEL_MOBILE_YN,ALIAS", // use check prefix query filed
  			"PLN_MST_IDX,PLN_MST_CHANNEL_PC_YN,PLN_MST_CHANNEL_MOBILE_YN,PLN_MST_ST_DT,PLN_MST_ED_DT", // set use check fast access field
  			"", // set multigroupby field
  			"", // set auth query (Auth Target Field, Auth Collection, Auth Reference Field, Authority Query)
  			"", // set Duplicate Detection Criterion Field, RANK/DESC,DATE/DESC
  			"m_exhibitions" // collection display name
  			}
          ,
          {
  			"m_emagazine", // set index name
  			"m_emagazine", // set collection name
  			"0,3",  // set pageinfo (start,count)
  			"1,0,0,0,0", // set query analyzer (useKMA,isCase,useOriginal,useSynonym, duplcated detection)
  			"RANK/DESC,DATE/DESC",  // set sort field (field,order) multi sort '/'
  			"basic,rpfmo,100",  // set sort field (field,order) multi sort '/'
  			"MGZ_MST_TITLE,MGZ_MST_CPY,MGZ_MST_CTS,IMG_PATH_MB_ALT",// set search field
  			"DOCID,MGZ_MST_IDX,MGZ_MST_TITLE,MGZ_MST_CTS,MGZ_MST_CPY,MGZ_MST_CTG_NM,MGZ_MST_CTG,IMG_PATH_PC,IMG_PATH_MB,IMG_PATH_PC_ALT,IMG_PATH_MB_ALT,MGZ_MST_KID,MGZ_MST_MTA_TAG1,MGZ_MST_MTA_TAG2,MGZ_MST_MTA_TAG3,MGZ_MST_MEMO,SUBSTR_MGZ_MST_CPY,ALIAS",// set document field
  			"", // set date range
  			"", // set rank range
  			"", // set prefix query, example: <fieldname:contains:value1>|<fieldname:contains:value2>/1,  (fieldname:contains:value) and ' ', or '|', not '!' / operator (AND:1, OR:0)
  			"", // set collection query (<fieldname:contains:value^weight | value^weight>/option...) and ' ', or '|'
  			"", // set boost query (<fieldname:contains:value> | <field3:contains:value>...) and ' ', or '|'
  			"", // set filter operation (<fieldname:operator:value>)
  			"", // set groupby field(field, count)
  			"", // set sort field group(field/order,field/order,...)
  			"", // set categoryBoost(fieldname,matchType,boostID,boostKeyword)
  			"", // set categoryGroupBy (fieldname:value)
  			"", // set categoryQuery (fieldname:value)
  			"", // set property group (fieldname,min,max, groupcount)
  			"MGZ_MST_CTG_NM,ALIAS", // use check prefix query filed
  			"MGZ_MST_IDX,MGZ_MST_CTG", // set use check fast access field
  			"", // set multigroupby field
  			"", // set auth query (Auth Target Field, Auth Collection, Auth Reference Field, Authority Query)
  			"", // set Duplicate Detection Criterion Field, RANK/DESC,DATE/DESC
  			"m_emagazine" // collection display name
  			}
           ,
  			{
  			"m_review", // set index name
  			"m_review", // set collection name
  			"0,3",  // set pageinfo (start,count)
  			"1,0,0,0,0", // set query analyzer (useKMA,isCase,useOriginal,useSynonym, duplcated detection)
  			"RANK/DESC,DATE/DESC",  // set sort field (field,order) multi sort '/'
  			"basic,rpfmo,100",  // set sort field (field,order) multi sort '/'
  			"PRD_REV_TITLE,PRD_REV_CONTENTS,PRD_MST_NM",// set search field
  			"DOCID,PRD_REV_IDX,PRD_PRD_MST_CD,PRD_REV_TITLE,PRD_REV_CONTENTS,PRD_REV_FNC_STAR,PRD_REV_PRC_STAR,PRD_REV_SCORE_STAR,PRD_REV_AVG_STAR,PRD_REV_AVG_STAR_POINT,PRD_ORD_PRD_IDX,PRD_REV_REG_DT,PRD_REV_CHN_GBN,PRD_MST_NM,PRD_IMG,REP_CNT,ALIAS",// set document field
  			"", // set date range
  			"", // set rank range
  			"", // set prefix query, example: <fieldname:contains:value1>|<fieldname:contains:value2>/1,  (fieldname:contains:value) and ' ', or '|', not '!' / operator (AND:1, OR:0)
  			"", // set collection query (<fieldname:contains:value^weight | value^weight>/option...) and ' ', or '|'
  			"", // set boost query (<fieldname:contains:value> | <field3:contains:value>...) and ' ', or '|'
  			"", // set filter operation (<fieldname:operator:value>)
  			"", // set groupby field(field, count)
  			"", // set sort field group(field/order,field/order,...)
  			"", // set categoryBoost(fieldname,matchType,boostID,boostKeyword)
  			"", // set categoryGroupBy (fieldname:value)
  			"", // set categoryQuery (fieldname:value)
  			"", // set property group (fieldname,min,max, groupcount)
  			"PRD_REV_CHN_GBN,ALIAS", // use check prefix query filed
  			"", // set use check fast access field
  			"", // set multigroupby field
  			"", // set auth query (Auth Target Field, Auth Collection, Auth Reference Field, Authority Query)
  			"", // set Duplicate Detection Criterion Field, RANK/DESC,DATE/DESC
  			"m_review" // collection display name
  			}
			};
		}
	}
%>