reate database colsultorio;

create table paciente(
    id int not null auto_increment,
    nombre varchar(30) not null, 
    apellido varchar (30) not null,
    curp varchar (30) not null,
    telefono varchar(30) not null, 
   movil varchar(30) not null,
   email varchar(50) not null,
   sexo varchar(10) not null,
   fechaNacimiento date not null, 
   nacionalidad varchar(30) not null,
   ocupacion varchar(30) not null,
   idAntecedenteClinico int not null,
   idAntecedenteFamiliar int not null,
   idAntecedenteSexual int not null,
   idAntecedenteNoClinico int not null,
    fechaCreacion datetime not null default current_timestamp,
    primary key(id),
    foreign key(idAntecedenteClinico) references antecedenteClinico(id),
    foreign key(idAntecedenteFamiliar) references antecedenteFamiliar(id),
    foreign key(idAntecedenteSexual) references antecedenteSexual(id),
    foreign key(idAntecedenteNoClinico) references antecedenteNoClinico(id),
    foreign key(idTratamiento) references tratamiento(id)
);

create table doctor (
    id int not null auto_increment,
    nombre varchar(30) not null, 
    apellido varchar (30) not null,
    movil varchar(30) not null, 
    especialidad varchar (30) not null,
    cedula varchar(30) not null,
    idCita int not null,
    fechaCreacion datetime not null default current_timestamp,
    primary key(id)
    foreign key(idCita) references cita(id)
);

create table cita(
    id int not null auto_increment,
    horaInicio datetime not null, 
    horaFinal datetime not null, 
    duracion int not null,
    idPaciente int not null,
    idConsultorio int not null, 
    idSecretaria int not null, 
    motivoCita varchar (255),
    estado enum ('Confirmado', 'Reagendado', 'En progreso', 'Retrasado', 'Cancelado'),
    fechaCreacion datetime not null default current_timestamp,
    primary key(id)
    foreign key(idPaciente) references paciente(id),
    foreign key(idConsultorio) references consultorio(id),
    foreign key(idSecretaria) references secretaria(id)
);

create table tratamiento (
     id int not null auto_increment,
     idCita int not null, 
     idPaciente int not null, 
     diagnostico varchar(255) not null, 
     duracion int not null,
     medicacion varchar(255) not null, 
     proximaCita datetime not null, 
    observaciones varchar(500) not null,
    fechaCreacion datetime not null default current_timestamp,
    primary key(id),
    foreign key(idCita) references cita(id),
    foreign key(idPaciente) references paciente(id)
);

create table antecedenteClinico(
    id int not null auto_increment,
     idPaciente int not null, 
     medicacion varchar (500),
     cirujia varchar (500),
     traumatologia varchar (500),
     idAlergia int, 
     psiquiatrica varchar (500),
     adicciones varchar (500),
    fechaCreacion datetime not null default current_timestamp,
     primary key(id),
     foreign key (idPaciente) references paciente (id),
    foreign key(idAlergia) references alergia(id)

);

create table antecedenteNoClinico(
    id int not null auto_increment,
     idPaciente int not null, 
     actividadFisica varchar (500) not null, 
     vacunas varchar (500),
     nutricion varchar (500),
     sueño(255),
     fechaCreacion datetime not null default current_timestamp,
     primary key(id),
     foreign key (idPaciente) references paciente (id)
);

create table antecedenteFamiliar(
    id int not null auto_increment,
     idPaciente int not null, 
     enfermedadPadre varchar (500) not null, 
     enfermedadMadre varchar (500) not null,
     enfermedadAbuelos varchar (500) not null, 
     fechaCreacion datetime not null default current_timestamp,
     primary key(id),
     foreign key (idPaciente) references paciente (id)
);

create table antecedenteSexual(
     id int not null auto_increment,
     idPaciente int not null, 
     edadInicio int not null,
     menarca int,
     partos int not null, 
     aborto int,
     ETS varchar(255),  
     fechaCreacion datetime not null default current_timestamp,
     primary key(id),
     foreign key (idPaciente) references paciente (id)
);
 
 create table colsultorio(
     id int not null auto_increment,
     idDoctor int not null, 
     idPaciente int not null, 
     numero int not null,
      fechaCreacion datetime not null default current_timestamp,
     primary key(id),
     foreign key (idDoctor) references doctor (id), 
     foreign key (idPaciente) references paciente (id),
     foreign key (idCita) references cita (id)  
 );

 create table laboratorio (
     id int not null auto_increment,
     nombre varchar(30) not null, 
     telefono varchar(30) not null,
     email varchar (30) not null,
     direccion varchar (30) not null,
     nombreContacto varchar(30) not null,
     fechaCreacion datetime not null default current_timestamp,
     primary key(id)
 );
create table alergia(
    id int not null auto_increment,
    idPaciente int not null, 
    nombre varchar (255) not null, 
     fechaCreacion datetime not null default current_timestamp,
     primary key(id),
     foreign key (idPaciente) references paciente (id)
);

create table secretaria(
    id int not null auto_increment,
    nombre varchar (30) not null, 
    apellido varchar (30) not null, 
    idCita int not null, 
    fechaCreacion datetime not null default current_timestamp,
     primary key(id),
     foreign key (idCita) references cita (id)
);
