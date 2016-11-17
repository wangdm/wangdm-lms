package com.wangdm.lms.course.entity;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.wangdm.core.constant.EntityType;
import com.wangdm.core.entity.BaseEntity;

@Entity
@Table(name = "attributemap")
public class AttributeMap extends BaseEntity {

    private static final long serialVersionUID = -6738467441407164502L;

	@ManyToOne
	@JoinColumn(name="entitytype")
    private EntityType entityType;

	@ManyToOne
	@JoinColumn(name="attributenameId")
    private AttributeName name;

	@ManyToOne
	@JoinColumn(name="attributevalueId")
    private AttributeValue value;

    public EntityType getEntityType() {
        return entityType;
    }

    public void setEntityType(EntityType entityType) {
        this.entityType = entityType;
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
