########################################
# MySQL 必知必会
# 我的字符集和校对顺序创建脚本
########################################


########################
#给表指定字符集和校对
########################
/*
CREATE TABLE mytable
(
	columnn1 INT,
    columnn2 VARCHAR(10)
) DEFAULT CHARACTER SET hebrew
  COLLATE hebrew_general_ci;
*/


########################
#给表和列指定字符集和校对
########################
CREATE TABLE mytable
(
	columnn1 INT,
    columnn2 VARCHAR(10), 
    columnn3 VARCHAR(10) CHARACTER SET latin1 COLLATE latin1_general_ci
) DEFAULT CHARACTER SET hebrew
  COLLATE hebrew_general_ci;