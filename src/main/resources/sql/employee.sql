
mvn install:install-file -Dfile=ojdbc6.jar -DartifactId=ojdbc6 -DgroupId=com.oracle -Dversion=11.2.0 -Dpackaging=jar            



select * from dept;
select * from emp;
select * from BONUS;
select * from SALGRADE;

--
-- Inner Join 1
--
select dept.deptno, dept.dname, emp.ename, emp.hiredate
  from dept inner join emp
    on dept.deptno = emp.deptno
 order by dept.deptno desc;
 
--
-- Inner Join 2
--    
select d.deptno, d.dname, e.ename, e.hiredate
  from dept d, emp e
 where d.deptno = e.deptno
 order by d.deptno desc;
--
-- Left Outer Join
--
select d.deptno, d.dname, e.ename, e.hiredate
  from dept d left outer join emp e
    on d.deptno = e.deptno;
    
-- 1. emp에 직원을 추가하시오     
--    empno = 8000
--    ename = 홍길동
--    job = develper
--    ...
--    deptno = 80
--    dname = 홍무부
--    dloc = 서울
--
-- 2. dpet정보를 수정하시오
--    deptno = 20
--    dname = 개발부
--    loc = 부산

-- 3. 직원정보를 삭제하시오
--    empno >= 7300 and empno <= 7600

-- 4. 부서별 직원정보를 출력하시오 (단 모든 부서를 출력하시오)


select * from emp;

insert into emp
(
	empno,
	ename,
	job,
	mgr,
	hiredate,
	sal,
	deptno
)
values
( 
	1000,
	'홍길동2',
	'deve''xxx''',
	7000,
	'2015/09/10',
	300.2,
	10
);

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

/*
 * City
 */
drop table city;
create table city (
	id			numeric(11) not null,
	name		char(35)	default '',
	countrycode char(3)		default '',
	district	char(20)	default '',
	population	numeric(11) default 0,
	constraint pk_city primary key (id),
	constraint fk_country foreign key (countrycode) references country(code) 
);
/*
 * Country
 */
drop table country;
create table country (
	code 			char(3)			default '',
	name 			char(52)		default '',
	continent		char(20)		default 'Asia',
	region			char(26)		default '',
	surfacearea		numeric(10,2)	default '0.00',
	indepyear		numeric(6)		default null,
	population		numeric(11)		default 0,
	lifeexpectancy	numeric(3,1)	default null,
	gnp				numeric(10,2)	default null,
	gnpold			numeric(10,2)	default null,
	localname		char(45)		default '',
	governmentform	char(45)		default '',
	headofstate		char(60)		default null,
	capital			numeric(11)		default null,
	code2			char(2)			default '',
	constraint ck_continent check (continent in ('Asia','Europe','North America','Africa','Oceania','Antarctica','South America')),
	constraint pk_country primary key (code)
);

/*
 * CountryLanguage
 */
drop table countrylanguage;
create table countrylanguage (
	countrycode	char(3)			default '',
	language	char(30)		default '',
	isofficial	char(1)			default 'f',
	percentage	numeric(4,1)	default '0.0',
	constraint ck_isofficial check (isofficial in ('t','f')),
	constraint pk_countrylanguage primary key (countrycode, language)
);

create table filelist (
	fname			varchar(50) primary key,
	flength			numeric(10),
	flast_modified	date,
	image			blob
);

select * from filelist;

delete from dept where deptno = 70;

select * from dept;

update dept
   set dname = 'xxxx',
   	   loc   = 'yyyy'
 where deptno= 12;
 
 select *
   from (select rownum rn, inner.*
   		   from (
	   			select *
	   			  from member 
	   			 order by id desc
	   			) inner
   		) outer
  where outer.rn >=3
    and outer.rn <=4; 
 
 /*
  * Member Table 생성
  */
 select * from member;
 drop table member;
 create table member (
 	id			int not null,
 	email		varchar(64) not null,
 	password	varchar(64) not null,
 	name		varchar(12) not null,
 	regdate		timestamp not null,
 	constraint member_pk primary key (id, email),
 	constraint member_id_uq unique (id),
 	constraint member_email_uq unique (email)
 );

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
 
 /*
  * 채번, 발번
  */
 drop sequence member_id_seq;
 create sequence member_id_seq
 start with 1000;
 
 select member_id_seq.nextval from dual;
 select member_id_seq.currval from dual;
 
 select * from member;
 
 insert into member
 (id, email, password, name, regdate)
 values
 (1004,'xxx11@xxx.com', 'qw23%rty2t', 'zz''z', '2015/08/11');
    
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
  * update 고려사항
  */
 
 select * from member;
 
update member
   set email 	= null,
	   password	= 'qwer1234',
	   name		= null,
 where id 		= 16400;
 
update member
 where id 		= 16400;

update member
   set name		= '홍순이'
 where id 		= 1000; 
 
 /*
  * Pagination
  */

select *
  from member
 order by id 
 
 
select outer.rn,
       outer.id,
       outer.email,
       outer.password,
       outer.name,
       outer.regdate
  from (select rownum rn, inner.*
	      from (select m.* 
		          from member m
		         order by m.id desc
		 	   ) inner
	   ) outer
 where outer.rn >= 21
   and outer.rn <= 30
 	   
 	   
 
 
 
 
 
 
 
 
 
 
 
 

