package com.aomi.nani.controller;

import com.aomi.nani.model.vo.PagerVo;
import com.aomi.nani.model.vo.ProductCategoryVo;
import com.aomi.nani.model.vo.ProductVo;
import com.aomi.nani.service.ProductCategorySevice;
import com.aomi.nani.service.ProductService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Slf4j
@RequestMapping("/product")
@Controller
public class ProductController {

    @Autowired
    private ProductCategorySevice productCategorySevice;

    @Autowired
    private ProductService productService;

    @GetMapping(value = {"", "/index"})
    public String index(@RequestParam(value = "keyword", required = false) String keyword,
                        @RequestParam(value = "pageIndex", required = false, defaultValue = "1") int pageIndex,
                        @RequestParam(value = "pageSize", required = false, defaultValue = "10") int pageSize, Model model) {

      PagerVo<ProductVo> pagerVo = this.productService.findProductsByKeyword(keyword, pageIndex, pageSize);

        model.addAttribute("pagerVo", pagerVo);
        model.addAttribute("keyword",keyword);

        return "product/home";
    }

    @GetMapping("/addProduct")
    public String addProduct(Model model) {

        List<ProductCategoryVo> productCategoryVos =  this.productCategorySevice.findProductCategoriesByParentId(-1l);

        model.addAttribute("productCategoryVos",productCategoryVos);

        return "product/add";
    }

    @PostMapping("/add")
    public String add(ProductVo productVo) {

        this.productService.AddProductVo(productVo);

        return "redirect:/product";
    }


}
