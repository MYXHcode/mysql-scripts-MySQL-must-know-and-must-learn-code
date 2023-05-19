########################################
# MySQL 必知必会
# 我的存储过程创建脚本
########################################


########################
#创建返回产品平均价格的存储过程
########################
DELIMITER //

CREATE PROCEDURE productpricing()
BEGIN
  SELECT Avg(prod_price) AS priceaverage
  FROM products;
END//

DELIMITER ;


########################
#删除返回产品平均价格的存储过程
########################
DROP PROCEDURE productpricing;


########################
#创建返回产品平均价格的有参数的存储过程
########################
DELIMITER //

CREATE PROCEDURE productpricing(
  OUT p1 DECIMAL(8, 2), 
  OUT ph DECIMAL(8, 2), 
  OUT pa DECIMAL(8, 2)
  )
BEGIN
  SELECT Min(prod_price)
  INTO p1
  FROM products;
  SELECT Max(prod_price)
  INTO ph
  FROM products;
  SELECT Avg(prod_price)
  INTO pa
  FROM products;
END//

DELIMITER ;


########################
#创建返回该订单的合计的有参数的存储过程
########################
DELIMITER //

CREATE PROCEDURE ordertotal(
  IN onumber INT, 
  OUT ototal DECIMAL(8, 2)
  )
BEGIN
  SELECT Sum(item_price*quantity)
  FROM orderitems
  WHERE order_num = onumber
  INTO ototal;
END//

DELIMITER ;


########################
#删除返回该订单的合计的有参数的存储过程
########################
DROP PROCEDURE ordertotal;


########################
#建立智能存储过程
#创建返回该订单的合计并考虑营业税的有参数的存储过程
########################
-- 名称:ordertotal
-- 参数:onumber = 订购号
--      taxable = 0 如果不纳税的话，1 如果须纳税
--      ototal  = 可变的订单总数

DELIMITER //

CREATE PROCEDURE ordertotal(
  IN onumber INT, 
  IN taxable BOOLEAN, 
  OUT ototal DECIMAL(8, 2)
  ) COMMENT '获得订单总额，可选择加税'
BEGIN

  -- 声明变量为总计
  DECLARE total DECIMAL(8, 2);
  -- 声明税率
  DECLARE taxrate INT DEFAULT 6;

  -- 获得订单总数
  SELECT Sum(item_price*quantity)
  FROM orderitems
  WHERE order_num = onumber
  INTO total;

  -- 需要纳税吗？
  IF taxable THEN
    -- 是的，所以把税率加到总数中
    SELECT total+(total/100*taxrate) INTO total;
  END IF;

  -- 最后，保存到输出变量
  SELECT total INTO ototal;

END//

DELIMITER ;