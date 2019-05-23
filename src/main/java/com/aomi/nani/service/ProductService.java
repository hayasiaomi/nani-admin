package com.aomi.nani.service;

import com.aomi.nani.mapper.ProductMapper;
import com.aomi.nani.model.domain.ProductPicture;
import com.aomi.nani.model.domain.ProductSku;
import com.aomi.nani.model.domain.ProductSpu;
import com.aomi.nani.model.vo.PagerVo;
import com.aomi.nani.model.vo.ProductVo;
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

    public PagerVo<ProductVo> findProductsByKeyword(String keyword, int pageIndex, int pageSize) {

        List<ProductVo> productVos = new ArrayList<>();

        List<ProductSpu> spus = this.productMapper.selectProductSpuByKeyword(keyword, pageSize * (pageIndex - 1), pageSize);

        if (spus != null && spus.size() > 0) {
            for (ProductSpu spu : spus) {

                ProductSku productSku = this.productMapper.selectProductSkuByProductId(spu.getId());

                List<ProductPicture> productPictures = this.productMapper.selectProductPictureByProductId(productSku.getId());

                String mainPictureSrc = productPictures.stream().filter( pp ->pp.isMain()).map( pp->pp.getSrc()).findFirst().orElse("");

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
    public void AddProductVo(ProductVo productVo) {


        ProductSpu productSpu = new ProductSpu();

        productSpu.setTitle(productVo.getTitle());
        productSpu.setProductName(productVo.getProductName());
        productSpu.setIsDelete(false);
        productSpu.setDescription(productVo.getDescription());
        productSpu.setStatus(0);
        productSpu.setUnit(productVo.getUnit());
        productSpu.setProductType(1);
        productSpu.setProductCode(productVo.getProductCode());

        productSpu.setCreateTime(Timestamp.valueOf(LocalDateTime.now()));
        productSpu.setLastUpdateTime(Timestamp.valueOf(LocalDateTime.now()));

        this.productMapper.insertProductSpu(productSpu);

        ProductSku productSku = new ProductSku();

        productSku.setPrice(productVo.getPrice());
        productSku.setProductId(productSpu.getId());
        productSku.setSalePrice(productVo.getSalePrice());
        productSku.setCostPrice(productVo.getCostPrice());
        productSku.setStoreCount(productVo.getStoreCount());
        productSku.setStoreLimitCount(5);
        productSku.setBarCode(productVo.getBarCode());
        productSku.setWeight(0d);

        this.productMapper.insertProductSku(productSku);


        ProductPicture mainProductPicture = new ProductPicture();

        mainProductPicture.setImgName(new File(productVo.getMainPictureSrc()).getName());
        mainProductPicture.setMain(true);
        mainProductPicture.setSrc(productVo.getMainPictureSrc());
        mainProductPicture.setProductSkuId(productSku.getId());

        this.productMapper.insertProductPicture(mainProductPicture);

        if (productVo.getSubPictureSrcs() != null && productVo.getSubPictureSrcs().size() > 0) {

            for (String subProductPictureSrc : productVo.getSubPictureSrcs()) {

                ProductPicture subProductPicture = new ProductPicture();

                subProductPicture.setImgName(new File(subProductPictureSrc).getName());
                subProductPicture.setSrc(subProductPictureSrc);
                subProductPicture.setMain(false);
                subProductPicture.setProductSkuId(productSku.getId());

                this.productMapper.insertProductPicture(subProductPicture);
            }
        }

    }


}
