package com.aomi.nani.service;

import com.aomi.nani.mapper.SkuPropertyMapper;
import com.aomi.nani.model.domain.SkuProperty;
import com.aomi.nani.model.domain.SkuPropertyValue;
import com.aomi.nani.model.vo.PagerVo;
import com.aomi.nani.model.vo.SkuPropertyValueVo;
import com.aomi.nani.model.vo.SkuPropertyVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class SkuPropertyService {

    @Autowired
    private SkuPropertyMapper skuPropertyMapper;

    public PagerVo<SkuPropertyVo> findSkuPropertyByKeyword(String keyword, int pageIndex, int pageSize) {

        List<SkuProperty> skuProperties = this.skuPropertyMapper.selectSkuPropertyByKeyword(keyword, pageSize * (pageIndex - 1), pageSize);

        List<SkuPropertyVo> skuPropertyVos = skuProperties.stream().map(skuProperty -> {

            SkuPropertyVo skuPropertyVo = new SkuPropertyVo();

            skuPropertyVo.setId(skuProperty.getId());
            skuPropertyVo.setBackPropertyName(skuProperty.getBackPropertyName());
            skuPropertyVo.setFrontPropertyName(skuProperty.getFrontPropertyName());
            skuPropertyVo.setDescription(skuProperty.getDescription());
            skuPropertyVo.setSelectable(skuProperty.getSelectable());
            skuPropertyVo.setPropertyName(skuProperty.getPropertyName());

            return skuPropertyVo;

        }).collect(Collectors.toList());

        int sumCount = this.skuPropertyMapper.selectSkuPropertyCountByKeyword(keyword);

        return new PagerVo<>(skuPropertyVos, pageIndex, pageSize, sumCount);

    }

    public void AddSkuPropertyVo(SkuPropertyVo skuPropertyVo) {

        SkuProperty skuProperty = new SkuProperty();

        skuProperty.setPropertyName(skuPropertyVo.getPropertyName());
        skuProperty.setFrontPropertyName(skuPropertyVo.getFrontPropertyName());
        skuProperty.setBackPropertyName(skuPropertyVo.getBackPropertyName());
        skuProperty.setSelectable(skuPropertyVo.getSelectable());
        skuProperty.setLastUpdateTime(Timestamp.valueOf(LocalDateTime.now()));
        skuProperty.setCreateTime(Timestamp.valueOf(LocalDateTime.now()));

        this.skuPropertyMapper.insertSkuProperty(skuProperty);
    }

    public void editSkuPropertyVo(SkuPropertyVo skuPropertyVo) {

        SkuProperty skuProperty = new SkuProperty();

        skuProperty.setId(skuPropertyVo.getId());
        skuProperty.setPropertyName(skuPropertyVo.getPropertyName());
        skuProperty.setFrontPropertyName(skuPropertyVo.getFrontPropertyName());
        skuProperty.setBackPropertyName(skuPropertyVo.getBackPropertyName());
        skuProperty.setDescription(skuPropertyVo.getDescription());
        skuProperty.setSelectable(skuPropertyVo.getSelectable());
        skuProperty.setLastUpdateTime(Timestamp.valueOf(LocalDateTime.now()));

        this.skuPropertyMapper.updateSkuProperty(skuProperty);
    }

    public SkuPropertyVo getSkuPropertyVoById(Long id) {
        SkuProperty skuProperty = this.skuPropertyMapper.selectSkuPropertyById(id);

        SkuPropertyVo skuPropertyVo = new SkuPropertyVo();

        skuPropertyVo.setId(skuProperty.getId());
        skuPropertyVo.setBackPropertyName(skuProperty.getBackPropertyName());
        skuPropertyVo.setFrontPropertyName(skuProperty.getFrontPropertyName());
        skuPropertyVo.setDescription(skuProperty.getDescription());
        skuPropertyVo.setSelectable(skuProperty.getSelectable());
        skuPropertyVo.setPropertyName(skuProperty.getPropertyName());

        return skuPropertyVo;
    }

    public void removeSkuPropertyVo(Long id) {
        this.skuPropertyMapper.deleteSkuPropertyById(id);
    }


    public List<SkuPropertyValueVo> findSkuPropertyValueBySkuPropertyId(Long skuPropertyId) {

        List<SkuPropertyValue> skuPropertyValues = this.skuPropertyMapper.selectSkuPropertyValueBySkuPropertyId(skuPropertyId);

        List<SkuPropertyValueVo> skuPropertyValueVos = skuPropertyValues.stream().map(spv -> {
            SkuPropertyValueVo skuPropertyValueVo = new SkuPropertyValueVo();

            skuPropertyValueVo.setId(spv.getId());
            skuPropertyValueVo.setPropertyValue(spv.getPropertyValue());
            skuPropertyValueVo.setEnable(spv.getEnable());
            skuPropertyValueVo.setSkuPropertyId(spv.getSkuPropertyId());

            return skuPropertyValueVo;
        }).collect(Collectors.toList());

        return skuPropertyValueVos;
    }

    public void removeSkuPropertyValueById(Long id)
    {
        this.skuPropertyMapper.deleteSkuPropertyValueById(id);
    }

    public  void addSkuPropertyValue(Long skuPropertyId,String propertyValue)
    {
        this.skuPropertyMapper.insertSkuPropertyValue(skuPropertyId,propertyValue);
    }
}
