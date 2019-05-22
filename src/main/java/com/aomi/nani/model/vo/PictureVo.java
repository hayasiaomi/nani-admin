package com.aomi.nani.model.vo;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class PictureVo {
    public Long id;
    private String dirName;
    private Long pictureTypeId;
    private String url;
    private Long folderId;
    private LocalDateTime lastUpdateTime;
}
