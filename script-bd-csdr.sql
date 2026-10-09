create table public.usuario (
  id_usuario serial not null,
  nome character varying(100) not null,
  email character varying(150) not null,
  senha_hash character varying(255) not null,
  perfil character varying(255) not null,
  criado_em timestamp without time zone null,
  atualizado_em timestamp without time zone null,
  constraint usuario_pkey primary key (id_usuario)
);

CREATE TABLE dispositivo(
 id_dispositivo SERIAL PRIMARY KEY,
 usuario_id varchar(36),
 modelo  varchar(100) not null,
 sistema_operacional varchar(50)not null,
 versao_so   varchar(50)not null,
 arquitetura_cpu  varchar(50),
 nucleos_cpu   int,
 frequencia_cpu_ghz  decimal(4,2),
 memoria_ram_mb  int not null ,
 armazenamento_total_mb   bigint not null,
 armazenamento_livre_mb   bigint not null,
 coletado_em  timestamp
);


CREATE TABLE sessao_usuario(
 id_sessao_usuario SERIAL PRIMARY KEY,
 usuario_id   varchar(36) not null,
 token_jwt    varchar(500) not null,
 ip_origem    varchar(45),
 user_agent   text,
 expira_em    timestamp not null,
 criado_em    timestamp
 );

CREATE TABLE termo_lgpd(
id_termo_lgpd SERIAL PRIMARY KEY,
versao varchar(20) not null,
conteudo text not null,
data_publicacao timestamp
);

SELECT * FROM termo_lgpd;

INSERT INTO termo_lgpd (versao , conteudo , data_publicacao) VALUES('2.0','aplicativo','2026-01-19 12:00:00');



CREATE TABLE aplicativo (
id_aplicativo SERIAL PRIMARY KEY,
nome           varchar (150) not null,
desenvolvedora  varchar (100),
descricao      text,
categoria      varchar (50),
criado_por     varchar (36),
criado_em      timestamp 
);

SELECT * FROM aplicativo;

INSERT INTO aplicativo (nome , desenvolvedora , descricao , categoria , criado_por , criado_em ) 
VALUES('whatsapp', 'meta', 'aplicativo de comunicacao', 'todas as idades', 'meta', '2009-02-24 14:00:00');

CREATE TABLE requisito_aplicativo(
 id_requisito_aplicativo SERIAL PRIMARY KEY,
 aplicativo_id varchar(36) not null,
 tipo_requisito varchar(255) not null,
 so_minimo varchar(50) not null,
 versao_so_minima varchar(50) not null,
 ram_minima_mb int not null,
 espaco_armazenamento_mb bigint not null,
 frequencia_cpu_minima_ghz decimal(4,2),
 nucleos_cpu_minimos int
);

