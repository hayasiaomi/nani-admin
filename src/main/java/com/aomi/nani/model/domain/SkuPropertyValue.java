package com.aomi.nani.model.domain;

import lombok.Data;

@Data
public class SkuPropertyValue {
    private  Long id;
    private Long skuPropertyId;
    private String propertyValue;
    private Boolean enable;
}
