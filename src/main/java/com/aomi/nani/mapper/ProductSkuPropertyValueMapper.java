package com.aomi.nani.mapper;

import com.aomi.nani.model.domain.ProductSkuPropertyValue;
import com.aomi.nani.model.domain.SkuProperty;
import com.aomi.nani.model.domain.SkuPropertyValue;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

@Mapper
@Component
public interface ProductSkuPropertyValueMapper {
    void insertProductSkuPropertyValue(ProductSkuPropertyValue productSkuPropertyValue);
}
