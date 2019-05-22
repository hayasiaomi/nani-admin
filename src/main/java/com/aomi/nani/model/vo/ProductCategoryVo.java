package com.aomi.nani.model.vo;

import com.aomi.nani.model.domain.ProductCategory;
import lombok.Data;

import java.util.List;

@Data
public class ProductCategoryVo {
    private  Long id;
    private String categoryName;
    private String description;
    private Integer childrenCount;
    private Long parentId;
    private Boolean isLock;
    private Boolean isDelete;
    private Integer sequence;
    private List<ProductCategoryVo> children;
}
