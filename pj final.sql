CREATE DATABASE projetofinalbrendaevellyn;
USE projetofinalbrendaevellyn;

CREATE TABLE playlists (
    idplaylist INT PRIMARY KEY,
    playlist VARCHAR(100)
);

CREATE TABLE genero (
    idgenero INT PRIMARY KEY,
    tipogenero VARCHAR(100)
);

CREATE TABLE artista (
    idartista INT PRIMARY KEY,
    nomeartista VARCHAR(50),
    datadenascimento DATE,
    sexo CHAR(1),
    id_genero INT,
    FOREIGN KEY (id_genero) REFERENCES genero(idgenero)
);

CREATE TABLE album (
    idalbum INT PRIMARY KEY,
    tituloalbum VARCHAR(50),
    anolancamento YEAR,
    id_artista INT,
    FOREIGN KEY (id_artista) REFERENCES artista(idartista)
);

CREATE TABLE musica (
    idmusica INT PRIMARY KEY,
    duracao TIME,
    nomemusica VARCHAR(100),
    id_album INT,
    id_genero INT,
    FOREIGN KEY (id_album) REFERENCES album(idalbum),
    FOREIGN KEY (id_genero) REFERENCES genero(idgenero)
);

CREATE TABLE compositor (
    idcompositor INT PRIMARY KEY,
    nomecompositor VARCHAR(50)
);

CREATE TABLE musica_playlist (
    fk_musica_idmusica INT,
    fk_playlists_idplaylist INT,
    idmusica_playlist INT,
    PRIMARY KEY (fk_musica_idmusica, fk_playlists_idplaylist),
    FOREIGN KEY (fk_musica_idmusica) REFERENCES musica(idmusica),
    FOREIGN KEY (fk_playlists_idplaylist) REFERENCES playlists(idplaylist)
);

CREATE TABLE musica_compositor (
    fk_compositor_idcompositor INT,
    fk_musica_idmusica INT,
    PRIMARY KEY (fk_compositor_idcompositor, fk_musica_idmusica),
    FOREIGN KEY (fk_compositor_idcompositor) REFERENCES compositor(idcompositor),
    FOREIGN KEY (fk_musica_idmusica) REFERENCES musica(idmusica)
);

INSERT INTO genero (idgenero, tipogenero)
VALUES (1, 'Samba'),
       (2, 'MPB'),
       (3, 'Funk'),
       (4, 'Forró'),
       (5, 'Sertanejo'),
       (6, 'Rock Nacional');

INSERT INTO artista (idartista, nomeartista, datadenascimento, sexo, id_genero)
VALUES (1, 'Caetano Veloso', '1942-08-07', 'M', 2),
       (2, 'Marisa Monte', '1967-07-01', 'F', 2),
       (3, 'Anitta', '1993-03-30', 'F', 3),
       (4, 'Wesley Safadão', '1988-09-06', 'M', 4),
       (5, 'Jorge Ben Jor', '1939-03-22', 'M', 1);

INSERT INTO album (idalbum, tituloalbum, anolancamento, id_artista)
VALUES (1, 'Cores, Nomes', 1982, 1),
       (2, 'Mais', 1991, 1),
       (3, 'Memórias, Crônicas e Declarações de Amor', 2000, 2),
       (4, 'Infinito Particular', 2006, 2),
       (5, 'Anitta', 2013, 3),
       (6, 'Bang', 2015, 3),
       (7, 'Garota Safada', 2003, 4),
       (8, 'Vai Esperar', 2007, 4),
       (9, 'Acústico MTV', 2002, 5),
       (10, 'Samba Esquema Novo', 1963, 5);

