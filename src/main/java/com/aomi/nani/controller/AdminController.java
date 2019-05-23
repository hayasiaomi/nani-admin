package com.aomi.nani.controller;

import com.aomi.nani.model.NaniConstants;
import com.aomi.nani.model.domain.Account;
import com.aomi.nani.model.enums.ResultCodeEnum;
import com.aomi.nani.model.vo.JsonResultVo;
import com.aomi.nani.service.AccountService;
import com.aomi.nani.service.LocaleMessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@RequestMapping("/admin")
@Controller
public class AdminController {

    @Autowired
    private AccountService accountService;
    @Autowired
    private LocaleMessageService localeMessageService;

    @GetMapping(value = {"", "/index"})
    public String index(Model model) {

        return "admin/main";
    }

    @GetMapping("test")
    public String test() {
        return "test";
    }



    @GetMapping("/login")
    public String login(HttpSession session)
    {
        final Account account = (Account) session.getAttribute(NaniConstants.ACCOUNT_SESSION_KEY);
        //如果session存在，跳转到后台首页
        if (null != account) {
            return "redirect:/admin";
        }
        return "admin/login";
    }

    @PostMapping("/auth")
    @ResponseBody
    public JsonResultVo auth(@ModelAttribute("username") String username,
                       @ModelAttribute("password") String password,
                       HttpSession session)
    {
        Account account = this.accountService.findByUserNameAndPassword(username,password);

        if(account != null)
        {
            session.setAttribute(NaniConstants.ACCOUNT_SESSION_KEY, account);

            return new JsonResultVo(ResultCodeEnum.SUCCESS.getCode(), this.localeMessageService.getMessage("code.admin.login.success"));
        }

        return new JsonResultVo(ResultCodeEnum.FAIL.getCode(), this.localeMessageService.getMessage("code.admin.login.failed"));
    }
}
