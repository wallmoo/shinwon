package com.epasscni.util;

import java.text.MessageFormat;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.market.mall.model.Paging;

/**
 * @Class Name : PagingRenderer
 * 기본적인 페이징 기능이 구현되어 있으며, 화면에서 아래와 같이 display 된다.
 *
 * [<<][<] 1 2 3 4 5 6 7 8 [>][>>]
 *
 * firstPageLabel = [<<]
 * previousPageLabel = [<]
 * currentPageLabel = 현재 페이지 번호
 * otherPageLabel = 현재 페이지를 제외한 페이지 번호
 * nextPageLabel = [>]
 * lastPageLabel = [>>]
 *
 */
public class PagingRenderer {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
    public String firstPageLabel;
    public String previousPageLabel;
    public String currentPageLabel;
    public String otherPageLabel;
    public String nextPageLabel;
    public String lastPageLabel;
    public String firstPageLabelDisable;
    public String previousPageLabelDisable;
    public String nextPageLabelDisable;
    public String lastPageLabelDisable;

    public PagingRenderer(){
        firstPageLabel = "<a class=\"ir first\" href=\"javascript:;\" onclick=\"{0}({1}); return false;\"><em>처음 페이지</em></a> ";
        previousPageLabel = "<a class=\"ir prev\" href=\"javascript:;\" onclick=\"{0}({1}); return false;\"><em>이전 페이지</em></a> ";
        currentPageLabel = "<strong>{0} <span class=\"semantic\">&nbsp;페이지 - 현재 위치</span></strong> ";
        otherPageLabel = "<a href=\"javascript:;\" onclick=\"{0}({1}); return false;\">{1}</a> ";
        nextPageLabel = "<a class=\"ir next\" href=\"javascript:;\" onclick=\"{0}({1}); return false;\"><em>다음 페이지</em></a> ";
        lastPageLabel = "<a class=\"ir last\" href=\"javascript:;\" onclick=\"{0}({1}); return false;\"><em>끝 페이지</em></a>";
        firstPageLabelDisable = "<a class=\"ir first\" href=\"javascript:;\" ><em>처음 페이지</em></a> ";
        previousPageLabelDisable = "<a class=\"ir prev\" href=\"javascript:;\" ><em>이전 페이지</em></a> ";
        nextPageLabelDisable = "<a class=\"ir next\" href=\"javascript:;\" ><em>다음 페이지</em></a> ";
        lastPageLabelDisable = "<a class=\"ir last\" href=\"javascript:;\" ><em>끝 페이지</em></a>";
    }
   
