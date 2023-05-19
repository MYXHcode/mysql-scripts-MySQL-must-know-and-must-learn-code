########################################
# MySQL 必知必会
# 我的用户账号创建脚本
########################################


########################
#创建用户账号
########################
CREATE USER ben IDENTIFIED BY 'p@$$wOrd';


########################
#重命名用户账号
########################
RENAME USER ben TO bforta;


########################
#设置访问权限
########################
GRANT SELECT ON crashcourse.* TO bforta;


########################
#更改口令
########################
/*
SET PASSWORD FOR bforta = Password('n3w p@$$wOrd');
*/


########################
#删除用户账号
########################
DROP USER bforta;