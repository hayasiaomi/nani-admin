package com.aomi.nani.service;

import com.aomi.nani.mapper.ProductCategoryMapper;
import com.aomi.nani.model.domain.ProductCategory;
import com.aomi.nani.model.vo.ProductCategoryVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sun.rmi.runtime.Log;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class ProductCategorySevice {

    @Autowired
    private ProductCategoryMapper productCategoryMapper;

    public List<ProductCategoryVo> findProductCategoryVos() {

        List<ProductCategory> productCategories = this.productCategoryMapper.selectProductCategories();

        List<ProductCategoryVo> firstProductCategoryVos = productCategories
                .stream()
                .filter(c -> c.getParentId() == -1)
                .map(c -> {
                    ProductCategoryVo productCategoryVo = new ProductCategoryVo();

                    productCategoryVo.setId(c.getId());
                    productCategoryVo.setCategoryName(c.getCategoryName());
                    productCategoryVo.setDescription(c.getDescription());
                    productCategoryVo.setIsDelete(c.getIsDelete());
                    productCategoryVo.setChildrenCount(c.getChildrenCount());
                    productCategoryVo.setSequence(c.getSequence());
                    productCategoryVo.setIsLock(c.getIsLock());
                    productCategoryVo.setParentId(c.getParentId());

                    this.loadCascadeProductCategoryVo(productCategoryVo, productCategories);

                    return productCategoryVo;
                }).collect(Collectors.toList());

        return firstProductCategoryVos;
    }

    public List<ProductCategoryVo> findProductCategoriesByParentId(Long parentId)
    {
        List<ProductCategory> productCategories = this.productCategoryMapper.selectFirstProductCategoriesByParentId(parentId);

        List<ProductCategoryVo> firstProductCategoryVos = productCategories
                .stream().map(c -> {
                    ProductCategoryVo productCategoryVo = new ProductCategoryVo();

                    productCategoryVo.setId(c.getId());
                    productCategoryVo.setCategoryName(c.getCategoryName());
                    productCategoryVo.setDescription(c.getDescription());
                    productCategoryVo.setIsDelete(c.getIsDelete());
                    productCategoryVo.setChildrenCount(c.getChildrenCount());
                    productCategoryVo.setSequence(c.getSequence());
                    productCategoryVo.setIsLock(c.getIsLock());
                    productCategoryVo.setParentId(c.getParentId());

                    this.loadCascadeProductCategoryVo(productCategoryVo, productCategories);

                    return productCategoryVo;
                }).collect(Collectors.toList());

        return firstProductCategoryVos;
    }

    public ProductCategoryVo getProductCategoryVoById(Long id) {

        ProductCategory productCategory = this.productCategoryMapper.selectProductCategoryById(id);

        if (productCategory != null) {
            ProductCategoryVo productCategoryVo = new ProductCategoryVo();

            productCategoryVo.setId(productCategory.getId());
            productCategoryVo.setCategoryName(productCategory.getCategoryName());
            productCategoryVo.setDescription(productCategory.getDescription());
            productCategoryVo.setIsDelete(productCategory.getIsDelete());
            productCategoryVo.setChildrenCount(productCategory.getChildrenCount());
            productCategoryVo.setSequence(productCategory.getSequence());
            productCategoryVo.setIsLock(productCategory.getIsLock());
            productCategoryVo.setParentId(productCategory.getParentId());

            return productCategoryVo;

        }
        return null;
    }


    public  void addProductCategoryVo(String categoryName,String description,Long parentId)
    {
        ProductCategory productCategory = new ProductCategory();

        productCategory.setCategoryName(categoryName);
        productCategory.setDescription(description);
        productCategory.setParentId(parentId);

        this.productCategoryMapper.insertProductCategory(productCategory);
    }

    public  void editProductCategoryVo(Long id,String categoryName,String description)
    {
        this.productCategoryMapper.updateProductCategory(id,categoryName,description);
    }

    public void RemoveProductCategoryVo(Long id)
    {
        this.productCategoryMapper.deleteProductCategory(id);
    }


    private void loadCascadeProductCategoryVo(ProductCategoryVo productCategoryVo, List<ProductCategory> datas) {
        List<ProductCategoryVo> childrenVos = datas
                .stream()
                .filter(c -> c.getParentId() == productCategoryVo.getId())
                .map(c -> {
                    ProductCategoryVo vo = new ProductCategoryVo();

                    vo.setId(c.getId());
                    vo.setCategoryName(c.getCategoryName());
                    vo.setDescription(c.getDescription());
                    vo.setIsDelete(c.getIsDelete());
                    vo.setChildrenCount(c.getChildrenCount());
                    vo.setSequence(c.getSequence());
                    vo.setIsLock(c.getIsLock());
                    vo.setParentId(c.getParentId());

                    return vo;
                }).collect(Collectors.toList());

        productCategoryVo.setChildren(childrenVos);

        if (childrenVos == null || childrenVos.size() == 0)
            return;

        for (ProductCategoryVo childVo : childrenVos) {
            this.loadCascadeProductCategoryVo(childVo, datas);
        }
    }





}
