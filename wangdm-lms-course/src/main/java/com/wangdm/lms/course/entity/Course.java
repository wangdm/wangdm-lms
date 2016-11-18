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
@Table(name = "course")
public class Course extends BaseEntity {

    private static final long serialVersionUID = -828260442690228820L;

    @Column(name = "title", nullable = false, length = 100)
    private String title;

    @ManyToOne
    @JoinColumn(name = "categoryId", nullable = false)
    private Category category;

    @OneToMany(fetch = FetchType.LAZY)
    private List<AttributeMap> attributes;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public List<AttributeMap> getAttributes() {
        return attributes;
    }

    public void setAttributes(List<AttributeMap> attributes) {
        this.attributes = attributes;
    }

}
