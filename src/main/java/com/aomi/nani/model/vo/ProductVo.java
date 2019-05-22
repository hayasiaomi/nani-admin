package com.aomi.nani.model.vo;

import lombok.Data;

@Data
public class ProductVo {
    private Long id;
    private String title;
    private String productName;
    private String productCode;
    private String pictureUrl;
    private String description;
    private Integer storeCount;
    private Integer storeLimitCount;
    private String unit;
    private Double price;
    private Double salePrice;
    private Integer status;
    private int isOnLine;
    private String barCode;
    private Boolean isDelete;

}
