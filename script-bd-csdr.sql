CREATE TABLE professor(
 id_professor SERIAL PRIMARY KEY,
 nome varchar(255),
 email varchar(255),
 cpf varchar(15)
);


SELECT * FROM professor;


INSERT INTO professor (nome,email,cpf) VALUES('shaina','shaina.moise@escola.pr.gov.br','002005006');

DELETE FROM professor WHERE id_professor = 2 ;
