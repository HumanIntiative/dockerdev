-- init.sql

create database pkpu_core;
use pkpu_core;
source /db/database.sql;

create user user identified by "password";
grant all privileges on pkpu_core.* to user@'%';