package com.aomi.nani;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@EnableTransactionManagement
@SpringBootApplication
@MapperScan("com.aomi.nani.mapper")
public class NaniAdminApplication {

    public static void main(String[] args) {
        SpringApplication.run(NaniAdminApplication.class, args);
    }

}
