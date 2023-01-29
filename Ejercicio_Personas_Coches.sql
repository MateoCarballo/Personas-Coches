#------------------------------------------------------------------------------------------------------
# Creación de la Base de Datos llamada PersonasCoches
#------------------------------------------------------------------------------------------------------
drop database if exists	PersonasCoches ;
create database PersonasCoches;
#------------------------------------------------------------------------------------------------------
# Selecciona la base de datos recién creada para ser utilizada.
#------------------------------------------------------------------------------------------------------
use PersonasCoches;
#------------------------------------------------------------------------------------------------------
# Creación de una tabla llamada Persona con los siguientes campos:
# NIF como cadena de 9 caracteres.
# Nombre como cadena de 30 caracteres.
# Apellido como cadena de 50 caracteres.
#------------------------------------------------------------------------------------------------------
create table Persona(
NIF 	 	varchar(9),
Nombre 		varchar(30),
Apellido 	varchar(50) 	
);
#------------------------------------------------------------------------------------------------------
# Creación de una tabla llamada Coche con los siguientes campos:
#Matrícula como cadena de 9 caracteres.
#Model como cadena de 20 caracteres.
#Tipo como cadena de 20 caracteres.
#------------------------------------------------------------------------------------------------------
create table Coche(
Matricula 	varchar(9),
Model 		varchar(20),
Tipo 		varchar(20)
);
# Muestra la codificacion de las tablas??
select * from Persona;
select * from Coche;

#En la tabla persona asigna NIF como clave primaria
alter table Persona
modify NIF varchar(9) primary key;

##Opcion2 para lode arriba 
# alter table persona add primary key (NIF);

#En la tabla coche asigna matrícula como clave primaria
alter table coche 
modify matricula varchar(9) primary key;

# En la tabla Persona modifica "Apellido" por "Apellidos"
alter table Persona
change column Apellido Apellidos varchar(50);

#En la tabla coche cambia el campo "Model" por "Modelo"
alter table coche 
change column Model Modelo varchar(50);

# En la tabla Persona,
# crea un campo Vehículo que sea clave foránea de la clave Matrícula de la tabla Coche.
alter table Persona
add column Vehiculo varchar(10),
add foreign key (Vehiculo) references Coche(Matricula);

#En la tabla Coche crea un campo "Propietario" que sea clave foranea de la clave NIF en la tabla
# Persona
alter table Coche
add column Propietario varchar(20),
add foreign key (Propietario) references Persona(NIF);

#En la tabla Persona, agrega la restriccion de que el campo "Nombre" no pueda ser nulo
alter table Persona
modify Nombre varchar(30) not null;

#En la tabla coche, agrega la restriccion de que el campo "Tipo" no pueda ser nulo
alter table Coche
modify Tipo varchar (20) not null;

select * from Persona;
select * from Coche;
