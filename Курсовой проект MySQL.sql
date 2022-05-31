#Realt — площадка недвижимости №1 в Беларуси*
#Уникальная база объектов недвижимости Беларуси, 
#Разместить объявление в любой категории можно быстро, 
#легко, в т.ч. и бесплатно. 

#Ежемесячная аудитория Realt превышает 1,5 миллиона 
#уникальных пользователей (физические лица, агентства недвижимости).

#На Realt размещают более 100 000 объявлений ежемесячно.
#Пользователь подаёт заявку с исходными данными.
#После рассмотрения заявки и оплаты (при необходимости) публикуются объявления.
#Пользователи имеют возможность общаться между собой, 
# а также подавать жалобы на некорректные объявления.




drop database if exists realt_by;
create database realt_by;

use realt_by;

#таблица пользователей
drop table if exists users;
create table users (
	id bigint unsigned primary key auto_increment,
	name char(150) not null,
	phone bigint unique not null
	);
	

#таблица видов объектов недвижимости
drop table if exists view_estate_object;
create table view_estate_object (
	id int unsigned primary key,
	view_object char(150) not null
	);

#таблица наименований объектов недвижимости
drop table if exists estate_object;
create table estate_object ( 
	id int unsigned primary key auto_increment,
	name char(150) not null,
	id_view int unsigned,
	foreign key (id_view) references view_estate_object (id)
	);
	
#таблица типов размещаемых объявлений
drop table if exists type_advertisement;
create table type_advertisement (
	id int unsigned primary key,
	type_ad char(150) not null);
	

#таблица месторасположений объектов недвижимости
drop table if exists locality;
create table locality (
	id int primary key auto_increment,
	name_locality char(150) not null
	);


#таблица поданных заяврк на размещение объявлений
drop table if exists applications;
create table applications (
	id bigint primary key auto_increment,
	user_id bigint unsigned,
	type_id int unsigned,
	name_id int unsigned,
	price int,
	id_locality int,
	specifications char(250) not null,
	date_submission datetime default now() not null,
	date_review datetime default null,
	foreign key (user_id) references users (id),
	foreign key (type_id) references type_advertisement (id),
	foreign key (name_id) references estate_object (id),
	foreign key (id_locality) references locality (id) 
	);
	

#таблица опубликованных объявлений
drop table if exists ads;
create table ads (
	id bigint unsigned primary key auto_increment,
	id_application bigint,
	body char(250),
	date_placement datetime default now() not null,
	date_update datetime default null,
	activity bit default (1),
	foreign key (id_application) references applications (id)
	);


#таблица сообщений между пользователями
drop table if exists messages;
create table messages (
	id bigint primary key auto_increment,
	from_user_id bigint unsigned,
	to_user_id bigint unsigned,
	body char(250),
	foreign key (from_user_id) references users (id),
	foreign key (to_user_id) references users (id)
	);


#таблица произведенных за размещение объявлений платежей
drop table if exists payments;
create table payments (
	id bigint unsigned primary key auto_increment,
	user_id bigint unsigned,
	ads_id bigint unsigned,
	date_payment datetime default now(),
	foreign key (user_id) references users (id),
	foreign key (ads_id) references ads (id)
	);
	

#таблица поступивших жалоб на некорректные объявления
drop table if exists complaint;
create table complaint (
	id bigint unsigned primary key auto_increment,
	user_id bigint unsigned,
	ads_id bigint unsigned,
	date_complaint datetime default now(),
	body char(250),
	consideration bit default (0),
	foreign key (user_id) references users (id),
	foreign key (ads_id) references ads (id)
	);
	
#скрипты наполнения таблиц данными
insert into users (name, phone) values
  ('Иван Иванов', 158976523),
  ('Агентство Этажи', 785369124),
  ('Агентство Твоя Столица', 746988533),
  ('Николай Степанов', 228774369),
  ('Алла Чижик', 478996574),
  ('Агентство Час пик', 788996005),
  ('Светлана Суворова', 889630102),
  ('Агентство Мариэлт', 300951667),
  ('Анатолий Синица', 698220576);
  
 insert into view_estate_object (id, view_object) values 
  (1, 'жилая'),
  (2, 'загородная'),
  (3, 'коммерческая');
  
 insert into estate_object (name, id_view) values
  ('квартира', 1),
  ('комната', 1),
  ('коттедж', 2),
  ('дом', 2),
  ('участок', 2),
  ('бизнес-центр', 3),
  ('кафе', 3),
  ('офис', 3),
  ('магазин', 3),
  ('склад', 3);
  
insert into type_advertisement (id, type_ad) values 
  (1, 'продажа'),
  (2, 'покупка'),
  (3, 'аренда');
  
 insert into locality (name_locality) values 
	('г.Минск'),
	('г.Витебск'),
	('г.Гродно'),
	('г.Могилев'),
	('г.Брест'),
	('г.Гомель'),
	('СТ Вишневка'),
	('СТ Озерцо'),
	('пос.Радужный'),
	('д.Михалёво');
	
