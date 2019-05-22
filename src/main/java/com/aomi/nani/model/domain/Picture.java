package com.aomi.nani.model.domain;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class Picture {
    public Long id;
    private String dirName;
    private Long pictureTypeId;
    private String url;
    private Timestamp lastUpdateTime;
    private Timestamp createTime;
}
