create table oficina_marca(cod_marca int not null auto_increment, 
descricao varchar(45) not null,
primary key(cod_marca))engine = InnoDB; OK

create table oficina_modelo(cod_modelo int not null auto_increment,
descricao varchar(45) not null,
cod_marca int not null,
primary key(cod_modelo),
constraint fk_oficina_modelo_cod_marca foreign key (cod_marca) references oficina_marca(cod_marca)
on delete no action on update no action)engine = InnoDB; OK

create table oficina_mao_obra(cod_mao_obra int not null auto_increment,
descricao varchar(255) not null,
valor double not null,
primary key(cod_mao_obra))engine = InnoDB; OK

create table oficina_peca(cod_peca int not null auto_increment,
descricao varchar(255) not null,
valor double not null,
quantidade_estoque int not null,
primary key(cod_peca))engine = InnoDB; OK

create table oficina_proprietario(cpf varchar(14) not null,
nome varchar(255) not null,
endereco varchar(255) not null,
primary key(cpf))engine = InnoDB; OK

create table oficina_telefone(telefone varchar(20) not null,
primary key(telefone),
cpf varchar(14) not null,
constraint fk_oficina_telefone_cpf foreign key(cpf) references oficina_proprietario(cpf)
on delete no action on update no action)engine = InnoDB; OK

create table oficina_veiculo(placa varchar(7) not null,
ano int not null,
cor varchar(45),
data_cadastro date not null,
historico text not null,
cpf varchar(14) not null,
cod_modelo int not null,
primary key(placa),
constraint fk_oficina_veiculo_cpf foreign key(cpf) references oficina_proprietario(cpf),
constraint fk_oficina_veiculo_cod_modelo foreign key(cod_modelo) references oficina_modelo(cod_modelo)
)engine = InnoDB; OK

create table oficina_avarias(cod_avaria int not null auto_increment,
avaria varchar(255) not null,
primary key(cod_avaria),
placa varchar(7) not null,
constraint fk_oficina_avarias_placa foreign key(placa) references oficina_veiculo(placa)
on delete no action on update no action)engine = InnoDB; OK

create table oficina_orcamento_ordem_servico(cod_ordem_servico int not null auto_increment,
data_cadastro date not null,
data_validade date not null,
valor double not null,
diagnostico varchar(45),
ordem_servico bit,
data_prevista_finalizacao date,
data_finalizacao date,
placa varchar(7) not null,
primary key(cod_ordem_servico),
constraint fk_oficina_orcamento_ordem_servico_placa foreign key(placa) references oficina_veiculo(placa))engine = InnoDB; OK

create table oficina_orcamento_peca(cod_orcamento_peca int not null auto_increment,
quantidade int not null,
valor double not null,
primary key(cod_orcamento_peca),
cod_peca int not null,
cod_ordem_servico int not null,
constraint fk_oficina_orcamento_peca_cod_peca foreign key(cod_peca) references oficina_peca(cod_peca),
constraint fk_oficina_orcamento_peca_cod_ordem_servico foreign key(cod_ordem_servico) references oficina_orcamento_ordem_servico(cod_ordem_servico)
on delete no action on update no action)engine = InnoDB; OK

create table oficina_orcamento_mao_obra(cod_orcamento_mao_obra int not null auto_increment,
quantidade int not null,
valor double not null,
primary key(cod_orcamento_mao_obra),
cod_mao_obra int not null,
cod_ordem_servico int not null,
constraint fk_oficina_orcamento_mao_obra_cod_mao_obra foreign key(cod_mao_obra) references oficina_mao_obra(cod_mao_obra),
constraint fk_oficina_orcamento_mao_obra_cod_ordem_servico foreign key(cod_ordem_servico) references oficina_orcamento_ordem_servico(cod_ordem_servico))engine = InnoDB; OK