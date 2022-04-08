# AwsomeAnsible 基础软件自动安装
- **ansible基础命令：** 在ansible主机上执行ansible-playbook，指定需要安装软件的目标服务器IP列表，并指明需要使用的脚本目录下的主入口文件。即可一键安装。也可指定<-e>选项补充额外变量。
  ```
  ansible-playbook <-i> <IP列表清单.ini> <主入口文件.yml>
  ansible-playbook -i example/hosts.m-master.ip.ini 00-kernel.yml #升级目标服务器的系统内核
  ```
- **AWX 图形化操作：** 可在AWX应用上新建svn项目，同步所有服务器列表文件（*.ini）和脚本文件，并由awx执行安装。
## AwsomeAnsible 目录结构说明

### 标准ansible目录
    ```
    [root@awx-49 awsomeansible]# tree -L 6 OptionMaintenance/Docker
    OptionMaintenance/Docker
    ├── docker
    │   ├── docker.yml          #主入口文件：指定了哪些“主机组”中的主机，去执行哪些“role”中包括的子脚本任务。
    │   └── roles               #按role区分了不同脚本。roles的子目录就是一组脚本，某台主机可以同时运行多组脚本，也可只运行其中之一。可在主入口文件进行指定。
    │       └── docker          #名为docker的一组脚本。
    │           ├── files       #固定格式：存放需要从ansible主机复制到目标机器的配置文件。可通过copy模块进行复制，且在脚本中可以使用相对路径。
    │           │   ├── daemon.json
    │           │   ├── docker-ce.repo
    │           │   └── ipvs.modules
    │           ├── handlers    #固定格式：按顺序执行的脚本在tasks目录（组），触发执行的脚本在handlers目录（组）。通过notify模块进行触发执行。
    │           │   └── main.yml
    │           ├── tasks       #固定格式：通过main.yml主入口文件指定依次自行哪些脚本任务。类似nginx配置文件中的inlude。
    │           │   ├── add_yum_repo.yml
    │           │   ├── clean_op_tags.yml
    │           │   ├── judge_op_tags.yml
    │           │   ├── main.ymlc
    │           │   └── set_docker.yml
    │           └── vars        #固定格式：需要安装的目标软件的全局变量指定。比如 docker_version: "19.03.15"。也可通过ansible-playbook -e命令进行覆盖。
    │               └── main.yml
    └── docker-compose
        ├── docker-compose.yml
        └── roles
            └── docker-compose
                ├── tasks
                │   └── main.yml
                └── vars
                    └── main.yml
    
    12 directories, 14 files
    [root@awx-49 awsomeansible]# 
    ```
### AwsomeAnsible目录

    ```shell script
    [root@awx-49 ~]# tree -L 1 awsomeansible/
    awsomeansible/
    ├── BigData                 #大数据相关脚本：安装基础软件、触发hudi流程。
    ├── codeFromAwx-playbook    #待合并的其它项目代码，如通过bash /mysqlInstall.sh手动安装MySQL的脚本。
    ├── DataBase                #数据库层软件：ElasticSearch、MySql、Postgresql等数据库软件安装脚本。
    ├── Hosts                   #全局服务器IP列表文件：存放给不同服务器安装软件时，需要指定的xxx_hosts.ini文件。如docker_hosts.ini
    ├── OptionMaintenance       #运维相关软件：Ansible、Docker、Jenkins、Zabbix等。
    ├── PrimaryApplications     #主要应用软件：K8S、Confluent-CDC、Kafka、Nginx等。
    ├── README.md               #项目说明。
    ├── SecondaryApplications   #辅助应用软件：Gitlab、Harbor、Maven等。
    ├── StressTesting           #压力测试相关：针对应用软件的压力测试，以便调优。
    └── Tunning                 #优化脚本：系统初始化及优化、数据库等应用的优化。
    
    9 directories, 1 file
    ```