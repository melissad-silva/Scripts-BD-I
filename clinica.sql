create table clinica_paciente(
    codigo int not null auto_increment,
    nome varchar(255) not null,
    data_nascimento date not null,
    sexo varchar (10) not null,
    prontuario varchar(255) not null,
    endereco varchar(255) not null,
    cpf varchar(45),
    rg varchar (45),
    obs varchar(45),
    primary key (codigo)
)engine = InnoDB;  ok

create table clinica_medico (
    crm int not null,
    nome varchar(255) not null,
    especialidade varchar(45) not null,
    data_atendimento date not null,
    horarios_atentimento varchar (255),
    primary key (crm)
)engine = InnoDB; ok

create table clinica_exames(
    codigo int not null auto_increment,
    nome varchar(45) not null,
    valor float not null,
    status varchar(45) not null,
    instrucao varchar(255),
    primary key (codigo)
)engine = InnoDB; ok

create table clinica_telefone_paciente(
    telefone varchar(15) not null,
    codigo_paciente int not null,
    primary key(telefone, codigo_paciente),
    constraint fk_clinica_telefone_paciente_codigo_paciente foreign key (codigo_paciente) references clinica_paciente(codigo)
    on delete no action on update no action 
)engine = InnoDB; ok

create table clinica_agendamento(
    codigo int not null auto_increment,
    codigo_paciente int not null, 
    codigo_exame int not null,
    data_agendamento date not null,
    data_exame_agendado date not null,
    hora_exame_agendado time not null,
    hora_exame_realizado time,
    primary key (codigo),
    constraint fk_clinica_agendamento_codigo_paciente foreign key (codigo_paciente) references clinica_paciente(codigo),
    constraint fk_clinica_agendamento_codigo_exame foreign key (codigo_exame) references clinica_exames(codigo)
    on delete no action on update no action
)engine = InnoDB; ok

create table clinica_consulta(
    codigo int not null auto_increment,
    codigo_paciente int not null,
    crm_medico int not null,
    data_agendamento date not null,
    data_consulta_agendada date not null,
    hora_consulta_agendada time not null,
    valor float not null,
    status varchar(45) not null,
    hora_consulta_realizada time ,
    primary key (codigo),
    constraint fk_clinica_consulta_codigo_paciente foreign key (codigo_paciente) references clinica_paciente(codigo),
    constraint fk_clinica_consulta_crm_medico foreign key (crm_medico) references clinica_medico(crm)
    on delete no action on update no action 
)engine = InnoDB; ok

create table clinica_consulta_exame(
    codigo_exame int not null,
    codigo_consulta int not null,
    primary key (codigo_exame, codigo_consulta),
    constraint fk_clinica_consulta_exame_codigo_exame foreign key (codigo_exame) references clinica_exames (codigo),
    constraint fk_clinica_consulta_exame_codigo_consulta foreign key (codigo_consulta) references clinica_consulta (codigo)
    on delete no action on update no action
)engine = InnoDB; ok

create table clinica_receita(
    codigo int not null auto_increment,
    codigo_consulta int not null,
    posologia varchar(45),
    observacao varchar(45),
    primary key (codigo),
    constraint fk_clinica_receita_codigo_consulta foreign key (codigo_consulta) references clinica_consulta(codigo)
    on delete no action on update no action
)engine = InnoDB; ok

create table clinica_medicamento(
    medicamento varchar(45) not null,
    codigo_receita int not null,
    primary key (medicamento, codigo_receita),
    constraint fk_clinica_medicamento_codigo_receita foreign key (codigo_receita) references clinica_receita(codigo)
)engine = InnoDB; ok

