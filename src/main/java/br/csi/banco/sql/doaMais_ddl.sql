-- DROP DATABASE IF EXISTS doa_mais;
CREATE DATABASE doa_mais;

DROP TABLE IF EXISTS agendamento;
DROP TABLE IF EXISTS evento;
DROP TABLE IF EXISTS alerta;
DROP TABLE IF EXISTS hemocentro;
DROP TABLE IF EXISTS doador;
DROP TABLE IF EXISTS admin_sistema;
DROP TABLE IF EXISTS usuario;

CREATE TABLE IF NOT EXISTS usuario (
	id_usuario		SERIAL,
	email			VARCHAR(50) 	UNIQUE NOT NULL,
	senha			VARCHAR(50) 	NOT NULL,
	PRIMARY KEY 		(id_usuario)
);

CREATE TABLE IF NOT EXISTS admin_sistema (
	id_admin		INTEGER,
	login_admin		VARCHAR(50) NOT NULL,
	PRIMARY KEY		(id_admin),
	FOREIGN KEY		(id_admin) REFERENCES usuario (id_usuario) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS doador (
	id_doador		INTEGER,
	nome_doador		VARCHAR(255)	NOT NULL,
	cpf			CHAR(14)	UNIQUE NOT NULL,
	data_nasc		DATE		NOT NULL,
	sexo			CHAR(1)		NOT NULL, 
	celular			CHAR(16)	NOT NULL,
	cep_doador		CHAR(9)		NOT NULL,
	tipo_sanguineo		CHAR(3)		NOT NULL,
	peso			INTEGER		NOT NULL,
	ja_doou			BOOLEAN		NOT NULL,
	ultima_doacao		CHAR(1)		NULL,
	medicamentos		VARCHAR(255)	NULL,
	observacoes		VARCHAR(255) 	NULL,
	PRIMARY KEY		(id_doador),
	FOREIGN KEY		(id_doador) REFERENCES usuario (id_usuario) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS hemocentro (
	id_hemocentro		SERIAL,
	nome_hemocentro 	VARCHAR(80)  	NOT NULL,
	endereco_hemocentro	VARCHAR(255) 	NOT NULL, 
	cep_hemocentro		CHAR(9)		NOT NULL,
	telefone_hemocentro	CHAR(14)	NOT NULL,
	email_hemocentro	VARCHAR(50)	NOT NULL,
	link_facebook		VARCHAR(60)	NULL,
	link_site		VARCHAR(60)	NULL,
	PRIMARY KEY		(id_hemocentro)
);

CREATE TABLE IF NOT EXISTS alerta (
	id_alerta		SERIAL,
	id_hemocentro		INTEGER		NOT NULL,
	tipo_sanguineo		CHAR(3)		NOT NULL,
	data_alerta		DATE		NOT NULL,
        alerta_aberto           BOOLEAN         NOT NULL,
        objetivo_doacoes        INTEGER         NOT NULL,
        info_extra              VARCHAR(60)     NULL,
	PRIMARY KEY		(id_alerta),
	FOREIGN KEY		(id_hemocentro) REFERENCES hemocentro (id_hemocentro) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS evento (
	id_evento			SERIAL,
	id_hemocentro			INTEGER		NOT NULL,
	nome_evento			VARCHAR(50)	NOT NULL,
	descricao_evento		VARCHAR(255) 	NOT NULL,
	data_evento			DATE		NOT NULL,
	horario_evento			VARCHAR(255)	NOT NULL,
	local_evento			VARCHAR(255)	NOT NULL,
	cep_local_evento		CHAR(9)		NOT NULL,
	qtd_agendamentos		INTEGER 	DEFAULT 0,	-- Redundante, controle por trigger
	PRIMARY KEY			(id_evento),
	FOREIGN KEY			(id_hemocentro) REFERENCES hemocentro (id_hemocentro) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS agendamento (
	id_agendamento		SERIAL,
	id_doador		INTEGER		NOT NULL,
	id_hemocentro		INTEGER		NOT NULL,
	data_agendamento	DATE		NOT NULL,
	faixa_horario		VARCHAR(255)	NOT NULL,
	id_evento		INTEGER 	NULL,
	observacoes_agendamento VARCHAR(255)    NULL,
	PRIMARY KEY		(id_agendamento),
	FOREIGN KEY		(id_doador) 	REFERENCES doador (id_doador) ON DELETE CASCADE,
	FOREIGN KEY		(id_hemocentro) REFERENCES hemocentro (id_hemocentro) ON DELETE CASCADE,
	FOREIGN KEY		(id_evento)	REFERENCES evento (id_evento) 
);

CREATE OR REPLACE FUNCTION update_qtd() 
RETURNS TRIGGER AS $$
DECLARE
	id_evento_updt INTEGER;
BEGIN
	IF (TG_OP = 'INSERT') THEN
		id_evento_updt = NEW.id_evento;
	ELSE 
		id_evento_updt = OLD.id_evento;
	END IF;
	IF (id_evento_updt IS NOT NULL) THEN
		UPDATE evento SET qtd_agendamentos = ( SELECT COUNT(*) FROM agendamento WHERE id_evento = id_evento_updt ) 
		WHERE id_evento = id_evento_updt;
	END IF; 
	RETURN NULL;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS trigger_updt_qtd ON agendamento;
CREATE TRIGGER trigger_updt_qtd
AFTER INSERT OR DELETE ON agendamento
FOR EACH ROW 
EXECUTE PROCEDURE update_qtd();