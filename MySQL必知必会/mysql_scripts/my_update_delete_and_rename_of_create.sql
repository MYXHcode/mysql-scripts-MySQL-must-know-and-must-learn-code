########################################
# MySQL 必知必会
# 我的示例表更新和删除创建脚本
########################################


##########################
# 更新和删除供应商表
##########################
/* 更新表 */
ALTER TABLE vendors
ADD vend_phone char(20);

ALTER TABLE vendors
DROP COLUMN vend_phone;

/* 删除表 */
/*
DELETE TABLE customers2;
*/

/* 重命名表 */
/*
RENAME TABLE customers2 TO customers;

RENAME TABLE backup_customers TO customers,
             backup_vendors TO vendors,
             backup_products TO products;
*/