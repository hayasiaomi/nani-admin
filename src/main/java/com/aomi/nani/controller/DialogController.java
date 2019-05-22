package com.aomi.nani.controller;

import com.aomi.nani.model.vo.PictureVo;
import com.aomi.nani.model.vo.PagerVo;
import com.aomi.nani.model.vo.PictureTypeVo;
import com.aomi.nani.service.PictureService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@RequestMapping("/dialog")
@Controller
public class DialogController {

    @Autowired
    private PictureService pictureService;

    @GetMapping("/images")
    public String images(@RequestParam(value = "target", defaultValue = "imageCallBack", required = false) String target,
                         @RequestParam(value = "keyword", defaultValue = "", required = false) String keyword,
                         @RequestParam(value = "pictureTypeId", defaultValue = "-1", required = false) int pictureTypeId,
                         @RequestParam(value = "pageIndex", defaultValue = "1", required = false) int pageIndex,
                         @RequestParam(value = "pageSize", defaultValue = "8", required = false) int pageSize, Model model) {

        PagerVo<PictureVo> pagerVo = pictureService.findPictureVosByKeyword(keyword,pictureTypeId, pageIndex, pageSize);

        List<PictureTypeVo> pictureTypeVos =  this.pictureService.findPictureTypes();

        model.addAttribute("imageLocation", target);
        model.addAttribute("pagerVo", pagerVo);
        model.addAttribute("pictureTypeId",pictureTypeId);
        model.addAttribute("pictureTypeVos",pictureTypeVos);
        model.addAttribute("keyword",keyword);
        return "dialogs/images";
    }

}
