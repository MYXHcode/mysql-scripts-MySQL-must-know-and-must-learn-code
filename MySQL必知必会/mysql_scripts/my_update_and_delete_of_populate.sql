########################################
# MySQL 必知必会
# 我的示例表更新和删除填充脚本
########################################


##########################
# 更新和删除客户表数据
##########################
/* 更新数据 */
/*
UPDATE customers
SET cust_email = 'elmer@fudd.com'
WHERE cust_id = 10005;
*/

UPDATE customers
SET cust_name = 'The Fudds', 
 cust_email = 'elmer@fudd.com'
WHERE cust_id = 10005; 

UPDATE customers
SET cust_email = NULL
WHERE cust_id = 10005; 

/* 删除数据 */
DELETE FROM customers
WHERE cust_id = 10006;