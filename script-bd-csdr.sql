create table usuario (
  id_usuario serial not null,
  nome character varying(100) not null,
  email character varying(150) not null,
  senha_hash character varying(255) not null,
  perfil character varying(255) not null,
  criado_em timestamp without time zone,
  atualizado_em timestamp without time zone ,
  constraint usuario_pkey primary key (id_usuario)
);
select * from public.usuario

INSERT INTO usuario (nome, email, senha_hash, perfil, criado_em, atualizado_em) VALUES
('Ana Silva', 'ana.silva@email.com', '$2b$12$eImiTXuWVxfM37uY4JANjO3z565v8G6/2', 'Administrador', NOW(), NOW()),
('Carlos Souza', 'carlos.souza@email.com', '$2b$12$L7R2m30mS4mS8mQ7mE1mO.7mR30mS4mS8', 'Gestor', NOW(), NOW()),
('Mariana Costa', 'mariana.costa@email.com', '$2b$12$Z1x2c3v4b5n6m7asdfghjklpowqeyruti', 'Cliente', NOW(), NOW());
 
CREATE TABLE dispositivo(
  id_dispositivo SERIAL PRIMARY KEY,
  fk_usuario int,
  modelo  varchar(100) not null,
  sistema_operacional varchar(50)not null,
  versao_so   varchar(50)not null,
  arquitetura_cpu  varchar(50),
  nucleos_cpu   int,
  frequencia_cpu_ghz  decimal(4,2),
  memoria_ram_mb  int not null ,
  armazenamento_total_mb   bigint not null,
  armazenamento_livre_mb   bigint not null,
  coletado_em  timestamp,
  constraint fk_usuario foreign key (fk_usuario) references usuario (id_usuario)
);
select * from usuario

select * from dispositivo


INSERT INTO dispositivo (fk_usuario, modelo, sistema_operacional, versao_so, arquitetura_cpu, nucleos_cpu, frequencia_cpu_ghz, memoria_ram_mb, armazenamento_total_mb, armazenamento_livre_mb, coletado_em) VALUES (7, 'ThinkPad L14', 'Windows 11 Pro', '23H2', 'x86_64', 8, 2.10, 16384, 512000, 320500, '2026-10-21 10:00:00');

INSERT INTO dispositivo (fk_usuario, modelo, sistema_operacional, versao_so, arquitetura_cpu, nucleos_cpu, frequencia_cpu_ghz, memoria_ram_mb, armazenamento_total_mb, armazenamento_livre_mb, coletado_em) VALUES (9, 'Ubuntu Server Proliant', 'Ubuntu LTS', '24.04', 'x86_64', 16, 3.50, 32768, 1024000, 850000, '2026-10-21 11:15:00');

INSERT INTO dispositivo (fk_usuario, modelo, sistema_operacional, versao_so, arquitetura_cpu, nucleos_cpu, frequencia_cpu_ghz, memoria_ram_mb, armazenamento_total_mb, armazenamento_livre_mb, coletado_em) VALUES (8, 'Galaxy S24', 'Android', '14.0', 'ARM64', 8, 3.39, 8192, 256000, 120000, '2026-10-21 11:45:00');