INSERT INTO musica (idmusica, duracao, nomemusica, id_album, id_genero)
VALUES (1, '04:12:00', 'Tropicália', 1, 2),
    (2, '03:45:00', 'Sozinho', 1, 2),
    (3, '03:20:00', 'Cajuína', 2, 2),
    (4, '05:00:00', 'Alegria, Alegria', 2, 2),
    (5, '04:30:00', 'Odara', 2, 2),
    (6, '04:15:00', 'O Leãozinho', 1, 2),
    (7, '03:40:00', 'A Luz de Tieta', 1, 2),
    (8, '03:55:00', 'Itapuã', 1, 2),
    (9, '03:25:00', 'Sampa', 1, 2),
    (10, '04:10:00', 'Você é Linda', 1, 2),
    (11, '03:15:00', 'Amor I Love You', 3, 2),
    (12, '04:00:00', 'Balança Pema', 3, 2),
    (13, '03:50:00', 'Não é Proibido', 3, 2),
    (14, '03:30:00', 'De Mais Ninguém', 3, 2),
    (15, '03:45:00', 'O Que Se Quer', 3, 2),
    (16, '03:20:00', 'Sou Seu Sabiá', 3, 2),
    (17, '04:05:00', 'Vilarejo', 3, 2),
    (18, '03:55:00', 'Amor I Love You (Acústico)', 3, 2),
    (19, '03:40:00', 'A Sua', 3, 2),
    (20, '04:20:00', 'Gentileza', 3, 2),
    (21, '03:50:00', 'Bang', 5, 3),
    (22, '04:00:00', 'Deixa Ele Sofrer', 5, 3),
    (23, '03:30:00', 'Show das Poderosas', 5, 3),
    (24, '04:15:00', 'Zen', 5, 3),
    (25, '03:40:00', 'Na Batida', 5, 3),
    (26, '04:10:00', 'Sim ou Não', 5, 3),
    (27, '03:55:00', 'Essa Mina é Louca', 5, 3),
    (28, '04:20:00', 'Cravo e Canela', 5, 3),
    (29, '03:45:00', 'Meiga e Abusada', 5, 3),
    (30, '04:00:00', 'Cobertor', 5, 3),
    (31, '03:55:00', 'Camarote', 7, 4),
    (32, '04:05:00', 'A Dama e o Vagabundo', 7, 4),
    (33, '03:30:00', 'Coração Machucado', 7, 4),
    (34, '04:15:00', 'Ar Condicionado no 15', 7, 4),
    (35, '03:50:00', 'Romance Com Safadeza', 7, 4),
    (36, '04:20:00', 'Sonhei Que Tava Me Casando', 7, 4),
    (37, '03:40:00', 'Solteiro de Novo', 7, 4),
    (38, '03:55:00', 'Fala Aqui Com a Minha Mão', 7, 4),
    (39, '04:00:00', 'Só Pra Castigar', 7, 4),
    (40, '03:45:00', 'Não Me Deixe Sozinho', 7, 4),
    (41, '03:50:00', 'Mas Que Nada', 9, 1),
    (42, '03:45:00', 'Chove Chuva', 9, 1),
    (43, '04:20:00', 'Menina Mulher da Pele Preta', 9, 1),
    (44, '03:55:00', 'Fio Maravilha', 9, 1),
    (45, '04:10:00', 'País Tropical', 9, 1),
    (46, '03:45:00', 'Que Maravilha', 9, 1),
    (47, '04:20:00', 'Ponta de Lança Africano (Umbabarauma)', 9, 1),
    (48, '03:55:00', 'Que Pena', 9, 1),
    (49, '04:10:00', 'Cade Tereza', 9, 1),
    (50, '03:50:00', 'Charles, Anjo 45', 9, 1),
    (51, '04:00:00', 'Esse Cara Sou Eu', 10, 5),
    (52, '03:50:00', 'Fui Fiel', 10, 5),
    (53, '03:30:00', 'Camaro Amarelo', 10, 5),
    (54, '04:10:00', 'Te Esperando', 10, 5),
    (55, '03:45:00', 'Largado às Traças', 10, 5),
    (56, '04:20:00', 'Medicina', 10, 5),
    (57, '03:55:00', 'Atrasadinha', 10, 5),
    (58, '04:30:00', 'Jenifer', 10, 5),
    (59, '03:40:00', 'Sosseguei', 10, 5),
    (60, '04:15:00', 'Domingo de Manhã', 10, 5);
