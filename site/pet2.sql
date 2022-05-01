drop table pet2;
drop table AnimalTable;
drop table SizeTable;
drop table test;

create table pet2(
SNo int,
Animals VARCHAR2(7), 
Size_OF_ANIMAL VARCHAR2(7),
BODY_COLOR VARCHAR2(8),
PET_ANIMAL VARCHAR2(3),
PRIMARY KEY (SNo)
);



create table test(
SNo int,
Animals VARCHAR2(7), 
Size_OF_ANIMAL VARCHAR2(7),
BODY_COLOR VARCHAR2(8),
PET_ANIMAL VARCHAR2(3),
PRIMARY KEY (SNo)
);






create table AnimalTable(
SNo int,
AName VARCHAR2(7), 
Yes int,
No_ int,
Prob_yes float,
Prob_no float
);

create table SizeTable(
SNo int,
Asize VARCHAR2(7), 
Yes int,
No_ int,
Prob_yes float,
Prob_no float
);





insert into pet2 values(2,'Dog','Big','White','No');
insert into pet2 values(5,'Cow','Small','Brown','No');
insert into pet2 values(6,'Rat','Big','Brown','No');
insert into pet2 values(9,'Rat','Medium','Black','No');
insert into pet2 values(10,'Rat','Small','Brown','No');



insert into test values(1,'Dog','Big','White','No');
insert into test values(2,'Rat','Big','Brown','No');
insert into test values(3,'Dog','Medium','Black','Yes');
insert into test values(4,'Cow','Big','White','Yes');







create or replace view mytest as select 
s.Animals,s.Size_OF_ANIMAL,s.BODY_COLOR
from test s;




commit;

select * from pet2;
select * from test;
select * from mytest;