CREATE TABLE sessao_usuario(
 id_sessao_usuario SERIAL PRIMARY KEY,
 fk_usuario int not null,
 token_jwt    varchar(500) not null,
 ip_origem    varchar(45),
 user_agent   text,
 expira_em    timestamp not null,
 criado_em    timestamp,
constraint fk_usuario foreign key (fk_usuario) references usuario (id_usuario)
);
select * from sessao_usuario


 INSERT INTO sessao_usuario (fk_usuario, token_jwt, ip_origem, user_agent, expira_em, criado_em)
 VALUES (7, 'eyJhbGciOiJIUzI1NiIsInR5cjg0ODAwfQ.abc123xyz_example_token_pc', '192.168.1.50',
 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
 CURRENT_TIMESTAMP + INTERVAL '1 day', CURRENT_TIMESTAMP);


 INSERT INTO sessao_usuario (fk_usuario, token_jwt, ip_origem, user_agent, expira_em, criado_em)
 VALUES (8, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiO456uvw_example_token_mobile',  '2001:0db8:85a3:0000:0000:8a2e:0370:7334',  'Mozilla/5.0 (Linux; Android 13; SM-G998B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Mobile Safari/537.36',  CURRENT_TIMESTAMP + INTERVAL '2 days',CURRENT_TIMESTAMP);


INSERT INTO sessao_usuario (fk_usuario, token_jwt, ip_origem, user_agent, expira_em, criado_em)
VALUES (9, 'eyJhbGciOiJIUzI1NiIsInR5zk4Njg0ODAwfQ.ghi789rst_example_token_iphone', '187.54.210.12',
   'Mozilla/5.0 (iPhone; CPU iPhone OS 16_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.5 Mobile/15E148 Safari/604.1',
   CURRENT_TIMESTAMP + INTERVAL '2 hours',  CURRENT_TIMESTAMP );


CREATE TABLE termo_lgpd(
 id_termo_lgpd SERIAL PRIMARY KEY,
 versao varchar(20) not null,
 conteudo text not null,
 data_publicacao timestamp
);

SELECT * FROM termo_lgpd

INSERT INTO termo_lgpd (versao , conteudo , data_publicacao ) VALUES('2.0','aplicativo','2026-01-19 12:00:00');
INSERT INTO termo_lgpd (versao , conteudo , data_publicacao ) VALUES('3.0','jogo','2026-04-12 12:00:00');
INSERT INTO termo_lgpd (versao , conteudo , data_publicacao ) VALUES('5.0','aplicativo','2026-02-28 12:00:00');

CREATE TABLE aplicativo (
 id_aplicativo SERIAL PRIMARY KEY,
 nome varchar (150) not null,
 desenvolvedora varchar (100),
 descricao text,
 categoria varchar (50),
 criado_por varchar (36),
 criado_em timestamp 
);

SELECT * FROM aplicativo

INSERT INTO aplicativo (nome , desenvolvedora , descricao , categoria , criado_por , criado_em ) 
VALUES('whatsapp', 'meta', 'aplicativo de comunicacao', 'todas as idades', 'meta', '2009-02-24 14:00:00');
INSERT INTO aplicativo (nome , desenvolvedora , descricao , categoria , criado_por , criado_em ) 
VALUES('faceboock', 'meta', 'aplicativo de entretenimento', 'todas as idades', 'meta', '2004-06-19 14:00:00');
INSERT INTO aplicativo (nome , desenvolvedora , descricao , categoria , criado_por , criado_em ) 
VALUES('instagram', 'meta', 'aplicativo de entretenimento', 'todas as idades', 'meta', '2005-01-14 14:00:00');

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




 CREATE TABLE relatorio_divergencia(
 id_relatorio_divergencia SERIAL PRIMARY KEY,
 usuario_id varchar(36) not null,
 aplicativo_id varchar(36),
 dispositivo_id varchar(36),
 descricao_problema text not null,
 status varchar(255),
 criado_em timestamp

);


CREATE TABLE consentimento_usuario(
  id_consentimento_usuario SERIAL PRIMARY KEY,
  fk_usuario  int not null,
  fk_termo_lgpd  int not null,
  aceito  boolean not null,
  data_consentimento  timestamp,
  constraint fk_usuario foreign key (fk_usuario) references usuario (id_usuario),
  constraint fk_termo_lgpd foreign key (fk_termo_lgpd) references termo_lgpd (id_termo_lgpd)
);



INSERT INTO consentimento_usuario (fk_usuario, fk_termo_lgpd, aceito) 
VALUES (9, 1, true);

INSERT INTO consentimento_usuario (fk_usuario, fk_termo_lgpd, aceito) 
VALUES (7, 2, false);

INSERT INTO consentimento_usuario (fk_usuario, fk_termo_lgpd, aceito) 
VALUES (8, 3, true);

select * from consentimento_usuario



create table public.notificacao (
  id character varying(36) not null,
  usuario_id character varying(36) not null,
  titulo character varying(150) not null,
  mensagem text not null,
  lida boolean null,
  criada_em timestamp without time zone null,
  constraint notificacao_pkey primary key (id)
) TABLESPACE pg_default;



CREATE TABLE diagnostico_compatibilidade(
id_diagnostico_compatibilidade SERIAL PRIMARY KEY,
fk_usuario int not null,
fk_dispositivo int not null,
fk_aplicativo int not null,
status varchar (255) not null,
detalhes_falhas varchar(255),
executado_em timestamp,
constraint fk_usuario foreign key (fk_usuario) references usuario (id_usuario),
constraint fk_dispositivo foreign key (fk_dispositivo) references dispositivo (id_dispositivo),
constraint fk_aplicativo foreign key (fk_aplicativo) references aplicativo (id_aplicativo)
);


INSERT INTO diagnostico_compatibilidade (fk_usuario, fk_dispositivo, fk_aplicativo, status, detalhes_falhas, executado_em)
VALUES (7, 1, 1, 'Compatível', NULL, NOW());


INSERT INTO diagnostico_compatibilidade (fk_usuario, fk_dispositivo, fk_aplicativo, status, detalhes_falhas, executado_em)
VALUES (8, 2, 3, 'Incompatível', 'Memória RAM insuficiente (Mínimo: 8GB, Disponível: 4GB).', NOW());


INSERT INTO diagnostico_compatibilidade (fk_usuario, fk_dispositivo, fk_aplicativo, status, detalhes_falhas, executado_em)
VALUES (9, 3, 2, 'Incompatível', 'Versão do Android não homologada para este aplicativo.', NOW());

select * from diagnostico_compatibilidade;
