Drop table pet;
Drop table pet1;
drop table colortable;



create table pet(
SNo int,
Animals VARCHAR2(7), 
Size_OF_ANIMAL VARCHAR2(14),
BODY_COLOR VARCHAR2(11),
PET_ANIMAL VARCHAR2(10),
PRIMARY KEY (SNo)
);

create table pet1(
SNo int,
Animals VARCHAR2(7), 
Size_OF_ANIMAL VARCHAR2(14),
BODY_COLOR VARCHAR2(11),
PET_ANIMAL VARCHAR2(10),
PRIMARY KEY (SNo)
);



create table ColorTable(
SNo int,
AColor VARCHAR2(7), 
Yes int,
No_ int,
Prob_yes float,
Prob_no float
);

insert into pet values(1,'Dog','Medium','Black','Yes');
insert into pet values(2,'Dog','Big','White','No');
insert into pet values(3,'Rat','Small','White','Yes');
insert into pet values(4,'Cow','Big','White','Yes');
insert into pet values(5,'Cow','Small','Brown','No');
insert into pet values(6,'Rat','Big','Brown','No');
insert into pet values(7,'Dog','Small','Brown','Yes');
insert into pet values(8,'Dog','Medium','Brown','Yes');
insert into pet values(9,'Rat','Medium','Black','No');
insert into pet values(10,'Rat','Small','Brown','No');
insert into pet values(11,'Cow','Big','White','Yes');




insert into pet1 values(1,'Dog','Medium','Black','Yes');
insert into pet1 values(3,'Rat','Small','White','Yes');
insert into pet1 values(4,'Cow','Big','White','Yes');
insert into pet1 values(7,'Dog','Small','Brown','Yes');
insert into pet1 values(8,'Dog','Medium','Brown','Yes');
insert into pet1 values(11,'Cow','Big','White','Yes');




select * from pet;
select * from pet1;

commit;

--@"F:\sem 4.1\CSE 4126 DDS lab\project\nb.sql"