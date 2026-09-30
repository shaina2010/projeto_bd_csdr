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



