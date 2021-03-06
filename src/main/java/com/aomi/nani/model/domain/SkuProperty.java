package com.aomi.nani.model.domain;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class SkuProperty {
    private Long id;
    private Long productSpuId;
    private String propertyName;
    private String frontPropertyName;
    private String backPropertyName;
    private String description;
    private Boolean selectable;
    private String propertyValue;
    private Timestamp lastUpdateTime;
    private Timestamp createTime;
}