INSERT INTO compositor (idcompositor, nomecompositor)
VALUES 
    (1, 'Gilberto Gil'),
    (2, 'Caetano Veloso'),
    (3, 'Carlinhos Brown'),
    (4, 'Chico Buarque'),
    (5, 'Tom Jobim'),
    (6, 'Cazuza'),
    (7, 'Renato Russo'),
    (8, 'Rita Lee'),
    (9, 'Marcelo Camelo'),
    (10, 'Nando Reis');

INSERT INTO playlists (idplaylist, playlist)
VALUES 
    (1, 'Samba Raiz'),
    (2, 'MPB Clássica'),
    (3, 'Funk Carioca'),
    (4, 'Forró Pé de Serra'),
    (5, 'Sertanejo Universitário'),
    (6, 'Rock Nacional');

INSERT INTO musica_playlist (fk_musica_idmusica, fk_playlists_idplaylist)
VALUES 
    (1, 1),
    (2, 1),
    (3, 2),
    (4, 2),
    (5, 3),
    (6, 3),
    (7, 4),
    (8, 4),
    (9, 5),
    (10, 5),
    (11, 1),
    (12, 1),
    (13, 2),
    (14, 2),
    (15, 3),
    (16, 3),
    (17, 4),
    (18, 4),
    (19, 5),
    (20, 5),
    (21, 3),
    (22, 3),
    (23, 4),
    (24, 4),
    (25, 5),
    (26, 5),
    (27, 6),
    (28, 6),
    (29, 1),
    (30, 1),
    (31, 2),
    (32, 2),
    (33, 3),
    (34, 3),
    (35, 4),
    (36, 4),
    (37, 5),
    (38, 5),
    (39, 6),
    (40, 6),
    (41, 3),
    (42, 3),
    (43, 4),
    (44, 4),
    (45, 5),
    (46, 5),
    (47, 6),
    (48, 6),
    (49, 1),
    (50, 1);
    


   
/*Criar 30 queries, 15 com INNER JOIN
● 5 Views
● 5 Procedures
● 3 Usuários com senhas
✔ Usuário com privilégios de CREATE, INSERT
✔ Usuário com privilégios de SELECT
✔ Usuário com privilégios de UPDATE E DROP
● Backup do banco SPOTYMUSIC
● Salvar os scripts das Queries
● Salvar tudo em uma pasta com nome prova e inserir na plataforma.*/

/*Criar 30 queries, 15 com INNER JOIN*/

/*QUERY 01*/
SELECT * FROM album;

/*QUERY 02*/
SELECT * FROM playlists;

/*QUERY 03*/
SELECT * FROM genero;

/*QUERY 04*/
SELECT * FROM artista;

/*QUERY 05*/
SELECT * FROM album;

/*QUERY 06*/
SELECT * FROM musica;

/*QUERY 07*/
SELECT * FROM compositor;

/*QUERY 08*/
SELECT NOMEARTISTA, DATADENASCIMENTO
FROM ARTISTA;

/*QUERY 09*/
SELECT NOMEARTISTA, DATADENASCIMENTO, SEXO, IDARTISTA
FROM ARTISTA
WHERE IDARTISTA = 1;

/*QUERY 10*/
SELECT NOMEMUSICA, DURACAO from MUSICA where DURACAO between '04:10:00'AND'05:00:00';

/*QUERY 11*/
SELECT NOMEARTISTA, SEXO, DATADENASCIMENTO FROM ARTISTA WHERE SEXO ='M';

 
/*QUERY 12*/
SELECT NOMEARTISTA, SEXO FROM ARTISTA WHERE SEXO ='F'; 

/*QUERY 13*/
SELECT SEXO, COUNT(*) AS QUANTIDADE FROM ARTISTA GROUP BY SEXO;


/*QUERY 14*/
SELECT NOMECOMPOSITOR,IDCOMPOSITOR
FROM COMPOSITOR
WHERE NOMECOMPOSITOR = 'CAETANO VELOSO';


/*QUERY 15*/

SELECT *FROM ARTISTA ORDER BY DATADENASCIMENTO;


/*QUERY 16*/
SELECT IDARTISTA, NOMEARTISTA, ANOLANCAMENTO
FROM ARTISTA
INNER JOIN ALBUM
ON IDARTISTA=IDALBUM;

