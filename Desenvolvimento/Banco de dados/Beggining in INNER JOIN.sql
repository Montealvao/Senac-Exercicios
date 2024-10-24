CREATE DATABASE senac;
use senac;


create table students(
id varchar(36) primary key,
name varchar(70) not null,
age int not null,
id_class varchar(36) not null,

foreign key(id_class) references class(id)
);

create table class(
id varchar(36) primary key,
class_name varchar(70)
);

insert into students(id,name,age,id_class) values
('3e770f22-e6a0-4f76-b8d1-0935509d16d4','Samuel Barros',18,'45a1e21e-5770-4e82-93ee-d7e0bcdb79d6'),
('2a424320-d741-4ebe-9aa4-ad19c2e063be','João Augusto',22,'c1a6815f-1def-4f46-940e-936571370c5a'),
('a29dffd1-4a0d-4293-b8ed-11758dcde0c6','Freitas Nascimento',16,'da3d39b8-bd6c-47ad-8058-250ce42afe22'),
('ff02c6be-b13e-4ee0-a7df-745add4b6feb','Pedro celeste',17,'2ef97f61-c1a9-4e16-87e6-7ca7f974fd76');

select * from students;

insert into class(id,class_name) values
('45a1e21e-5770-4e82-93ee-d7e0bcdb79d6','Técnico em Desenvolvimento de Sistemas'),
('c1a6815f-1def-4f46-940e-936571370c5a','Técnico em Enfermagem'),
('da3d39b8-bd6c-47ad-8058-250ce42afe22','Gastronomia'),
('2ef97f61-c1a9-4e16-87e6-7ca7f974fd76','Moda');

select * from class;

select students.name , students.age , class.class_name
from students
inner join class
on students.id_class = class.id;