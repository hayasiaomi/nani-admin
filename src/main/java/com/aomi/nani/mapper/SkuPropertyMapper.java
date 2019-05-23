package com.aomi.nani.mapper;

import com.aomi.nani.model.domain.SkuProperty;
import com.aomi.nani.model.domain.SkuPropertyValue;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

@Mapper
@Component
public interface SkuPropertyMapper {
    List<SkuProperty> selectSkuPropertyByKeyword(@Param("keyword") String keyword, @Param("limit") int limit, @Param("skip") int skip);

    SkuProperty selectSkuPropertyById(Long id);

    Integer selectSkuPropertyCountByKeyword(@Param("keyword") String keyword);

    void insertSkuProperty(SkuProperty skuProperty);

    void updateSkuProperty(SkuProperty skuProperty);

    void deleteSkuPropertyById(Long id);

    void insertSkuPropertyValue(@Param("skuPropertyId")Long skuPropertyId,@Param("propertyValue") String propertyValue);

    void deleteSkuPropertyValueById(Long id);

    List<SkuPropertyValue> selectSkuPropertyValueBySkuPropertyId(Long skuPropertyId);
}
