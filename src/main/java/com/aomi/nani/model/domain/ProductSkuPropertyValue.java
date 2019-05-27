package com.aomi.nani.model.domain;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class ProductSkuPropertyValue {
    private Long id;
    private Long skuPropertyId;
    private Long productSpuId;
    private Long productSkuId;
    private String propertyValue;
    private Timestamp lastUpdateTime;
    private Timestamp createTime;
}
