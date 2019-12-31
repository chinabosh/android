显示数据库:show databases;  
显示表结构:show columns from 表名;  
建表：  
create table user ( 
id int(11) not null auto_increment,  
name varchar(255) default null,  
pwd varchar(255) default null,  
primary key (id)  
) engine=InnoDB auto_increment=10 default charset=utf8;  
新增一列:  
alter table 表名 add column 新列名 varchar(255) not null;   
插入到指定列后:  
alter table 表名 add column 新列名 varchar(255) not null after 列名;  
插入到第一列:  
alter table 表名 add column 新列名 varchar(255) not null first;  
为列添加唯一性约束:  
alter table 表名 add unique(列名);  
