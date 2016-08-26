package com.wangdm.lms.course.entity;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.wangdm.core.entity.BaseEntity;

@Entity
@Table(name = "courseattribute")
public class CourseAttribute extends BaseEntity {

    private static final long serialVersionUID = -6738467441407164502L;

	@ManyToOne
	@JoinColumn(name="courseId")
    private Course course;

	@ManyToOne
	@JoinColumn(name="attributenameId")
    private AttributeName name;

	@ManyToOne
	@JoinColumn(name="attributevalueId")
    private AttributeValue value;

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public AttributeName getName() {
        return name;
    }

    public void setName(AttributeName name) {
        this.name = name;
    }

    public AttributeValue getValue() {
        return value;
    }

    public void setValue(AttributeValue value) {
        this.value = value;
    }
}
