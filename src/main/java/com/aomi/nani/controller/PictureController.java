package com.aomi.nani.controller;

import com.aomi.nani.model.enums.ResultCodeEnum;
import com.aomi.nani.model.vo.JsonResultVo;
import com.aomi.nani.service.PictureService;
import com.aomi.nani.service.LocaleMessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;

@RequestMapping("/picture")
@RestController
public class PictureController {
    @Autowired
    private LocaleMessageService localeMessageService;

    @Autowired
    private PictureService pictureService;

    @PostMapping("/upload")
    public JsonResultVo upload(@RequestParam("file[]") MultipartFile mfile, @RequestParam("pictureTypeId") Long pictureTypeId, HttpServletRequest request) {

        try {
            String path = request.getSession().getServletContext().getRealPath("pictures");
            System.out.println(path);
            String fileName = mfile.getOriginalFilename();
            File targetDir = new File(path);
            File targetFile = new File(path, fileName);

            if (!targetDir.exists()) {
                targetDir.mkdir();
            }

            if (!targetFile.exists()) {
                targetFile.createNewFile();
            }

            mfile.transferTo(targetFile);

            this.pictureService.AddPictureVo(fileName, targetFile.getAbsolutePath(), pictureTypeId);

        } catch (Exception e) {
            e.printStackTrace();

            return new JsonResultVo(ResultCodeEnum.FAIL.getCode(), "上传失败");
        }

        return new JsonResultVo(ResultCodeEnum.SUCCESS.getCode(), "上传成功");
    }

    @PostMapping("/dir/create")
    public JsonResultVo dirCreate(@RequestParam("typeName") String typeName) {

        if(typeName == null || typeName == "")
        {
            return new JsonResultVo(ResultCodeEnum.FAIL.getCode(), "创建失败");
        }

        this.pictureService.AddPictureTypeVo(typeName);

        return new JsonResultVo(ResultCodeEnum.SUCCESS.getCode(), "创建成功");
    }
}
