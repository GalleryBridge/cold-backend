package cn.laidor.common.admin.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import cn.laidor.common.admin.entity.CompanyEntity;
import org.apache.ibatis.annotations.Mapper;

/**
 * @author xiongzhigang
 * @date 2021-01-27 14:42
 * @description
 */
@Mapper
public interface CompanyDao extends BaseMapper<CompanyEntity> {
}
