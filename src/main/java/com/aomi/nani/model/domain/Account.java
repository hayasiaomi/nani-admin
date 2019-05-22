package com.aomi.nani.model.domain;

import lombok.Data;

@Data
public class Account  {
    private long Id;
    private String username;
    private String password;
    private int sex;
    private boolean enabled;
}
