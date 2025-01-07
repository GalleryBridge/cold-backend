package cn.laidor.common.job.dao;

import cn.laidor.common.job.entity.ScheduleJobEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

import java.util.Map;

/**
 * @author xiongzhigang
 * @date 2021-01-26 11:17
 * @description
 */
@Mapper
public interface ScheduleJobDao extends BaseMapper<ScheduleJobEntity> {
    /**
     * 批量更新
     *
     * @param map
     */
    public void updateBatch(Map<String, Object> map);
}
