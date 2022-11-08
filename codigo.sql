CREATE DATABASE adrenalisa_turismo_e_aventura;

CREATE TABLE cliente
(
id INT NOT NULL,
pacote_turistico_id INT NOT NULL,
pessoa_quantidade INT,
pagamento_forma VARCHAR (255),
FOREIGN KEY (pacote_turistico_id) REFERENCES pacote_turistico (id),
PRIMARY KEY (id)
);

INSERT INTO cliente (id, pacote_turistico_id, pessoa_quantidade, pagamento_forma)
VALUES (1, 7, 10, "Parcelado");

SELECT * FROM cliente;

-- Setor de Marketing --

CREATE TABLE hotel
(
id INT NOT NULL,
sobre VARCHAR (255),
localizacao VARCHAR (255),
quarto_quantidade INT,
classificacao INT,
servico_alimentacao BOOLEAN,
valor_hospedagem FLOAT,
PRIMARY KEY (id)
);

INSERT INTO hotel (id, sobre, localizacao, quarto_quantidade, classificacao, servico_alimentacao, valor_hospedagem)
VALUES (2, "Hotel renomado do Brasil", "São Paulo", 5, 5, 1, 269.99);

SELECT * FROM hotel;

CREATE TABLE operadora_aerea
(
id INT NOT NULL,
nome VARCHAR (255),
trajeto VARCHAR (255),
assento_disponivel INT,
volume_restricao VARCHAR (255),
taxa_embarque FLOAT,
PRIMARY KEY (id)
);

INSERT INTO operadora_aerea (id, nome, trajeto, assento_disponivel, volume_restricao, taxa_embarque)
VALUES (3, "TOM Viagens", "Curitiba - São Paulo", 50, "100m3", 19.99);

SELECT * FROM operadora_aerea;

CREATE TABLE operadora_terrestre
(
id INT NOT NULL,
nome VARCHAR (255),
trajeto VARCHAR (255),
assento_disponivel INT,
assento_minimo INT,
PRIMARY KEY (id)
);

INSERT INTO operadora_terrestre (id, nome, trajeto, assento_disponivel, assento_minimo)
VALUES (4, "Viagemus", "Curitiba - São Paulo", 20, 10);

SELECT * FROM operadora_terrestre;

CREATE TABLE prestador_de_servico
(
id INT NOT NULL,
nome VARCHAR (255),
telefone CHAR (11),
email VARCHAR (255),
cnpj CHAR (14),
nome_servico VARCHAR (255),
descricao VARCHAR (255),
valor FLOAT,
PRIMARY KEY (id)
);

INSERT INTO prestador_de_servico (id, nome, telefone, email, cnpj, nome_servico, descricao, valor)
VALUES (5, "Serviçeiro", 41913429830, "email_01@gmail.com", 12345678910, "serviço_01", "descrição_01", 299.99);

SELECT * FROM prestador_de_servico;

CREATE TABLE atividade
(
id INT NOT NULL,
descricao VARCHAR (255),
tempo DATETIME,
transporte BOOLEAN,
PRIMARY KEY (id)
);

INSERT INTO atividade (id, descricao, tempo, transporte)
VALUES (6, "atividade_01", "2022-11-01 07:30:00", 1);

SELECT * FROM atividade;

-- Setor Administrativo --

CREATE TABLE pacote_turistico
(
id INT NOT NULL,
hotel_id INT NOT NULL,
transporte_aereo_id INT,
transporte_terrestre_id INT,
prestador_de_servico_id INT NOT NULL,
atividade_id INT NOT NULL,
data DATE,
vaga_quantidade INT,
FOREIGN KEY (hotel_id) REFERENCES hotel (id),
FOREIGN KEY (transporte_aereo_id) REFERENCES operadora_aerea (id),
FOREIGN KEY (transporte_terrestre_id) REFERENCES operadora_terrestre (id),
FOREIGN KEY (prestador_de_servico_id) REFERENCES prestador_de_servico (id),
FOREIGN KEY (atividade_id) REFERENCES atividade (id),
PRIMARY KEY (id)
);

INSERT INTO pacote_turistico (id, hotel_id, transporte_aereo_id, transporte_terrestre_id, prestador_de_servico_id, atividade_id, data, vaga_quantidade)
VALUES (7, 2, 3, 4, 5, 6, "2022-12-01", 30);

SELECT * FROM pacote_turistico;
