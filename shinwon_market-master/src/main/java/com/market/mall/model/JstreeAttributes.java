package com.market.mall.model;

import java.io.Serializable;

public class JstreeAttributes implements Serializable {
    private static final long serialVersionUID = 1L;

    private String id;
    private String title;
    private String upperId;
    private String level;
    
    /**
     * 생성자
     */
    public JstreeAttributes() {
        super();
    }
    
    /**
     * 생성자
     * @param id
     * @param title
     */
    public JstreeAttributes(String id, String title, String upperId, String level) {
        super();

        this.id      = id;
        this.title   = title;
        this.upperId = upperId;
        this.level = level;
    }

    /**
     * id를 가져옵니다.
     * @return
     * @author 박종윤
     */
    public String getId() {
        return id;
    }

    /**
     * id를 설정합니다.
     * @param id
     * @author 박종윤
     */
    public void setId(String id) {
        this.id = id;
    }

    /**
     * title 을 가져옵니다.
     * @param id
     * @author 박종윤
     */
    public String getTitle() {
        return title;
    }

    /**
     * title 을 설정합니다.
     * @param id
     * @author 박종윤
     */
    public void setTitle(String title) {
        this.title = title;
    }
    
    /**
     * upperId 을 가져옵니다.
     * @param id
     * @author 박종윤
     */
    public String getUpperId() {
        return upperId;
    }

    /**
     * upperId 을 설정합니다.
     * @param id
     * @author 박종윤
     */
    public void setpperId(String upperId) {
        this.title = upperId;
    }
    
    /**
     * level 을 가져옵니다.
     * @param id
     * @author 박종윤
     */
    public String getLevel() {
        return level;
    }

    /**
     * level 을 설정합니다.
     * @param id
     * @author 박종윤
     */
    public void setLevel(String level) {
        this.level = level;
    }
}
