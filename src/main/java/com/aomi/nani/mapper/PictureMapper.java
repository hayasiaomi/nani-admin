package com.aomi.nani.mapper;

import com.aomi.nani.model.domain.Picture;
import com.aomi.nani.model.domain.PictureType;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

@Mapper
@Component
public interface PictureMapper {

    void insertPicture(Picture picture);

    List<Picture> selectPictureByLimitAndSkip(@Param("keyword") String keyword, @Param("pictureTypeId") Long pictureTypeId, @Param("limit") Integer limit, @Param("skip") Integer skip);

    Integer selectPictureCountByLimitAndSkip(@Param("keyword") String keyword, @Param("pictureTypeId") Long pictureTypeId);

    List<PictureType> selectPictureTypes();

    void insertPictureType(String typeName);
}
