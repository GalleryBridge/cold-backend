package com.laidor.admin.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.laidor.common.admin.entity.WareHouseEntity;
import com.laidor.common.utils.PageUtils;

import java.util.Map;

/**
 * @Author: Laidor
 * @Description:
 * @Date:2025/1/8 下午 01:58
 */
public interface WareHouseService extends IService<WareHouseEntity> {
    /**
     * 分页查询
     *
     * @param params 查询参数
     * @return PageUtils
     */
    PageUtils queryPage(Map<String, Object> params);
}