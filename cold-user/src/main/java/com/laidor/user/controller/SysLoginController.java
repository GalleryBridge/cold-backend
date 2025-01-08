package com.laidor.user.controller;

import com.laidor.common.user.entity.UserEntity;
import com.laidor.common.user.entity.UserTokenEntity;
import com.laidor.common.user.entity.UserVo;
import com.laidor.common.utils.ResultResp;
import com.laidor.user.service.UserService;
import com.laidor.user.service.UserTokenService;
import org.apache.http.HttpStatus;
import org.apache.shiro.crypto.hash.Sha256Hash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

/**
 * @Author: Laidor
 * @Description:
 * @Date:2025/1/8 上午 09:12
 */
@RestController
@RequestMapping("sys/user")
public class SysLoginController {

    @Autowired
    private UserService userService;

    @Autowired
    private UserTokenService userTokenService;

    @PostMapping("login")
    public ResultResp login (@RequestBody UserVo userVo) throws Exception {
        UserEntity userEntity = userService.getUserByName(userVo.getUsername());

        if (userEntity == null || ! userEntity.getPassword().equals(new Sha256Hash(userVo.getPassword(), userEntity.getSalt()).toHex())) {
            return new ResultResp(HttpStatus.SC_FORBIDDEN, "用户名或密码错误");
        }

        return userTokenService.createToken(userEntity.getUserId());
    }

    @PostMapping("getToken")
    public UserTokenEntity getToken(@RequestHeader( value = "token") String token) throws Exception{
        return userTokenService.getToken(token);
    }

    @PostMapping("logout")
    public ResultResp logout(@RequestHeader( value = "token") String token) throws Exception {
        userTokenService.logout(token);
        return ResultResp.success("登出成功");
    }

    @GetMapping("info")
    public ResultResp info() throws Exception{
        UserEntity user = userService.getUserByName("admin");
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("name", user.getUsername());
        map.put("company", "月迹");
        map.put("phone", "");
        map.put("avatar", "");
        map.put("username", user.getUsername());
        map.put("logintime", "");
        return ResultResp.success(map);
    }

}
