package com.laidor.admin.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.laidor.admin.service.CompanyService;
import com.laidor.common.admin.dao.CompanyDao;
import com.laidor.common.admin.entity.CompanyEntity;
import com.laidor.common.utils.PageUtils;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service("companyService")
public class CompanyServiceImpl extends ServiceImpl<CompanyDao, CompanyEntity> implements CompanyService {
    /**
     * 分页查询
     *
     * @param params 参数
     * @return PageUtils
     */
    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        int current = params.get("page") == null ? 1 : Integer.valueOf(params.get("page").toString());
        int size = params.get("pagesize") == null ? 10 : Integer.valueOf(params.get("pagesize").toString());

        String company = params.get("company") == null ? "" : params.get("company").toString();

        Page<CompanyEntity> page = new Page<>();
        QueryWrapper<CompanyEntity> wrapper = new QueryWrapper<>();
        wrapper.lambda().like(CompanyEntity::getCompany, company)
                .orderByAsc(CompanyEntity::getCreatedTime);

        IPage<CompanyEntity> result = this.page(page, wrapper);

        return new PageUtils(result);
    }
}
