drop table student, course, class, class_student;
create table student (
	id numeric(4),
	name varchar(50),
	course_id numeric(4)
);

alter table student
add constraint student_id primary key(id);

create table course (
	id numeric(4),
	title varchar(50)
);

alter table course 
add constraint course_id primary key(id);

create table class (
	id numeric(4),
	title varchar(50)
);

alter table class
add constraint class_id primary key(id);

create table class_student (
	student_id numeric(4),
	class_id numeric(4),
	score numeric(5, 2)
);

-- BASIC SETUP DONE

alter table student add constraint course_fk foreign key(course_id) references course(id); 
alter table class_student
add constraint student_fk foreign key(student_id) references student(id),
add constraint class_fk foreign key(class_id) references class(id),
add constraint class_student_id primary key(class_id, student_id);

-- FK SETUP DONE

insert into course values (1, 'Gestão');
insert into course values (2, 'Economia');
insert into course values (3, 'Marketing');

insert into student values (798, 'Ana Marques', 1);
insert into student values (1123, 'Joana Costa', 2);
insert into student values (2045, 'Fernando Dias', 3);

insert into class values (23, 'Inglês');
insert into class values (17, 'História');
insert into class values (45, 'Informática');
insert into class values (30, 'Matemática');

insert into class_student values (798, 23, 13.0);
insert into class_student values (1123, 17, 12);
insert into class_student values (1123, 45, 14);
insert into class_student values (2045, 30, 16);

select student.name, class.title, cs.score 
from class_student as cs, class, student 
where cs.student_id = student.id and cs.class_id = class.id
order by class.title;
