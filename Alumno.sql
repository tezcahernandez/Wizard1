create table tblObject
(
IdObject int not null primary key key identity (1,1),
Object nvarchar(max) null
)

create table tblAlumno
(
Id int not null primary key identity (1,1),
Nombre nvarchar(max) not null,
ApPaterno nvarchar (max) not null,
ApMaterno nvarchar(max) not null,
Email nvarchar(max) not null
)

create procedure spInsertColumn
as
begin
insert into tblAlumno(nombre,appaterno,apmaterno,email)
select	[Object].value('(/Alumno/nombre)[1]','nvarchar(max)') as nombre,
		[Object].value('(/Alumno/aPaterno)[1]','nvarchar(max)') as appaterno,
		[Object].value('(/Alumno/aMaterno)[1]','nvarchar(max)') as apmaterno,
		[Object].value('(/Alumno/email)[1]','nvarchar(max)') as email 
		from tblObject where IdObject=(select max(IdObject) from tblObject)
end

exec spInsertColumn
select * from tblAlumno
select * from tblObject