package org.wangdm.lms.course;

import java.util.HashSet;
import java.util.Set;

import com.wangdm.lms.course.dto.AttributeValueDto;
import com.wangdm.lms.course.entity.AttributeValue;

public final class App {
    
    public static void main( String[] args )
    {
        
        App app = new App();
        
        app.testEquals();
    }
    
    public void testEquals(){
        AttributeValueDto val1 = new AttributeValueDto();
        //val1.setId("1");
        val1.setValue("1111");
        AttributeValueDto val2 = new AttributeValueDto();
        //val2.setId("1");
        val2.setValue("2222");
        
        AttributeValue entity1 = (AttributeValue)val1.toEntity(AttributeValue.class);
        
        AttributeValue entity2 = (AttributeValue)val2.toEntity(AttributeValue.class);
        
        System.out.println(entity1.equals(entity2));
        
        Set<AttributeValue> valueSet = new HashSet<AttributeValue>();
        
        Set<AttributeValue> set1 = new HashSet<AttributeValue>();
        set1.add(entity1);
        
        Set<AttributeValue> set2 = new HashSet<AttributeValue>();
        set2.add(entity2);
        
        valueSet.addAll(set2);
        System.out.println(valueSet.toString());
        
        valueSet.addAll(set1);
        System.out.println(valueSet.toString());
    }
}
