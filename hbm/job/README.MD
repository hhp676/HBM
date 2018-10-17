------
## HBM-JOB
------
HBM-JOB是一个轻量级分布式任务调度框架，其核心设计目标是开发迅速、学习简单、轻量级、易扩展； 基于开源框架XXL-JOB的1.7.1版本开发。
### 设计思想
> * 将调度行为抽象形成“调度中心”公共平台，而平台自身并不承担业务逻辑，“调度中心”负责发起调度请求。
> * 将任务抽象成分散的JobHandler，交由“执行器”统一管理，“执行器”负责接收调度请求并执行对应的JobHandler中业务逻辑。
因此，“调度”和“任务”两部分可以相互解耦，提高系统整体稳定性和扩展性；
> * JOB调度中心是独立部署，JOB执行器嵌入BE中，跟随BE部署。

### 技术架构
![image](http://cc.hongguaninfo.com/_hdp/gitlab_res/hbm/job_system_architecture.png)

### 传统应用（单机部署）
![image](http://cc.hongguaninfo.com/_hdp/gitlab_res/hbm/job_deploy_single.png)

### 分布式服务
![image](http://cc.hongguaninfo.com/_hdp/gitlab_res/hbm/job_deploy_distributed.png)




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

