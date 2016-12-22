package com.wangdm.lms.config.service.impl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wangdm.core.constant.EntityStatus;
import com.wangdm.core.constraint.Constraint;
import com.wangdm.core.constraint.ConstraintFactory;
import com.wangdm.core.dao.Dao;
import com.wangdm.core.dto.Dto;
import com.wangdm.core.query.Query;
import com.wangdm.core.service.BaseService;
import com.wangdm.lms.config.dto.KeyValueDto;
import com.wangdm.lms.config.entity.KeyValue;
import com.wangdm.lms.config.service.KeyValueService;

@Service("keyvalueService")
@Transactional
public class KeyValueServiceImpl extends BaseService<KeyValue> implements KeyValueService {
	
	private static final Logger log = LoggerFactory.getLogger(ConfigServiceImpl.class);

	@Autowired
	private Dao<KeyValue> keyvalueDao;
	
    @Autowired
    private ConstraintFactory constraintFactory;

	@Override
	public Dto findById(Serializable id) {
		
		KeyValue entity = keyvalueDao.findById(id, KeyValue.class);
		if(entity !=null){
			KeyValueDto dto = new KeyValueDto();
	    	dto.fromEntity(entity);
	        return dto;
		}
		log.info("No KyeValue is found with id="+id);
        return null;
	}

	@Override
	public Dto findbyKey(String key) {
        
        Constraint constraint = constraintFactory.createConstraint(KeyValue.class);

        constraint.addEqualCondition("key", key);
        
        List<EntityStatus> entityTypeList = new ArrayList<EntityStatus>();
        entityTypeList.add(EntityStatus.NORMAL);
        constraint.addEqualCondition("status", entityTypeList);
        
        List<KeyValue> menuList = keyvalueDao.findByConstraint(constraint);
        
        KeyValue entity = null;
        if(menuList != null && menuList.size()>0){
        	entity = menuList.get(0);
    		KeyValueDto dto = new KeyValueDto();
        	dto.fromEntity(entity);
            return dto;
        }
		log.info("No KyeValue is found with key="+key);
        return null;
	}

	@Override
	public List<Dto> query(Query query) {
		log.warn("Unimplement method! you shouldn't call it.");
		return null;
	}
}
