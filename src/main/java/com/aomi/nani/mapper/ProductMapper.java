package com.aomi.nani.mapper;

import com.aomi.nani.model.domain.ProductSku;
import com.aomi.nani.model.domain.ProductSpu;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

@Mapper
@Component
public interface ProductMapper {
    List<ProductSpu> selectProductSpuByKeyword(@Param("keyword") String keyword, @Param("limit") int limit, @Param("skip") int skip);

    Integer selectProductSpuCountByKeyword(@Param("keyword") String keyword);

    ProductSku selectProductSkuByProductId(Long productId);

    Long insertProductSpu(ProductSpu productSpu);

    Long insertProductSku(ProductSku productSku);
}
