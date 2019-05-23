package com.aomi.nani.controller;

import com.aomi.nani.model.vo.PagerVo;
import com.aomi.nani.model.vo.SkuPropertyValueVo;
import com.aomi.nani.model.vo.SkuPropertyVo;
import com.aomi.nani.service.SkuPropertyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@RequestMapping("/sku")
@Controller
public class SkuController {

    @Autowired
    private SkuPropertyService skuPropertyService;

    @GetMapping(value = {"", "index"})
    public String index(@RequestParam(value = "keyword", required = false) String keyword,
                        @RequestParam(value = "pageIndex", required = false, defaultValue = "1") int pageIndex,
                        @RequestParam(value = "pageSize", required = false, defaultValue = "10") int pageSize, Model model) {

        PagerVo<SkuPropertyVo> pagerVo = this.skuPropertyService.findSkuPropertyByKeyword(keyword, pageIndex, pageSize);

        model.addAttribute("pagerVo", pagerVo);
        model.addAttribute("keyword", keyword);

        return "sku/home";
    }

    @GetMapping("/addSkuProperty")
    public String addSkuProperty() {
        return "sku/add";
    }

    @GetMapping("/editSkuProperty")
    public String addSkuProperty(@RequestParam("id") Long id, Model model) {
        SkuPropertyVo skuPropertyVo = this.skuPropertyService.getSkuPropertyVoById(id);

        model.addAttribute("skuPropertyVo", skuPropertyVo);

        return "sku/edit";
    }

    @PostMapping("/edit")
    public String edit(SkuPropertyVo skuPropertyVo) {
        this.skuPropertyService.editSkuPropertyVo(skuPropertyVo);

        return "redirect:/sku";
    }


    @PostMapping("/add")
    public String add(SkuPropertyVo skuPropertyVo) {
        this.skuPropertyService.AddSkuPropertyVo(skuPropertyVo);

        return "redirect:/sku";
    }

    @GetMapping("/delete")
    public String delete(@RequestParam("id") Long id) {
        this.skuPropertyService.removeSkuPropertyVo(id);
        return "redirect:/sku";
    }


    @GetMapping("/valueManager")
    public String valueManager(@RequestParam("id") Long id, Model model) {
        SkuPropertyVo skuPropertyVo = this.skuPropertyService.getSkuPropertyVoById(id);

        List<SkuPropertyValueVo> skuPropertyValueVos = this.skuPropertyService.findSkuPropertyValueBySkuPropertyId(id);

        model.addAttribute("skuPropertyVo", skuPropertyVo);
        model.addAttribute("skuPropertyValueVos", skuPropertyValueVos);


        return "sku/value";
    }

    @PostMapping("/value/add")
    public String addValue(@RequestParam("skuPropertyId") Long skuPropertyId, @RequestParam("propertyValue") String propertyValue) {
        this.skuPropertyService.addSkuPropertyValue(skuPropertyId, propertyValue);
        return "redirect:/sku/valueManager?id=" + skuPropertyId;
    }

    @GetMapping("/value/delete")
    public String deleteValue(@RequestParam("id") Long id,@RequestParam("skuPropertyId") Long skuPropertyId) {
        this.skuPropertyService.removeSkuPropertyValueById(id);
        return "redirect:/sku/valueManager?id=" + skuPropertyId;
    }


}

