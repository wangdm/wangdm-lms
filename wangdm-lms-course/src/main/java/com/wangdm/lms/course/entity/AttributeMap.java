package com.wangdm.lms.course.entity;

import java.io.Serializable;

import javax.persistence.Column;
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

	@Column(name="entitytype", nullable = false, updatable = false)
    private EntityType entityType;

    @Column(name="entityid", nullable = false, updatable = false)
    private Serializable entityId;

	@ManyToOne
	@JoinColumn(name="attributenameId", nullable = false, updatable = false)
    private AttributeName name;

	@ManyToOne
	@JoinColumn(name="attributevalueId", nullable = false)
    private AttributeValue value;

    public EntityType getEntityType() {
        return entityType;
    }

    public void setEntityType(EntityType entityType) {
        this.entityType = entityType;
    }

    public Serializable getEntityId() {
        return entityId;
    }

    public void setEntityId(Serializable entityId) {
        this.entityId = entityId;
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
