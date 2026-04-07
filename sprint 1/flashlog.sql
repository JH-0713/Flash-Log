create database flashlog;
use flashlog;

create table if not exists usuario(
	id_usuario int auto_increment primary key,
    nome varchar(255) not null,
    senha text not null,
    email varchar(255) not null unique,
    cargo enum('ADM',"ENTREGADOR") not null
);

create table if not exists cliente(
	id_cliente int auto_increment primary key,
    nome varchar(255) not null,
    cpf varchar(255) not null unique,
    telefone varchar(50) not null,
    endereço text not null
);

create table if not exists entrega(
	id_entrega int auto_increment primary key,
    data_saida timestamp default current_timestamp,
    data_entrega datetime,
    status_entrega enum("PREPARACAO","CAMINHO","ENTREGUE")
);

create table if not exists rastreador(
	id_rastreador int auto_increment primary key,
    data_atual DATETIME DEFAULT CURRENT_TIMESTAMP,
    endereço text,
    entrega_id int,
    constraint fk_rastreador_entrega foreign key (entrega_id) references entrega(id_entrega)
    
);

create table if not exists pedido(
	id_pedido int auto_increment primary key,
    data_criacao datetime not null,
    pedido_status varchar(150),
    cliente_id int,
    constraint fk_pedido_cliente foreign key (cliente_id) references cliente(id_cliente)
);
