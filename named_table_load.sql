--CREATE DATABASE CROSSOVER;

USE DATABASE crossover;
CREATE or replace SCHEMA REAL_ESTATE;
USE SCHEMA REAL_ESTATE;

--create a new table to load into
create or replace table rent_role (
    unit string,
    unit_type string,
    sqft int,
    market_rent int,
    rent int,
    move_in date,
    lease_exp date,
    month string
);

-- get account information for SnowSQL login
select CURRENT_ACCOUNT()
select CURRENT_USER()

-- create data 
CREATE OR REPLACE STAGE crossover_stage
  file_format = (type = 'CSV' FIELD_DELIMITER = ',' SKIP_HEADER = 1);

-- get location information from right clicking on file
put file:///Users/antoinemack/Downloads/*Report.csv @crossover_stage;

-- query data from stage table
-- staging will not allow you to use select *, example below
select co.$1, co.$2,co.$3,co.$4,co.$5,co.$6,co.$7,co.$8,co.$9, co.$10 from @crossover_stage co;

--copy data into table from stage
COPY INTO RENT_ROLE FROM @crossover_stage
pattern = '.{1,}Report.{1,}';


list @crossover_stage


select * from rent_role;