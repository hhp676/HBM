package com.hginfo.hbm.base;

import javax.persistence.Transient;

/**
 * Created by qiujingde on 2017/2/14.<br />
 * 单主键实体基类。
 * @author qiujingde
 */
public abstract class SingleKeyBaseEntity extends BaseEntity {
    private static final long serialVersionUID = 238479417719639863L;

    /**
     * 虚拟主键。
     * id属性对应实体的主键，是为统一处理方便而添加，可参考以下示例实现：<br />
     *          <code>@Override</code>                              <br />
     *          public Long getId() {                   <br />
     *              return getUserId();                 <br />
     *          }                                       <br />
     *                                                  <br />
     *           <code>@Override</code>                            <br />
     *           public void setId(Long id) {           <br />
     *              setUserId(id);                      <br />
     *           }                                      <br />
     * 以上代码来自{@link com.hginfo.hbm.base.entity.sys.SysUser} <br />
     * 此时，类中有两个属性id，userId作为主键，他们的作用是等价的。<br />
     *
     * @since 3.0.0-SNAPSHOT
     * @return id
     */
    @Transient
    public abstract Long getId();

    /**
     * 设置主键。
     * @param id 主键值
     */
    public abstract void setId(Long id);

}
