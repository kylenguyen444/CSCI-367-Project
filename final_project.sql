create database project;
create table courses_taken (
	course_code varchar(25) not null primary key,
    course_name varchar(50),
    credit_received double,
    course_detail varchar(250)
);
create table advisor (
	name varchar (200),
    email varchar (200) primary key,
    phone_number long,
    office_room varchar(200),
    department varchar(200)
);
select * from advisor;
create table departments (
	dept_name varchar(200) not null primary key,
    credits_to_major double,
    credits_to_minor double
);
create table grad_requirement (
	requirement varchar(25) primary key,
    req_details varchar(500),
    completed boolean
);
-- create table students (
	-- stu_name varchar(255) not null,
    -- stu_email varchar(255) primary key,
    -- total_credits double,
    -- adv_email varchar(200),
    -- cum_gpa double
-- );

    
    

