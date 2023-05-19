########################################
# MySQL 必知必会
# 我的视图创建脚本
########################################


########################
#创建产品顾客视图
########################
CREATE VIEW productcustomer AS
SELECT cust_name, cust_contact, prod_id
FROM customers, orders, orderitems
WHERE customers.cust_id = orders.cust_id
  AND orderitems.order_num = orders.order_num;


########################
#创建供应商位置视图
########################
CREATE VIEW vendorlocations AS
SELECT Concat(RTrim(vend_name), '(', RTrim(vend_country), ')')
  AS vend_title
FROM vendors
ORDER BY vend_name;


########################
#创建顾客电子邮件列表视图
########################
CREATE VIEW customeremaillist AS
SELECT cust_id, cust_name, cust_email
FROM customers
WHERE cust_email IS NOT NULL;


########################
#创建订单总价格视图
########################
CREATE VIEW orderitemsexpanded AS
SELECT order_num, 
       prod_id, 
       quantity, 
       item_price, 
quantity*item_price AS expanded_price
FROM orderitems;