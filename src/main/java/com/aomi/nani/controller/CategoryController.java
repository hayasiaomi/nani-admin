package com.aomi.nani.controller;

import com.aomi.nani.model.enums.ResultCodeEnum;
import com.aomi.nani.model.vo.JsonResultVo;
import com.aomi.nani.model.vo.ProductCategoryVo;
import com.aomi.nani.service.ProductCategorySevice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RequestMapping("/category")
@Controller
public class CategoryController {

    @Autowired
    private ProductCategorySevice productCategorySevice;

    @GetMapping(value = {"", "/index"})
    public String home(Model model) {

        List<ProductCategoryVo> productCategoryVos = this.productCategorySevice.findProductCategoryVos();

        model.addAttribute("productCategoryVos", productCategoryVos);

        return "category/home";
    }

    @GetMapping("/addCategory")
    public String addCategory(@RequestParam(value = "parentId", defaultValue = "-1", required = false) Long parentId, Model model) {

        ProductCategoryVo productCategoryVo = this.productCategorySevice.getProductCategoryVoById(parentId);

        if (productCategoryVo == null) {
            model.addAttribute("parentId", -1);
            model.addAttribute("parentName", "无");
        } else {
            model.addAttribute("parentId", productCategoryVo.getId());
            model.addAttribute("parentName", productCategoryVo.getCategoryName());
        }

        return "category/add";
    }

    @PostMapping("/add")
    public String add(@RequestParam(value = "parentId", defaultValue = "-1", required = false) Long parentId,
                      @RequestParam(value = "categoryName", defaultValue = "-1", required = false) String categoryName,
                      @RequestParam(value = "description", defaultValue = "-1", required = false) String description) {

        this.productCategorySevice.addProductCategoryVo(categoryName, description, parentId);

        return "redirect:/category";
    }

    @GetMapping("/editCategory")
    public String editCategory(@RequestParam("id") Long id, Model model) {
        ProductCategoryVo productCategoryVo = this.productCategorySevice.getProductCategoryVoById(id);

        ProductCategoryVo parentProductCategoryVo = null;

        if (productCategoryVo.getParentId() != -1) {
            parentProductCategoryVo = this.productCategorySevice.getProductCategoryVoById(productCategoryVo.getParentId());
        }

        if (parentProductCategoryVo == null) {
            model.addAttribute("parentId", -1);
            model.addAttribute("parentName", "无");
        } else {
            model.addAttribute("parentId", productCategoryVo.getId());
            model.addAttribute("parentName", productCategoryVo.getCategoryName());
        }

        model.addAttribute("categoryName", productCategoryVo.getCategoryName());
        model.addAttribute("description", productCategoryVo.getDescription());
        model.addAttribute("id",id);

        return "category/edit";

    }

    @PostMapping("/edit")
    public String edit(
            @RequestParam("id") Long id,
            @RequestParam(value = "categoryName", defaultValue = "-1", required = false) String categoryName,
            @RequestParam(value = "description", defaultValue = "-1", required = false) String description) {

        this.productCategorySevice.editProductCategoryVo(id, categoryName, description);

        return "redirect:/category";
    }

    @GetMapping("/delete")
    public String delete(@RequestParam("id") Long id) {

        this.productCategorySevice.RemoveProductCategoryVo(id);

        return "redirect:/category";
    }

    @GetMapping("/children")
    @ResponseBody
    public JsonResultVo children(@RequestParam("parentId") Long parentId)
    {
        JsonResultVo jsonResultVo = new JsonResultVo();

        try
        {
            List<ProductCategoryVo> children = this.productCategorySevice.findProductCategoriesByParentId(parentId);

            jsonResultVo.setResult(children);

            jsonResultVo.setCode(ResultCodeEnum.SUCCESS.getCode());
        }
        catch (Exception ex)
        {
            jsonResultVo.setMsg(ex.getMessage());
            jsonResultVo.setCode(ResultCodeEnum.FAIL.getCode());
        }


        return jsonResultVo;
    }

}
