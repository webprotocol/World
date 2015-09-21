

select count(*) from city;

select * from city;
select * from country;
select * from countrylanguage;

select * from dept;
select * from emp;

-- char(10)      255max
-- varchar(10)	 255max
-- longvarchar(1000) - oracle ==> long, mysql ==> text, mediuntext
-- clob              - oracle ==> clob, mysql ==> longtext

-- numeric(10, 2)
-- decimal(10, 2)

-- Timestamp (날짜, 시간) - oracle ==> date, mysql ==> datetime
-- Date (날짜)
-- Time (시간)

-- bLob		- oracle ==> blob, mysql ==> blob, mediunblob, lognblob

--
-- dept
--
drop table dept;
create table dept (
	deptno numeric(2) not null,
	dname varchar(14),
	loc varchar(13),
	constraint pk_dept primary key (deptno)
) engine=InnoDB default charset=utf8;

--
-- emp
--
drop table emp;
create table emp (
	empno numeric(4) not null,
	ename varchar(10),
	job varchar(9),
	mgr numeric(4),
	hiredate datetime,
	sal numeric(7,2),
	comm numeric(7,2),
	deptno numeric(2),
	constraint pk_emp primary key (empno),
	constraint fk_deptno foreign key (deptno) references dept(deptno)
) engine=InnoDB default charset=utf8;

--
-- bonus
--
drop table bonus;
create table bonus (
	ename varchar(10),
	job varchar(9),
	sal numeric,
	comm numeric
) engine=InnoDB default charset=utf8;

--
-- salgrade
--
drop table salgrade;
create table salgrade ( 
	grade numeric,
	losal numeric,
	hisal numeric 
) engine=InnoDB default charset=utf8;

select * from dept;

select * from emp;
insert into emp
(
	empno,
	ename,
	job
)
values
( 
	1000,
	'hong',
	'test'
);

-- totalItem
select count(*) from city;	

-- limit start, count ==> start 0, 1, 2,,,,

-- ? start ==> firstItem - 1
-- ? count ==> lastItem - firstItem + 1

-- 1 page :  1 - 10  ==>  0 -  9
select *
  from city
 limit 0, 10;
-- 2 page : 11 - 20  ==> 10 - 19
select *
  from city
 limit 10, 10;

create table filelist (
	fname			varchar(50) primary key,
	flength			numeric(10),
	flast_modified	datetime,
	image			longblob
);

select * from filelist;

 
 /*
  * Member Table 생성
  * email  		xxx@xxx.com 	(regex)
  * password	영문 and 숫자  and 6자리 이상 and not 3자리이상 반복
  * 			암호화(encryption) ==> MD5, SHA-256
  */
 select * from member;
 drop table member;
 create table member (
 	id			int not null auto_increment,
 	email		varchar(64) not null,
 	password	varchar(64) not null,
 	name		varchar(12) not null,
 	regdate		timestamp not null,
 	constraint member_pk primary key (id, email),
 	constraint member_id_uq unique (id),
 	constraint member_email_uq unique (email)
 );
  alter table member auto_increment=1000;
  
 select * from member2;
 drop table member2;
 create table member2 (
 	id			int not null,
 	email		varchar(64) not null,
 	password	varchar(64) not null,
 	name		varchar(12) not null,
 	regdate		timestamp not null,
 	constraint member2_pk primary key (id, email),
 	constraint member2_id_uq unique (id),
 	constraint member2_email_uq unique (email)
 );
 

 
 select * from member;
 
 insert into member
 (email, password, name, regdate)
 values
 ('xxx123', 'yyyy', 'zzzz', '2015/08/11');
 
 
 select last_insert_id();

 	
 /*
  * id generator
  */
 
 select * from id_generator;
 
 drop table id_generator;
 create table id_generator (
 	name	varchar(20) not null primary key,
 	nextval	numeric(10) not null,
 	incval	numeric(5) not null 
 );
 
 insert into id_generator
 (name, nextval, incval)
 values
 ('memberId', 10000, 100);

/*
 * Pagination
 */
 select *
   from city
  where countrycode = 'KOR'
  order by id
  limit 1, 12

/*
 * District 분석
 */

select *
  from city
 where countrycode = 'KOR' 

select distinct district
  from city
 where countrycode = 'KOR'  

select code, name
  from country

insert into city
(name, countrycode, district, population)
values
('홍길동입니다', 'KOR', 'yyy', 10);




















