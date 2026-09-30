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



