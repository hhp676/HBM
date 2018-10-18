**[HBM-JOB](/hbm/job)**

## 系统介绍
------
HBM是HDF下的主要产品。HBM是基于spring等开源产品的一款JAVA WEB开发框架，目的是为了保障产品交付质量，提升系统稳定和安全，提高开发效率，降低开发成本。

------
## 系统特性
------
HBM开发框架主要基于spring、springmvc、myBatis、shiro、easyui、bootstrap等较新和稳定的开源产品，基于以上，我们又使用了最流行和成熟的开发技术做了一系列的整合、优化和改进。或许刚开始接触你会感到复杂，但是一旦你开始使用它，你会发现它比我们之前的框架更加成熟健壮和方便高效，使用它可以让你的业务开发更加轻松自如。HBM系统主要特性如下：

> * 一套代码，支持集中部署，同时主持DUBBO分布式部署；
> * 多前端支持，目前支持easyui、bootstrap、上海移动专用前端版本；
> * 支持分布式任务调度，并支持任务的监控、报警、在线管理；
> * 支持唯一约束的在线配置管理；
> * 多数据源、多数据源支持；
> * 访问权限控制更加严格有效；
> * 数据权限支持；
> * ehcache、redis缓存支持；
> * 多登录方式支持；
> * 前后端数据效验支持；
> * 防重复提交支持；
> * XSS、CSRF、会话和防注入等安全加强；
> * 统一的异常处理；
> * 灵活的日志记录和控制；
> * 本地化支持；
> * 系统监控支持；
> * websocket支持；
> * 内置图标库；

------

### HBM各子工程简介
> * BASE：该工程主要定义了实体和接口；
> * CORE：该工程主要定义公共核心包；
> * BE：该工程主要定义业务服务实现，包含Dao和接口实现等；
> * FE-CORE：该工程主要定义了前端公共核心包；
> * FE-EASYUI:该工程是easyui版的前端工程，主要包含控制层和静态资源等。
> * FE-BOOTSTRAP:该工程是bootstrap版的前端工程，主要包含控制层和静态资源等。
> * FE-SHMC:该工程是上海移动专用的前端工程，主要包含控制层和静态资源等。
> * GENERATOR：该工程是生成interface,dao,service、controller和JSP的代码生成器。
> * JOB：**[HBM-JOB](/hbm/job)**是一个分布式任务调度框架，基于开源框架XXL-JOB的1.7.1版本开发。

> > * JOB-CODE：HBM-JOB的公共依赖。
> > * JOB-ADMIN：HBM-JOB的调度中心。



------
## 系统架构
------
![image](http://cc.hongguaninfo.com/_hdp/gitlab_res/hbm/system_architecture.png)


------
## 功能架构
------
![image](http://cc.hongguaninfo.com/_hdp/gitlab_res/hbm/functional_architecture.png)


------
## HBM各个子工程依赖关系
------
![image](http://cc.hongguaninfo.com/_hdp/gitlab_res/hbm/dependency.jpg)


------
## 分层架构
------
![image](http://cc.hongguaninfo.com/_hdp/gitlab_res/hbm/level_relation.png)


------
## 部署架构
------
### 传统应用（单机部署）
![image](http://cc.hongguaninfo.com/_hdp/gitlab_res/hbm/deploy_single.png)

### 分布式服务
![image](http://cc.hongguaninfo.com/_hdp/gitlab_res/hbm/deploy_distributed.png)



### 主页

<http://cc.hongguaninfo.com/_hdf/>

### GIT

<http://git.hongguaninfo.com/hdp/hdf/>


### 仓库

*maven central repository*:
<http://repo.hongguaninfo.com/nexus/content/repositories/releases/com/hongguaninfo/> 


### 项目文档

<http://git.hongguaninfo.com/hdp/hdp-docs>


### 常见问题汇总

<http://git.hongguaninfo.com/hdp/hdf/wikis/home>


### 技术支持QQ群：

65852508

