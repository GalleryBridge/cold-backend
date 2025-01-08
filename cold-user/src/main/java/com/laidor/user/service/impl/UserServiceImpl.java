package com.laidor.user.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.laidor.common.user.dao.UserDao;
import com.laidor.common.user.entity.UserEntity;
import com.laidor.user.service.UserService;
import org.springframework.stereotype.Service;

/**
 * @Author: Laidor
 * @Description:
 * @Date:2025/1/8 上午 09:22
 */
@Service("UserService")
public class UserServiceImpl extends ServiceImpl<UserDao, UserEntity> implements UserService {

    /**
     * 根据用户名查询用户
     *
     * @param username
     * @return
     * @throws Exception
     */
    @Override
    public UserEntity getUserByName(String username) throws Exception {
        return baseMapper.queryByUserName(username);
    }
}