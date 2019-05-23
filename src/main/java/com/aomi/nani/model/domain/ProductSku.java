package com.aomi.nani.model.domain;

import lombok.Data;

@Data
public class ProductSku {
    private Long id;
    private Long productId;
    private Long skuPropertyValueId;
    private Double price;
    private Double salePrice;
    private Double costPrice;
    private Integer storeCount;
    private Integer storeLimitCount;
    private String barCode;
    private Double weight;
    private Boolean isOnLine;
}
