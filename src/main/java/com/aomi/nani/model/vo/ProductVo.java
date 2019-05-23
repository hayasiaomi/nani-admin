package com.aomi.nani.model.vo;

import lombok.Data;

import java.util.List;

@Data
public class ProductVo {
    private Long id;
    private String title;
    private String productName;
    private String productCode;
    private Long productCategoryId;
    private String description;
    private Integer storeCount;
    private Integer storeLimitCount;
    private  String mainPictureSrc;
    private List<String> subPictureSrcs;
    private String unit;
    private Double price;
    private Double salePrice;
    private  Double costPrice;
    private Integer status;
    private Boolean isOnLine;
    private String barCode;
    private Boolean isDelete;
}
