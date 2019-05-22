package com.aomi.nani.mapper;

import com.aomi.nani.model.domain.ProductCategory;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import java.util.List;

@Mapper
@Component
public interface ProductCategoryMapper {

    List<ProductCategory> selectFirstProductCategoriesByParentId(Long parentId);

    List<ProductCategory> selectProductCategories();

    ProductCategory selectProductCategoryById(Long id);

    void insertProductCategory(ProductCategory productCategory);

    void updateProductCategory(Long id,String categoryName,String description);

    void deleteProductCategory(Long id);
}
