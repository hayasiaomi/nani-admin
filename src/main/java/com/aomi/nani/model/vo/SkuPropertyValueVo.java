package com.aomi.nani.model.vo;

import lombok.Data;

@Data
public class SkuPropertyValueVo {
    private  Long id;
    private Long skuPropertyId;
    private String propertyValue;
    private Boolean enable;
}
