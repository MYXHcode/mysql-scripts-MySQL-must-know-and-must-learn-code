########################################
# MySQL 必知必会
# 我的示例表填充脚本
########################################


##########################
# 填充客户表
##########################
/* 插入完整的行 */
/*
INSERT INTO customers
VALUES(NULL, 
    'Pep E. LaPew', 
    '100 Main Street', 
    'Los Angeles', 
    'CA', 
    '90046', 
    'USA', 
    NULL,
    NULL);
*/

/*
INSERT INTO customers(cust_name, 
    cust_address, 
    cust_city, 
    cust_state, 
    cust_zip, 
    cust_country, 
    cust_contact, 
    cust_email)
VALUES('Pep E. LaPew', 
    '100 Main Street', 
    'Los Angeles', 
    'CA', 
    '90046', 
    'USA', 
    NULL,
    NULL);
*/

/*
INSERT INTO customers(cust_name, 
    cust_contact, 
    cust_email, 
    cust_address, 
    cust_city, 
    cust_state, 
    cust_zip, 
    cust_country)
VALUES('Pep E. LaPew', 
    NULL, 
    NULL, 
    '100 Main Street', 
    'Los Angeles', 
    'CA', 
    '90046', 
    'USA');
*/

/* 插入多个行 */
/*
INSERT INTO customers(cust_name, 
    cust_address, 
    cust_city, 
    cust_state, 
    cust_zip, 
    cust_country)
VALUES('Pep E. LaPew', 
    '100 Main Street', 
    'Los Angeles', 
    'CA', 
    '90046', 
    'USA');
INSERT INTO customers(cust_name, 
    cust_address, 
    cust_city, 
    cust_state, 
    cust_zip, 
    cust_country)
VALUES('M. Martian', 
    '42 Galaxy way', 
    'New York', 
    'NY', 
    '11213', 
    'USA');
*/

INSERT INTO customers(cust_name, 
    cust_address, 
    cust_city, 
    cust_state, 
    cust_zip, 
    cust_country)
VALUES(
        'Pep E. LaPew', 
        '100 Main Street', 
        'Los Angeles', 
        'CA', 
        '90046', 
        'USA'
    ),
    (
        'M. Martian', 
        '42 Galaxy way', 
        'New York', 
        'NY', 
        '11213', 
        'USA'
    );

/* 插入检索出的数据 */
INSERT INTO customers(cust_id, 
    cust_contact, 
    cust_email, 
    cust_name,
    cust_address, 
    cust_city, 
    cust_state, 
    cust_zip, 
    cust_country)
SELECT cust_id,
    cust_contact, 
    cust_email, 
    cust_name,
    cust_address, 
    cust_city, 
    cust_state, 
    cust_zip, 
    cust_country
FROM custnew;