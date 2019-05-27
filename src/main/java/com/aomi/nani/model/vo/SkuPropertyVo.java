package com.aomi.nani.model.vo;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class SkuPropertyVo {
    private Long id;
    private Long productSpuId;
    private String propertyName;
    private String frontPropertyName;
    private String backPropertyName;
    private String description;
    private Boolean selectable;
    private Timestamp lastUpdateTime;
    private Timestamp createTime;
}
