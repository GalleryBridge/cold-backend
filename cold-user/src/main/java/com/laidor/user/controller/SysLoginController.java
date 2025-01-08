package com.laidor.user.controller;

import com.laidor.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * @Author: Laidor
 * @Description:
 * @Date:2025/1/8 上午 09:12
 */
@RestController
@RequestMapping("/sys/user")
public class SysLoginController {

    @Resource
    private UserService userService;

//    @Autowired
//    private UserTokenService


}
