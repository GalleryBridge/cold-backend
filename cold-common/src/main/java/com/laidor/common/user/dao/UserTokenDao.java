package com.laidor.common.user.dao;

import com.laidor.common.user.entity.UserTokenEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserTokenDao extends BaseMapper<UserTokenEntity> {

    /**
     * 根据token查询
     *
     * @param token
     * @return
     * @throws Exception
     */
    public UserTokenEntity queryByToken(String token) throws Exception;

    /**
     * 删除token
     *
     * @param token
     * @throws Exception
     */
    public void deleteByToken(String token) throws Exception;
}
