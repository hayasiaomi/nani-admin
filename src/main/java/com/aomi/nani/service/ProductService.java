package com.aomi.nani.service;

import com.aomi.nani.mapper.ProductMapper;
import com.aomi.nani.mapper.ProductSkuPropertyValueMapper;
import com.aomi.nani.mapper.SkuPropertyMapper;
import com.aomi.nani.model.domain.*;
import com.aomi.nani.model.vo.AddAndEditProductVo;
import com.aomi.nani.model.vo.PagerVo;
import com.aomi.nani.model.vo.ProductVo;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.File;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class ProductService {

    @Autowired
    private ProductMapper productMapper;
    @Autowired
    private ProductSkuPropertyValueMapper productSkuPropertyValueMapper;
    @Autowired
    private SkuPropertyMapper skuPropertyMapper;

    public PagerVo<ProductVo> findProductsByKeyword(String keyword, int pageIndex, int pageSize) {

        List<ProductVo> productVos = new ArrayList<>();

        List<ProductSpu> spus = this.productMapper.selectProductSpuByKeyword(keyword, pageSize * (pageIndex - 1), pageSize);

        if (spus != null && spus.size() > 0) {
            for (ProductSpu spu : spus) {

                ProductSku productSku = this.productMapper.selectProductSkuByProductId(spu.getId());

                List<ProductPicture> productPictures = this.productMapper.selectProductPictureByProductId(productSku.getId());

                String mainPictureSrc = productPictures.stream().filter(pp -> pp.isMain()).map(pp -> pp.getSrc()).findFirst().orElse("");

                List<String> subPictureSrcs = productPictures.stream().filter(pp -> !pp.isMain()).map(pp -> pp.getSrc()).collect(Collectors.toList());

                ProductVo productVo = new ProductVo();

                productVo.setId(spu.getId());
                productVo.setDescription(spu.getDescription());
                productVo.setProductName(spu.getProductName());
                productVo.setProductCode(spu.getProductCode());
                productVo.setStatus(spu.getStatus());
                productVo.setTitle(spu.getTitle());
                productVo.setUnit(spu.getUnit());
                productVo.setPrice(productSku.getPrice());
                productVo.setStoreCount(productSku.getStoreCount());
                productVo.setStoreLimitCount(productSku.getStoreLimitCount());
                productVo.setSalePrice(productSku.getSalePrice());
                productVo.setCostPrice(productSku.getCostPrice());
                productVo.setMainPictureSrc(mainPictureSrc);
                productVo.setSubPictureSrcs(subPictureSrcs);
                productVo.setIsOnLine(productSku.getIsOnLine());

                productVos.add(productVo);
            }
        }

        int sumCount = this.productMapper.selectProductSpuCountByKeyword(keyword);

        return new PagerVo<>(productVos, pageIndex, pageSize, sumCount);


    }

    @Transactional
    public void AddProductVo(AddAndEditProductVo addAndEditProductVo) {


        ProductSpu productSpu = new ProductSpu();

        productSpu.setTitle(addAndEditProductVo.getTitle());
        productSpu.setProductName(addAndEditProductVo.getProductName());
        productSpu.setIsDelete(false);
        productSpu.setDescription(addAndEditProductVo.getDescription());
        productSpu.setStatus(0);
        productSpu.setUnit(addAndEditProductVo.getUnit());
        productSpu.setProductType(1);
        productSpu.setProductCode(addAndEditProductVo.getProductCode());

        productSpu.setCreateTime(Timestamp.valueOf(LocalDateTime.now()));
        productSpu.setLastUpdateTime(Timestamp.valueOf(LocalDateTime.now()));

        this.productMapper.insertProductSpu(productSpu);

        ProductSku productSku = new ProductSku();

        productSku.setPrice(addAndEditProductVo.getPrice());
        productSku.setProductId(productSpu.getId());
        productSku.setSalePrice(addAndEditProductVo.getSalePrice());
        productSku.setCostPrice(addAndEditProductVo.getCostPrice());
        productSku.setStoreCount(addAndEditProductVo.getStoreCount());
        productSku.setStoreLimitCount(5);
        productSku.setBarCode(addAndEditProductVo.getBarCode());
        productSku.setWeight(0d);

        this.productMapper.insertProductSku(productSku);


        ProductPicture mainProductPicture = new ProductPicture();

        mainProductPicture.setImgName(new File(addAndEditProductVo.getMainPictureSrc()).getName());
        mainProductPicture.setMain(true);
        mainProductPicture.setSrc(addAndEditProductVo.getMainPictureSrc());
        mainProductPicture.setProductSkuId(productSku.getId());

        this.productMapper.insertProductPicture(mainProductPicture);

        if (addAndEditProductVo.getSubPictureSrcs() != null && addAndEditProductVo.getSubPictureSrcs().size() > 0) {

            for (String subProductPictureSrc : addAndEditProductVo.getSubPictureSrcs()) {

                ProductPicture subProductPicture = new ProductPicture();

                subProductPicture.setImgName(new File(subProductPictureSrc).getName());
                subProductPicture.setSrc(subProductPictureSrc);
                subProductPicture.setMain(false);
                subProductPicture.setProductSkuId(productSku.getId());

                this.productMapper.insertProductPicture(subProductPicture);
            }
        }

        if (addAndEditProductVo.getSpecNames() != null && addAndEditProductVo.getSpecNames().size() > 0) {
            List<String> specNames = addAndEditProductVo.getSpecNames();
            List<String> specValues = addAndEditProductVo.getSpecValues();

            ObjectMapper mapper = new ObjectMapper();

            for (int i = 0; i < specNames.size(); i++) {
                String specName = specNames.get(i);

                if(specName != null && specName != "")
                {
                    String specValue = "";
                    if (i < specValues.size()) {

                        specValue = specNames.get(i);
                    }

                    SkuProperty skuProperty = new SkuProperty();

                    skuProperty.setProductSpuId(productSpu.getId());
                    skuProperty.setPropertyName(specName);

                    List<String> values = new ArrayList<>();

                    values.add(specValue);

                    try {
                        skuProperty.setPropertyValue(mapper.writeValueAsString(values));
                    } catch (JsonProcessingException e) {
                        e.printStackTrace();
                    }

                    this.skuPropertyMapper.insertSkuProperty(skuProperty);

                    ProductSkuPropertyValue productSkuPropertyValue = new ProductSkuPropertyValue();

                    productSkuPropertyValue.setProductSpuId(productSpu.getId());
                    productSkuPropertyValue.setProductSkuId(productSku.getId());
                    productSkuPropertyValue.setSkuPropertyId(skuProperty.getId());
                    productSkuPropertyValue.setPropertyValue(specValue);

                    this.productSkuPropertyValueMapper.insertProductSkuPropertyValue(productSkuPropertyValue);

                }
            }
        }


    }


}
