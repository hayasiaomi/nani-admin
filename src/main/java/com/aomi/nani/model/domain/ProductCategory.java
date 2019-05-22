package com.aomi.nani.model.domain;

import lombok.Data;

@Data
public class  ProductCategory {
    private  Long id;
    private String categoryName;
    private String description;
    private Integer childrenCount;
    private Long parentId;
    private Boolean isLock;
    private Boolean isDelete;
    private Integer sequence;
}
