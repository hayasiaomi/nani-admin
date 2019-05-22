package com.aomi.nani.service;

import com.aomi.nani.mapper.ProductMapper;
import com.aomi.nani.model.domain.ProductSku;
import com.aomi.nani.model.domain.ProductSpu;
import com.aomi.nani.model.vo.PagerVo;
import com.aomi.nani.model.vo.ProductVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Service
public class ProductService {

    @Autowired
    private ProductMapper productMapper;

    public PagerVo<ProductVo> findProductsByKeyword(String keyword, int pageIndex, int pageSize) {

        List<ProductVo> productVos = new ArrayList<>();

        List<ProductSpu> spus = this.productMapper.selectProductSpuByKeyword(keyword, pageSize * (pageIndex - 1), pageSize);

        if (spus != null && spus.size() > 0) {
            for (ProductSpu spu : spus) {

                ProductSku productSku = this.productMapper.selectProductSkuByProductId(spu.getId());

                ProductVo productVo = new ProductVo();

                productVo.setId(spu.getId());
                productVo.setDescription(spu.getDescription());
                productVo.setProductName(spu.getProductName());
                productVo.setProductCode(spu.getProductCode());
                productVo.setStatus(spu.getStatus());
                productVo.setPictureUrl(spu.getPictureUrl());
                productVo.setTitle(spu.getTitle());
                productVo.setStock(spu.getStock());
                productVo.setWarningStock(spu.getWarningStock());
                productVo.setPrice(productSku.getPrice());
                productVo.setSalePrice(productSku.getSalePrice());

                productVos.add(productVo);
            }
        }

        int sumCount = this.productMapper.selectProductSpuCountByKeyword(keyword);

        return new PagerVo<>(productVos, pageIndex, pageSize, sumCount);


    }

    @Transactional
    public void AddProductVo(ProductVo productVo) {


        ProductSpu productSpu = new ProductSpu();

        productSpu.setTitle(productVo.getTitle());
        productSpu.setProductName(productVo.getProductName());
        productSpu.setIsDelete(false);
        productSpu.setDescription(productVo.getDescription());
        productSpu.setPictureUrl(productVo.getPictureUrl());
        productSpu.setStatus(0);
        productSpu.setUnit(productVo.getUnit());
        productSpu.setProductType(1);
        productSpu.setWarningStock(productVo.getWarningStock());
        productSpu.setStock(productVo.getStock());
        productSpu.setProductCode(productVo.getProductCode());

        productSpu.setCreateTime(Timestamp.valueOf(LocalDateTime.now()));
        productSpu.setLastUpdateTime(Timestamp.valueOf(LocalDateTime.now()));

        this.productMapper.insertProductSpu(productSpu);

        ProductSku productSku = new ProductSku();

        productSku.setPrice(productVo.getPrice());
        productSku.setProductId(productSpu.getId());
        productSku.setSalePrice(productVo.getSalePrice());
        productSku.setStoreCount(productVo.getStock());
        productSku.setBarCode(productVo.getBarCode());
        productSku.setWeight(0d);

        this.productMapper.insertProductSku(productSku);
    }
}
