package com.laidor.admin.controller;

import com.laidor.admin.service.WareHouseService;
import com.laidor.common.admin.entity.WareHouseEntity;
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
@RequestMapping("admin/warehouse")
public class WareHouseController {
    @Resource
    private WareHouseService wareHouseService;

    @RequestMapping("list")
    public ResultResp list(@RequestParam Map<String, Object> params) {
        PageUtils res = wareHouseService.queryPage(params);
        return ResultResp.success(res);
    }

    @RequestMapping("info/{id}")
    public ResultResp info(@PathVariable("id") String id) {
        WareHouseEntity warehouseEntity = wareHouseService.getById(id);
        return ResultResp.success(warehouseEntity);
    }

    @RequestMapping("save")
    public ResultResp save(@RequestBody WareHouseEntity warehouseEntity) {
        warehouseEntity.setId(MD5Util.enCodeByMd5(warehouseEntity.toString()));
        wareHouseService.save(warehouseEntity);
        return ResultResp.success("保存成功！");
    }

    @RequestMapping("update")
    public ResultResp update(@RequestBody WareHouseEntity warehouseEntity) {
        wareHouseService.updateById(warehouseEntity);
        return ResultResp.success("更新成功！");
    }

    @RequestMapping("delete")
    public ResultResp delete(String id) {
        wareHouseService.removeById(id);
        return ResultResp.success("删除成功！");
    }

}
