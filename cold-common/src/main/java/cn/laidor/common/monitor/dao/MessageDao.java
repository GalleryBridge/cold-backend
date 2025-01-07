package cn.laidor.common.monitor.dao;

import cn.laidor.common.monitor.entity.MessageEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * @author xiongzhigang
 * @date 2021-01-27 19:34
 * @description
 */
@Mapper
public interface MessageDao extends BaseMapper<MessageEntity> {
}
