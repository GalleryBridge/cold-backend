package com.laidor.common.user.entity;

import com.laidor.common.constant.TConstants;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.util.Date;

@Data
@TableName(TConstants.T_USER_TOKEN_NAME)
public class UserTokenEntity {

  @TableId(type = IdType.INPUT)
  private long userId;
  private String token;
  private Date expireTime;
  private Date updateTime;

}