insert into applications (user_id, type_id, name_id, price, id_locality, specifications) values 
	(5, 1, 4, 15000, 10, 'год постройки - 1977, 58 кв.м., все коммуникации'),
    (2, 1, 1, 82000, 1, 'год постройки - 2021,  60 кв.м., 2-хкомнатная, 3 этаж, с отделкой'), 
	(6, 1, 1, 96000, 1, 'год постройки - 2020,  78 кв.м., 2-хкомнатная, 5 этаж, с отделкой'),
    (3, 1, 8, 55000, 1, 'год постройки - 2005,  34 кв.м., с отделкой'),
    (7, 1, 5, 7000, 8, '6 соток, без коммуникаций');
    
insert into applications (user_id, type_id, name_id, id_locality, specifications) values   
    (1, 2, 5, 7, 'без построек');
   
update applications set date_review = now() where id=3;

update applications set date_review = now() where id=1 or id=5;
    
insert into ads (id_application) values
	(2),
    (6),
    (4),
    (1),
    (5),
    (3);
   
 update ads set date_update = now() where id=3 or id=6;

 update ads set activity = 0 where id=5;
   
 insert into messages (from_user_id, to_user_id, body) values
	(4, 7, 'Gjbmscghfc svgc scvghv'),
    (8, 5, 'E cghv schb sxsfcf'),
    (7, 4, 'Pdfxgsk hjyvj sgvf skl'),
    (7, 3, 'Wcgf kjbdc snl'),
    (6, 1, 'Ihgcv fcgfc 99 kjbh'),
    (1, 6, 'Qfcgf dkjn 6548 kjbdk'),
    (1, 9, 'Gjhvjh vgh sknc'),
    (1, 3, 'Dgtygcf lghsvc swcoi'),
    (7, 5, 'Zgvc gfn 878 dhb 54 skjb');
   
   
insert into payments (user_id, ads_id) values
	(5, 1),
    (2, 2),
    (6, 3);
   
insert into payments (user_id, ads_id) values
	(3, 4),
    (7, 5),
    (1, 6);    
   
 insert into complaint (user_id, ads_id, body) values
	(9, 3, 'Rfchcg'),
    (8, 6, 'GTcdvjh');
 
  update complaint set consideration = 1 where id=1;  
  
 
 
 
#выборки

#выбрать первые три активных объявлений о продаже объектов недвижимости в г.Минске в порядке снижения цены
select ads.id, estate_object.name, applications.specifications, applications.price
from ads 
join applications on applications.id = ads.id_application
join estate_object on estate_object.id = applications.name_id
where activity = 1 and id_locality = 1 and type_id = 1
order by price desc
limit 3;

#выбрать все объявления по сделкам с участками, отсортировав по видам объявлений
select ads.id, type_advertisement.type_ad, estate_object.name, locality.name_locality
from ads
join applications on applications.id = ads.id_application
join type_advertisement on type_advertisement.id = applications.type_id
join estate_object on estate_object.id = applications.name_id
join locality on locality.id = applications.id_locality
where estate_object.name = 'участок'
order by type_advertisement.type_ad;

#выбрать все нерассмотренные жалобы, поступившие от агентств в порядке их поступления
select *
from complaint
where user_id in
	(select id
    from users
    where name like '%Агентство%')
and consideration = 0
order by date_complaint;


#посчитать все рассмотренные заявки на размещение по типам объявлений
select type_id, count(*)
from applications
where date_review is not null
group by type_id;

#посчитать среднюю цену 2-хкомнатных квартир в г.Минске по размещенным объявлениям
select round(avg(price), 2) as 'средняя цена' 
from  applications
join locality on locality.id = applications.id_locality
where specifications like '%2-х%' and name_locality like '%Минск%' and date_review is not null;


#представление сводных данных по авторам размещенных объявлений и объектам сделки 
create view my_view_1 as
select users.name as 'Автор объявления',
	estate_object.name as 'Объект сделки'
from users
join applications on applications.user_id = users.id
join estate_object on estate_object.id = applications.name_id
where date_review is not null
order by 'Автор объявления';

select * 
from my_view_1;




#Представление данных по количеству поданных заявок в разрезе месторасположения объектов недвижимости
create view  my_view_2 as
select  locality.name_locality as 'Месторасположение объекта', count(*) as 'Количество заявок' 
from applications
join locality on locality.id = applications.id_locality
group by locality.name_locality;

select * 
from my_view_2;



#процедура добавления пользователя

delimiter //
create procedure add_user (n char(150), p bigint)
begin 
	insert into users (name, phone) values (n, p);
end//

delimiter ;
call add_user ('Петр Васильев', '749862357');




#триггер на удаление записи об оплате актиного объявления

delimiter //

create trigger del_p before delete on payments
for each row
begin
	declare error_del_p condition for sqlstate '50000';
    set @del_id_p = old.id;
	set @act = (select activity from ads
				join payments on payments.ads_id = ads.id
				where payments.id = @del_id_p);
    if  @act = 1 then
        signal error_del_p
        set message_text = 'Нельзя удалить запись об оплате активного объявления';
     end if;
end//

delimiter ;
delete from payments where id = 4;

 
 