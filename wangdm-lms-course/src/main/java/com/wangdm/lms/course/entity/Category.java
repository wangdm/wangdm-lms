package com.wangdm.lms.course.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.wangdm.core.entity.BaseEntity;

@Entity
@Table(name = "category")
public class Category extends BaseEntity {

    private static final long serialVersionUID = 257550356807785562L;
	
	@Column(name="name", nullable=false, length=40)
    private String name;
	
	@ManyToOne
	@JoinColumn(name="parentId")
    private Category parent;
	
	@Column(name="idx")
	private Integer index = 0;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Category getParent() {
        return parent;
    }

    public void setParent(Category parent) {
        this.parent = parent;
    }

    public Integer getIndex() {
        return index;
    }

    public void setIndex(Integer index) {
        this.index = index;
    }
	
}