/*QUERY 17*/
SELECT IDARTISTA, NOMEARTISTA, ANOLANCAMENTO, TITULOALBUM
FROM ARTISTA
INNER JOIN ALBUM
ON IDARTISTA=IDALBUM;

/*QUERY 18*/
SELECT IDARTISTA, NOMEARTISTA, ANOLANCAMENTO, IDALBUM, TITULOALBUM
FROM ARTISTA
INNER JOIN ALBUM
ON IDARTISTA=IDALBUM;

/*QUERY 19*/
SELECT IDARTISTA, NOMEARTISTA, ANOLANCAMENTO, IDALBUM, TITULOALBUM,TIPOGENERO
FROM ARTISTA
INNER JOIN ALBUM
ON IDARTISTA=IDALBUM
INNER JOIN GENERO
ON ID_GENERO=IDGENERO;

/*QUERY 20*/
SELECT IDARTISTA, NOMEARTISTA,TITULOALBUM,TIPOGENERO
FROM ARTISTA
INNER JOIN ALBUM
ON IDARTISTA=IDALBUM
INNER JOIN GENERO
ON ID_GENERO=IDGENERO;


/*QUERY 21 */
SELECT IDARTISTA, NOMEARTISTA,TITULOALBUM,TIPOGENERO,NOMEMUSICA
FROM ARTISTA
INNER JOIN ALBUM
ON IDARTISTA=IDALBUM
INNER JOIN GENERO
ON ID_GENERO=IDGENERO
INNER JOIN MUSICA
ON IDALBUM=IDMUSICA;



/*QUERY 22*/
SELECT IDARTISTA, NOMEARTISTA,TITULOALBUM,TIPOGENERO,NOMEMUSICA,DURACAO
FROM ARTISTA
INNER JOIN ALBUM
ON IDARTISTA=IDALBUM
INNER JOIN GENERO
ON ID_GENERO=IDGENERO
INNER JOIN MUSICA
ON IDALBUM=IDMUSICA;


/*QUERY 23*/
SELECT IDARTISTA,IDALBUM,IDGENERO,IDMUSICA
FROM ARTISTA
INNER JOIN ALBUM
ON IDARTISTA=IDALBUM
INNER JOIN GENERO
ON ID_GENERO=IDGENERO
INNER JOIN MUSICA
ON IDALBUM=IDMUSICA;

/*QUERY 24*/
SELECT IDARTISTA, NOMEARTISTA,TITULOALBUM,TIPOGENERO,NOMEMUSICA,DURACAO,PLAYLIST
FROM ARTISTA
INNER JOIN ALBUM
ON IDARTISTA=IDALBUM
INNER JOIN GENERO
ON ID_GENERO=IDGENERO
INNER JOIN MUSICA
ON IDALBUM=IDMUSICA
INNER JOIN PLAYLISTS
ON IDPLAYLIST=IDALBUM;

/*QUERY 25*/
SELECT NOMEARTISTA,TITULOALBUM,TIPOGENERO,NOMEMUSICA,DURACAO,PLAYLIST,IDPLAYLIST
FROM ARTISTA
INNER JOIN ALBUM
ON IDARTISTA=IDALBUM
INNER JOIN GENERO
ON ID_GENERO=IDGENERO
INNER JOIN MUSICA
ON IDALBUM=IDMUSICA
INNER JOIN PLAYLISTS
ON IDPLAYLIST=IDALBUM;

/*QUERY 26*/
SELECT IDARTISTA,IDALBUM,IDGENERO,IDMUSICA,IDPLAYLIST
FROM ARTISTA
INNER JOIN ALBUM
ON IDARTISTA=IDALBUM
INNER JOIN GENERO
ON ID_GENERO=IDGENERO
INNER JOIN MUSICA
ON IDALBUM=IDMUSICA
INNER JOIN PLAYLISTS
ON IDPLAYLIST=IDALBUM
WHERE IDALBUM=2;

