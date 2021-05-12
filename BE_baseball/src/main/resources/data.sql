-- schema.sql 파일은 DDL 스크립트
-- data.sql 파일은 DML 스크립트
use baseball;


-- ----------------------------------------------------------
-- match 관련 데이터
-- ----------------------------------------------------------
DESC `match`;
INSERT INTO `match`(home,away) values
    ('Tigers','Bears'),
    ('Bears','Twins'),
    ('Twins','Dinos'),
    ('Dinos','Lions'),
    ('Lions','Eagles'),
    ('Eagles','Giants'),
    ('Giants','Tigers');
-- ----------------------------------------------------------



-- ----------------------------------------------------------
-- board 관련 데이터
-- ----------------------------------------------------------
-- -- turn 은 둘중하나 TOP/AWAY or BOT/HOME
desc `board`;
INSERT INTO `board`(`match`,`inning`,`turn`,`strike`,`ball`,`out`,`home_point`,`away_point`,`pitcher`,`batter`) values
(1,1,'TOP/AWAY',0,0,0,0,0,'kim','dong'),
(1,1,'TOP/AWAY',1,0,0,0,0,'kim','dong'), -- 1 스트라이크
(1,1,'TOP/AWAY',2,0,0,0,0,'kim','dong'), -- 2 스트라이크
(1,1,'TOP/AWAY',3,0,1,0,0,'kim','dong'), -- 3 스트라이크 , 삼진아웃
(1,1,'TOP/AWAY',0,0,1,0,0,'kim','hun'), -- 타자변경
(1,1,'TOP/AWAY',0,1,1,0,0,'kim','hun'), -- 1 볼
(1,1,'TOP/AWAY',0,2,1,0,0,'kim','hun'), -- 2 볼
(1,1,'TOP/AWAY',1,2,1,0,0,'kim','hun'), -- 2 볼 1스트라이크
(1,1,'TOP/AWAY',0,0,1,0,0,'kim','honux'), -- 앞에서 안타 쳐서 호눅스로 타자변경
(1,1,'TOP/AWAY',1,0,1,0,0,'kim','honux'), -- 앞에서 안타 쳐서 호눅스로 타자변경
(1,1,'TOP/AWAY',2,0,1,0,0,'kim','honux'), -- 앞에서 안타 쳐서 호눅스로 타자변경
(1,1,'TOP/AWAY',3,0,1,0,0,'kim','honux'), -- 앞에서 안타 쳐서 호눅스로 타자변경

(1,1,'BOT/HOME',0,0,0,0,0,'kim','dong'); -- */
select * from board;
-- ----------------------------------------------------------



-- ----------------------------------------------------------
-- team 관련 데이터
-- ----------------------------------------------------------
-- Tigers, Bears, Twins, Dinos, Lions, Eagles, Giants;
DESC `team`;
-- DELETE FROM `team` WHERE team_id = *;
/*
INSERT INTO `team`(`team_id`,`team_name`,`win`,`lose`,`draw`,`victory_point`) values
(1,'Tigers',10,10,2,10*3+2),
(2,'Bears',1,19,2,1*3+2),
(3,'Twins',3,17,2,3*3+2),
(4,'Dinos',5,15,2,5*3+2),
(5,'Lions',7,13,2,7*3+2),
(6,'Eagles',9,11,2,9*3+2),
(7,'Giants',12,8,2,12*3+2);
SELECT * FROM team;

 */

INSERT INTO `team`(`team_name`,`win`,`lose`,`draw`,`victory_point`) values
('Tigers',10,10,2,10*3+2),
('Bears',1,19,2,1*3+2),
('Twins',3,17,2,3*3+2),
('Dinos',5,15,2,5*3+2),
('Lions',7,13,2,7*3+2),
('Eagles',9,11,2,9*3+2),
('Giants',12,8,2,12*3+2);
SELECT * FROM team;

-- ----------------------------------------------------------


-- ----------------------------------------------------------
-- player 관련 데이터
-- ----------------------------------------------------------
DESC `player`;
INSERT INTO `player`(`team_id`, `name`,`uniform_number`,`played_games`,`at_bat`,`hit`,`ball`,`strike`) values
-- 1번 팀 선수
(1,'최동원',411,120,355,1518,111,120),
(1,'이대호',140,720,6454,158,411,201),
(1,'윤학길',229,2200,545,444,112,132),
(1,'손섭',2224,839,144,445,456,485),
(1,'강민호',345,345,123,235,152,98),
(1,'염김종석',247,567,546,346,83,662),
-- 2번팀 선수
(2,'손민한',411,120,355,158,111,1),
(2,'김응국',140,720,645,158,41,201),
(2,'로드리게스',229,200,5445,444,112,132),
(2,'산쵸스',224,839,144,445,456,485),
(2,'효도르',345,3245,123,235,152,998),
(2,'김추찬',2247,567,546,346,823,662),
-- 3번팀 선수
(3,'홍문종',411,120,355,158,111,120),
(3,'박현승',140,720,645,158,411,201),
(3,'페르디난드',229,200,545,444,112,132),
(3,'한영준',224,839,144,445,456,485),
(3,'강병철',345,345,123,235,152,998),
(3,'레일리',247,567,546,346,823,662);


SELECT * FROM `player`;
-- ----------------------------------------------------------