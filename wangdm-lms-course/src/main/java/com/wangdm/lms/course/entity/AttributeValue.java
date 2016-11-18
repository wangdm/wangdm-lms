package com.wangdm.lms.course.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.wangdm.core.entity.BaseEntity;

@Entity
@Table(name = "attributevalue")
public class AttributeValue extends BaseEntity {

    private static final long serialVersionUID = -274605136276226414L;

    @Column(name = "value", nullable = false, length = 40)
    private String value;

    @Column(name = "idx", nullable = false)
    private Integer index = 0;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "attributenameId", nullable = false, updatable = false)
    private AttributeName name;

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public Integer getIndex() {
        return index;
    }

    public void setIndex(Integer index) {
        this.index = index;
    }

    public AttributeName getName() {
        return name;
    }

    public void setName(AttributeName name) {
        this.name = name;
    }
}
