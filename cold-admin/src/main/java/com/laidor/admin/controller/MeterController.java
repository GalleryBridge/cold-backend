package com.laidor.admin.controller;

import com.laidor.admin.service.MeterService;
import com.laidor.common.admin.entity.MeterEntity;
import com.laidor.common.utils.*;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.Map;

/**
 * @Author: Laidor
 * @Description:
 * @Date:2025/1/8 下午 02:03
 */
@RestController
@RequestMapping("admin/meter")
public class MeterController {
    @Resource
    private MeterService meterService;

    @RequestMapping("list")
    public ResultResp list(@RequestParam Map<String, Object> params) {
        PageUtils res = meterService.queryPage(params);
        return ResultResp.success(res);
    }

    @RequestMapping("info/{id}")
    public ResultResp info(@PathVariable("id") String id) {
        MeterEntity meterEntity = meterService.getById(id);
        return ResultResp.success(meterEntity);
    }

    @RequestMapping("save")
    public ResultResp save(@RequestBody MeterEntity meterEntity) {
        meterEntity.setId(MD5Util.enCodeByMd5(meterEntity.toString()));
        meterService.save(meterEntity);

        JedisUtil.Strings strings = JedisUtil.getInstance().new Strings();
        strings.set(meterEntity.getMeterCode(), SerializeUtil.serialize(meterEntity));
        return ResultResp.success("保存成功！");
    }

    @RequestMapping("update")
    public ResultResp update(@RequestBody MeterEntity meterEntity) {
        meterService.updateById(meterEntity);

        JedisUtil.Strings strings = JedisUtil.getInstance().new Strings();
        strings.set(meterEntity.getMeterCode(), SerializeUtil.serialize(meterEntity));
        return ResultResp.success("更新成功！");
    }

    @RequestMapping("delete")
    public ResultResp delete(String id) {
        meterService.removeById(id);

        JedisUtil.getInstance().getJedis().del(meterService.getById(id).getMeterCode());
        return ResultResp.success("删除成功！");
    }
}
