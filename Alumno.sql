create table tblObject
(
IdObject int not null primary key identity (1,1),
Object xml null
)
create table tblAlumno
(
Id int not null primary key,
Nombre nvarchar(max) not null,
ApPaterno nvarchar (max) not null,
ApMaterno nvarchar(max) not null,
Email nvarchar(max) not null
)
create procedure spInsertColumn 
@IdAlumno int
as
begin
insert into tblAlumno (Id, Nombre, ApPaterno, ApMaterno, Email)
select	@IdAlumno AS ID, [Object].value('(/Alumno/nombre)[1]','nvarchar(max)') as Nombre,
		[Object].value('(/Alumno/aPaterno)[1]','nvarchar(max)') as ApPaterno,
		[Object].value('(/Alumno/aMaterno)[1]','nvarchar(max)') as ApMaterno,
		[Object].value('(/Alumno/email)[1]','nvarchar(max)') as Email
		from tblObject where IdObject=@IdAlumno;
end