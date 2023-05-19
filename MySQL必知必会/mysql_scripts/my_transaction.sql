########################################
# MySQL 必知必会
# 我的事务处理创建脚本
########################################


########################
#使用 ROLLBACK 命令用来回退 MySQL 语句
########################
SET SQL_SAFE_UPDATES = 0;

SELECT * FROM ordertotals;
START TRANSACTION;
DELETE FROM ordertotals;
SELECT * FROM ordertotals;
ROLLBACK;
SELECT * FROM ordertotals;

SET SQL_SAFE_UPDATES = 1;


########################
#删除删除订单时，保存将要删除的订单的触发器
########################
DROP TRIGGER deleteorder;

########################
#使用 COMMIT 命令用来提交 MySQL 语句
########################
START TRANSACTION;
DELETE FROM orderitems WHERE orderitems.order_num = 20010;
DELETE FROM orders WHERE orders.order_num = 20010;
COMMIT;

########################
#创建删除订单时，保存将要删除的订单的触发器
########################
DELIMITER //

CREATE TRIGGER deleteorder BEFORE DELETE ON orders
FOR EACH ROW
BEGIN
	INSERT INTO archive_orders(order_num, order_date, cust_id)
    VALUES(OLD.order_num, OLD.order_date, OLD.cust_id);
END//

DELIMITER ;