package com.aomi.nani.service;

import com.aomi.nani.mapper.PictureMapper;
import com.aomi.nani.model.domain.Picture;
import com.aomi.nani.model.domain.PictureType;
import com.aomi.nani.model.vo.PictureVo;
import com.aomi.nani.model.vo.PagerVo;
import com.aomi.nani.model.vo.PictureTypeVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Service
public class PictureService {

    @Autowired
    private PictureMapper pictureMapper;

    public PagerVo<PictureVo> findPictureVosByKeyword(String keyword, long pictureTypeId, int pageIndex, int pageSize) {

        List<PictureVo> folderVos = new ArrayList<>();

        List<Picture> pictures = this.pictureMapper.selectPictureByLimitAndSkip(keyword, pictureTypeId, pageSize * (pageIndex - 1), pageSize);

        if (pictures != null && pictures.size() > 0) {

            for (Picture picture : pictures) {

                PictureVo folderVo = new PictureVo();

                folderVo.setId(picture.getId());
                folderVo.setDirName(picture.getDirName());
                folderVo.setPictureTypeId(picture.getPictureTypeId());
                folderVo.setUrl(picture.getUrl());
                folderVo.setLastUpdateTime(picture.getLastUpdateTime().toLocalDateTime());

                folderVos.add(folderVo);
            }
        }

        int sumCount = this.pictureMapper.selectPictureCountByLimitAndSkip(keyword, pictureTypeId);

        return new PagerVo<>(folderVos, pageIndex, pageSize, sumCount);
    }

    public void AddPictureVo(String fileName, String url, Long pictureTypeId) {
        Picture picture = new Picture();

        picture.setDirName(fileName);
        picture.setUrl(url);
        picture.setPictureTypeId(pictureTypeId);
        picture.setCreateTime(Timestamp.valueOf(LocalDateTime.now()));
        picture.setLastUpdateTime(Timestamp.valueOf(LocalDateTime.now()));

        this.pictureMapper.insertPicture(picture);

    }

    public  void AddPictureTypeVo(String typeName)
    {
        this.pictureMapper.insertPictureType(typeName);
    }

    public List<PictureTypeVo> findPictureTypes() {

        List<PictureTypeVo> pictureTypeVos = new ArrayList<>();
        List<PictureType> pictureTypes = this.pictureMapper.selectPictureTypes();

        if (pictureTypes != null && pictureTypes.size() > 0) {
            for (PictureType pt : pictureTypes) {
                PictureTypeVo ptv = new PictureTypeVo();

                ptv.setId(pt.getId());
                ptv.setTypeName(pt.getTypeName());

                pictureTypeVos.add(ptv);
            }
        }

        return pictureTypeVos;
    }
}