/*QUERY 27*/
SELECT NOMEARTISTA,IDARTISTA,SEXO, NOMEMUSICA
FROM ARTISTA
INNER JOIN ALBUM
ON IDARTISTA=IDALBUM
INNER JOIN GENERO
ON ID_GENERO=IDGENERO
INNER JOIN MUSICA
ON IDALBUM=IDMUSICA;

/*QUERY 28*/
SELECT NOMEARTISTA,IDARTISTA,SEXO, NOMEMUSICA
FROM ARTISTA
INNER JOIN ALBUM
ON IDARTISTA=IDALBUM
INNER JOIN GENERO
ON ID_GENERO=IDGENERO
INNER JOIN MUSICA
ON IDALBUM=IDMUSICA
WHERE IDARTISTA=1;

/*QUERY 29*/
SELECT NOMEARTISTA,IDARTISTA,SEXO, NOMEMUSICA
FROM ARTISTA
INNER JOIN ALBUM
ON IDARTISTA=IDALBUM
INNER JOIN GENERO
ON ID_GENERO=IDGENERO
INNER JOIN MUSICA
ON IDALBUM=IDMUSICA
WHERE IDMUSICA=5;

/*QUERY 30*/
SELECT IDARTISTA,IDALBUM,IDGENERO,IDMUSICA,IDPLAYLIST
FROM ARTISTA
INNER JOIN ALBUM
ON IDARTISTA=IDALBUM
INNER JOIN GENERO
ON ID_GENERO=IDGENERO
INNER JOIN MUSICA
ON IDALBUM=IDMUSICA
INNER JOIN PLAYLISTS
ON IDPLAYLIST=IDALBUM;



/*1-view das músicas, álbuns e artistas ● 5 Views*/
CREATE VIEW vw_detalhes_musicas AS
SELECT
    m.idmusica AS Id_Musica,
    m.nomemusica AS Nome_Musica,
    m.duracao AS Duracao,
    a.idalbum AS Id_Album,
    a.tituloalbum AS Titulo_Album,
    a.anolancamento AS Ano_Lancamento,
    ar.idartista AS Id_Artista,
    ar.nomeartista AS Nome_Artista,
    ar.datadenascimento AS Data_Nascimento_Artista,
    ar.sexo AS Sexo_Artista,
    g.idgenero AS Id_Genero,
    g.tipogenero AS Tipo_Genero
FROM musica m
INNER JOIN album a ON m.id_album = a.idalbum
INNER JOIN artista ar ON a.id_artista = ar.idartista
INNER JOIN genero g ON m.id_genero = g.idgenero;

SELECT *
FROM vw_detalhes_musicas;

/* 2- view das músicas, álbuns, artistas e playlists*/
CREATE VIEW vw_detalhes_musicas_playlists AS
SELECT
    m.idmusica AS Id_Musica,
    m.nomemusica AS Nome_Musica,
    m.duracao AS Duracao,
    a.idalbum AS Id_Album,
    a.tituloalbum AS Titulo_Album,
    a.anolancamento AS Ano_Lancamento,
    ar.idartista AS Id_Artista,
    ar.nomeartista AS Nome_Artista,
    ar.datadenascimento AS Data_Nascimento_Artista,
    ar.sexo AS Sexo_Artista,
    g.idgenero AS Id_Genero,
    g.tipogenero AS Tipo_Genero,
    p.idplaylist AS Id_Playlist,
    p.playlist AS Nome_Playlist
FROM musica m
INNER JOIN album a ON m.id_album = a.idalbum
INNER JOIN artista ar ON a.id_artista = ar.idartista
INNER JOIN genero g ON m.id_genero = g.idgenero
INNER JOIN musica_playlist mp ON m.idmusica = mp.fk_musica_idmusica
INNER JOIN playlists p ON mp.fk_playlists_idplaylist = p.idplaylist;

SELECT *
FROM vw_detalhes_musicas_playlists;


/* 3- view artista, álbuns, genero*/
CREATE VIEW VWARTISTA_MUSICA AS 
SELECT NOMEARTISTA,IDARTISTA,SEXO, NOMEMUSICA
FROM ARTISTA
INNER JOIN ALBUM
ON IDARTISTA=IDALBUM
INNER JOIN GENERO
ON ID_GENERO=IDGENERO
INNER JOIN MUSICA
ON IDALBUM=IDMUSICA;
SELECT *FROM VWARTISTA_MUSICA;

