package com.laidor.user.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.laidor.common.user.entity.UserTokenEntity;
import com.laidor.common.utils.ResultResp;

/**
 * @Author: Laidor
 * @Description:
 * @Date:2025/1/8 上午 09:26
 */
public interface UserTokenService extends IService<UserTokenEntity> {

    /**
     * 创建token
     *
     * @param userId
     * @return
     * @throws Exception
     */
    public ResultResp createToken(long userId) throws Exception;

    /**
     * 登出
     *
     * @param token
     * @throws Exception
     */
    public void logout(String token) throws Exception;

    /**
     * 根据token查询
     *
     * @param token
     * @return
     * @throws Exception
     */
    public UserTokenEntity getToken(String token) throws Exception;
}
