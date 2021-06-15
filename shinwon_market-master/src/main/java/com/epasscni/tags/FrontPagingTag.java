package com.epasscni.tags;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import com.epasscni.util.PagingRenderer;
import com.market.mall.model.Paging;

public class FrontPagingTag extends TagSupport {
	
	private static final long serialVersionUID = 4276560185159565989L;
	private Paging paging;
	private String jsFunction;
	
	public Paging getPaging() {
		return paging;
	}

	public void setPaging(Paging paging) {
		this.paging = paging;
	}

	public String getJsFunction() {
		return jsFunction;
	}

	public void setJsFunction(String jsFunction) {
		this.jsFunction = jsFunction;
	}

	@Override
	public int doEndTag() throws JspException {
		// TODO Auto-generated method stub
		try{
			JspWriter out = pageContext.getOut();
            
			PagingRenderer pagingRenderer = new PagingRenderer("FRONT");
            
            String contents = pagingRenderer.renderPagination(paging, jsFunction);
            
            out.println(contents);
			
			return EVAL_PAGE;
		}catch(IOException e){
			throw new JspException();
		}
	}
}
