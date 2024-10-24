CREATE DATABASE IF NOT EXISTS horseflix_db;

USE horseflix_db;

CREATE TABLE IF NOT EXISTS users(
  id VARCHAR(36) PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  phone_number VARCHAR(20) UNIQUE,
  password VARCHAR(255) NOT NULL,
  subscription_id VARCHAR(36) DEFAULT NULL UNIQUE,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS profiles(
  id VARCHAR(36) PRIMARY KEY,
  username VARCHAR(255) NOT NULL,
  avatar_url VARCHAR(255) NOT NULL DEFAULT 'https://placehold.co/64x64',
  restriction BOOLEAN,
  password VARCHAR(5) DEFAULT NULL,
  user_id VARCHAR(36) NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  update_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS movies(
  id VARCHAR(36) PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  description TEXT DEFAULT NULL,
  duration INT NOT NULL,
  restriction BOOLEAN DEFAULT FALSE,
  movie_url TEXT NOT NULL,
  thumbnail_url TEXT NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  update_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS movies_avaliations(
  id VARCHAR(36) PRIMARY KEY,
  movie_id VARCHAR(36) NOT NULL,
  profile_id VARCHAR(36) NOT NULL,
  avaliation ENUM ('ODIEI', 'GOSTEI', 'AMEI') NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  update_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS series(
  id VARCHAR(36) PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  description TEXT NOT NULL,
  temps TINYINT,
  thumbnail_url TEXT,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  update_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS series_avaliations(
  id VARCHAR(36) PRIMARY KEY,
  serie_id VARCHAR(36) NOT NULL,
  profile_id VARCHAR(36) NOT NULL,
  avaliation ENUM ('ODIEI', 'GOSTEI', 'AMEI') NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  update_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS episodes(
  id VARCHAR(36) PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  description TEXT DEFAULT NULL,
  duration INT NOT NULL,
  thumbnail_url TEXT NOT NULL,
  season INT NOT NULL,
  serie_id VARCHAR(36) NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  update_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS subscriptions(
  id VARCHAR(36) PRIMARY KEY,
  address VARCHAR(100) NOT NULL,
  type_id VARCHAR(36) NOT NULL,
  status ENUM('INACTIVE', 'ACTIVE', 'PENDENT') NOT NULL,
  updated_at TIMESTAMP NOT NULL ON UPDATE CURRENT_TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS subscriptions_type(
  id VARCHAR(36) PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  permissions TEXT NOT NULL,
  price FLOAT NOT NULL
);

CREATE TABLE IF NOT EXISTS favorites_movies(
  id VARCHAR(36) PRIMARY KEY,
  movie_id VARCHAR(36) NOT NULL,
  profile_id VARCHAR(36) NOT NULL,
  created_at TIMESTAMP NOT NULL
);

CREATE TABLE IF NOT EXISTS favorites_series(
  id VARCHAR(36) PRIMARY KEY,
  serie_id VARCHAR(36) NOT NULL,
  profile_id VARCHAR(36) NOT NULL,
  created_at TIMESTAMP NOT NULL
);

CREATE TABLE IF NOT EXISTS movies_history(
  id VARCHAR(36) PRIMARY KEY,
  movie_id VARCHAR(36) NOT NULL,
  profile_id VARCHAR(36) NOT NULL,
  watched_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS episodes_history(
  id VARCHAR(36) PRIMARY KEY,
  episode_id VARCHAR(36) NOT NULL,
  profile_id VARCHAR(36) NOT NULL,
  watched_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE profiles ADD FOREIGN KEY (user_id) REFERENCES users(id);

ALTER TABLE movies_avaliations ADD FOREIGN KEY (movie_id) REFERENCES movies(id);
ALTER TABLE movies_avaliations ADD FOREIGN KEY (profile_id) REFERENCES profiles(id);

ALTER TABLE users ADD FOREIGN KEY (subscription_id) REFERENCES subscriptions(id);

ALTER TABLE subscriptions ADD FOREIGN KEY (type_id) REFERENCES subscriptions_type(id);

ALTER TABLE favorites_movies ADD FOREIGN KEY (movie_id) REFERENCES movies(id);
ALTER TABLE favorites_movies ADD FOREIGN KEY (profile_id) REFERENCES profiles(id);

ALTER TABLE favorites_series ADD FOREIGN KEY (serie_id) REFERENCES series(id);
ALTER TABLE favorites_series ADD FOREIGN KEY (profile_id) REFERENCES profiles(id);

ALTER TABLE series_avaliations ADD FOREIGN KEY (serie_id) REFERENCES series(id);
ALTER TABLE series_avaliations ADD FOREIGN KEY (profile_id) REFERENCES profiles(id);

ALTER TABLE episodes ADD FOREIGN KEY (serie_id) REFERENCES series(id);

ALTER TABLE movies_history ADD FOREIGN KEY (movie_id) REFERENCES movies(id);
ALTER TABLE movies_history ADD FOREIGN KEY (profile_id) REFERENCES profiles(id);

ALTER TABLE episodes_history ADD FOREIGN KEY (episode_id) REFERENCES episodes(id);
ALTER TABLE episodes_history ADD FOREIGN KEY (profile_id) REFERENCES profiles(id);


INSERT INTO subscriptions_type(id,name,permissions,price) VALUES
('c53e4eb4-a7f9-443a-9143-d61abccef6d5','Basic','Plano que concede acesso aos conteúdos básicos, com anúncios.',24.99),
('f70e4b0a-0f5c-4658-ad8b-faafc3d090a6','Basic++','Plano que concede acesso aos conteúdos básicos, sem anúncios.',34.99),
('1642edb9-ece7-4e8b-92e2-dacd7a100584','Premium','Plano que concede acesso a todos os conteúdos.',49.99);


INSERT INTO subscriptions(id,address,type_id,status) VALUES
('bc67ab67-bd6c-4a34-93de-eaee0eb613ec','Rua Padre M.T, 87 - Jardim Itatiaia','c53e4eb4-a7f9-443a-9143-d61abccef6d5','INACTIVE'),
('dff424ae-eb2a-4dc0-94c3-7e4b516a564d','Rua dos Santos, 12 - Jardim Botafogo','f70e4b0a-0f5c-4658-ad8b-faafc3d090a6','ACTIVE'),
('ba6a61e7-103c-41be-b9ab-96424902de0f','Avenida Afonso Pena, 1600, Centro','1642edb9-ece7-4e8b-92e2-dacd7a100584','PENDENT');


INSERT INTO users(id,name,email,phone_number,password,subscription_id) VALUES
('e1c2618d-8401-41f3-89bc-1add39e83adf','Celeste','celestino45@gmail.com','+55(67)99264-7836','****************', 'bc67ab67-bd6c-4a34-93de-eaee0eb613ec'),
('d5b4d6b4-a246-4c6b-ba7e-e46f84c6554f','Samuel','samuelbarros@gmail.com','+55(67)99432-8796','**************','dff424ae-eb2a-4dc0-94c3-7e4b516a564d'),
('7531b05b-3157-43f9-835f-55d5a30fefb8','Freitas','freitasdev@gmail.com','.55(67)99620-1475','************','ba6a61e7-103c-41be-b9ab-96424902de0f');


INSERT INTO profiles(id,username,avatar_url,restriction,password,user_id) VALUES
('7714793f-4fab-4ef2-9e7f-d60f92b0a2300','Maicon',DEFAULT,DEFAULT,'***','e1c2618d-8401-41f3-89bc-1add39e83adf'),
('3c99606a-465f-4b90-9149-4012667480ca','Albertinho',DEFAULT,TRUE,'****','d5b4d6b4-a246-4c6b-ba7e-e46f84c6554f'),
('98109d0e-e78f-46f6-9208-fe3e289b47aa','João',DEFAULT,DEFAULT,'*****','7531b05b-3157-43f9-835f-55d5a30fefb8');



INSERT INTO movies (id,title,description,duration,movie_url, thumbnail_url)
VALUES
('1e246ae6-23ff-4b62-afb6-ea4f9ea44af1',
 'Montros SA',
 'Monstros S.A. é a maior fábrica de sustos existente. Localizada em uma dimensão paralela, a fábrica constrói portais que levam os monstros para os   quartos das crianças',
 92,
 'https://movies.com/monstrossa.mp4',
 'https://movies.com/olhogrande.jpg' 
),
(
 '52825412-4fec-4748-a65c-316bc7dada41',
 'A volta dos que não foram',
 'Romance infantojuvenil sobre a amizade de quatro pré-adolescentes cuja história, narrada em primeira pessoa, tem como tema central as questões existenciais vividas nessa faixa etária.',
 120,
 'https://movies.com/osqueforamvoltaram.mp4',
 'https://movies.com/voltar.jpg' 
),
(
 '4b22fc79-614e-40e1-9808-581ebd7842c0',
 'Harry Potter',
 'Harry, por um lado, é um bruxo, sabe criar poções mágicas, voar em vassouras e consegue até ficar invisível. Por outro, é um menino normal. Um pouco tímido, companheiro, tem medos, expectativas e às vezes fica furioso.',
 152,
 'https://movies.com/magicodeoz.mp4',
 'https://movies.com/varina.jpg' 
);



INSERT INTO series (id,title,description,temps, thumbnail_url) VALUES
(
'96149a10-0adf-44b1-9ea3-ac2f23e4f731',
    'Braaking Bad',
    'Breaking Bad é uma série de televisão americana criada e produzida por Vince Gilligan. Ela retrata a vida do químico Walter White, um homem brilhante frustrado em dar aulas para adolescentes do ensino médio enquanto lida com um filho sofrendo de paralisia cerebral, uma esposa grávida e dívidas intermináveis.',
    5,
    'https://series.com/pequenobebe.jpg'
),
(
'e5cca312-40ff-4c77-9ac2-c15f1655ce52',
   'One Piece',
    'Adaptada da série de manga homônima, One Piece é um anime que conta a história do jovem Monkey D. Luffy, que ganhou poderes de borracha depois de comer uma fruta do diabo.',
    1,
    'https://series.com/fruta.jpg'
),
(
   '4e991486-b897-4c1a-a3a2-1c9058e6e760',
   'Gambito da rainha',
    'Em um orfanato nos anos 1950, uma garota-prodígio do xadrez luta contra o vício em uma jornada improvável para se tornar a número 1 do mundo.',
 	2,
  'https://series.com/xadrez.jpg'
);



INSERT INTO episodes (id, title, description, duration, thumbnail_url, season , serie_id) VALUES
(
	'03d9db8c-88cc-4525-aff2-b6ccea5b4da1',
	'Cancer man',
	'Como fazer drogas no porão usando um giz de será',
    32,
    'https://series.com/dogskwai.jpg',
    1,
    '96149a10-0adf-44b1-9ea3-ac2f23e4f731'
),
(
	'521ecf61-6a59-4152-858d-ab76bad0339e',
	'O melhor',
	'Como pegar frutas online',
    58,
    'https://series.com/luffy.jpg',
    1,
    'e5cca312-40ff-4c77-9ac2-c15f1655ce52'

),
(
	'a12d427f-6340-46bb-9684-1c81b4555315',
	'O torneio',
	'O torneio de simnat desencadeia uma maratona de uma viajem',
    58,
    'https://series.com/pilloto.jpg',
    1,
    '4e991486-b897-4c1a-a3a2-1c9058e6e760'
);


INSERT INTO favorites_movies(id,movie_id,profile_id) VALUES
('36f546a4-7653-41cd-897d-545826a39b25','1e246ae6-23ff-4b62-afb6-ea4f9ea44af1','7714793f-4fab-4ef2-9e7f-d60f92b0a2300'),
('043553e5-f684-4118-b329-40bbc47741b0','52825412-4fec-4748-a65c-316bc7dada41','3c99606a-465f-4b90-9149-4012667480ca'),
('87990acf-10fd-4160-950a-4e0d4c87656b','4b22fc79-614e-40e1-9808-581ebd7842c0','98109d0e-e78f-46f6-9208-fe3e289b47aa');

INSERT INTO favorites_series(id,serie_id,profile_id) VALUES
('26d8597d-16f7-40cb-9a8d-6fb6ea17d0d5','96149a10-0adf-44b1-9ea3-ac2f23e4f731','7714793f-4fab-4ef2-9e7f-d60f92b0a2300'),
('af7cde23-c99c-4b10-b3b3-a1ea87619684','e5cca312-40ff-4c77-9ac2-c15f1655ce52','3c99606a-465f-4b90-9149-4012667480ca'),
('a853abcf-e2d1-4caf-83d6-2cb8c74eac40','4e991486-b897-4c1a-a3a2-1c9058e6e760','98109d0e-e78f-46f6-9208-fe3e289b47aa');

INSERT INTO movies_history(id,movie_id,profile_id) VALUES
('02e71505-feef-4a17-833e-6e8ad7e4d31c','1e246ae6-23ff-4b62-afb6-ea4f9ea44af1','7714793f-4fab-4ef2-9e7f-d60f92b0a2300'),
('fbebc353-10cc-4ac1-9512-dce34121b357','52825412-4fec-4748-a65c-316bc7dada41','3c99606a-465f-4b90-9149-4012667480ca'),
('d8e73b63-154c-4ee7-8308-aaf7566e54c6','4b22fc79-614e-40e1-9808-581ebd7842c0','98109d0e-e78f-46f6-9208-fe3e289b47aa');

INSERT INTO episodes_history(id,episode_id,profile_id) VALUES
('e1566388-969e-4d3e-98df-e947bf9fb4d0','03d9db8c-88cc-4525-aff2-b6ccea5b4da1','7714793f-4fab-4ef2-9e7f-d60f92b0a2300'),
('d99ca9ad-5839-4182-b4a6-8a97b925c136','521ecf61-6a59-4152-858d-ab76bad0339e','3c99606a-465f-4b90-9149-4012667480ca'),
('04c548e1-60b8-479f-9e9e-00ae5e2289d9','a12d427f-6340-46bb-9684-1c81b4555315','98109d0e-e78f-46f6-9208-fe3e289b47aa');


INSERT INTO movies_avaliations(id,movie_id,profile_id,avaliation) VALUES
('11593895-49ed-49b9-9992-b33345037072','1e246ae6-23ff-4b62-afb6-ea4f9ea44af1','7714793f-4fab-4ef2-9e7f-d60f92b0a2300','GOSTEI'),
('fdc36db1-9000-4e6a-ae9f-93a311c418b5','52825412-4fec-4748-a65c-316bc7dada41','3c99606a-465f-4b90-9149-4012667480ca','ODIEI'),
('a9488cff-6739-4415-9fda-df57b4f31cec','4b22fc79-614e-40e1-9808-581ebd7842c0','98109d0e-e78f-46f6-9208-fe3e289b47aa','AMEI');

INSERT INTO series_avaliations(id,serie_id,profile_id,avaliation) VALUES
('cdbd357b-ea29-4d6f-8cbc-19a05cf40e5f','96149a10-0adf-44b1-9ea3-ac2f23e4f731','7714793f-4fab-4ef2-9e7f-d60f92b0a2300','GOSTEI'),
('50584a5e-b620-4c05-a0b6-8da4ab72b96b','e5cca312-40ff-4c77-9ac2-c15f1655ce52','3c99606a-465f-4b90-9149-4012667480ca','ODIEI'),
('e9eccb3b-dd40-41dd-abec-d3d73daf5888','4e991486-b897-4c1a-a3a2-1c9058e6e760','98109d0e-e78f-46f6-9208-fe3e289b47aa','AMEI');



