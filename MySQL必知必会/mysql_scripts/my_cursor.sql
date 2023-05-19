########################################
# MySQL 必知必会
# 我的游标创建脚本
########################################


########################
#创建处理订单的存储过程
#创建订单号游标
########################
/*
DELIMITER //

CREATE PROCEDURE processorders()
BEGIN
  DECLARE ordernumbers CURSOR
  FOR
  SELECT order_num FROM orders;
END//

DELIMITER ;
*/


########################
#创建处理订单的存储过程
#创建订单号游标
########################
/*
DELIMITER //

CREATE PROCEDURE processorders()
BEGIN
  -- 声明游标
  DECLARE ordernumbers CURSOR
  FOR
  SELECT order_num FROM orders;
  
  -- 打开游标
  OPEN ordernumbers;
  
  -- 关闭游标
  CLOSE ordernumbers;
END//

DELIMITER ;
*/


########################
#创建处理订单的存储过程
#创建订单号游标
########################
/*
DELIMITER //

CREATE PROCEDURE processorders()
BEGIN
  -- 声明局部变量
  DECLARE o INT;

  -- 声明游标
  DECLARE ordernumbers CURSOR
  FOR
  SELECT order_num FROM orders;
  
  -- 打开游标
  OPEN ordernumbers;
  
  -- 获得订单号
  FETCH ordernumbers INTO o;
  
  -- 关闭游标
  CLOSE ordernumbers;
END//

DELIMITER ;
*/


########################
#创建处理订单的存储过程
#创建订单号游标
########################
/*
DELIMITER //

CREATE PROCEDURE processorders()
BEGIN
  -- 声明局部变量
  DECLARE done BOOLEAN DEFAULT 0;
  DECLARE o INT;

  -- 声明游标
  DECLARE ordernumbers CURSOR
  FOR
  SELECT order_num FROM orders;
  
  -- 声明继续处理程序
  DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done=1;

  -- 打开游标
  OPEN ordernumbers;
  
  -- 循环通过所有行
  REPEAT

	-- 获得订单号
	FETCH ordernumbers INTO o;
    
  -- 结束循环
  UNTIL done END REPEAT;
  
  -- 关闭游标
  CLOSE ordernumbers;
END//

DELIMITER ;
*/


########################
#创建处理订单的存储过程
#创建订单号游标
########################
DELIMITER //

CREATE PROCEDURE processorders()
BEGIN
  -- 声明局部变量
  DECLARE done BOOLEAN DEFAULT 0;
  DECLARE o INT;
  DECLARE t DECIMAL(8, 2);

  -- 声明游标
  DECLARE ordernumbers CURSOR
  FOR
  SELECT order_num FROM orders;
  
  -- 声明继续处理程序
  DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done=1;

  -- 创建一个表来存储结果
  CREATE TABLE IF NOT EXISTS ordertotals
    (order_num INT, total DECIMAL(8, 2));

  -- 打开游标
  OPEN ordernumbers;
  
  -- 循环通过所有行
  REPEAT

	-- 获得订单号
	FETCH ordernumbers INTO o;
    
    -- 得到这个订单的总数
    CALL ordertotal(o, 1, t);
    
    -- 在订单总计中插入订单和总计
    INSERT INTO ordertotals(order_num, total)
    VALUES(o, t);
    
  -- 结束循环
  UNTIL done END REPEAT;
  
  -- 关闭游标
  CLOSE ordernumbers;
END//

DELIMITER ;