package com.aomi.nani.model.domain;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class ProductSpu {
    private Long id;
    private String title;
    private String productName;
    private String productCode;
    private String pictureUrl;
    private Long productCategoryId;
    private String description;
    private int productType;
    private String unit;
    private int sequence;
    private Integer status;
    private Timestamp lastUpdateTime;
    private Timestamp createTime;
    private Boolean isDelete;


}
