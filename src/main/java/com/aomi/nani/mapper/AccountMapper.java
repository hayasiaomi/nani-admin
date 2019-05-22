package com.aomi.nani.mapper;

import com.aomi.nani.model.domain.Account;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

@Mapper
@Component
public interface AccountMapper {

    Account SelectAccountByUsernameAndPassword(@Param("UserName") String username, @Param("Password") String password);
}
