package com.aomi.nani.model.domain;

import lombok.Data;

@Data
public class ProductPicture {
    private Long id;
    private  String imgName;
    private String src;
    private boolean isMain;
    private Long productSkuId;
}
