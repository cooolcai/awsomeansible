#! /usr/bin/python
#coding:utf-8
#主py文件，将所有功能都集中到这里使用。

#引用依赖包
import os
import tarfile
var2 = "5.7.37"
#配置文件默认模板
#str1 = "[mysqld]\ndatadir=/data/mysql-data\nsocket=/var/lib/mysql/mysql.sock\n\nsymbolic-links=0\n\noptimizer_switch='derived_merge=off'\n\nsql_mode=STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION\n\nmax_connections=1024\n\ncharacter_set_server=utf8\ninit_connect='SET NAMES utf8'\nport=5575\nlower_case_table_names=1\n\nlog-error=/var/log/mysqld.log\npid-file=/var/run/mysqld/mysqld.pid\n\nserver-id = 1111\n\nlog_bin = mysql-bin\nbinlog_format = row\nbinlog_row_image = full\n\nexpire_logs_days = 10\n"
#str2 = str(os.popen("ifconfig ens192 |grep netmask|awk '{print $2}'|awk -F. '{print $3$4}'").read().strip('\n'))
#mysql_conf = "/etc/my.cnf"


#卸载与mysql冲突的maria依赖包（此处可加排除逻辑：若存在则卸载，否则跳过）
var_maria_libs = str(os.popen('rpm -qa |grep maria').read())
if var_maria_libs !='':
    os.system("yum remove -y %s" % (var_maria_libs))
#解压安装包
os.chdir("/media")
os.system("pwd")
tarfile.open("mysql-%s-1.el7.x86_64.rpm-bundle.tar"% (var2)).extractall()
tarfile.open("mysql-%s-1.el7.x86_64.rpm-bundle.tar"% (var2)).close()

#按顺序离线安装rpm文件
#
os.system("rpm -ivh mysql-community-common-%s-1.el7.x86_64.rpm" % (var2))
os.system("rpm -ivh mysql-community-libs-%s-1.el7.x86_64.rpm" % (var2))
os.system("rpm -ivh mysql-community-libs-compat-%s-1.el7.x86_64.rpm" % (var2))
os.system("rpm -ivh mysql-community-client-%s-1.el7.x86_64.rpm" % (var2))
os.system("rpm -ivh mysql-community-server-%s-1.el7.x86_64.rpm" % (var2))

#创建数据目录
mysql_data = "/data/mysql5575/"
if os.path.exists(mysql_data):
    print("/data/mysql is exist!")
else:
    os.makedirs(mysql_data)
    print ("/data/mysql is crated")

#关闭selinux
os.system("sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config")
os.system("setenforce 0")


#备份及修改配置文件
os.system("mv -f /media/my.cnf /etc/my.cnf")
os.system("service mysqld start")
#os.system("cp /etc/my.cnf /etc/my.cnf.old")
#os.system("echo >/etc/my.cnf")
var_mysql_init_passwd = str(os.popen("cat /var/log/mysqld.log |grep 'temporary password'|awk '{print $11}'").read().strip('\n'))
var_mysql_new_passwd = "I.lw@2020"

# str4 = "use mysql;\ndelete from mysql.user where user!='root';\ngrant all on *.* to root@'%' identified by 'I.lw@2020';\nflush privileges;"

#生成初始化sql文件
# f2 = open("/media/mysql-ini.sql","w")
# f2.write(str4)
# f2.close

#执行初始化文件
#os.system("mysql --connect-expired-password -u root -p'%s' -h localhost < /media/mysql-ini.sql" % (var_mysql_init_passwd))
os.system("mysql --connect-expired-password -uroot -p'%s' -e \"alter user root@localhost identified by '%s';\"" % (var_mysql_init_passwd,var_mysql_new_passwd))

#方式一使用sql导入
#os.system("mysql --connect-expired-password -u root -p'I.lw@2020' -h localhost < /media/mysql-ini.sql")

#方式二直接紧跟命令执行
os.system("mysql --connect-expired-password -uroot -p'%s' -e \"grant all on *.* to root@'%%' identified by '%s';\nflush privileges;\"" % (var_mysql_new_passwd,var_mysql_new_passwd))

os.system("service mysqld restart")

os.system("firewall-cmd --zone=public --add-port=5575/tcp --permanent && firewall-cmd --reload")
