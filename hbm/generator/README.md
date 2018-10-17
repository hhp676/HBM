代码生成器说明
=============
### 作用
代码生成器从数据库中获取表结构信息，生成对应的代码和配置文件：
1.   entity:  实体类
2.   dao:     Dao类
3.   mapper:  mybatis Mapper类
4.   service: Service类
5.   sqlmap:  mybatis sqlmap配置xml
### 相关配置页面
![配置页面](https://cl.ly/3l2V2322353O)

代码生成器首页，可设置数据库连接，生成代码包路径，文件位置等的配置信息。

设置完成后，点击`下一步（选表）`

### 选择要生成的表

![选择表](https://cl.ly/2X062Q3d211s)

从配置页面点击确定，可以进入表选择页面，在此处可以：
* 选择单个，多个或所有要生成代码的表。
* 设置某个表的别名，模块，表类型。
* 设置完成后，点击`生成`。

### 生成成功
![生成成功](https://cl.ly/3Q3O3c0o0w11)

### 生成代码说明
####相关概念
1. 实体表与关系表
   
    实体表对应业务实体表，如sys_account, sys_user。实体表生成的entity继承自BizEntity;
    
    关系表对应记录业务表关系信息的表，如sys_user_role。关系表生成的entity继承自RelEntity。
    
    <s>实体表和关系表默认通过是否包含联合主键来区分。</s>
    
    实体表和关系表默认通过是否可逻辑删除，即表中是否包含字段“IS_DELETE_”来区分的。
    
    实体表中应包含以下字段：
    - IS_DELETE_
    - IS_FINAL_
    - CRT_USER_ID_
    - UPD_USER_ID_
    - CRT_TIME_
    - UPD_TIME_
    
    关系表中应包含以下字段：
    - IS_FINAL_
    - CRT_USER_ID_
    - CRT_TIME_
    
####entity
* entity类根据对应表是否为`实体表`，确定其基类，规则规则可参考概念说明`实体表与关系表`。
* entity类根据对应表的字段，生成对应的属性（包含getter, setter方法），并设置相应的Hibernate注解。
* entity类根据对应表的外键信息，生成相关外键表的entity属性，如SysUserRole实体中：
   
        private SysUser sysUser;
  对应属性的变量名生成规则如下：
    + 如果主表主键名与外表的外键名称相同，取主表的firstLowerClassName;
    + 2.如果外键的名称为FID_,关联字段名为parent;
    + 3.从外键名称中去掉主键名称转换成lowerCamel，再加主表的ClassName。
* entity类根据对应表的字段，生成合适的toString方法。

####sqlmap
* 根据对应表是否有外键，确定`getList`，`getById`使用`resultType`或是`resultMap`。

  resultMap中包含外键实体设置信息，如：
      
      <association property="sysRole" column="roleId" select="com.hginfo.hbm.be.mapper.sys.SysRoleMapper.getById" />
  外键实体的加载方式默认为延迟加载。
    