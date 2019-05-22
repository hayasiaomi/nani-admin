package com.aomi.nani.model.vo;

import lombok.Data;

@Data
public class JsonResultVo {
    /**
     * 返回的状态码 (Same as HttpStatus.value()).
     */
    private Integer code;

    /**
     * 返回信息
     */
    private String msg;

    /**
     * Dev message.(only setting in dev environment)
     */
    private String devMsg;

    /**
     * 返回的数据
     */
    private Object result;

    public JsonResultVo() {
    }

    /**
     * 只返回状态码
     *
     * @param code 状态码
     */
    public JsonResultVo(Integer code) {
        this.code = code;
    }

    /**
     * 不返回数据的构造方法
     *
     * @param code 状态码
     * @param msg  信息
     */
    public JsonResultVo(Integer code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    /**
     * 返回数据的构造方法
     *
     * @param code   状态码
     * @param msg    信息
     * @param result 数据
     */
    public JsonResultVo(Integer code, String msg, Object result) {
        this.code = code;
        this.msg = msg;
        this.result = result;
    }

    /**
     * 返回状态码和数据
     *
     * @param code   状态码
     * @param result 数据
     */
    public JsonResultVo(Integer code, Object result) {
        this.code = code;
        this.result = result;
    }

    public JsonResultVo(Integer code, String msg, String devMsg, Object result) {
        this.code = code;
        this.msg = msg;
        this.devMsg = devMsg;
        this.result = result;
    }
}
