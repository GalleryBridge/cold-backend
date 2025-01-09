package com.laidor.admin.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.laidor.common.admin.entity.CompanyEntity;
import com.laidor.common.utils.PageUtils;

import java.util.Map;

/**
 * @Author: Laidor
 * @Description:
 * @Date:2025/1/8 下午 01:58
 */
public interface CompanyService extends IService<CompanyEntity> {
    /**
     * 分页查询
     *
     * @param params 参数
     * @return PageUtils
     */
    public PageUtils queryPage(Map<String, Object> params);
}
