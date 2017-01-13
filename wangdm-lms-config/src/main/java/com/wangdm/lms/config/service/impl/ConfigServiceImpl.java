package com.wangdm.lms.config.service.impl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
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
import com.wangdm.core.query.QueryResult;
import com.wangdm.lms.config.entity.KeyValue;
import com.wangdm.lms.config.service.ConfigService;

@Service("configService")
@Transactional
public class ConfigServiceImpl implements ConfigService {

    private static final Logger log = LoggerFactory.getLogger(ConfigServiceImpl.class);

    @Autowired
    private Dao<KeyValue> keyvalueDao;

    @Autowired
    private ConstraintFactory constraintFactory;

    public void saveConfig( String key, String value ) {

        if (StringUtils.isBlank(key) || StringUtils.isBlank(value)) {
            return;
        }

        KeyValue kv = this.findByKey(key);
        if (kv != null) {
            kv.setValue(value);
            keyvalueDao.update(kv);
            log.debug("update config " + key + " = " + value);
        }
        else {
            kv = new KeyValue();
            kv.setKey(key);
            kv.setValue(value);
            keyvalueDao.create(kv);
            log.debug("create config " + key + " = " + value);
        }
    }

    public String getConfig( String key, String defaultValue ) {

        if (StringUtils.isBlank(key)) {
            return null;
        }

        KeyValue kv = this.findByKey(key);
        if (kv == null) {
            if (StringUtils.isBlank(defaultValue)) {
                return null;
            }
            else {
                kv = new KeyValue();
                kv.setKey(key);
                kv.setValue(defaultValue);
                keyvalueDao.create(kv);
                log.debug("create config " + key + " = " + defaultValue);
            }
        }else if(kv != null && StringUtils.isBlank(kv.getValue())){
            if (StringUtils.isBlank(defaultValue)) {
                return null;
            }
            else {
                kv.setValue(defaultValue);
                keyvalueDao.update(kv);
                log.debug("update config " + key + " = " + defaultValue);
            }
        }
        return kv.getValue();

    }

    private KeyValue findByKey( String key ) {

        Constraint constraint = constraintFactory.createConstraint(KeyValue.class);

        constraint.addEqualCondition("key", key);

        List<EntityStatus> entityTypeList = new ArrayList<EntityStatus>();
        entityTypeList.add(EntityStatus.NORMAL);
        constraint.addEqualCondition("status", entityTypeList);

        List<KeyValue> menuList = keyvalueDao.findByConstraint(constraint);

        if (menuList != null && menuList.size() > 0) {
            return menuList.get(0);
        }

        return null;
    }

    @Override
    public Dto findById( Serializable id ) {

        log.warn("unimplement method!");
        return null;
    }

    @Override
    public QueryResult query( Query query ) {

        log.warn("unimplement method!");
        return null;
    }

    @Override
    public Serializable create( Dto dto ) {

        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public void update( Dto dto ) {

        // TODO Auto-generated method stub
        
    }

    @Override
    public void delete( Serializable id ) {

        // TODO Auto-generated method stub
        
    }

    @Override
    public void erase( Serializable id ) {

        // TODO Auto-generated method stub
        
    }

    @Override
    public void restore( Serializable id ) {

        // TODO Auto-generated method stub
        
    }
    
}
