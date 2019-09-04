package com.artfactory.project01.todayart.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
public class EmailVerifyModel {
    private String type;
    private String email;
}
