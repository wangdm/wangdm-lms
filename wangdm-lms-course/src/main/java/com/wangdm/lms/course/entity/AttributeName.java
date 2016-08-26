package com.wangdm.lms.course.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.wangdm.core.entity.BaseEntity;

@Entity
@Table(name = "attributename")
public class AttributeName extends BaseEntity {
	
    private static final long serialVersionUID = -1551370183301698148L;
	
	@Column(name="name", nullable=false, length=40)
    private String name;
	
	@ManyToOne
	@JoinColumn(name="categoryId")
    private Category category;
	
	@Column(name="idx")
	private Integer index = 0;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public Integer getIndex() {
        return index;
    }

    public void setIndex(Integer index) {
        this.index = index;
    }

}
