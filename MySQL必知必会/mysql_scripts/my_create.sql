########################################
# MySQL 必知必会
# 我的示例表创建脚本
########################################


########################
#创建新客户表
########################
CREATE TABLE custnew
(
  cust_id      int       NOT NULL AUTO_INCREMENT,
  cust_name    char(50)  NOT NULL ,
  cust_address char(50)  NULL ,
  cust_city    char(50)  NULL ,
  cust_state   char(5)   NULL ,
  cust_zip     char(10)  NULL ,
  cust_country char(50)  NULL ,
  cust_contact char(50)  NULL ,
  cust_email   char(255) NULL ,
  PRIMARY KEY (cust_id)
) ENGINE=InnoDB;


#####################
#定义外键
#####################
ALTER TABLE orders ADD CONSTRAINT fk_orders_custnew FOREIGN KEY (cust_id) REFERENCES customers (cust_id);