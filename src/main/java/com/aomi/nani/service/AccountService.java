package com.aomi.nani.service;

import com.aomi.nani.mapper.AccountMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.aomi.nani.model.domain.Account;

@Service
public class AccountService {
    @Autowired
    private AccountMapper accountMapper;

    public Account findByUserNameAndPassword(String username, String password) {
        return this.accountMapper.SelectAccountByUsernameAndPassword(username, password);
    }


}
