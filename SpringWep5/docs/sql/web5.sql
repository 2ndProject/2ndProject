create table web5_member(
	id 			varchar2(20)	primary key
	, password 	varchar2(20)	not null
	, name 		varchar2(20)	not null
	, email		varchar2(50)	not null
	, division	varchar2(20)	not null check(division='person' or division='company')
	, idno		number(20)		not null
	, address	varchar2(50)	not null
	)
	
create table web5_board(
	boardNum 	number			primary key
	, id 			varchar2(20)	not null
	, title 		varchar2(100)	not null
	, content		varchar2(2000)	not null
	, inputdate		date			default sysdate
	, hits			number			default 0
	, originalfile	varchar2(200)
	, savedfile		varchar2(200)
	)
	
create sequence web5_board_seq start with 1 increment by 1;

	
	
	select
			custid
			, password
			, name
			, email
			, division
			, idno
			, address
		from web5_member
		
select * from WEB5_BOARD

		
		
alter table web5_member rename column id to custid
	