create table escola_pessoa(
    codigo int not null auto_increment,
    nome varchar (255) not null,
    endereco varchar (255) not null,
    primary key (codigo)
)engine = InnoDB; ok

create table escola_material_didatico(
    codigo int not null auto_increment,
    descricao varchar (255) not null,
    primary key (codigo)
)engine = InnoDB; ok

create table escola_telefone(
    telefone int not null,
    codigo_pessoa int not null,
    primary key(telefone, codigo_pessoa),
    constraint fk_escola_telefone_codigo_pessoa foreign key (codigo_pessoa) references escola_pessoa (codigo)
    on delete no action on update no action   
)engine = InnoDB; ok

create table escola_aluno(
    codigo_pessoa int not null ,
    sexo varchar(45) not null,
    data_nascimento date not null,
    rg varchar(45),
    cpf varchar(45),
    primary key (codigo_pessoa),
    constraint fk_escola_aluno_codigo_pessoa foreign key (codigo_pessoa) references escola_pessoa(codigo)
    on delete no action on update no action
)engine = InnoDB; ok

create table escola_professor(
    codigo_pessoa int not null ,
    formacao varchar(255) not null,
    primary key (codigo_pessoa),
    constraint fk_escola_professor_codigo_pessoa foreign key (codigo_pessoa) references escola_pessoa(codigo)
    on delete no action on update no action
)engine = InnoDB; ok

create table escola_idiomas(
    codigo int not null auto_increment,
    descricao varchar (255) not null,
    primary key (codigo)
)engine = InnoDB; ok

create table escola_pre_requisito(
    codigo_idioma1 int not null,
    codigo_idioma2 int not null,
    primary key (codigo_idioma1, codigo_idioma2),
    constraint fk_escola_pre_requisito_codigo_idioma1 foreign key (codigo_idioma1) references escola_idiomas(codigo),
    constraint fk_escola_pre_requisito_codigo_idioma2 foreign key (codigo_idioma2) references escola_idiomas(codigo)
    on delete no action on update no action
)engine = InnoDB; ok

create table escola_ministra(
    codigo_idioma int not null,
    codigo_professor int not null,
    primary key (codigo_idioma, codigo_professor),
    constraint fk_escola_ministra_codigo_idioma foreign key (codigo_idioma) references escola_idiomas (codigo),
    constraint fk_escola_ministra_codigo_professor foreign key (codigo_professor) references escola_professor(codigo_pessoa)
    on delete no action on update no action
)engine = InnoDB; ok

create table escola_turma(
    codigo int not null auto_increment,
    codigo_idioma int not null,
    codigo_professor int not null,
    data_inicio date not null,
    data_termino date not null,
    dias_da_semana varchar (255),
    horario_inicio_aula time not null,
    horario_termino_aula time not null,
    nivel int not null,
    primary key (codigo),
    constraint fk_escola_turma_codigo_idioma foreign key (codigo_idioma) references escola_idiomas(codigo),
    constraint fk_escola_turma_codigo_professor foreign key (codigo_professor) references escola_professor(codigo_pessoa)
    on delete no action on update no action
)engine = InnoDB; ok

create table escola_matricula(
    codigo_matricula int not null auto_increment,
    codigo_aluno int not null,
    turma_codigo int not null,
    codigo_material_didatico int not null,
    valor_mensalidade float not null,
    data_matricula date not null,
    primary key(codigo_matricula),
    constraint fk_escola_matricula_codigo_aluno foreign key (codigo_aluno) references escola_aluno(codigo_pessoa),
    constraint fk_escola_matricula_turma_codigo foreign key (turma_codigo) references escola_turma(codigo),
    constraint fk_escola_matricula_codigo_material_didatico foreign key (codigo_material_didatico) references escola_material_didatico (codigo)
    on delete no action on update no action
)engine = InnoDB; ok

create table escola_frequencia(
    codigo_turma int not null,
    codigo_aluno int not null,
    data date not null,
    registro char(1) not null,
    primary key(codigo_turma, codigo_aluno),
    constraint fk_escola_frequencia_codigo_turma foreign key (codigo_turma) references escola_turma (codigo),
    constraint fk_escola_frequencia_codigo_aluno foreign key (codigo_aluno) references escola_aluno (codigo_pessoa)
    on delete no action on update no action
)engine = InnoDB; ok