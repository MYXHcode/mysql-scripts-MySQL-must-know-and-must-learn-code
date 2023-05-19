########################################
# MySQL 必知必会
# 我的触发器创建脚本
########################################


########################
#创建插入新产品时，返回产品增加信息的触发器
########################
CREATE TRIGGER newproduct AFTER INSERT ON products
FOR EACH ROW SELECT 'Product added' INTO @productaddedinfo;


########################
#删除插入新产品时，返回产品增加信息的触发器
########################
DROP TRIGGER newproduct;


########################
#创建返回新的订单号的触发器
########################
CREATE TRIGGER neworder AFTER INSERT ON orders
FOR EACH ROW SELECT NEW.order_num INTO @newordernum;


########################
#使用返回新的订单号的触发器
########################
INSERT INTO orders(order_date, cust_id)
VALUES(Now(), 10001);


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


########################
#创建更新供应商时，保证州名缩写是大写的触发器
########################
CREATE TRIGGER updatevendor BEFORE UPDATE ON vendors
FOR EACH ROW SET NEW.vend_state = Upper(NEW.vend_state);