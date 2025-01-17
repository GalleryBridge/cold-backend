package com.laidor.common.user.dao;

import com.laidor.common.user.entity.UserEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserDao extends BaseMapper<UserEntity> {
    /**
     * 根据用户名查询用户
     *
     * @param username
     * @return
     * @throws Exception
     */
    public UserEntity queryByUserName(String username) throws Exception;
}
