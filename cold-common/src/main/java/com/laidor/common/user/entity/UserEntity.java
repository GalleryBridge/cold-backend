package com.laidor.common.user.entity;

import com.laidor.common.constant.TConstants;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import java.util.Date;

@Data
@TableName(TConstants.T_USER_NAME)
public class UserEntity {

  @TableId
  private long userId;

  @NotBlank(message = "用户名不能为空")
  private String username;

  @NotBlank(message = "密码不能为空")
  private String password;

  private String salt;
  private String email;
  private String mobile;
  private long status;
  private long createUserId;
  private Date createTime;


}
