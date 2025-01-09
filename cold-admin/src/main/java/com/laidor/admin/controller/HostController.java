package com.laidor.admin.controller;

import com.laidor.admin.service.HostService;
import com.laidor.common.admin.entity.HostEntity;
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
@RequestMapping("admin/host")
public class HostController {
    @Resource
    private HostService hostService;

    @RequestMapping("list")
    public ResultResp list(@RequestParam Map<String, Object> params) {
        PageUtils res = hostService.queryPage(params);
        return ResultResp.success(res);
    }

    @RequestMapping("info/{id}")
    public ResultResp info(@PathVariable("id") String id) {
        HostEntity hostEntity = hostService.getById(id);
        return ResultResp.success(hostEntity);
    }

    @RequestMapping("save")
    public ResultResp save(@RequestBody HostEntity hostEntity) {
        hostEntity.setId(MD5Util.enCodeByMd5(hostEntity.toString()));
        hostService.save(hostEntity);
        return ResultResp.success("保存成功！");
    }


    @RequestMapping("update")
    public ResultResp update(@RequestBody HostEntity hostEntity) {
        hostService.updateById(hostEntity);
        return ResultResp.success("更新成功！");
    }


    @RequestMapping("delete")
    public ResultResp delete(String id) {
        hostService.removeById(id);
        return ResultResp.success("删除成功！");
    }

}