    public PagingRenderer(String TYPE){
    	// FRONT
    	if (TYPE.equals("FRONT"))
    	{
            /*firstPageLabel = "<a class=\"nav first\" href=\"javascript:;\" onclick=\"{0}({1}); return false;\"><span class=\"blind\">처음 페이지</span></a> ";
            previousPageLabel = "<a class=\"nav prev\" href=\"javascript:;\" onclick=\"{0}({1}); return false;\"><span class=\"blind\">이전 페이지</span></a> ";
            currentPageLabel = "<a class=\"num active\">{0}</a> ";
            otherPageLabel = "<a class=\"num\" href=\"javascript:;\" onclick=\"{0}({1}); return false;\">{1}</a> ";
            nextPageLabel = "<a class=\"nav next\" href=\"javascript:;\" onclick=\"{0}({1}); return false;\"><span class=\"blind\">다음 페이지</span></a> ";
            lastPageLabel = "<a class=\"nav last\" href=\"javascript:;\" onclick=\"{0}({1}); return false;\"><span class=\"blind\">끝 페이지</span></a>";
            firstPageLabelDisable = "<a class=\"nav first\" href=\"javascript:;\" ><span class=\"blind\">처음 페이지</span></a> ";
            previousPageLabelDisable = "<a class=\"nav prev\" href=\"javascript:;\" ><span class=\"blind\">이전 페이지</span></a> ";
            nextPageLabelDisable = "<a class=\"nav next\" href=\"javascript:;\" ><span class=\"blind\">다음 페이지</span></a> ";
            lastPageLabelDisable = "<a class=\"nav last\" href=\"javascript:;\" ><span class=\"blind\">끝 페이지</span></a>";*/
            
    		
    		firstPageLabel 		= "<span class=\"img_arrow first\" href=\"javascript:;\" onclick=\"{0}({1}); return false;\"> <em class=\"blind\">첫 페이지로 이동</em></span> ";
            previousPageLabel 	= "<span class=\"img_arrow prev\" href=\"javascript:;\" onclick=\"{0}({1}); return false;\"> <em class=\"blind\">이전 페이지로 이동</em></span> ";
            currentPageLabel 	= "<a class=\"num on\">{0}</a> ";
            otherPageLabel 		= "<a class=\"num\" href=\"javascript:;\" onclick=\"{0}({1}); return false;\">{1}</a> ";
            nextPageLabel 		= "<span class=\"img_arrow next\" href=\"javascript:;\" onclick=\"{0}({1}); return false;\"> <em class=\"blind\">다음 페이지로 이동</em></span> ";
		    lastPageLabel 		= "<span class=\"img_arrow last\" href=\"javascript:;\" onclick=\"{0}({1}); return false;\"> <em class=\"blind\">마지막 페이지로 이동</em></span> ";
		    
		    firstPageLabelDisable		=	"";
		    previousPageLabelDisable	=	"";
		    nextPageLabelDisable		=	"";
		    lastPageLabelDisable		=	"";
		    
		    }
		    	// 몰 관리자
		    	else
	    	{
	            firstPageLabel = "<a class=\"ir first\" href=\"javascript:;\" onclick=\"{0}({1}); return false;\"><em>처음 페이지</em></a> ";
            previousPageLabel = "<a class=\"ir prev\" href=\"javascript:;\" onclick=\"{0}({1}); return false;\"><em>이전 페이지</em></a> ";
            currentPageLabel = "<strong>{0} <span class=\"semantic\">&nbsp;페이지 - 현재 위치</span></strong> ";
            otherPageLabel = "<a href=\"javascript:;\" onclick=\"{0}({1}); return false;\">{1}</a> ";
            nextPageLabel = "<a class=\"ir next\" href=\"javascript:;\" onclick=\"{0}({1}); return false;\"><em>다음 페이지</em></a> ";
            lastPageLabel = "<a class=\"ir last\" href=\"javascript:;\" onclick=\"{0}({1}); return false;\"><em>끝 페이지</em></a>";
            firstPageLabelDisable = "<a class=\"ir first\" href=\"javascript:;\" ><em>처음 페이지</em></a> ";
            previousPageLabelDisable = "<a class=\"ir prev\" href=\"javascript:;\" ><em>이전 페이지</em></a> ";
            nextPageLabelDisable = "<a class=\"ir next\" href=\"javascript:;\" ><em>다음 페이지</em></a> ";
            lastPageLabelDisable = "<a class=\"ir last\" href=\"javascript:;\" ><em>끝 페이지</em></a>";
    	}
    }

    public String renderPagination(Paging paging, String jsFunction){
        StringBuffer strBuff = new StringBuffer();
        if (paging != null){
            int firstPageNo = paging.getFirstPageNo();
            int firstPageNoOnPageList = paging.getFirstPageNoOnPageList();
            int totalPageCount = paging.getTotalPageCount();
            int lastPageNoOnPageList = paging.getLastPageNoOnPageList();
            int cPage = paging.getcPage();
            int lastPageNo = paging.getLastPageNo();
            int pageSize = paging.getPageSize();
            int pagingSize = paging.getPagingSize();
            
            if(totalPageCount > pagingSize){
            	if(firstPageNoOnPageList > pagingSize){
                    strBuff.append(MessageFormat.format(firstPageLabel,new Object[]{jsFunction,Integer.toString(firstPageNo)}));
                    strBuff.append(MessageFormat.format(previousPageLabel,new Object[]{jsFunction,Integer.toString(firstPageNoOnPageList-1)}));
                } else {
                    strBuff.append(firstPageLabelDisable);
                    strBuff.append(previousPageLabelDisable);
                }
            } else {
                strBuff.append(firstPageLabelDisable);
                strBuff.append(previousPageLabelDisable);
            }

            if (lastPageNoOnPageList > totalPageCount){
                lastPageNoOnPageList = totalPageCount;
            }

            for(int i=firstPageNoOnPageList;i<=lastPageNoOnPageList;i++){
                if(i==cPage){
                    strBuff.append(MessageFormat.format(currentPageLabel,new Object[]{Integer.toString(i)}));
                }else{
                    strBuff.append(MessageFormat.format(otherPageLabel,new Object[]{jsFunction,Integer.toString(i),Integer.toString(i)}));
                }
            }

            if(totalPageCount > pagingSize){
                if(lastPageNoOnPageList < totalPageCount){
                	strBuff.append(MessageFormat.format(nextPageLabel,new Object[]{jsFunction,Integer.toString(lastPageNoOnPageList+1)}));
                    strBuff.append(MessageFormat.format(lastPageLabel,new Object[]{jsFunction,Integer.toString(lastPageNo)}));
                }else {
                    strBuff.append(nextPageLabelDisable);
                    strBuff.append(lastPageLabelDisable);
                }
            } else {
                strBuff.append(nextPageLabelDisable);
                strBuff.append(lastPageLabelDisable);
            }
        }
        return strBuff.toString();
    }
}
