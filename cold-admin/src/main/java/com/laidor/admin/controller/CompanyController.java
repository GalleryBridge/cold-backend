package com.laidor.admin.controller;

import com.laidor.admin.service.CompanyService;
import com.laidor.common.admin.entity.CompanyEntity;
import com.laidor.common.utils.MD5Util;
import com.laidor.common.utils.PageUtils;
import com.laidor.common.utils.ResultResp;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.Map;

/**
 * @Author: Laidor
 * @Description:
 * @Date:2025/1/8 下午 02:03
 */

@RestController
@RequestMapping("admin/company")
public class CompanyController {

    @Resource
    private CompanyService companyService;

    @RequestMapping("list")
    public ResultResp list(@RequestParam Map<String, Object> params) {
        PageUtils res = companyService.queryPage(params);
        return ResultResp.success(res);
    }

    @RequestMapping("info/{id}")
    public ResultResp info(@PathVariable("id") String id) {
        CompanyEntity companyEntity = companyService.getById(id);
        return ResultResp.success(companyEntity);
    }

    @RequestMapping("save")
    public ResultResp save(@RequestBody CompanyEntity companyEntity) {
        companyEntity.setId(MD5Util.enCodeByMd5(companyEntity.toString()));
        companyService.save(companyEntity);
        return ResultResp.success("新增成功！");
    }

    @RequestMapping("update")
    public ResultResp update(@RequestBody CompanyEntity companyEntity) {
        companyService.updateById(companyEntity);
        return ResultResp.success("更新成功！");
    }

    @RequestMapping("delete")
    public ResultResp delete(String id) {
        companyService.removeById(id);
        return ResultResp.success("删除成功！");
    }

}