/* 4- view artista, álbuns*/

CREATE VIEW VW_ARTISTA_ALBUM AS
SELECT IDARTISTA, NOMEARTISTA, ANOLANCAMENTO
FROM ARTISTA
INNER JOIN ALBUM
ON IDARTISTA=IDALBUM;

SELECT *FROM VW_ARTISTA_ALBUM;

/* 5- view artista e musica onde id artista seja 1 */
CREATE VIEW VIEW_ART AS
SELECT NOMEARTISTA,IDARTISTA,SEXO, NOMEMUSICA
FROM ARTISTA
INNER JOIN ALBUM
ON IDARTISTA=IDALBUM
INNER JOIN GENERO
ON ID_GENERO=IDGENERO
INNER JOIN MUSICA
ON IDALBUM=IDMUSICA
WHERE IDARTISTA=1;

SELECT *FROM VIEW_ART;



/*procedures 1 */
DELIMITER //

CREATE PROCEDURE sp_consultar_playlists_por_artista (
    IN p_id_artista INT
)
BEGIN
    SELECT DISTINCT pl.idplaylist, pl.playlist
    FROM playlists pl
    INNER JOIN musica_playlist mp ON pl.idplaylist = mp.fk_playlists_idplaylist
    INNER JOIN musica m ON mp.fk_musica_idmusica = m.idmusica
    INNER JOIN album al ON m.id_album = al.idalbum
    WHERE al.id_artista = p_id_artista;
END //

DELIMITER ;

CALL sp_consultar_playlists_por_artista(1);

/*procedures 2 */
DELIMITER //

CREATE PROCEDURE ListAllArtists ()
BEGIN
    SELECT idartista, nomeartista, datadenascimento, sexo, g.tipogenero AS genero
    FROM artista a
    INNER JOIN genero g ON a.id_genero = g.idgenero;
END//

DELIMITER ;

call ListAllArtists;


/*procedures 3 */
DELIMITER //

CREATE PROCEDURE ListarTodosGeneros ()
BEGIN
    SELECT idgenero, tipogenero
    FROM genero;
END//

DELIMITER ;
call ListarTodosGeneros;

/*procedures 4 */
DELIMITER //

CREATE PROCEDURE BuscarArtistaPorNome (
    IN nome_artista VARCHAR(50)
)
BEGIN
    SELECT idartista, nomeartista, datadenascimento, sexo, g.tipogenero AS genero
    FROM artista a
    INNER JOIN genero g ON a.id_genero = g.idgenero
    WHERE a.nomeartista LIKE CONCAT('%', nome_artista, '%');
END//

DELIMITER ;
call BuscarArtistaPorNome('Wesley Safadao');

/*procedures 5 */
DELIMITER //

CREATE PROCEDURE ContarMusicasPorGenero ()
BEGIN
    SELECT g.tipogenero AS genero, COUNT(m.idmusica) AS numero_musicas
    FROM genero g
    LEFT JOIN musica m ON g.idgenero = m.id_genero
    GROUP BY g.tipogenero;
END//

DELIMITER ;
call ContarMusicasPorGenero;

-- Criar o primeiro usuário
CREATE USER 'usuario1'@'localhost' IDENTIFIED BY 'senha123';

-- Criar o segundo usuário
CREATE USER 'usuario2'@'localhost' IDENTIFIED BY 'senha1234';

-- Criar o terceiro usuário
CREATE USER 'usuario3'@'localhost' IDENTIFIED BY 'senha12345';


GRANT CREATE ON projetofinalbrendaevellyn.* TO 'usuario1'@'localhost';
GRANT INSERT ON projetofinalbrendaevellyn.* TO 'usuario1'@'localhost';


GRANT SELECT ON projetofinalbrendaevellyn.* TO 'usuario2'@'localhost';

GRANT UPDATE ON projetofinalbrendaevellyn.* TO 'usuario3'@'localhost';
GRANT DROP ON projetofinalbrendaevellyn.* TO 'usuario3'@'localhost';








