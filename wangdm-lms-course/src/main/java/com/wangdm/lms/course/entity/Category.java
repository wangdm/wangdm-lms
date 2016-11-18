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
@Table(name = "category")
public class Category extends BaseEntity {

    private static final long serialVersionUID = 257550356807785562L;
	
	@Column(name="name", nullable=false, length=40)
    private String name;
    
    @Column(name="idx", nullable=false)
    private Integer index = 0;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="parentId", updatable = false)
    private Category parent;
    
    @OneToMany(fetch = FetchType.LAZY)
    private List<Category> chileren;

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

    public Category getParent() {
        return parent;
    }

    public void setParent(Category parent) {
        this.parent = parent;
    }

    public List<Category> getChileren() {
        return chileren;
    }

    public void setChileren(List<Category> chileren) {
        this.chileren = chileren;
    }
	
}
