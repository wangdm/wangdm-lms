package com.wangdm.lms.course.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.wangdm.core.entity.BaseEntity;

@Entity
@Table(name = "attributename")
public class AttributeName extends BaseEntity {
	
    private static final long serialVersionUID = -1551370183301698148L;
	
	@Column(name="name", nullable=false, length=40)
    private String name;
    
    @Column(name="idx", nullable=false)
    private Integer index = 0;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="categoryId", nullable = false, updatable = false)
    private Category category;
	
	@OneToMany(fetch = FetchType.EAGER)
	private List<AttributeValue> valueList;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getIndex() {
        return index;
    }

    public void setIndex(Integer index) {
        this.index = index;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public List<AttributeValue> getValueList() {
        return valueList;
    }

    public void setValueList(List<AttributeValue> valueList) {
        this.valueList = valueList;
    }

}
