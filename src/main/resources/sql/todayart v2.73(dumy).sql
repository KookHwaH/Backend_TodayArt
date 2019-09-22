# Todayart v2.73
/*
[v1.3]
    - 모든 테이블에 default now() -> default current_timestamp로 변경
    - order -> ordered 문자열 변경
    - member_role, role : 테이블 삭제
    - member : authority 컬럼 삭제, role 컬럼 추가
    - ordered_detail : 컬럼 추가
        > `product_name` varchar(255) not null
        > `product_size` varchar(255) not null
        > `shipping_fee` int not null
    - payment : 컬럼추가
        > `refund_comment` varchar(255) comment "환불 사유"
    - shipping_items : 테이블 추가
    - shipping : 컬럼 추가
        > `tracking_number` varchar(255) null
        > `shipping`
[v1.4]
    - 모든 테이블 primary key 지정
    - 복합키 삭제, auto_increament 로 대체
    - shipping_items 테이블 추가
    - update_log 테이블 추가
    - ordered_detail track_number 컬럼 추가
    - ordered_datail status 옵션 추가
[v1.5]
    - 테이블 간 관계 연결 완료
[v1.51]
	  - 더미데이터 추가
      > 몇 칼럼 자료형을 enum 으로 변경
[v1.52]
	  - mileage_invoice : 컬럼추가
        > `is_delete` INT(11) NOT NULL DEFAULT 0 COMMENT '0: 미삭제, 1: 삭제'
      - 더미데이터 추가
[V1.53]
	- ordered 에 감추기용 isHidden 컬럼 추가(DELETE 기능 대신)
[V1.55]
	- 더미데이터 수정/추가
    - cart 테이블 전체적인 구조 수정
    - member_address 테이블 post_code -> postal_code 변경
    - payment 테이블 pg_number 추가
    - shiping 테이블 postal_code 추가
    - shipping_items 테이블 status 컬럼 enum 타입으로 변경
[V1.56]
	- file : 컬럼 명 변경
    > file_ip -> file_upload_ip
  - product : 컬럼 추가
    > `product_content` TEXT NOT NULL
[V1.57]
	- file : 컬럼 추가
    > `file_content_type` VARCHAR(255) NULL
[v1.58]
	- ordered_detail : 컬럼추가
    > `total_product_price` int null
    - ordered_detail : 컬럼순서변경
    - file : 더미데이터 수정
    >`file_content_type` insert 문에 임시로 null 값 추가
[V1.59]
  - file : 컬럼 제거 및 컬럼 변경
    * 제거
        > `file_type` VARCHAR(255) NULL DEFAULT NULL,
    * 변경
        > `file_size` BIGINT NOT NULL DEFAULT '0',
        > `file_name` VARCHAR(255) NOT NULL UNIQUE KEY,
  - 더미데이터 수정
[V1.6]
	- artist : 컬럼 추가
    > `artist_name` VARCHAR(255) NOT NULL
[v.1.61]
	- payment : 컬럼변경
    > `product_id` -> `ordered_detail_id`
    > `pay_price` -> `order_detail_price`
    > `total_price` -> `total_order_price`
    - 관련 데이터 수정
[V1.62]
	- shipping : 컬럼 추가
    > `is_delete` INT(11) NOT NULL DEFAULT '0' COMMENT '0:미삭제, 1:삭제',
[V1.63]
    - shipping : 컬럼 수정
        > `consignee_phone` VARCHAR(255) NOT NULL,
[V1.64]
	- wishlist 테이블 전체적인 구조 수정
		> `artist_name` varchar(255) not NULL
		> `thumbnail_id` INT(11) NOT NULL
		> `product_price` int not null
		> `product_size` varchar(255) not null
		> `is_deleted` int(11) not null default 0 comment '0: not deleted, 1: deleted '
		> `is_stock` INT(11) NOT NULL DEFAULT 1 COMMENT '0:재고없음, 1:재고있음'
    - wishlist 더미데이터 수정/추가
[V1.65]
    - artist : 컬럼 추가, fk 추가
        > `adm_product_image` INT(11) NOT NULL,
        > INDEX `fk_artist_file_idx2` (`adm_product_image` ASC) VISIBLE,
        >   CONSTRAINT `fk_artist_file2`
            FOREIGN KEY (`adm_product_image`)
            REFERENCES `todayart`.`file` (`file_id`)
            ON DELETE NO ACTION
            ON UPDATE CASCADE)
    - 더미데이터 수정
    
[V1.66]
	-member : UK추가
		  UNIQUE KEY (`email`),
		  UNIQUE KEY (`nickname`)
	-artist : 컬럼 추가
	  `adm_apply_dated` DATETIME NOT NULL, // 신청일
	  `adm_check_dated` DATETIME NULL DEFAULT NULL, // 승인,거부 일자
      
[V1.67]
	- product 컬럼 추가
		>`artist_name` VARCHAR(255) NOT NULL
[V1.68]
	- product: 더미데이터 수정
[V1.69]
	- member: 컬럼명 변경 (username -> realname)
[V1.7]
  - member: 더미데이터 수정
[V1.71]
- artist: 컬럼 추가 및 더미데이터 수정
> `artist_contact` VARCHAR(255) NOT NULL,
[v1.8]
  - pg_kakaopay 테이블 추가
  - payment 컬럼 수정
		> `pg_number` varchar(30)
[v2.0]
	- 스키마에서 true/false 용으로 쓰던 0/1 을 모두 'y'/'n' 으로 변경
    
[v2.1]
    - article 테이블 수정
    - article 더미데이터 추가
    - boardcategory 디폴트 값 추가
    - comment 테이블 생성(article테이블에 있던 order,depth,group을 comment테이블로 이동)
[v2.2]
  - email_verify 테이블 추가
[v2.3]
  - email_verify : 컬럼 수정
	>   `verify_text` TEXT not NULL,
    
[v2.4]
	- member_address: 컬럼 수정, 추가
		> postal_number char(5) no null -> postal_number char(5) not null
		>`consignee` VARCHAR(255) NOT NULL
		>`consignee_phone` VARCHAR(255) NOT NULL
	- shipping : 컬럼 수정
		> postal_number INT null -> postal_number char(5)
        
[v2.5]
   - comments:컬럼 수정
      >group,order  -> reply_group,reply_order

[v2.6]
	- product: 더미데이터 추가/수정,
    - file: 더미데이터 추가/수정
    
[v2.61]
	-article: 더미데이터 추가/수정,
    -board: 더미데이터 추가/수정
    
[v2.62]
	- product: 더미데이터 수정,
    - category: insert문 추가/수정
수정->   INSERT INTO `todayart`.`category` VALUE(1, '서양화');
		INSERT INTO `todayart`.`category` VALUE(2, '동양화');
추가->	INSERT INTO `todayart`.`category` VALUE(3, '기타');

[v2.63]
	- comment테이블명 comments로 변경
    - boardcartegory테이블 board_name 기본 값 "게시판"으로 변경
    
[v2.64]
	- wishlist에서 thumbnailId 삭제 

[v2.65]
	- wishlist 더미데이터 오류 수정 

[v2.66]
	- member_address : 컬럼 추가
    > `is_delete`CHAR(1) NOT NULL DEFAULT 'n' COMMENT 'n:미삭제, y:삭제',
[v2.67]
	- member_address : 컬럼 추가
    > `consignee` varchar(255)null comment '대표수령인'
    > `consignee_phone` varcher(255) null comment '대표연락처'
[v2.69]
	- product table에 remain컬럼 default 값 수정 
    > `remain` INT(11) NOT NULL DEFAULT '1'
    
[v2.7]
- shipping : 제약조건 수정(artist 가 member랑 연결되어있는부분 artist와 연결되게 변경)

[v2.71]
- 더미 데이터 추가

[v2.73]
- product : 더미데이터 수정
	> product_name 중 _ 가 들어가는 부분 띄어쓰기 또는 : 로 변경
*/

-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema todayart
-- -----------------------------------------------------

DROP DATABASE IF EXISTS `todayart`;
 
CREATE DATABASE IF NOT EXISTS `todayart`
  DEFAULT CHARACTER SET utf8
  DEFAULT COLLATE utf8_general_ci;
 
CREATE USER IF NOT EXISTS 'art_master'@'%' IDENTIFIED BY 'art12#$';
 
GRANT ALL PRIVILEGES ON todayart.* To 'art_master'@'%';
 
USE `todayart`;

-- -----------------------------------------------------
-- Table `todayart`.`member`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `todayart`.`member` (
  `member_id` INT(11) NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `nickname` VARCHAR(255) NOT NULL,
  `realname` VARCHAR(255) NULL DEFAULT NULL,
  `reg_dated` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `phone` VARCHAR(255) NULL DEFAULT NULL,
  `role` ENUM('ROLE_ADMIN', 'ROLE_CUSTOMER', 'ROLE_ARTIST') NOT NULL DEFAULT 'ROLE_CUSTOMER',
  `last_connect_dated` DATETIME NULL DEFAULT NULL,
  `expired` CHAR(1) NOT NULL DEFAULT 'n',
  `expired_dated` DATETIME NULL DEFAULT NULL,
  `email_checked` CHAR(1) NOT NULL DEFAULT 'n',
  PRIMARY KEY (`member_id`),
  UNIQUE KEY (`email`),
  UNIQUE KEY (`nickname`))
ENGINE = InnoDB
AUTO_INCREMENT = 10003
DEFAULT CHARACTER SET = utf8;
 
INSERT INTO member VALUE(1, "admin@admin.com", "8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918", "admin", "admin", now(), "01012345678", "ROLE_ADMIN", now(), 'n', null, 'y');
INSERT INTO member VALUE(10001, "artist@artist.com", "70b1e8e06785cae451496104850781f33faf6cc8e0777ecd3a9ccaaefb154b2d", "목란", "artist", now(), "01012345678", "ROLE_ARTIST", now(), 'n', null, 'y');
INSERT INTO member VALUE(10002, "artist2@artist.com", "70b1e8e06785cae451496104850781f33faf6cc8e0777ecd3a9ccaaefb154b2d", "홍원", "artist2", now(), "01012345678", "ROLE_ARTIST", now(), 'n', null, 'y');
INSERT INTO member VALUE(10003, "artist3@artist.com", "70b1e8e06785cae451496104850781f33faf6cc8e0777ecd3a9ccaaefb154b2d", "향미", "artist3", now(), "01012345678", "ROLE_ARTIST", now(), 'n', null, 'y');
INSERT INTO member VALUE(10004, "artist4@artist.com", "70b1e8e06785cae451496104850781f33faf6cc8e0777ecd3a9ccaaefb154b2d", "도원", "artist4", now(), "01012345678", "ROLE_ARTIST", now(), 'n', null, 'y');
INSERT INTO member VALUE(10005, "artist5@artist.com", "70b1e8e06785cae451496104850781f33faf6cc8e0777ecd3a9ccaaefb154b2d", "난향", "artist5", now(), "01012345678", "ROLE_ARTIST", now(), 'n', null, 'y');
INSERT INTO member VALUE(10006, "artist6@artist.com", "70b1e8e06785cae451496104850781f33faf6cc8e0777ecd3a9ccaaefb154b2d", "열빈", "artist6", now(), "01012345678", "ROLE_ARTIST", now(), 'n', null, 'y');
INSERT INTO member VALUE(10007, "artist7@artist.com", "70b1e8e06785cae451496104850781f33faf6cc8e0777ecd3a9ccaaefb154b2d", "태원", "artist7", now(), "01012345678", "ROLE_ARTIST", now(), 'n', null, 'y');
INSERT INTO member VALUE(8888, "artist88@artist.com", "70b1e8e06785cae451496104850781f33faf6cc8e0777ecd3a9ccaaefb154b2d", "무명", "artist8", now(), "01012345678", "ROLE_CUSTOMER", now(), 'n', null, 'y');
INSERT INTO member VALUE(88, "kimyp@naver.com", "70b1e8e06785cae451496104850781f33faf6cc8e0777ecd3a9ccaaefb154b2d", "다함", "김정유", now(), "01012345678", "ROLE_CUSTOMER", now(), 'n', null, 'y');

-- -----------------------------------------------------
-- Table `todayart`.`artist_level`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `todayart`.`artist_level` (
  `artist_level_id` INT(11) NOT NULL AUTO_INCREMENT,
  `level` VARCHAR(10) NOT NULL DEFAULT 'Bronze',
  `commission` INT(11) NOT NULL DEFAULT '15',
  PRIMARY KEY (`artist_level_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

INSERT INTO `todayart`.`artist_level` VALUE(1, 'Bronze', 15);

-- -----------------------------------------------------
-- Table `todayart`.`file`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `todayart`.`file` (
  `file_id` INT(11) NOT NULL AUTO_INCREMENT,
  `file_origin_name` VARCHAR(255) NOT NULL,
  `file_name` VARCHAR(255) NOT NULL UNIQUE KEY,
  `file_size` BIGINT NOT NULL DEFAULT '-1',
  `file_reg_dated` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `file_upload_ip` VARCHAR(255) NULL DEFAULT NULL,
  `member_id` INT(11) NOT NULL,
  `file_content_type` VARCHAR(255) NULL,
  PRIMARY KEY (`file_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (1,'Osnat_A Night Out.jpg','9e8b8ca6c385e2aa415b1c9cefc53483f166a830cb368c3b73a4329bb31bf7b9',151022,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10001,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (2,'Osnat_abstract-nude-art-male-acrylic-figure-study-original-painting-etsy-figure-painting-acrylic.jpg','5d565b82551e747de385e341888ee55c6d6c8cec90e1a91cec30c74000088ac9',47673,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10002,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (3,'Osnat_Roots.jpg','c66c5c77d6f20469ef765d154f4a2fb575a599316dfbb2687a82be8061508565',140029,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10003,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (4,'고갱_Portrait de lartiste par lui-même.jpg','936c85deba59e28bb4d5672dae813b34181e7b220cb5bd9ce22a9046eea7ef09',128522,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10004,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (5,'렘브란트_자화상.jpg','bbcd2aa2ec169e1eba4a13ee62e98f8066a51560a6a483d4440ffdcaf9a6dd58',29940,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10005,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (6,'렘브란트_자화상2.jpg','a5255bdbccb1829eb65f5f6c7ed1442d7ff675f2cc2d008071da6d77a7792e88',103968,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10006,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (7,'마티스_Jacqueline with Flowers.jpg','d2f773959366b8dec66204d887d5b3b2b8ca366df8018ff29b5b5252a270510f',26322,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10007,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (8,'마티스_Le Rifain assis (Seated Riffian).jpg','2002b914657fb4d3e521d3f3a4e7a6c530825c20ba204032dc693b125e05c1b3',89438,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10001,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (9,'마티스_The Purple Robe.jpg','c7ffd4cd7c01d5eaf5f04d5b1a72686cebb1421736e525d0eb04056508d5e4bf',94737,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10002,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (10,'마티스_Woman With Hat.jpg','9b31b0e7d4ef07f78baa635ccc5b585fda8a714cfa7767fbf77bf58920733347',117181,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10003,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (11,'모네_산책하는사람들.jpg','27686bfac5d9004b76a3b6f6ba9f37792dcf51769573e2f0853b054443f0da99',189773,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10004,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (12,'모네_양산을든부인.jpg','2319509d0068ca8f622f4521eb864779adcf29550a52f768a505542845bacad1',201050,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10005,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (13,'반고흐-밀집모자를쓴자화상(1888).jpg','1c1a6342551115ca7668edaf33101983ffed3a1aa42397c9a2ead4c92f899fae',32717,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10006,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (14,'천경자_1983_괌도에서.jpg','82faa970b5e2932cc8f254e554cf5e9bca81304d83891ecb6add405bc5749b03',97206,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10007,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (15,'티치아노[Tiziano Vecellio] [자화상] Self-Portrait.jpg','7e06c7a3123341dbc8fbf61047bf774a8c4a87c22da56a2b4fe7c634bb1de333',33018,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10001,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (16,'폴 고갱_Self portrait at Lezaven.jpg','17c06c2fb237ab459092a605c44446713119da596a3ad086e164b3171d5c204f',151146,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10002,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (17,'폴고갱_Self-Portrait with Halo.jpg','22053d7436969b4ab32a9da0d4182f58ac026ac0710ed381ac44611886f1c2f6',83391,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10003,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (18,'프리다 칼로_보니토새들과 함께한 자화상.jpg','6fa901531f8fcd7eebc5ffb8e5bfbdca39e49bf6bbde47c3751e53cb3d765062',57103,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10004,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (19,'프리다 칼로_엘로서 박사에게 보낸 자화상.jpg','60ef5870628620db7d1e2a49426abf41bd04f2bb9e8ff1d02ffbf4956080bd89',159792,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10005,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (20,'피카소_Maya with a Doll.jpg','899fbeaaff8eb95d8066699767bc71b262c12c7f016309d89bb27b3a0e5779d0',21317,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10006,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (21,'피카소_The Peasant.jpg','3a2e205e40bff91c07f71f8883b1a2779811880740f69f22d627accee6b3ce52',21152,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10007,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (22,'피카소_Three Dancers.jpg','e9571f9cf7915784efb2427d8d0b0f01e51430e59f56d41e417789071693998c',29227,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10001,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (23,'피카소_Weeping Woman.jpg','0c5a8ec4f165d5ad68edb7b08158998e300074c8e538105629a83b200cac9ce4',46526,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10002,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (24,'피카소_Woman with a Chignon.jpg','d6bd1e5d9409ab83f7c20466cad69b9c5295e21a65a238f04f6a0c16298309ac',21415,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10003,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (25,'피카소_Woman with a Flower.jpg','47e303028a4c7e35d5582b190d8b3c62837d353647f30fae62ca3719718fbd89',20554,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10004,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (26,'피카소_Young Tormented Girl.jpg','1973dfb688036d3370e30ead029e053baa8f24d4565130262365b8a72716d429',21284,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10005,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (27,'14.바닥에 앉아 있는 난쟁이.jpg','44af3ce7b4e64f6d5161de9740882cfa5334676453bfa76f9746a4f105ca1146',107067,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10006,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (28,'749e468dff8e4e0bb0c75efdf75e20a7.jpg','8b574ffe8fec75887c47673d4fb6d8b94b066e0ba1128fb65527d9d700bbd564',57047,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10007,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (29,'2015040611868_0.jpg','d75bac74352d0cf989a5b2143633760897a1b9025b3d9a228f23ab5488fe631b',121156,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10001,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (30,'Bildnis Freda Wermel in blauer bluse.jpg','a78f9fd40b2903d873e171078951d3230bfab6a7e9e0daaa8f062c9da97d42b9',90607,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10002,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (31,'Cellospieler, Bildnis Dr. Freundlich.jpg','76c158463fac2adddeff5ee59db774673a72c3e0a776828f10fc9c80862594bc',117870,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10003,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (32,'dancer.jpg','48e58a966b07c3697a039d853bf21c59118eaba3094837d0d4528f0cefde974b',61427,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10004,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (33,'YellowMask.jpg','84ad094ca1b7eaf8e5072b6bd6c29cf12f7a3a0d3c9a2373760183bd7dd07e1d',99046,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10005,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (34,'마리세잔의 초상화.jpg','31c5efaf51dbf9d48d340fcd0d8732ff6b7fbad5b21074add3e4d195b4ce662a',209012,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10006,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (35,'무용시험.jpg','28d909128bbfea26ab0a16c96c88b5ada1b6c9f879f09a7a39a7e79094180bb1',64385,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10007,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (36,'밀레_양치는_소녀.jpg','40edb82b26edbd648af8a85392d94b0514b179f37b0227a488d055e9c9b31d6c',67923,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10001,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (37,'서서_실잣는_여인_밀레.jpg','da921116d44fca80442d74e333fde13c031d391687cc3b959891554c95eb9f45',80996,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10002,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (38,'오베르의 초상화.jpg','c2f9ef5f594db1d67be67f3f8a8937d00db0309d476023e98b5ea57a2f2875b2',96555,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10003,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (39,'중절모신사.jpg','ea35c8cb0adbdb35be4c5e91a4d686870f01cd366ac47e046c44572828110cfe',104194,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10004,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (40,'파이프를 문 남자.jpg','ae0970b1141f5d1728c6b2a02f2d5a857e9de467c645fa9631b79289af6e8de1',54990,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10005,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (41,'679.Mahana_Maa_I_Aka_The_Moment_Of_Truth_I.jpg','f4f7ca404477f4ca2c3076f8e2201d979257d545f3753bf765a3da62267dfe8a',93137,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10006,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (42,'765.Cabin_Under_The_Trees.jpg','581ea9a65b43979e5e3cc9c156ea5450e5bee45717b4cad2af4cd5c03992e9c1',124210,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10007,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (43,'768.Around_The_Huts.jpg','c3d6fd6a1904f5308b62fc152fa6cf2be99754dab45e6bbe7a93a073bc1af9b8',102915,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10001,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (44,'799.타히티 풍경.jpg','fd1567e773d958536c342f02699f87e4698b6a554aa9829b8d722dcab3e45d54',132170,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10002,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (45,'889.Children_In_The_Pasture_Aka_Orchard_Below_Bihorel_Church.jpg','bc0ccac9762cc4c060b9d34429b885c143512442160103999b4fc8fac2ff18d5',165464,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10003,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (46,'901.포플러.jpg','31cebb72642fa9e798bd9da076b00f4cb59e848eb74aa90a4f88314a2b10fded',143313,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10004,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (47,'9948F7405C8F0A0E17.jpg','fd95c2230b8254509df5f882b200f99527df211842ff2dcf6a45ba56e579b717',132985,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10005,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (48,'Another day.jpg','27528e4ea7745f3aa0626ae8ddaf4631638925a712f2601ca0b1a923c4127524',62530,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10006,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (49,'Bird on a Tree ( L oiseau ).jpg','613062be1a305048eb788f4d2ad5fddf8cfad72fa0bd734ea2762b566b314ee0',137806,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10007,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (50,'붉은탑.jpg','6d6268319edae8408801878e1b1170efd150f2678b004ce978c5764f6bdcf9a1',124753,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10001,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (51,'La-Torre-Eiffel.jpg','6e935bd78da2429456d5a37c8cb0be27c7db2fa273780efbc365b6225a382103',82390,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10002,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (52,'Malven_I_(Hollyhocks_I).jpg','f999a35d6be6726a8ec99bb736c99e81934508a3eb943c70c488e5412fc60d5a',194649,'2019-08-28 11:16:04','0:0:0:0:0:0:0:3',10001,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (53,'Nicholas Cvn Road','ffda7a87fdc99d70ab466d09b37742fa72500663467ed0159dc84f58ededc371',105560,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10004,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (54,'Sensitivity of Memory.jpg','ec31fbe7e3b437daa89f49b071cd9b47adab027b4c88fa20ce66687b5fd1193b',65762,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10005,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (55,'계단길.jpg','8bc39ab588e39ee22515addc4c86ebb5b3e38d0327a14f776442aaed64be5356',106857,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10006,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (56,'Road with Cypresses.jpg','e5d4c6d0769e22721013966c81a98515f663a6ca6d2833ab1b5ecac0b8298e1b',180187,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10007,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (57,'L allée des Alyscamps.jpg','8c6386e9a54ad538f55ff20a9cc066f7e25dcbfe947065f517c5db5aa14dcbf0',130058,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10001,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (58,'Le Moulin de Blute-Fin.jpg','861fc37d7e1274221ed2b8221612de5a828824540bb35112521c5d85fce7d659',57311,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10002,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (59,'The Bagpiper.jpg','9c741cbc6f2fedb8e1a11c4a10aa99a108ef4215181ae501aec739e228dc99e6',128181,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10003,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (60,'나무2.jpg','895ad993e89fecee77dacbd4eb3a01ff230ddaca4db1f3133fa517ba5a8c64f0',146469,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10004,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (61,'나무3.jpg','14071e8dc63a780610e49d6cc16fe8c79f47de60b242de77bebcdf6f79eef335',201863,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10005,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (62,'나무4.jpg','7e47a06ae96a4660b67ea2ea77416e8c93ebe9abd0e47c4832082f107d817c4a',149162,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10006,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (63,'드리우다.jpg','46387e29400e01f8e5562db3f4d0d4601bcfcbd7d71e999795b9c0dc83026f47',98745,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10007,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (64,'르네 마그리트_빛의제국.jpg','7d66cf1955eba1db676ba998f6a873cdc6cc244899372cd20e428b49a28582d0',54910,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10001,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (65,'마을에 햇빛이 드리우면.jpg','6a2d8ff6bc8fc3df8abd0920ebf75b3c59b92aad1d1e47db4b67a728491be25f',89733,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10002,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (66,'만찬.jpg','a1a340d585bb54e65c767d50fbba00cb0c079873b834bb3ee14168945619b80b',24941,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10003,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (67,'목맨사람의집.jpg','bffd3960d20c11c8f6a3d09222e34115dac5877933d828c87016ae8dbbafad7d',199429,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10004,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (68,'백야.jpg','37c40dc57deba7ed25ee20859945fd431aa43fd345e6a6a62a8eb60f8daf8b5d',113053,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10005,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (69,'사랑으로.jpg','32e243011cba5301bb75fb86140652bcfe971e57c1219dea7d2e83cc226db78d',73851,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10006,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (70,'서커스.jpg','d4845b66ad36b47673b584bbaa1e79a68e02361c20256b0a1fefe5ca59806919',242521,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10007,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (71,'신윤복_귀로산수도.jpg','964be1c505afd350d99878ec4e10fbc01781062f55c255fd2f764f7535ec533f',159970,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10001,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (72,'앙드레드랭_Funeral.jpg','23386020ba0fe6df7d5c992c9172fa3d8f877391b4abf7f2856416a794a05e25',69905,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10002,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (73,'에스타크.jpg','030eebf8def2372c8e70657caf67b7797857350a19f485ad2315e3e99651628f',122665,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10003,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (74,'에펠탑.jpg','b850872751e0aaee5a3e132804b3514598f28f1c3ded7c15a41b7547d76c5b5a',110604,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10004,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (75,'운동장.jpg','09a292d3b7581d5de8578d0891c19daafe3b74f5a510dfe04062a11084427860',49342,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10005,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (76,'움직이는 집.jpg','10a2dbf634dc94e720808db4baadbcf7c19e3092b517a918f6ea664daa41bae8',98212,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10006,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (77,'풍경화.jpg','b220d42df3a228731203b9611cd820075734f6405a14713385285327b6e43501',121195,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10007,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (78,'호텔 우물의경관.jpg','730978a12e02f8c9efdc4091ebcf001b0cb702dd4bb969d3f475ec62a7cf3647',152476,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10001,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (79,'휴가.jpg','b51897caa0d8c1274af2560329b8a5a2cc10af9ef3d6d1d52076f2b6ac027467',90717,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10002,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (80,'BlossomingAcaciaBranches.jpg','f0c62311f9cc7cfbf25ba4573fde3ec97bd9642b550a33d2de8b72e68437ac02',201952,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10003,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (81,'blue and white.jpg','c679e54e27b4b31d9eb63411a8d211e6a828bc3e504eba0a72d023f4a0f3c222',574433,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10004,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (82,'ColeusPlantinaFlowerPot1886.jpg','6c16b341afe51594c05bbce432a212158abefaaf980f4f07888fea52a02402f7',152369,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10005,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (83,'Composition with skull.jpg','b2c8680ecb09d58040cc4430c1f685e382ecbd347b6df54e81d578d6e2c7ba11',72459,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10006,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (84,'Corner Of Studio.jpg','ce9acf6f55ee5bb6f5bdbac9254f5561576824a2b90d5177e9fdeab6ac14580a',90574,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10007,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (85,'Das rote Teeservice.jpg','627cc093148f53e6bf2e60be8669a5563a5915bf15c84e7183d48b84ac393864',195307,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10001,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (86,'Flowers and Fruit.jpg','95a09fc49a8afb5abeede41ac76b1ce02f12b28afb9c2d8d4d82d2dd2c12b1e5',116514,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10002,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (87,'물병과 바이올린.jpg','d868a9470fd955bc564557acdabc17a326c47b548dcf041b4c1f642f4e6e39a9',63048,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10003,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (88,'Fruit-on-a-Bench.jpg','f1d89c9a80f62882312cae0b9ab66e032a8daf1e4292cb9c570c428bb66a152d',46886,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10004,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (89,'FruitsandFlowers.jpg','6d230606f2aa6dd5209f7613798878c868c9bc52b2244f924e1228f8fd065f04',113742,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10005,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (90,'GlasswithRoses.jpg','c9324c73237f8ad64fef435c215a333a42d3b97a6a5a425319d41749fcdca940',154549,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10006,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (91,'Irises.jpg','4b2f8a87fc37eb98206310fb60b5089bc98ed04715f27d6dc852af3eac4fe86b',119502,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10007,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (92,'Malven_I_(Hollyhocks_I).jpg','2a9f8fcd17998a00dbc06cfded654ae9b5b030b41c150f24a18f094e9a076dcf',98807,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10001,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (93,'NatureDead.jpg','bc69bc055cba0a9944f4358c81ece70bb15ab7bfd00aa6190a3dfda67bfa3333',152996,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10002,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (94,'noname.jpg','5b1eef633a6a469e2bc286df8fb84cff4730fda59378a168e37f61dfd1350412',47648,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10003,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (95,'objet.jpg','601f93bf64a11697db762e256e36fbe6f42d33c8c2987818042f661084d8894d',65043,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10004,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (96,'objet2.jpg','bda011cc36ade0958fa35a22327936efddd821c960d9e8860e9a45dc63e7e0d9',198693,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10005,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (97,'PoppiesandButterflie.jpg','b63dcb416cc9a0d00bc14840b31806104fc13a8e885250798272e73684f99951',157272,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10006,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (98,'Rabbit, Copper Cauldron and Quince.jpg','5e0928433a47035224c61712bf1adfbb5c44ccf6dc8c9b4718b6d8b75b0fc257',105264,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10007,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (99,'Spring Flowers.jpg','5af55f75eaad6e9f2600d828f9b105fa90a2310cd433289f6140467f4a93f3aa',309801,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10001,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (100,'Still Life with Decanter and Lemons on a Plate.jpg','cd154a016717d463332af5173c6299bb86d8f8e73f51cbff9ea91d471501471a',68454,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10002,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (101,'Still Life with Lemons.jpg','21d7a549c48b7fa33c5ae4cc7d8efc38dfa981329a13fa78efd692328959ad3c',70499,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10003,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (102,'Stilleben mit Äpfeln und Schneeball.jpg','5b8f379c66a1b14ba62a8fff66c4cdc5b8fec78dbf351c41dcc907a938ab5a37',95363,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10004,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (103,'The Blue Vase.jpg','610ee1343cb9b84cd6bfcebd5004577a7fe25c9ad24035982e8e0acdf7401f5a',62088,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10005,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (104,'The Buffet.jpg','6acefdf074ce08a844f9a0e6a81be640057c01169528c6c2616f796089d60ea2',88005,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10006,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (105,'The Copper Drinking Fountain.jpg','33807b92935995b8166d311faf081839c64ea1a586b8451a045bc732791a39aa',102329,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10007,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (106,'untitle.jpg','91676d15df1f0a097e5ac62efd39ccd9e0a78e8803266a3041c3ed40a05879e0',143441,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10001,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (107,'Vase of Flowers.jpg','45cda3ed72f4822e7e1b2122b261c3abc26acc53dcb2ba2f991e036a62653ac4',165794,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10002,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (108,'White Azaleas in a Pot.jpg','f831956c22703d122cf759c7d7abe4b006d508fea704d992f734f3f17a50f4a2',168702,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10003,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (109,'고양이와 어항.jpg','848814652e27fa2a9d0e36887ef5315f7ed46f4caa64d1f6730ea9d24fffce53',82169,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10004,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (110,'과일정물.jpg','5c1790ccf7139ee7b2e375e83af6184d269eaa09130295a14600d4659ceb150f',65671,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10005,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (111,'금붕어.jpg','36b087835cc4b89d7f37b89e5735ba7a75d1ff63d6a905a09c3c12238c1a9c79',96799,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10006,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (112,'금붕어가 있는 정물.jpg','a4d45ec566d749b4cfbe458ced18aceb2a7b252076806d06c0536098c4e2cc65',164888,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10007,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (113,'유리물병과 과일이 있는 정물.jpg','9185812c514630be9737672a40610d0c58874ffb59a29cc74e8269cc1c3c98b5',100692,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10001,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (114,'의자.jpg','d1d0be7f8020b6a958e56c8d0a4e72b7950a451f039633a126f9b4c9e716d418',53151,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10002,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (115,'자고새와 철갑용 장갑.jpg','7f5545d4984dc49f1d8a98dd2fd06e10b5ca62e8bc8e7144fd823f11d6ee61d4',84005,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10003,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (116,'푸른창문.jpg','e7fa8d1dda75088754b0025616d164427b66bdbbe7a9ca102b62a7256a532467',125624,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10004,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (117,'푸른탁자가있는 정물.jpg','65c401cee6690d6f5143ecef3871508678fc060a9dae38186bf74845619699fb',422373,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10005,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (118,'푸토가있는정물.jpg','66f2535a60d174d9114ef2af52119e5557e121951e7d9f162e621903d92566f8',351673,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10006,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (119,'피카소_Flowers on the Table.jpg','156bbae8ad2439bb15b02f8b1a77320eac68c80daff316bfee5fb36d31a410df',72677,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10007,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (120,'Bauhaus Stairway.jpg','3a9ff9cda1cc7cd6818938a22bcfca5ef4689900c01d7b784175fe56bf4bd0ec',210130,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10001,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (121,'Dr. Waldmann from Expressionist Woodcuts.jpg','f95d465469385ee6114b1f5a98fccf428449fd7bcc539d20c6b2c1e3a536d329',169042,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10002,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (122,'volume II.jpg','65eb724d231df8682aa8b7eddd62b27c66effc4a720c1b4f08c5cc6f7acf021d',235606,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10003,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (123,'고뇌에 찬 자화상.jpg','2e8332d386d17e56d2b17ed571b11fc563f8b0046562693096f2f53323b908ea',55361,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10004,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (124,'압생트를 마시는 남자.jpg','b2d329bcd67c76270db028ac410051c91a76e22cb9d80151b0b2a65a120d9c95',90048,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10005,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (125,'압생트를 마시는 무명.jpg','ddfce837a4b62a080862daa48b26c8e884acb2a1cfd1d6a58f2e153225c5a0c8',110006,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10006,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (126,'압생트를 마시는 사람들.jpg','767c32384ee80b234ff734642b16cf315640c785e95784569e2d1ef7b5e69513',109674,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10007,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (127,'absinthe.jpg','23673b424231d8392d69806f9f373b2a535463bc9dc2e636f0fadb44f7bd3e83',102724,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10001,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (128,'Embarkation of St Paula Romana at Ostia.jpg','3ba593342cc0cb2fe54c7b722efedc9291f3e4fd27adadb604ba1ee10a1728f0',102724,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10001,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (129,'Landscape with the Finding.jpg','1711766fe418a19181e251b3fd11afc56cafa6d18bbe182723434987989414c6',102724,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10001,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (130,'설경.jpg','921d205b32e8edbc6a37d5294c6e72ad2b6117fd4a8b25b68ba9229817832a21',102724,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10001,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (131,'성월화.jpg','2eef1bcfb0febf5ca94564cfb26adfe1c2c82e03e9404329f16911403e6ccca1',102724,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10001,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (132,'트리에스테 항구.jpg','97e7f4786c8270eed96f40cefbaf4e6c54444dae5fcf6030e1e4432a83fc1907',102724,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10001,'image/jpeg');
INSERT INTO `todayart`.`file` (`file_id`,`file_origin_name`,`file_name`,`file_size`,`file_reg_dated`,`file_upload_ip`,`member_id`,`file_content_type`) 
VALUES (133,'호숫가를 거니는 여인이 있는 풍경.jpg','e29d1d93324a39da8b6e81bf41e472c28e25042d38a41b2ca9c5bf21e9d172e7',102724,'2019-08-28 11:16:04','0:0:0:0:0:0:0:1',10001,'image/jpeg');



-- -----------------------------------------------------
-- Table `todayart`.`artist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `todayart`.`artist` (
  `artist_id` INT(11) NOT NULL AUTO_INCREMENT,
  `member_id` INT(11) NOT NULL,
  `artist_name` VARCHAR(255) NOT NULL,
  `artist_desc` TEXT NOT NULL,
  `artist_contact` VARCHAR(255) NOT NULL,
  `profile_id` INT(11) NULL DEFAULT NULL,
  `adm_product_image` INT(11) NOT NULL,
  `adm_product_desc` TEXT NOT NULL,
  `adm_check` INT(1) NOT NULL DEFAULT '1' COMMENT '1: 미승인, 2: 승인, 3: 거부',
  `artist_level_id` INT(11) NOT NULL,
  `adm_apply_dated` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `adm_check_dated` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`artist_id`),
  INDEX `member_id_idx` (`member_id` ASC) VISIBLE,
  INDEX `fk_artist_artistLevel_idx` (`artist_level_id` ASC) VISIBLE,
  INDEX `fk_artist_file_idx` (`profile_id` ASC) VISIBLE,
  INDEX `fk_artist_file_idx2` (`adm_product_image` ASC) VISIBLE,
  CONSTRAINT `fk_artist_member`
    FOREIGN KEY (`member_id`)
    REFERENCES `todayart`.`member` (`member_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_artist_artistLevel`
    FOREIGN KEY (`artist_level_id`)
    REFERENCES `todayart`.`artist_level` (`artist_level_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_artist_file`
    FOREIGN KEY (`profile_id`)
    REFERENCES `todayart`.`file` (`file_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_artist_file2`
      FOREIGN KEY (`adm_product_image`)
      REFERENCES `todayart`.`file` (`file_id`)
      ON DELETE NO ACTION
      ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

INSERT INTO `todayart`.`artist` VALUE(1, 10001, "목란", "서울특별시 서대문구 연희로15길 21", "07018544877", NULL, 1, "비밀스러운 사진", 2, 1, now(), NULL);
INSERT INTO `todayart`.`artist` VALUE(2, 10002, "홍원", "서울특별시 마포구 백범로 23 거구장", "07018544877", NULL, 2, "비밀스러운 사진", 2, 1, now(), NULL);
INSERT INTO `todayart`.`artist` VALUE(3, 10003, "향미", "서울특별시 마포구 성미산로 193", "07018544877", NULL, 3, "비밀스러운 사진", 2, 1, now(), NULL);
INSERT INTO `todayart`.`artist` VALUE(4, 10004, "도원", "서울특별시 서대문구 가재울로6길 53-87 1층", "07018544877", NULL, 4, "비밀스러운 사진", 2, 1, now(), NULL);
INSERT INTO `todayart`.`artist` VALUE(5, 10005, "난향", "서울특별시 서대문구 신촌로 67 거촌빌딩", "07018544877", NULL, 5, "비밀스러운 사진", 2, 1, now(), NULL);
INSERT INTO `todayart`.`artist` VALUE(6, 10006, "열빈", "서울특별시 영등포구 국제금융로 78", "07018544877", NULL, 6, "비밀스러운 사진", 2, 1, now(), NULL);
INSERT INTO `todayart`.`artist` VALUE(7, 10007, "태원", "서울특별시 동작구 등용로 81", "07018544877", NULL, 7, "비밀스러운 사진", 2, 1, now(), NULL);

-- -----------------------------------------------------
-- Table `todayart`.`account`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `todayart`.`account` (
  `account_id` INT NOT NULL AUTO_INCREMENT,
  `artist_id` INT NOT NULL,
  `account_number` VARCHAR(255) NOT NULL,
  `bank` VARCHAR(255) NOT NULL,
  `main_account` CHAR(1) NOT NULL DEFAULT 'n' COMMENT 'n:일반계좌, y:대표계좌',
  PRIMARY KEY (`account_id`),
  INDEX `fk_account_artist_idx` (`artist_id` ASC) VISIBLE,
  CONSTRAINT `fk_account_artist`
    FOREIGN KEY (`artist_id`)
    REFERENCES `todayart`.`artist` (`artist_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `todayart`.`board_category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `todayart`.`board_category` (
  `board_id` INT(11) NOT NULL AUTO_INCREMENT,
  `board_name` VARCHAR(255) NULL DEFAULT "게시판",
  PRIMARY KEY (`board_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;
INSERT INTO `todayart`.`board_category`
VALUE(1,'FAQ');
INSERT INTO `todayart`.`board_category`
VALUE(2,'Q&A');
INSERT INTO `todayart`.`board_category`
VALUE(3,'공지사항');
INSERT INTO `todayart`.`board_category`
VALUE(4,'Product Q&A');

-- -----------------------------------------------------
-- Table `todayart`.`article`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `todayart`.`article` (
  `article_id` INT(11) NOT NULL AUTO_INCREMENT,
  `board_id` INT(11) NOT NULL,
  `member_id` INT(11) NOT NULL,
  `write_dated` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_dated` DATETIME NULL DEFAULT NULL,
  `title` VARCHAR(255) NOT NULL,
  `content` TEXT NOT NULL,
  `is_deleted` CHAR(1) NOT NULL DEFAULT 'n',
  `delete_dated` DATETIME NULL DEFAULT NULL,
  `is_hidden` CHAR(1) NOT NULL DEFAULT 'n',
  `password` VARCHAR(255) NULL DEFAULT NULL,
  `views` INT(11) NOT NULL DEFAULT '0',
  `product_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`article_id`),
  INDEX `fk_article_boardCategory_idx` (`board_id` ASC) VISIBLE,
  INDEX `fk_article_member_idx` (`member_id` ASC) VISIBLE,
  CONSTRAINT `fk_article_boardCategory`
    FOREIGN KEY (`board_id`)
    REFERENCES `todayart`.`board_category` (`board_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_article_member`
    FOREIGN KEY (`member_id`)
    REFERENCES `todayart`.`member` (`member_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

INSERT INTO `article`
VALUES(1,1,1,now(),null,'입금했는데 결제완료 처리가 되지 않아요.',"- 주문시 입력하신 입금자명과 실제 입금자명이 다른 경우
- 입금금액이 맞지 않는 경우

위와 같이 주문 내용과 실제 입금 내용이 다른 경우 입금확인 처리가 늦어질 수 있습니다.
문의하기 또는 고객센터를 통해 문의 주시면 처리해 드리겠습니다.",'n',null,'n',null,0,null);
INSERT INTO `article`
VALUES(2,1,1,now(),null,'이미 주문을 했는데, 추가주문이 가능한가요?',"주문하신 상품이 아직 배송 전인 경우 가능합니다.",'n',null,'n',null,0,null);
INSERT INTO `article`
VALUES(3,1,1,now(),null,'배송기간은 얼마나 걸리나요?',"기본 배송 기간은 결제완료 후 영업일 기준 7일~10일입니다.
공급처 사정으로 인하여 지연 및 품절이 발생할 수 있으며, 이러한 경우 개별 연락을 드립니다.",'n',null,'n',null,0,null);
-- INSERT INTO `article`
-- VALUES(4,1,3000,now(),null,'주문취소는 어떻게 하나요?',"주문취소는 고객센터(070-4250-7700) 또는 문의하기를 통해 연락 주시면 도와 드립니다.
-- 다만, 이미 배송이 출발한 경우에는 취소가 불가능 합니다.",'n',null,'n',null,0,null);
INSERT INTO `article`
VALUES(5,1,1,now(),null,'교환 가능한가요?',"판매중인 작품은 모두 실제 페인팅으로, 동일한 재고가 없습니다.
따라서 교환이 불가능한 점 양해 부탁드립니다.",'n',null,'n',null,0,null);
INSERT INTO `article`
VALUES(6,1,1,now(),null,'반품은 어떻게 하나요?',"실제 상품이 온라인 상의 내용과 다른 경우, 작품에 하자가 있거나 운송중 파손이 발생한 경우,
반품이 가능합니다. 택배를 이용하여 아티스티 측으로 반품해 주시면 됩니다.
단순변심에 따른 반품은 불가합니다.",'n',null,'n',null,0,null);
INSERT INTO `article`
VALUES(8,2,10001,now(),null,'직거래 문의드립니다.',"직거래 관련 문의는 고객센터(070-4250-7700), 이메일(info@artisty.co.kr)로 문의 주시면 최대한 빨리 답변드리도록 하겠습니다.",'n',null,'n',null,0,null);
INSERT INTO `article`
VALUES(9,2,10002,now(),null,'시즌2 언제 열리나요?',"현재 구체적인 계획이 수립되지 못했습니다. 계획되는대로 공지하도록 하겠습니다. 더 궁금하신 점이 있으시다면 문의하기 또는 고객센터(070-4250-7700), 이메일(info@artisty.co.kr)로 문의 주시면 최대한 빨리 답변드리도록 하겠습니다.",'n',null,'n',null,0,null);
INSERT INTO `article`
VALUES(10,2,10003,now(),null,'왜 택배비가 비싼가요?',"거래하시는 제품이 예술품이다보니 더 안전한 고오급 택배사를 통하여 운송하고 있습니다. 더 궁금하신 점이 있으시다면 고객센터(070-4250-7700), 이메일(info@artisty.co.kr)로 문의 주시면 최대한 빨리 답변드리도록 하겠습니다.",'n',null,'n',null,0,null);
INSERT INTO `article`
VALUES(11,2,10004,now(),null,'아마추어 작가도 판매자 등록 가능한가요?',"당연히 가능하십니다. 저희 오늘의 아트의 설립 취지가 아마추어 작가들의 작품거래 활성화이기 때문에 아마추어 작가분들을 저희 서비스 이용을 환영합니다. 더 궁금하신 점이 있으면 고객센터(070-4250-7700), 이메일(info@artisty.co.kr)로 문의 주시면 최대한 빨리 답변드리도록 하겠습니다.",'n',null,'n',null,0,null);
INSERT INTO `article`
VALUES(12,2,10005,now(),null,'직거래 하고싶은데 어떻게 해요?',"직거래 관련 문의는 고객센터(070-4250-7700), 이메일(info@artisty.co.kr)로 문의 주시면 최대한 빨리 답변드리도록 하겠습니다.",'n',null,'n',null,0,null);
INSERT INTO `article`
VALUES(13,2,10006,now(),null,'판매자도 구매 가능한가요?',"판매자 승인이 된 계정도 기존의 구매 서비스를 이용하실 수 있습니다. 더 궁금하신 점이 있으시다면 고객센터(070-4250-7700), 이메일(info@artisty.co.kr)로 문의 주시면 최대한 빨리 답변드리도록 하겠습니다.",'n',null,'n',null,0,null);
INSERT INTO `article`
VALUES(14,2,10007,now(),null,'한도액 없나요? 어떻게 하나요?',"아마추어 예술가들을 위한 서비스이다보니 최대 100만원까지 지원하고 있습니다. 더 궁금하신 점이 있으시다면 고객센터(070-4250-7700), 이메일(info@artisty.co.kr)로 문의 주시면 최대한 빨리 답변드리도록 하겠습니다.",'n',null,'n',null,0,null);

INSERT INTO `article`
VALUES(15,3,1,now(),null,'오늘의 아트는...',"미술 작품의 온라인 열린 장터입니다 (더 많이 쓰이는 용어로는 온라인 오픈 마켓이겠죠. 저는 일상 용어에서 너무 많은 외래어가 사용되는 것을 우려하는 입장입니다^^). 현재 시스템 준비는 결제를 제외하면 거의 끝났고, 작품들만 어느 정도 올라오면 본격적으로 거래를 시작할 것입니다.

아트폴리에 대하여 몇 몇 분들과 얘기를 하였는데 왜 이 일을 시작하는 지 궁금해 하셨습니다. 그래서 간단히 생각을 정리해 보았습니다.

저는 미술에 대하여 잘 모릅니다. 솔직히 한 번도 제 손으로 미술 작품을 사 본 적도 없습니다. 초등학교 때는 그림 그리는 것을 좋아하여 대회에서 상을 타 본 적도 있고 중학교 때에도 미술 반이긴 했지만, 그 이후 미술과는 거리가 먼 삶이었습니다. 그런데, 1-2년 전쯤부터 미술에 눈길이 가는 자신을 발견하게 되었습니다.

문득 사무실에 미술 작품을 걸고 싶다는 생각이 들기도 하였습니다. 승진하신 분에게 늘 하듯이 난을 선물하기보다 기쁨과 희망을 보여주는 그림을 보내드리면 좋겠다는 생각도 들기도 했습니다. 작년초에는 '반 고흐에서 피카소까지' 전시회가 끝나기 전에 꼭 보고 싶다는 생각이 들어 온 가족과 함께 가 보기도 했습니다. 박물관이나 전시회에 간 것도 드문 일이지만 각각의 작품에 예전보다 오랜 시간을 들여서 쳐다보고 있었던 것도 드문 경험이었습니다. 작품의 선, 색, 질감, 작품을 그릴 당시의 작가의 삶이나 생각 등 예전에는 피상적 지식 정도로 느껴지던 것들이 느낌으로 다가왔습니다.

저만 그런 것이 아니라, 점점 많은 분들이 이런 아름다움, 작은 서정을 생활속에서 느끼고 싶어하는 것 같습니다. 하지만 막상 미술을 가까이 하기란 매우 어려운 것이 현실입니다. 언론에서는 미술 시장에 대한 각종 뉴스가 많아지고 있지만, 기성 미술 시장에 맘 편하게 다가갈 수 있는 사람이 과연 얼마나 될까요? 첫째, 화랑에서 다루고 있는 작품의 대부분은 상당한 고가여서 일반인들이 엄두를 내기가 어렵습니다. 둘째, 화랑에 간다는 것 자체가 마음 편하지 않은 것도 사실입니다. 미술에 대하여 많이 모르는 저 같은 사람으로서는 뭔가 아는 체를 해야 할 것 같은 분위기가 편치 않은 것입니다. 뭔가 마음으로 문턱이 느껴지는 거죠. 셋째, 어디에 가야 할 지도 분명치 않습니다. 한 곳에서 이것 저것 보면서 자신의 취향을 확인하고, 작품을 고를 수 있으면 좋겠는데 그럴 수 없습니다. 많은 곳에 많은 시간을 들여 발품 팔고 다녀야겠죠.

작가 입장에서도 유명 작가가 아니면 화랑이나 전시회 등의 기존 미술 시장에서 선 보이는 것 자체가 쉽지 않은 것 같습니다. 작가 지망생중에는 이러한 어려움 때문데, 아예 작가의 길을 포기하는 사람들도 많아 보입니다. 유명화가가 되면 좋겠지만, 단지 미술이 좋아서 그 길을 가는 사람들이 더 많을 것으로 생각합니다. 그런 분들이 자신의 미술 세계를 소개할 통로가 미흡하여 좌절한다면 안타깝습니다. 지방에서는 더욱 힘들겠죠.

그래서 시작하였습니다. 요즘 명품이 유행하고 있지만, 가까이 하기엔 너무 먼 명품이 아니라 모두를 위한 미술 시장을 만들고 싶습니다. 명품을 살 금전적, 정신적, 시간적 여유는 없지만 내 가까이에서 나름대로 아름다움을 찾고, 작가의 정신세계, 예술세계와 공감하고 싶은 모든 사람들을 위한 곳. 미디어에 이름이 오르 내리고, 사회 유명인사들과 어울리고, 경매에서 높은 가격으로 화재가 되는 유명 작가는 아니더라도, 자신의 표현을 다른 사람과 공유하고 일상에 지친 보통 사람들에게 정서적 떨림을 줄 수 있음에 행복을 느끼는 미술가라면 누구나 사용하는 곳. 그런 곳을 만들고 싶습니다.

현재 저희 사이트에 필요한 것은 작품입니다. 장터에서 물건이 먼저냐 손님이 먼저냐는 것은 닭과 달걀 같은 문제이지만, 저희의 경우에는 분명히 물건이 먼저입니다. 작품이 어느 정도 진열이 되어 있어야 거래를 시작할 수 있습니다. 초기에 작품을 올려주시는 작가님들은 (아마도 제가 이름을 외울 수 있을 20명 이내 정도?) 앞으로 Artpoli 초기 회원으로 가까이 모시겠습니다. 개구리 올챙이 시절 기억 못한다고 하지만, 작고 어려울 때 힘을 보태주시는 분들을 잊지 않겠습니다. 물론 초기 이후에도 도움을 주시는 분들에게는 항상 감사할 것입니다. 오프라인 모임으로 맥주도 한 잔 하면서 이런 저런 얘기하는 자리도 갖고 싶습니다. 한 번 만나서 얘기하자고 연락 주셔도 좋습니다. 말씀하고 싶으신 것 있으면 언제라도 연락주십시오.

앞으로 많은 성원 부탁합니다. 감사합니다.",'n',null,'n',null,0,null);
INSERT INTO `article`
VALUES(16,3,1,now(),null,'2019 추석 연휴 택배배송 안내 입니다',"
2019 추석 연휴 택배배송 안내 입니다

9월 8일(일) 오전 11시 주문건까지 9월 9일(월) 발송 가능하며, 이후 주문건은 
추석 연휴가 끝나는 9월 16일(월)에 순차적으로 발송 됩니다

※ 시루아네 전제품은 아이스박스에 냉매를 넣어 발송 됩니다
추석 전 마지막 발송일은 9월 9일 (월) 입니다.
9월 8일 (일) 오전 11시 주문건까지 9월 9일 발송되어 추석전에 도착 가능 합니다]

※ 위 택배일정을 참고 하시여서 주문에 착오가 없으시길 바랍니다.
사전에 주문 하시면서 배송 메세지(요청메세지)에 희망 날짜를 적어 주시면 
맞춰서 발송해 드립니다",'n',null,'n',null,0,null);
INSERT INTO `article`
VALUES(17,3,1,now(),null,'우리 집은 미술관 - 오늘의아트 행사 소개',"미술이 '어려워서' 안 친하다고 하시는 분들도 계십니다. 하지만 베토벤이 어느 시대 사람인지, 비틀즈가 유명해지기 전에 어느 클럽에서 만들어졌는지, 서태지가 영향받은 음악이 무엇인지 몰라도 음악을 즐길 수 있듯이. 미술을 즐기는데 미술 지식이 필요한 것은 아닙니다. 김연아가 구사하는 기술의 이름이 뭔지 몰라도 그녀의 스케이팅을 보면서 멋지다고 느낄 수 있는 것도 마찬가지입니다. 저 자신도 미술 지식은 초보적 수준입니다.

사람은 누구나 타고난 미술 감상자입니다. 아름답거나 인상적인 모습을 보았을 때 시선을 집중합니다. 높은 산에 올랐을 때, 넓은 바다를 보았을 때, 미남 미녀를 보았을 때, 멋진 옷을 보았을 때. 미술도 마찬가지입니다. 눈을 뗄 수 없고 자꾸 보게 되면 좋은 것입니다.

아트폴리에서는 미술을 사람들과 가까이 하려고 노력하고 있습니다. 블로그에, 이동전화에, TV에 어디서나 볼 수 있게 하고 싶습니다. 이번 행사도 거실, 방, 사무실 같은 생활 공간에 미술과 함께 하시라는 의도에서 하고 있습니다. 물론 아트폴리와 그 생각도 알리고요. 작품 포스터 하나로 더 바라보고 싶은 자신의 공간을 만들어 보시기 바랍니다.",'n',null,'n',null,0,null);
INSERT INTO `article`
VALUES(18,3,1,now(),null,'시스템 점검 일정입니다',"안녕하세요. 오늘의아트입니다. 

2019년 09월 25일(목) 서비스 관련 안내 드립니다.

2019년 09월 25일(목) 오전2시~오전 5시 온라인투어 시스템 서비스 점검 예정으로 고객서비스 관련 이용이 제한적일 수 있는 점 양해 부탁드립니다.



     ■ 점검시간: 9월 25일(목) 오전 2 ~ 오전5시

     ■ 점검영향: 고객서비스 관련 메뉴 접속 불가(모바일/웹)



항상 오늘의아트를 애용해 주시는 모든 고객님들에게 진심으로 감사 드립니다.",'n',null,'n',null,0,null);
INSERT INTO `article`
VALUES(19,3,1,now(),null,'개인정보 처리방침이 일부 개정되어 안내드립니다.',"안녕하세요. 오늘의아트입니다.

 오늘의아트를 이용해주시는 고객님께 진심으로 감사 드리며, 개인정보 처리에 관한 정책을 담고 있는 개인정보 처리방침이 아래와 같이 일부 변경되어 사전 안내해 드립니다.



1. 적용시기 : 2019년 6월 5일 (수)



2. 주요 변경내용


    - 명칭변경 : 아트팩토리 -> 오늘의아트

   ※ 상세한 개정내용은 변경된 개인정보 처리방침을 확인하여 주시기 바랍니다.

      

3. 이의 및 문제 제기

  - 개정된 개인정보 처리방침 내용에 대한 이의제기 및 문의사항이 있으신 경우 고객센터(1577-7011)로 접수해 주시면 신속하고 친절하게 안내해 드리겠습니다.

  - 개정된 개인정보 처리방침 내용에 동의하지 않는 경우에는 회원탈퇴를 요청하실 수 있습니다.

  - 오늘의아트는 앞으로도 고객 여러분께 더욱 만족스러운 서비스를 제공할 수 있도록 노력하겠습니다.",'n',null,'n',null,0,null);
  INSERT INTO `article`
VALUES(20,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,1);
  INSERT INTO `article`
VALUES(21,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,2);
  INSERT INTO `article`
VALUES(22,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,3);
  INSERT INTO `article`
VALUES(23,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,4);
  INSERT INTO `article`
VALUES(24,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,5);
  INSERT INTO `article`
VALUES(25,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,6);
  INSERT INTO `article`
VALUES(26,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,7);
  INSERT INTO `article`
VALUES(27,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,8);
  INSERT INTO `article`
VALUES(28,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,9);
  INSERT INTO `article`
VALUES(29,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,10);
  INSERT INTO `article`
VALUES(30,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,11);
  INSERT INTO `article`
VALUES(31,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,12);
  INSERT INTO `article`
VALUES(32,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,13);
  INSERT INTO `article`
VALUES(33,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,14);
  INSERT INTO `article`
VALUES(34,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,15);
  INSERT INTO `article`
VALUES(35,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,16);
  INSERT INTO `article`
VALUES(36,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,17);
  INSERT INTO `article`
VALUES(37,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,18);
  INSERT INTO `article`
VALUES(38,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,19);
  INSERT INTO `article`
VALUES(39,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,20);
  INSERT INTO `article`
VALUES(40,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,21);
  INSERT INTO `article`
VALUES(41,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,22);
  INSERT INTO `article`
VALUES(42,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,23);
  INSERT INTO `article`
VALUES(43,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,24);
  INSERT INTO `article`
VALUES(44,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,25);
  INSERT INTO `article`
VALUES(45,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,26);
  INSERT INTO `article`
VALUES(46,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,27);
  INSERT INTO `article`
VALUES(47,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,28);
  INSERT INTO `article`
VALUES(48,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,29);
  INSERT INTO `article`
VALUES(49,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,30);
  INSERT INTO `article`
VALUES(50,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,31);
  INSERT INTO `article`
VALUES(51,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,32);
  INSERT INTO `article`
VALUES(52,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,33);
  INSERT INTO `article`
VALUES(53,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,34);
  INSERT INTO `article`
VALUES(54,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,35);
  INSERT INTO `article`
VALUES(55,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,36);
  INSERT INTO `article`
VALUES(56,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,37);
  INSERT INTO `article`
VALUES(57,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,38);
  INSERT INTO `article`
VALUES(58,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,39);
  INSERT INTO `article`
VALUES(59,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,40);
  INSERT INTO `article`
VALUES(60,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,41);
  INSERT INTO `article`
VALUES(61,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,42);
  INSERT INTO `article`
VALUES(62,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,43);
  INSERT INTO `article`
VALUES(63,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,44);
  INSERT INTO `article`
VALUES(64,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,45);
  INSERT INTO `article`
VALUES(65,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,46);
  INSERT INTO `article`
VALUES(66,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,47);
  INSERT INTO `article`
VALUES(67,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,48);
  INSERT INTO `article`
VALUES(68,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,49);
  INSERT INTO `article`
VALUES(69,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,50);
  INSERT INTO `article`
VALUES(70,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,51);
  INSERT INTO `article`
VALUES(71,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,52);
  INSERT INTO `article`
VALUES(72,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,53);
  INSERT INTO `article`
VALUES(73,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,54);
  INSERT INTO `article`
VALUES(74,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,55);
  INSERT INTO `article`
VALUES(75,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,56);
  INSERT INTO `article`
VALUES(76,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,57);
  INSERT INTO `article`
VALUES(77,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,58);
  INSERT INTO `article`
VALUES(78,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,59);
  INSERT INTO `article`
VALUES(79,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,60);
  INSERT INTO `article`
VALUES(80,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,61);
  INSERT INTO `article`
VALUES(81,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,62);
  INSERT INTO `article`
VALUES(82,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,63);
  INSERT INTO `article`
VALUES(83,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,64);
  INSERT INTO `article`
VALUES(84,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,65);
  INSERT INTO `article`
VALUES(85,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,66);
  INSERT INTO `article`
VALUES(86,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,67);
  INSERT INTO `article`
VALUES(87,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,68);
  INSERT INTO `article`
VALUES(88,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,69);
  INSERT INTO `article`
VALUES(89,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,70);
  INSERT INTO `article`
VALUES(90,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,71);
  INSERT INTO `article`
VALUES(91,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,72);
  INSERT INTO `article`
VALUES(92,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,73);
  INSERT INTO `article`
VALUES(93,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,74);
  INSERT INTO `article`
VALUES(94,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,75);
  INSERT INTO `article`
VALUES(95,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,76);
  INSERT INTO `article`
VALUES(96,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,77);
  INSERT INTO `article`
VALUES(97,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,78);
  INSERT INTO `article`
VALUES(98,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,79);
  INSERT INTO `article`
VALUES(99,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,80);
  INSERT INTO `article`
VALUES(100,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,81);
  INSERT INTO `article`
VALUES(101,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,82);
  INSERT INTO `article`
VALUES(102,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,83);
  INSERT INTO `article`
VALUES(103,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,84);
  INSERT INTO `article`
VALUES(104,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,85);
  INSERT INTO `article`
VALUES(105,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,86);
  INSERT INTO `article`
VALUES(106,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,87);
  INSERT INTO `article`
VALUES(107,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,88);
  INSERT INTO `article`
VALUES(108,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,89);
  INSERT INTO `article`
VALUES(109,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,90);
  INSERT INTO `article`
VALUES(110,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,91);
  INSERT INTO `article`
VALUES(111,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,92);
  INSERT INTO `article`
VALUES(112,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,93);
  INSERT INTO `article`
VALUES(113,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,94);
  INSERT INTO `article`
VALUES(114,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,95);
  INSERT INTO `article`
VALUES(115,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,96);
  INSERT INTO `article`
VALUES(116,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,97);
  INSERT INTO `article`
VALUES(117,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,98);
  INSERT INTO `article`
VALUES(118,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,99);
  INSERT INTO `article`
VALUES(119,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,100);
  INSERT INTO `article`
VALUES(120,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,101);
  INSERT INTO `article`
VALUES(121,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,102);
  INSERT INTO `article`
VALUES(122,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,103);
  INSERT INTO `article`
VALUES(123,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,104);
  INSERT INTO `article`
VALUES(124,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,105);
  INSERT INTO `article`
VALUES(125,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,106);
  INSERT INTO `article`
VALUES(126,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,107);
  INSERT INTO `article`
VALUES(127,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,108);
  INSERT INTO `article`
VALUES(128,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,109);
  INSERT INTO `article`
VALUES(129,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,110);
  INSERT INTO `article`
VALUES(130,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,111);
  INSERT INTO `article`
VALUES(131,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,112);
  INSERT INTO `article`
VALUES(132,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,113);
  INSERT INTO `article`
VALUES(133,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,114);
  INSERT INTO `article`
VALUES(134,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,115);
  INSERT INTO `article`
VALUES(135,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,116);
  INSERT INTO `article`
VALUES(136,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,117);
  INSERT INTO `article`
VALUES(137,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,118);
  INSERT INTO `article`
VALUES(138,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,119);
  INSERT INTO `article`
VALUES(139,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,120);
  INSERT INTO `article`
VALUES(140,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,121);
  INSERT INTO `article`
VALUES(141,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,122);
  INSERT INTO `article`
VALUES(142,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,123);
  INSERT INTO `article`
VALUES(143,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,124);
  INSERT INTO `article`
VALUES(144,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,125);
  INSERT INTO `article`
VALUES(145,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,126);
  INSERT INTO `article`
VALUES(146,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,127);
  INSERT INTO `article`
VALUES(147,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,128);
  INSERT INTO `article`
VALUES(148,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,129);
  INSERT INTO `article`
VALUES(149,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,130);
  INSERT INTO `article`
VALUES(150,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,131);
  INSERT INTO `article`
VALUES(151,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,132);
  INSERT INTO `article`
VALUES(152,4,8888,now(),null,'화구 문의드립니다.',"사용하신 물감 브랜드 좀 알 수 있을까요? 이용하신 화구도요!! ",'n',null,'n',null,0,133);

-------------------------------------------------------
-- Table `todayart`.`comment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `todayart`.`comments` (
  `comment_id` INT(11) NOT NULL AUTO_INCREMENT,
  `article_id` INT(11) NOT NULL,
  `member_id` INT(11) NOT NULL,
  `write_dated` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_dated` DATETIME NULL DEFAULT NULL,
  `content` TEXT NOT NULL,
  `reply_group` INT(11) NULL DEFAULT '1',
  `reply_depth` INT(11) NOT NULL DEFAULT '1',
  `reply_order` INT(11) NULL DEFAULT '1',
  `is_deleted` CHAR(1) NOT NULL DEFAULT 'n',
  `delete_dated` DATETIME NULL DEFAULT NULL,
  `is_hidden` CHAR(1) NOT NULL DEFAULT 'n',
  `password` VARCHAR(255) NULL DEFAULT NULL,
  `is_reply` CHAR(1) NOT NULL DEFAULT 'n' comment 'n:미답변, y:답변',
  
  PRIMARY KEY (`comment_id`),
  INDEX `fk_comment_article_idx` (`article_id` ASC) VISIBLE,
  INDEX `fk_comment_member_idx` (`member_id` ASC) VISIBLE,
  CONSTRAINT `fk_comment_article`
    FOREIGN KEY (`article_id`)
    REFERENCES `todayart`.`article` (`article_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_comment_member`
    FOREIGN KEY (`member_id`)
    REFERENCES `todayart`.`member` (`member_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


  INSERT INTO `comments`
VALUES(1,1,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(2,2,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(3,3,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(4,4,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(5,5,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(6,6,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(7,7,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(8,8,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(9,9,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(10,10,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(11,11,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(12,12,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(13,13,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(14,14,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(15,15,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(16,16,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(17,17,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(18,18,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(19,19,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(20,20,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(21,21,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(22,22,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(23,23,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(24,24,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(25,25,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(26,26,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(27,27,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(28,28,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(29,29,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(30,30,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(31,31,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(32,32,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(33,33,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(34,34,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(35,35,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(36,36,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(37,37,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(38,38,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(39,39,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(40,40,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(41,41,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(42,42,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(43,43,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(44,44,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(45,45,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(46,46,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(47,47,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(48,48,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(49,49,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(50,50,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(51,51,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(52,52,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(53,53,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(54,54,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(55,55,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(56,56,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(57,57,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(58,58,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(59,59,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(60,60,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(61,61,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(62,62,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(63,63,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(64,64,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(65,65,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(66,66,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(67,67,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(68,68,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(69,69,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(70,70,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(71,71,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(72,72,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(73,73,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(74,74,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(75,75,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(76,76,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(77,77,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(78,78,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(79,79,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(80,80,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(81,81,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(82,82,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(83,83,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(84,84,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(85,85,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(86,86,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(87,87,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(88,88,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(89,89,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(90,90,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(91,91,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(92,92,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(93,93,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(94,94,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(95,95,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(96,96,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(97,97,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(98,98,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(99,99,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(100,100,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(101,101,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(102,102,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(103,103,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(104,104,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(105,105,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(106,106,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(107,107,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(108,108,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(109,109,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(110,110,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(111,111,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(112,112,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(113,113,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(114,114,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(115,115,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(116,116,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(117,117,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(118,118,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(119,119,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(120,120,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(121,121,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(122,122,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(123,123,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(124,124,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(125,125,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(126,126,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(127,127,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(128,128,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(129,129,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(130,130,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(131,131,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(132,132,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');
  INSERT INTO `comments`
VALUES(133,133,8888,now(),null,"구매 시 이용화구 정보 동봉해드리겠습니다.",null,1,null,'n',null,'n',null,'n');


-- -----------------------------------------------------
-- Table `todayart`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `todayart`.`category` (
  `category_id` INT(11) NOT NULL AUTO_INCREMENT,
  `category_name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`category_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

INSERT INTO `todayart`.`category` VALUE(1, '인물화');
INSERT INTO `todayart`.`category` VALUE(2, '풍경화');
INSERT INTO `todayart`.`category` VALUE(3, '정물화');


-- -----------------------------------------------------
-- Table `todayart`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `todayart`.`product` (
  `product_id` INT(11) NOT NULL AUTO_INCREMENT,
  `artist_id` INT(11) NOT NULL,
  `artist_name` VARCHAR(255) NOT NULL,
  `category_id` INT(11) NOT NULL,
  `product_name` VARCHAR(255) NOT NULL,
  `product_content` TEXT NOT NULL,
  `product_size` VARCHAR(255) NOT NULL,
  `product_price` INT(11) NOT NULL,
  `thumbnail_id` INT(11) NOT NULL,
  `is_delete` CHAR(1) NOT NULL DEFAULT 'n',
  `delete_dated` DATETIME NULL DEFAULT NULL,
  `enroll_dated` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_dated` DATETIME NULL DEFAULT NULL,
  `is_sold_out` CHAR(1) NOT NULL DEFAULT 'n' COMMENT 'n: 판매가능, y: 품절',
  `remain` INT(11) NOT NULL DEFAULT '1',
  `count_cart` INT(11) NOT NULL DEFAULT '0',
  `count_wishlist` INT(11) NOT NULL DEFAULT '0',
  `shipping_fee` INT(11) NOT NULL,
  PRIMARY KEY (`product_id`),
  INDEX `fk_product_artist_idx` (`artist_id` ASC) VISIBLE,
  INDEX `fk_product_category_idx` (`category_id` ASC) VISIBLE,
  INDEX `fk_product_file_idx` (`thumbnail_id` ASC) VISIBLE,
  CONSTRAINT `fk_product_artist`
    FOREIGN KEY (`artist_id`)
    REFERENCES `todayart`.`artist` (`artist_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_product_category`
    FOREIGN KEY (`category_id`)
    REFERENCES `todayart`.`category` (`category_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_product_file`
    FOREIGN KEY (`thumbnail_id`)
    REFERENCES `todayart`.`file` (`file_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(1, '목란', 1, 'A Night Out', '작가의 작품들은 작가의 붓 터치가 모여서 캔버스 위에 얼마나 정서적으로 풍부한 세계를 구현할 수 있는지를 보여준다. 작가가 섬세하게 그은 선들은 풀잎들의 미세한 흔들림, 나뭇잎을 살짝 흔들고 지나가는 바람의 흐름까지도 작품 안에 고스란히 담아낸다. 그렇게 고스란히 담아낸 찰나의 순간들은 외롭고 쓸쓸한 분위기를 조성하면서, 보는 이의 불안감과 고독감을 자극한다. 여기에서 작가가 주목한 불안감과 고독감은 인간으로서 당연히 갖는 근원적인 정서이다. 인간은 사회적인 존재로서 타인의 시선을 신경 쓰면서 살아갈 수밖에 없다. 내가 나와 다른 사람들과 잘 얽혀서 살아갈 수 있을지에 대한 확신이 흔들리는 순간, 불안과 고독감이 퍼져나가기 시작한다. 작품은 눈에 보이지 않는 정서를 시각적으로 구현해서, 보는 이가 자기 자신을 돌아보고, 마주하는 것을 돕는다.
추천 이유
작품은 우리가 일상에서 그냥 스쳐 지나가기 쉬운 작은 순간들을 담고 있습니다. 몇몇 작품들은 풍경이 아니라 정물을 담고 있기도 하고, 풍경과 정물이 공존하기도 합니다. 어떤 작품에는 완전히 다른 양식으로 그려진 대상이 등장하기도 합니다. 우리가 주의 깊게 보지 않고 흘려보냈던 것들은 작품 안에서 모두 섬세한 붓 터치로 살아나서 우리의 내면에 말을 건넵니다. 작품과 대화하는 침묵의 시간 동안, 우리는 오로지 작품이 그리는 세계에만 집중하게 됩니다. 우리가 보지 못했던 것을 보여주는 것, 삶을 돌아보게 하고 새로운 원동력을 제공하는 것, 이런 것이 바로 예술이 우리 사회에서 하는 역할이자, 우리에게 예술이 필요한 이유가 아닐까요.
', '240x480', 55000, 1, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(2, '홍원', 1, 'abstract nude male', '작가의 작품들은 작가의 붓 터치가 모여서 캔버스 위에 얼마나 정서적으로 풍부한 세계를 구현할 수 있는지를 보여준다. 작가가 섬세하게 그은 선들은 풀잎들의 미세한 흔들림, 나뭇잎을 살짝 흔들고 지나가는 바람의 흐름까지도 작품 안에 고스란히 담아낸다. 그렇게 고스란히 담아낸 찰나의 순간들은 외롭고 쓸쓸한 분위기를 조성하면서, 보는 이의 불안감과 고독감을 자극한다. 여기에서 작가가 주목한 불안감과 고독감은 인간으로서 당연히 갖는 근원적인 정서이다. 인간은 사회적인 존재로서 타인의 시선을 신경 쓰면서 살아갈 수밖에 없다. 내가 나와 다른 사람들과 잘 얽혀서 살아갈 수 있을지에 대한 확신이 흔들리는 순간, 불안과 고독감이 퍼져나가기 시작한다. 작품은 눈에 보이지 않는 정서를 시각적으로 구현해서, 보는 이가 자기 자신을 돌아보고, 마주하는 것을 돕는다.
추천 이유
작품은 우리가 일상에서 그냥 스쳐 지나가기 쉬운 작은 순간들을 담고 있습니다. 몇몇 작품들은 풍경이 아니라 정물을 담고 있기도 하고, 풍경과 정물이 공존하기도 합니다. 어떤 작품에는 완전히 다른 양식으로 그려진 대상이 등장하기도 합니다. 우리가 주의 깊게 보지 않고 흘려보냈던 것들은 작품 안에서 모두 섬세한 붓 터치로 살아나서 우리의 내면에 말을 건넵니다. 작품과 대화하는 침묵의 시간 동안, 우리는 오로지 작품이 그리는 세계에만 집중하게 됩니다. 우리가 보지 못했던 것을 보여주는 것, 삶을 돌아보게 하고 새로운 원동력을 제공하는 것, 이런 것이 바로 예술이 우리 사회에서 하는 역할이자, 우리에게 예술이 필요한 이유가 아닐까요.
', '300x300', 50000, 2, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(3, '향미', 1, 'Roots', '작가는 도시 풍경과 일상의 풍경을 모티브로 하여 현대사회의 이미지를 다양한 방법으로 표현하고 있는 작가다. 그녀의 캔버스는 현대사회를 투영하는 공간으로, 사회 환경을 시각화하는 작업이 이루어지는 장소인 것이다. 작가의 주관에 따라 변형된 실재의 이미지는 회화적인 공간으로 재조합 되어 인간 본연의 감성과 정서의 본질을 이야기하고 있다. 특히 이 작품이 그려내고 있는 일상의 풍경은 작가 본인이 ‘인간이 자신이 속한 사회, 문화의 환경을 떠나 살 수 없는 존재임을 인식하고 외부세계의 대상이나 사건을 통해 환경에 따른 정서, 내적 현실에 의한 감정을 표현하고자 한’ 시도의 결과다. 작가가 여기서 말하고 있는 ‘감정’이란 ‘대상을 통한 정신적 가치의 체험’이다. 작가에게 예술은 구체적인 실생활의 총체성과 연관을 가지면서 자신의 표현 수단이 되고 ‘모든 인간’을 위한 감정이입의 매개체가 되는 것이며, 이 작품 역시 이러한 생각의 연장선상에 위치하고 있다.
추천 이유
작가가 주목한 일상의 풍경은 남겨진 거리, 익숙한 시간, 퇴근길, 오후 3시처럼 우리의 삶과 아주 밀접하게 맞닿아 있는 풍경입니다. 그러나 그 모습을 있는 그대로 캔버스 위에 복기(復碁)하는 것이 아니라 작가의 주관에 따라 재해석한 후 옮겨놓음으로써 관객에게 수많은 상상의 여지를 남깁니다. 또한, 화면에서 보이는 익숙한 듯 낯선 풍경이 주는 신선함은 볼 때마다 새로운 모습으로 다가와 오래도록 질리지 않는 매력을 선사할 것입니다. 자신의 공간을 새롭게 단장하고 싶은 분이라면 이 작품과 함께하세요.
', '480x720', 120000, 3, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(4, '도원', 1, 'Portrait de l artiste par lui-même', '작가는 도시 생활의 안식처를 찾아 자연으로 여행을 떠나서 마주쳤던 풍경을 그린다. 감탄을 자아내는 광대한 풍경, 잠깐 스쳐지나가면서 보는 익숙하고 편안한 풍경, 낯설거나 이국적이고 몽환적인 풍경 등 여행과 등산을 하며 마주치는 수많은 존재와 풍경들은 작가의 경험과 느낌을 토대로 새로운 풍경으로 재탄생한다. 작가는 자신이 풍경을 그리면서 갈증을 해소하고 휴식을 상상하듯이 감상자 역시 작가의 작품을 통해 편안하게 휴식하기를 바란다고 한다. 한지에 먹으로 채색하는 지극히 한국적인 방식으로 그려졌지만 현대적인 감각으로 그려져 동서양의 경계를 넘어 자연을 향한 향수를 자극하는 작품이다.
추천 이유
도시가 주는 편리함은 너무 매력적이지만 정신없이 바쁜 생활에서 공허감을 느끼고, 반복되는 일상에서 권태와 우울을 느끼기도 합니다. 그래서 많은 사람이 자연을 느낄 수 있는 곳으로 여행을 떠나고 싶어 합니다. 하지만 해야 할 일을 뒤로하고 어딘가로 훌쩍 떠난다는 게 말처럼 쉬운 일이 아니기에, 권소영 작가의 손에서 멋지게 재탄생한 자연 풍경을 즐겨보기를 추천합니다. 무채색으로 그려진 작가의 풍경화는 안락한 자연과 이상적인 경관을 보여주어 이상향에 한 걸음 다가가는 것 같은 기분이 들고, 마음이 차분히 가라앉고 평온해지는 것을 경험할 수 있을 것입니다. 감성을 자극하는 현대적인 수묵산수화로 일상의 지루함을 달래보세요.
', '600x720', 60000, 4, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(5, '난향', 1, '자화상', '나는 유년기의 어려웠던 기억들을 재해석함으로써 현대 사회 속에서 타인으로부터 상처받거나 소외감을 느끼며 살아가는 우리에게 자신을 돌아보고 위로하는 기회를 주는 그림을 그리고 싶다. 이인영 작가는 말한다. 그는 시장에서 하루 종일 야채장사를 하셨던 어머니와 계속된 사업의 실패로 술에 삶을 의지하셨던 아버지를 떠올리며 자신의 가난하고 불우했던 어린 시절을 고백한다. 유년기의 성장통과 불안, 욕망 등 내면의 다양한 감정들을 시각적 언어로 표현하는 그의 작업을 통해 자신의 어두운 감정을 마주할 수 있는 용기를 얻게 된다. 아픔을 마주하는 용기, 그것을 통해 우리는 비로소 자신을 모습을 바라볼 수 있고 성장할 수 있을 것이다.
추천 이유
지하철이나 버스 안에서 사람들을 보고 있으면 스마트폰을 한 손에 쥐고 눈을 그곳에서 떼지 못하고 있습니다. 사람들은 무언가를 상상하거나 생각하기보다 계속해서 어떠한 자료와 정보를 공유 받기를 원하고 있는 것 같습니다. 마치 무언가에 중독된 것처럼 말이죠. 하지만 공상의 시간은 과부화 된 뇌를 쉬게 하고 에너지를 충전하기에 꼭 필요한 시간입니다. 이인영 작가 또한 인생의 절망적인 시기를 공상을 통해 견뎌낼 수 있었다고 합니다. 거친 붓 터치와 깊은 색감으로 그려진 이 작품은 마치 누군가의 꿈속에 들어온 듯한 분위기를 연출하고, 강렬한 느낌을 자아냅니다. 참신한 아이디어가 필요한 곳에 어울리는 곳에 어울리는 작품을 찾고 있는 당신이라면 이 작품을 추천해드립니다. 공상의 세계로 당신을 안내해줄 것입니다
', '720x720', 30000, 5, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(6, '열빈', 1, '자화상2', '작가는 도시 생활의 안식처를 찾아 자연으로 여행을 떠나서 마주쳤던 풍경을 그린다. 감탄을 자아내는 광대한 풍경, 잠깐 스쳐지나가면서 보는 익숙하고 편안한 풍경, 낯설거나 이국적이고 몽환적인 풍경 등 여행과 등산을 하며 마주치는 수많은 존재와 풍경들은 작가의 경험과 느낌을 토대로 새로운 풍경으로 재탄생한다. 작가는 자신이 풍경을 그리면서 갈증을 해소하고 휴식을 상상하듯이 감상자 역시 작가의 작품을 통해 편안하게 휴식하기를 바란다고 한다. 한지에 먹으로 채색하는 지극히 한국적인 방식으로 그려졌지만 현대적인 감각으로 그려져 동서양의 경계를 넘어 자연을 향한 향수를 자극하는 작품이다.
추천 이유
도시가 주는 편리함은 너무 매력적이지만 정신없이 바쁜 생활에서 공허감을 느끼고, 반복되는 일상에서 권태와 우울을 느끼기도 합니다. 그래서 많은 사람이 자연을 느낄 수 있는 곳으로 여행을 떠나고 싶어 합니다. 하지만 해야 할 일을 뒤로하고 어딘가로 훌쩍 떠난다는 게 말처럼 쉬운 일이 아니기에, 권소영 작가의 손에서 멋지게 재탄생한 자연 풍경을 즐겨보기를 추천합니다. 무채색으로 그려진 작가의 풍경화는 안락한 자연과 이상적인 경관을 보여주어 이상향에 한 걸음 다가가는 것 같은 기분이 들고, 마음이 차분히 가라앉고 평온해지는 것을 경험할 수 있을 것입니다. 감성을 자극하는 현대적인 수묵산수화로 일상의 지루함을 달래보세요.
', '720x720', 130000, 6, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(7, '태원', 1, 'Jacqueline with Flowers', '유화를 통해 작품 속 대상에 감정을 이입시키고 일상을 재해석하는 김병권 작가는 끈질기게 유화라는 외길을 고집한다. 작가가 보는 세상과 공감을 불러일으키는 감정이 유화라는 매체를 통해 가장 잘 전달된다고 생각하기 때문이다. 작가는 우리가 일상에서 무심코 지나치는 풍경과 대상을 물감의 질감을 살려 입체적으로 표현한다. 작가의 흔적과 물성이 가시화된 그의 작품에서는 오히려 형태는 흐려지고 기억과 감정이 두드러지게 발현되어, 작품을 통해 관람자들에게 자신의 경험을 떠올리게 하고 감정을 마주하게 한다.
추천 이유
김병권 작가의 작품은 현실의 풍경을 대상으로 하지만 왜곡된 형태와 물감의 물성이 드러난 표면으로 인해 초현실적인 분위기를 자아냅니다. 길거리, 가게 앞 등 일상적인 공간이지만 작가의 시각으로 재탄생하여 독특하고 고유의 의미를 가진 장소가 된 듯합니다. 물감의 흔적이 그대로 남아 있는 작품을 보면서 작가의 흔적을 느끼고, 환상적인 분위기를 내는 세련된 색감에서 현대적인 감각을 느낄 수 있습니다. 20세기 초에 탄생한 초현실주의 작품을 보듯 상상력을 자극하며 일상 풍경을 자기만의 시선으로 재해석해 의미를 찾아갈 수 있도록 하는 작품으로, 공간에 개성을 부여해 줄 것입니다.
', '1200x1600', 250000, 7, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(1, '목란', 1, 'Le Rifain assis (Seated Riffian)', '현미경을 갖다 댄 듯 세밀한 묘사로 그려진 대상은 모두 생명을 가진 존재들이다. 남진숙 작가의 작품은 한 생명의 있는 그대로의 모습에 대한 치밀한 탐구로 이루어져있다. 그 탐구에 스민 절실함과 섬세함은 비단 대상을 그대로 재현하는 것에서 나타나는 것이 아니라 작품을 통해 드러난 작가의 시선을 통해 알 수 있다. 작가의 시선이 멈춘 누군가는 간절한 눈을 통해 돌처럼 굳어진 심정을 절절히 드러낸다. 누군가의 발자취가 남긴 그림자는 바닥의 보도 블록에서 튀어나와 몸 속을 흐르는 생명의 피처럼 순환하며 움직이는 살아있는 형태가 된다. 식물이 꽃을 피울 땐 주변의 모든 배경이 흐려지고 오직 여린 잎과 봉우리를 뚫고 고개를 내미는 꽃잎만이 남을 뿐이다. 이처럼 남진숙 작가는 살아있는 생명에 대한 깊을 고찰을 통해 삶이 의미를 갖게 되는 순간의 비밀을 드러낸다. 그것은 어떤 영원이나 저 멀리 이상의 세계에 있는 것이 아니라 생명이 그 순간을 살아가는 현재 바로 지금에 있는 것이다.
추천 이유
일상 속에서 우리는 작은 식물의 잎을 한없이 바라보는 경우가 아주 가끔씩 생깁니다. 그 순간 그 작은 잎에 미세한 솜털, 강한 줄기로부터 잎 끝까지 뻗어나간 잎맥이 있었음에 놀라게 됩니다. 그저 주변의 푸른 색의 일부분이었던 작은 잎이 지닌 선명함에 순간 압도당하기도 하지요. 이러한 시간은 우리가 무수히 지나쳐가는 삶의 순간순간에 대해 문득 깨닫게 합니다. 어제 오늘 내일 그저 시간의 흐름에 별일 없이 살던 나라는 존재 역시 이 작은 잎처럼 섬세하게 구성되고 강렬한 생명을 순간순간 뿜어내고 있습니다. 남진숙 작가는 살아있는 순간을 치열하게 담은 작품을 통해 살아있음 그 자체에 집중하는 시간을 갖게 합니다. 작품을 따라 작가의 시선으로 한 생명의 순간을 집중해서 보는 경험은 그 어떤 메시지보다도 우리의 삶을 생생하게 느끼고 나의 존재를 고찰하게 해주는 강한 울림을 갖고 있습니다. 남진숙 작가의 작품을 통해 살아있는 이 순간을 온전히 느껴보시기 바랍니다.
', '800x1200', 99000, 8, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(2, '홍원', 1, 'The Purple Robe', '나는 유년기의 어려웠던 기억들을 재해석함으로써 현대 사회 속에서 타인으로부터 상처받거나 소외감을 느끼며 살아가는 우리에게 자신을 돌아보고 위로하는 기회를 주는 그림을 그리고 싶다. 이인영 작가는 말한다. 그는 시장에서 하루 종일 야채장사를 하셨던 어머니와 계속된 사업의 실패로 술에 삶을 의지하셨던 아버지를 떠올리며 자신의 가난하고 불우했던 어린 시절을 고백한다. 유년기의 성장통과 불안, 욕망 등 내면의 다양한 감정들을 시각적 언어로 표현하는 그의 작업을 통해 자신의 어두운 감정을 마주할 수 있는 용기를 얻게 된다. 아픔을 마주하는 용기, 그것을 통해 우리는 비로소 자신을 모습을 바라볼 수 있고 성장할 수 있을 것이다.
추천 이유
지하철이나 버스 안에서 사람들을 보고 있으면 스마트폰을 한 손에 쥐고 눈을 그곳에서 떼지 못하고 있습니다. 사람들은 무언가를 상상하거나 생각하기보다 계속해서 어떠한 자료와 정보를 공유 받기를 원하고 있는 것 같습니다. 마치 무언가에 중독된 것처럼 말이죠. 하지만 공상의 시간은 과부화 된 뇌를 쉬게 하고 에너지를 충전하기에 꼭 필요한 시간입니다. 이인영 작가 또한 인생의 절망적인 시기를 공상을 통해 견뎌낼 수 있었다고 합니다. 거친 붓 터치와 깊은 색감으로 그려진 이 작품은 마치 누군가의 꿈속에 들어온 듯한 분위기를 연출하고, 강렬한 느낌을 자아냅니다. 참신한 아이디어가 필요한 곳에 어울리는 곳에 어울리는 작품을 찾고 있는 당신이라면 이 작품을 추천해드립니다. 공상의 세계로 당신을 안내해줄 것입니다
', '720x720', 70000, 9, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(3, '향미', 1, 'Woman With Hat', '작가는 도시 생활의 안식처를 찾아 자연으로 여행을 떠나서 마주쳤던 풍경을 그린다. 감탄을 자아내는 광대한 풍경, 잠깐 스쳐지나가면서 보는 익숙하고 편안한 풍경, 낯설거나 이국적이고 몽환적인 풍경 등 여행과 등산을 하며 마주치는 수많은 존재와 풍경들은 작가의 경험과 느낌을 토대로 새로운 풍경으로 재탄생한다. 작가는 자신이 풍경을 그리면서 갈증을 해소하고 휴식을 상상하듯이 감상자 역시 작가의 작품을 통해 편안하게 휴식하기를 바란다고 한다. 한지에 먹으로 채색하는 지극히 한국적인 방식으로 그려졌지만 현대적인 감각으로 그려져 동서양의 경계를 넘어 자연을 향한 향수를 자극하는 작품이다.
추천 이유
도시가 주는 편리함은 너무 매력적이지만 정신없이 바쁜 생활에서 공허감을 느끼고, 반복되는 일상에서 권태와 우울을 느끼기도 합니다. 그래서 많은 사람이 자연을 느낄 수 있는 곳으로 여행을 떠나고 싶어 합니다. 하지만 해야 할 일을 뒤로하고 어딘가로 훌쩍 떠난다는 게 말처럼 쉬운 일이 아니기에, 권소영 작가의 손에서 멋지게 재탄생한 자연 풍경을 즐겨보기를 추천합니다. 무채색으로 그려진 작가의 풍경화는 안락한 자연과 이상적인 경관을 보여주어 이상향에 한 걸음 다가가는 것 같은 기분이 들고, 마음이 차분히 가라앉고 평온해지는 것을 경험할 수 있을 것입니다. 감성을 자극하는 현대적인 수묵산수화로 일상의 지루함을 달래보세요.
', '240x480', 50000, 10, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(4, '도원', 1, '산책하는 사람들', '이동 수단으로서의 말 위에 정착을 의미하는 집이 올려져 있다. 류지선 작가는 모순적인 말의 모습을 통해 다양한 해석을 독려한다. 그는 집은 한 장소에 고정되어 있지만, 그것의 양식은 시대와 취향을 반영하며 그에 따라 변하기 때문에 항상 움직이는 말과 연결될 수 있음을 예리하게 짚어낸다. 다양한 건축양식이 혼재되어있는 집의 형태와 시공간을 알 수 없는 배경의 결합은 이러한 상징성을 뒷받침하고 서사적인 분위기를 연출한다. 한편, 건축술과 공간의 내부를 채우는 기술은 상당히 발전했지만, 인간 사이의 단절과 소외로 마음을 놓고 정착할 수 있는 곳을 거의 갖지 못한 채 심리적으로는 계속 떠돌아다니는 현대인의 단면을 밝힌다. 상징적 이미지를 통해 보여주는 현대 사회의 모습에서 그의 날카로운 비판 의식을 엿볼 수 있다.
추천 이유
집을 등에 실은 말이 정처 없이 떠돌고 있습니다. 화려하고 선명한 색상과 집을 등에 이고 있는 말이라는 이미지가 환상적인 분위기를 자아내는 한편, 말이 어떠한 곳을 떠돌아다니고 있는지 관찰하게 되는 일련의 과정이 보는 사람의 상상력을 자극합니다. 무엇을 상상하든 자유입니다. 어느 곳이든 갈 수 있지만, 어느 곳에도 머물지 못하는 현대인의 슬픈 모습을 볼 수 있고 동시에 어디든 갈 수 있다는 설렘 또한 느낄 수도 있습니다. 감각적이지만 결코 피상적이지 않아 무게감이 있습니다. 현대에 맞는 간결함이 돋보이지만, 그 의미는 가볍지 않은 공간과 조화를 이룰 수 있는 그림입니다.
', '120x240', 25000, 11, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(5, '난향', 1, '양산을 든 여인', '평범한 일상의 시간들이 지나면 추억이 되고 어느 날 우연치 않게 그 시간들을 되새기는 순간이 온다. 매일매일이 비슷해서 특별할 것 없다고 생각하는 시간들이 지나고 나면 소중해지는 순간처럼. 이혜진 작가는 반복되는 생활 속에서 스쳐 지나가는 풍경과 사물, 그리고 공간들을 감각하여 빗 바랜 추억을 곱씹는다. 과거의 기억이 현재의 순간을 만났을 때, 그녀의 작업은 여기서 시작된다. 이혜진 작가는 자신이 느끼고 발견한 섬세하고 감각적인 정서가 시간, 공간 그리고 기억을 재구성하여 새로운 이미지로 재구성한다. 종이와 연필 그리고 수묵 기법을 사용한 고즈넉한 그녀의 풍경들은 익숙하면서도 편안하고 정적이지만 동시에 다사로운 감각을 선사한다.
추천 이유
시간이 지남에도 늘 사랑받는 작품들, 즉 고전이라 일컬어지는 것들은 변치 않음이라기 보다는 다시 볼 때마다 새로운 기분을 주기 때문이 아닐까 합니다. 그렇게 느끼게 되는 연유는 아마 예전의 나와 지금의 내가 달라졌기 때문이겠죠. 불현듯 떠오르는 기억을 붙잡는 이혜진 작가의 작업은 마치, 새로운 나를 마주하게 하는 고전 이야기를 연상시킵니다. 시간이 지나면 증발하는 기억이 뜻밖의 순간에 마치 화학작용처럼 문득 떠오르는 것처럼 말입니다. 안온한 하면서도 신선함을 주는 이혜진 작가의 작품은 익숙하기 때문에 의식하지 못하고 있던 시간과 공간의 풍경을 예리하게 표현하는 일상을 돌이켜 생각해 보게 합니다. 여러분도 이혜진 작가의 작품을 통해 잊고 있던 기억을 또 다른 추억으로 떠올려보는 건 어떨까요?
', '1200x2400', 300000, 12, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(6, '열빈', 1, '밀집모자를 쓴 자화상', '유화를 통해 작품 속 대상에 감정을 이입시키고 일상을 재해석하는 김병권 작가는 끈질기게 유화라는 외길을 고집한다. 작가가 보는 세상과 공감을 불러일으키는 감정이 유화라는 매체를 통해 가장 잘 전달된다고 생각하기 때문이다. 작가는 우리가 일상에서 무심코 지나치는 풍경과 대상을 물감의 질감을 살려 입체적으로 표현한다. 작가의 흔적과 물성이 가시화된 그의 작품에서는 오히려 형태는 흐려지고 기억과 감정이 두드러지게 발현되어, 작품을 통해 관람자들에게 자신의 경험을 떠올리게 하고 감정을 마주하게 한다.
추천 이유
김병권 작가의 작품은 현실의 풍경을 대상으로 하지만 왜곡된 형태와 물감의 물성이 드러난 표면으로 인해 초현실적인 분위기를 자아냅니다. 길거리, 가게 앞 등 일상적인 공간이지만 작가의 시각으로 재탄생하여 독특하고 고유의 의미를 가진 장소가 된 듯합니다. 물감의 흔적이 그대로 남아 있는 작품을 보면서 작가의 흔적을 느끼고, 환상적인 분위기를 내는 세련된 색감에서 현대적인 감각을 느낄 수 있습니다. 20세기 초에 탄생한 초현실주의 작품을 보듯 상상력을 자극하며 일상 풍경을 자기만의 시선으로 재해석해 의미를 찾아갈 수 있도록 하는 작품으로, 공간에 개성을 부여해 줄 것입니다.
', '240x480', 60000, 13, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(7, '태원', 1, '괌도에서', '나는 유년기의 어려웠던 기억들을 재해석함으로써 현대 사회 속에서 타인으로부터 상처받거나 소외감을 느끼며 살아가는 우리에게 자신을 돌아보고 위로하는 기회를 주는 그림을 그리고 싶다. 이인영 작가는 말한다. 그는 시장에서 하루 종일 야채장사를 하셨던 어머니와 계속된 사업의 실패로 술에 삶을 의지하셨던 아버지를 떠올리며 자신의 가난하고 불우했던 어린 시절을 고백한다. 유년기의 성장통과 불안, 욕망 등 내면의 다양한 감정들을 시각적 언어로 표현하는 그의 작업을 통해 자신의 어두운 감정을 마주할 수 있는 용기를 얻게 된다. 아픔을 마주하는 용기, 그것을 통해 우리는 비로소 자신을 모습을 바라볼 수 있고 성장할 수 있을 것이다.
추천 이유
지하철이나 버스 안에서 사람들을 보고 있으면 스마트폰을 한 손에 쥐고 눈을 그곳에서 떼지 못하고 있습니다. 사람들은 무언가를 상상하거나 생각하기보다 계속해서 어떠한 자료와 정보를 공유 받기를 원하고 있는 것 같습니다. 마치 무언가에 중독된 것처럼 말이죠. 하지만 공상의 시간은 과부화 된 뇌를 쉬게 하고 에너지를 충전하기에 꼭 필요한 시간입니다. 이인영 작가 또한 인생의 절망적인 시기를 공상을 통해 견뎌낼 수 있었다고 합니다. 거친 붓 터치와 깊은 색감으로 그려진 이 작품은 마치 누군가의 꿈속에 들어온 듯한 분위기를 연출하고, 강렬한 느낌을 자아냅니다. 참신한 아이디어가 필요한 곳에 어울리는 곳에 어울리는 작품을 찾고 있는 당신이라면 이 작품을 추천해드립니다. 공상의 세계로 당신을 안내해줄 것입니다
', '1200x1600', 250000, 14, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(1, '목란', 1, 'Self-Portrait', '현미경을 갖다 댄 듯 세밀한 묘사로 그려진 대상은 모두 생명을 가진 존재들이다. 남진숙 작가의 작품은 한 생명의 있는 그대로의 모습에 대한 치밀한 탐구로 이루어져있다. 그 탐구에 스민 절실함과 섬세함은 비단 대상을 그대로 재현하는 것에서 나타나는 것이 아니라 작품을 통해 드러난 작가의 시선을 통해 알 수 있다. 작가의 시선이 멈춘 누군가는 간절한 눈을 통해 돌처럼 굳어진 심정을 절절히 드러낸다. 누군가의 발자취가 남긴 그림자는 바닥의 보도 블록에서 튀어나와 몸 속을 흐르는 생명의 피처럼 순환하며 움직이는 살아있는 형태가 된다. 식물이 꽃을 피울 땐 주변의 모든 배경이 흐려지고 오직 여린 잎과 봉우리를 뚫고 고개를 내미는 꽃잎만이 남을 뿐이다. 이처럼 남진숙 작가는 살아있는 생명에 대한 깊을 고찰을 통해 삶이 의미를 갖게 되는 순간의 비밀을 드러낸다. 그것은 어떤 영원이나 저 멀리 이상의 세계에 있는 것이 아니라 생명이 그 순간을 살아가는 현재 바로 지금에 있는 것이다.
추천 이유
일상 속에서 우리는 작은 식물의 잎을 한없이 바라보는 경우가 아주 가끔씩 생깁니다. 그 순간 그 작은 잎에 미세한 솜털, 강한 줄기로부터 잎 끝까지 뻗어나간 잎맥이 있었음에 놀라게 됩니다. 그저 주변의 푸른 색의 일부분이었던 작은 잎이 지닌 선명함에 순간 압도당하기도 하지요. 이러한 시간은 우리가 무수히 지나쳐가는 삶의 순간순간에 대해 문득 깨닫게 합니다. 어제 오늘 내일 그저 시간의 흐름에 별일 없이 살던 나라는 존재 역시 이 작은 잎처럼 섬세하게 구성되고 강렬한 생명을 순간순간 뿜어내고 있습니다. 남진숙 작가는 살아있는 순간을 치열하게 담은 작품을 통해 살아있음 그 자체에 집중하는 시간을 갖게 합니다. 작품을 따라 작가의 시선으로 한 생명의 순간을 집중해서 보는 경험은 그 어떤 메시지보다도 우리의 삶을 생생하게 느끼고 나의 존재를 고찰하게 해주는 강한 울림을 갖고 있습니다. 남진숙 작가의 작품을 통해 살아있는 이 순간을 온전히 느껴보시기 바랍니다.
', '600x600', 60000, 15, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(2, '홍원', 1, 'Self portrait at Lezaven', '평범한 일상의 시간들이 지나면 추억이 되고 어느 날 우연치 않게 그 시간들을 되새기는 순간이 온다. 매일매일이 비슷해서 특별할 것 없다고 생각하는 시간들이 지나고 나면 소중해지는 순간처럼. 이혜진 작가는 반복되는 생활 속에서 스쳐 지나가는 풍경과 사물, 그리고 공간들을 감각하여 빗 바랜 추억을 곱씹는다. 과거의 기억이 현재의 순간을 만났을 때, 그녀의 작업은 여기서 시작된다. 이혜진 작가는 자신이 느끼고 발견한 섬세하고 감각적인 정서가 시간, 공간 그리고 기억을 재구성하여 새로운 이미지로 재구성한다. 종이와 연필 그리고 수묵 기법을 사용한 고즈넉한 그녀의 풍경들은 익숙하면서도 편안하고 정적이지만 동시에 다사로운 감각을 선사한다.
추천 이유
시간이 지남에도 늘 사랑받는 작품들, 즉 고전이라 일컬어지는 것들은 변치 않음이라기 보다는 다시 볼 때마다 새로운 기분을 주기 때문이 아닐까 합니다. 그렇게 느끼게 되는 연유는 아마 예전의 나와 지금의 내가 달라졌기 때문이겠죠. 불현듯 떠오르는 기억을 붙잡는 이혜진 작가의 작업은 마치, 새로운 나를 마주하게 하는 고전 이야기를 연상시킵니다. 시간이 지나면 증발하는 기억이 뜻밖의 순간에 마치 화학작용처럼 문득 떠오르는 것처럼 말입니다. 안온한 하면서도 신선함을 주는 이혜진 작가의 작품은 익숙하기 때문에 의식하지 못하고 있던 시간과 공간의 풍경을 예리하게 표현하는 일상을 돌이켜 생각해 보게 합니다. 여러분도 이혜진 작가의 작품을 통해 잊고 있던 기억을 또 다른 추억으로 떠올려보는 건 어떨까요?
', '300x900', 100000, 16, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(3, '향미', 1, 'Self-Portrait with Halo', '이동 수단으로서의 말 위에 정착을 의미하는 집이 올려져 있다. 류지선 작가는 모순적인 말의 모습을 통해 다양한 해석을 독려한다. 그는 집은 한 장소에 고정되어 있지만, 그것의 양식은 시대와 취향을 반영하며 그에 따라 변하기 때문에 항상 움직이는 말과 연결될 수 있음을 예리하게 짚어낸다. 다양한 건축양식이 혼재되어있는 집의 형태와 시공간을 알 수 없는 배경의 결합은 이러한 상징성을 뒷받침하고 서사적인 분위기를 연출한다. 한편, 건축술과 공간의 내부를 채우는 기술은 상당히 발전했지만, 인간 사이의 단절과 소외로 마음을 놓고 정착할 수 있는 곳을 거의 갖지 못한 채 심리적으로는 계속 떠돌아다니는 현대인의 단면을 밝힌다. 상징적 이미지를 통해 보여주는 현대 사회의 모습에서 그의 날카로운 비판 의식을 엿볼 수 있다.
추천 이유
집을 등에 실은 말이 정처 없이 떠돌고 있습니다. 화려하고 선명한 색상과 집을 등에 이고 있는 말이라는 이미지가 환상적인 분위기를 자아내는 한편, 말이 어떠한 곳을 떠돌아다니고 있는지 관찰하게 되는 일련의 과정이 보는 사람의 상상력을 자극합니다. 무엇을 상상하든 자유입니다. 어느 곳이든 갈 수 있지만, 어느 곳에도 머물지 못하는 현대인의 슬픈 모습을 볼 수 있고 동시에 어디든 갈 수 있다는 설렘 또한 느낄 수도 있습니다. 감각적이지만 결코 피상적이지 않아 무게감이 있습니다. 현대에 맞는 간결함이 돋보이지만, 그 의미는 가볍지 않은 공간과 조화를 이룰 수 있는 그림입니다.
', '480x480', 30000, 17, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(4, '도원', 1, '보니토새들과 함께한 자화상', '현미경을 갖다 댄 듯 세밀한 묘사로 그려진 대상은 모두 생명을 가진 존재들이다. 남진숙 작가의 작품은 한 생명의 있는 그대로의 모습에 대한 치밀한 탐구로 이루어져있다. 그 탐구에 스민 절실함과 섬세함은 비단 대상을 그대로 재현하는 것에서 나타나는 것이 아니라 작품을 통해 드러난 작가의 시선을 통해 알 수 있다. 작가의 시선이 멈춘 누군가는 간절한 눈을 통해 돌처럼 굳어진 심정을 절절히 드러낸다. 누군가의 발자취가 남긴 그림자는 바닥의 보도 블록에서 튀어나와 몸 속을 흐르는 생명의 피처럼 순환하며 움직이는 살아있는 형태가 된다. 식물이 꽃을 피울 땐 주변의 모든 배경이 흐려지고 오직 여린 잎과 봉우리를 뚫고 고개를 내미는 꽃잎만이 남을 뿐이다. 이처럼 남진숙 작가는 살아있는 생명에 대한 깊을 고찰을 통해 삶이 의미를 갖게 되는 순간의 비밀을 드러낸다. 그것은 어떤 영원이나 저 멀리 이상의 세계에 있는 것이 아니라 생명이 그 순간을 살아가는 현재 바로 지금에 있는 것이다.
추천 이유
일상 속에서 우리는 작은 식물의 잎을 한없이 바라보는 경우가 아주 가끔씩 생깁니다. 그 순간 그 작은 잎에 미세한 솜털, 강한 줄기로부터 잎 끝까지 뻗어나간 잎맥이 있었음에 놀라게 됩니다. 그저 주변의 푸른 색의 일부분이었던 작은 잎이 지닌 선명함에 순간 압도당하기도 하지요. 이러한 시간은 우리가 무수히 지나쳐가는 삶의 순간순간에 대해 문득 깨닫게 합니다. 어제 오늘 내일 그저 시간의 흐름에 별일 없이 살던 나라는 존재 역시 이 작은 잎처럼 섬세하게 구성되고 강렬한 생명을 순간순간 뿜어내고 있습니다. 남진숙 작가는 살아있는 순간을 치열하게 담은 작품을 통해 살아있음 그 자체에 집중하는 시간을 갖게 합니다. 작품을 따라 작가의 시선으로 한 생명의 순간을 집중해서 보는 경험은 그 어떤 메시지보다도 우리의 삶을 생생하게 느끼고 나의 존재를 고찰하게 해주는 강한 울림을 갖고 있습니다. 남진숙 작가의 작품을 통해 살아있는 이 순간을 온전히 느껴보시기 바랍니다.
', '600x720', 90000, 18, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(5, '난향', 1, '엘로서 박사에게 보낸 자화상', '이동 수단으로서의 말 위에 정착을 의미하는 집이 올려져 있다. 류지선 작가는 모순적인 말의 모습을 통해 다양한 해석을 독려한다. 그는 집은 한 장소에 고정되어 있지만, 그것의 양식은 시대와 취향을 반영하며 그에 따라 변하기 때문에 항상 움직이는 말과 연결될 수 있음을 예리하게 짚어낸다. 다양한 건축양식이 혼재되어있는 집의 형태와 시공간을 알 수 없는 배경의 결합은 이러한 상징성을 뒷받침하고 서사적인 분위기를 연출한다. 한편, 건축술과 공간의 내부를 채우는 기술은 상당히 발전했지만, 인간 사이의 단절과 소외로 마음을 놓고 정착할 수 있는 곳을 거의 갖지 못한 채 심리적으로는 계속 떠돌아다니는 현대인의 단면을 밝힌다. 상징적 이미지를 통해 보여주는 현대 사회의 모습에서 그의 날카로운 비판 의식을 엿볼 수 있다.
추천 이유
집을 등에 실은 말이 정처 없이 떠돌고 있습니다. 화려하고 선명한 색상과 집을 등에 이고 있는 말이라는 이미지가 환상적인 분위기를 자아내는 한편, 말이 어떠한 곳을 떠돌아다니고 있는지 관찰하게 되는 일련의 과정이 보는 사람의 상상력을 자극합니다. 무엇을 상상하든 자유입니다. 어느 곳이든 갈 수 있지만, 어느 곳에도 머물지 못하는 현대인의 슬픈 모습을 볼 수 있고 동시에 어디든 갈 수 있다는 설렘 또한 느낄 수도 있습니다. 감각적이지만 결코 피상적이지 않아 무게감이 있습니다. 현대에 맞는 간결함이 돋보이지만, 그 의미는 가볍지 않은 공간과 조화를 이룰 수 있는 그림입니다.
', '1600x1600', 350000, 19, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(6, '열빈', 1, 'Maya with a Doll', '유화를 통해 작품 속 대상에 감정을 이입시키고 일상을 재해석하는 김병권 작가는 끈질기게 유화라는 외길을 고집한다. 작가가 보는 세상과 공감을 불러일으키는 감정이 유화라는 매체를 통해 가장 잘 전달된다고 생각하기 때문이다. 작가는 우리가 일상에서 무심코 지나치는 풍경과 대상을 물감의 질감을 살려 입체적으로 표현한다. 작가의 흔적과 물성이 가시화된 그의 작품에서는 오히려 형태는 흐려지고 기억과 감정이 두드러지게 발현되어, 작품을 통해 관람자들에게 자신의 경험을 떠올리게 하고 감정을 마주하게 한다.
추천 이유
김병권 작가의 작품은 현실의 풍경을 대상으로 하지만 왜곡된 형태와 물감의 물성이 드러난 표면으로 인해 초현실적인 분위기를 자아냅니다. 길거리, 가게 앞 등 일상적인 공간이지만 작가의 시각으로 재탄생하여 독특하고 고유의 의미를 가진 장소가 된 듯합니다. 물감의 흔적이 그대로 남아 있는 작품을 보면서 작가의 흔적을 느끼고, 환상적인 분위기를 내는 세련된 색감에서 현대적인 감각을 느낄 수 있습니다. 20세기 초에 탄생한 초현실주의 작품을 보듯 상상력을 자극하며 일상 풍경을 자기만의 시선으로 재해석해 의미를 찾아갈 수 있도록 하는 작품으로, 공간에 개성을 부여해 줄 것입니다.
', '480x480', 45000, 20, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(7, '태원', 1, 'The Peasant', '작가는 도시 생활의 안식처를 찾아 자연으로 여행을 떠나서 마주쳤던 풍경을 그린다. 감탄을 자아내는 광대한 풍경, 잠깐 스쳐지나가면서 보는 익숙하고 편안한 풍경, 낯설거나 이국적이고 몽환적인 풍경 등 여행과 등산을 하며 마주치는 수많은 존재와 풍경들은 작가의 경험과 느낌을 토대로 새로운 풍경으로 재탄생한다. 작가는 자신이 풍경을 그리면서 갈증을 해소하고 휴식을 상상하듯이 감상자 역시 작가의 작품을 통해 편안하게 휴식하기를 바란다고 한다. 한지에 먹으로 채색하는 지극히 한국적인 방식으로 그려졌지만 현대적인 감각으로 그려져 동서양의 경계를 넘어 자연을 향한 향수를 자극하는 작품이다.
추천 이유
도시가 주는 편리함은 너무 매력적이지만 정신없이 바쁜 생활에서 공허감을 느끼고, 반복되는 일상에서 권태와 우울을 느끼기도 합니다. 그래서 많은 사람이 자연을 느낄 수 있는 곳으로 여행을 떠나고 싶어 합니다. 하지만 해야 할 일을 뒤로하고 어딘가로 훌쩍 떠난다는 게 말처럼 쉬운 일이 아니기에, 권소영 작가의 손에서 멋지게 재탄생한 자연 풍경을 즐겨보기를 추천합니다. 무채색으로 그려진 작가의 풍경화는 안락한 자연과 이상적인 경관을 보여주어 이상향에 한 걸음 다가가는 것 같은 기분이 들고, 마음이 차분히 가라앉고 평온해지는 것을 경험할 수 있을 것입니다. 감성을 자극하는 현대적인 수묵산수화로 일상의 지루함을 달래보세요.
', '900x900', 90000, 21, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(1, '목란', 1, 'Three Dancers', '나는 유년기의 어려웠던 기억들을 재해석함으로써 현대 사회 속에서 타인으로부터 상처받거나 소외감을 느끼며 살아가는 우리에게 자신을 돌아보고 위로하는 기회를 주는 그림을 그리고 싶다. 이인영 작가는 말한다. 그는 시장에서 하루 종일 야채장사를 하셨던 어머니와 계속된 사업의 실패로 술에 삶을 의지하셨던 아버지를 떠올리며 자신의 가난하고 불우했던 어린 시절을 고백한다. 유년기의 성장통과 불안, 욕망 등 내면의 다양한 감정들을 시각적 언어로 표현하는 그의 작업을 통해 자신의 어두운 감정을 마주할 수 있는 용기를 얻게 된다. 아픔을 마주하는 용기, 그것을 통해 우리는 비로소 자신을 모습을 바라볼 수 있고 성장할 수 있을 것이다.
추천 이유
지하철이나 버스 안에서 사람들을 보고 있으면 스마트폰을 한 손에 쥐고 눈을 그곳에서 떼지 못하고 있습니다. 사람들은 무언가를 상상하거나 생각하기보다 계속해서 어떠한 자료와 정보를 공유 받기를 원하고 있는 것 같습니다. 마치 무언가에 중독된 것처럼 말이죠. 하지만 공상의 시간은 과부화 된 뇌를 쉬게 하고 에너지를 충전하기에 꼭 필요한 시간입니다. 이인영 작가 또한 인생의 절망적인 시기를 공상을 통해 견뎌낼 수 있었다고 합니다. 거친 붓 터치와 깊은 색감으로 그려진 이 작품은 마치 누군가의 꿈속에 들어온 듯한 분위기를 연출하고, 강렬한 느낌을 자아냅니다. 참신한 아이디어가 필요한 곳에 어울리는 곳에 어울리는 작품을 찾고 있는 당신이라면 이 작품을 추천해드립니다. 공상의 세계로 당신을 안내해줄 것입니다
', '800x800', 40000, 22, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(2, '홍원', 1, 'Weeping Woman', '현미경을 갖다 댄 듯 세밀한 묘사로 그려진 대상은 모두 생명을 가진 존재들이다. 남진숙 작가의 작품은 한 생명의 있는 그대로의 모습에 대한 치밀한 탐구로 이루어져있다. 그 탐구에 스민 절실함과 섬세함은 비단 대상을 그대로 재현하는 것에서 나타나는 것이 아니라 작품을 통해 드러난 작가의 시선을 통해 알 수 있다. 작가의 시선이 멈춘 누군가는 간절한 눈을 통해 돌처럼 굳어진 심정을 절절히 드러낸다. 누군가의 발자취가 남긴 그림자는 바닥의 보도 블록에서 튀어나와 몸 속을 흐르는 생명의 피처럼 순환하며 움직이는 살아있는 형태가 된다. 식물이 꽃을 피울 땐 주변의 모든 배경이 흐려지고 오직 여린 잎과 봉우리를 뚫고 고개를 내미는 꽃잎만이 남을 뿐이다. 이처럼 남진숙 작가는 살아있는 생명에 대한 깊을 고찰을 통해 삶이 의미를 갖게 되는 순간의 비밀을 드러낸다. 그것은 어떤 영원이나 저 멀리 이상의 세계에 있는 것이 아니라 생명이 그 순간을 살아가는 현재 바로 지금에 있는 것이다.
추천 이유
일상 속에서 우리는 작은 식물의 잎을 한없이 바라보는 경우가 아주 가끔씩 생깁니다. 그 순간 그 작은 잎에 미세한 솜털, 강한 줄기로부터 잎 끝까지 뻗어나간 잎맥이 있었음에 놀라게 됩니다. 그저 주변의 푸른 색의 일부분이었던 작은 잎이 지닌 선명함에 순간 압도당하기도 하지요. 이러한 시간은 우리가 무수히 지나쳐가는 삶의 순간순간에 대해 문득 깨닫게 합니다. 어제 오늘 내일 그저 시간의 흐름에 별일 없이 살던 나라는 존재 역시 이 작은 잎처럼 섬세하게 구성되고 강렬한 생명을 순간순간 뿜어내고 있습니다. 남진숙 작가는 살아있는 순간을 치열하게 담은 작품을 통해 살아있음 그 자체에 집중하는 시간을 갖게 합니다. 작품을 따라 작가의 시선으로 한 생명의 순간을 집중해서 보는 경험은 그 어떤 메시지보다도 우리의 삶을 생생하게 느끼고 나의 존재를 고찰하게 해주는 강한 울림을 갖고 있습니다. 남진숙 작가의 작품을 통해 살아있는 이 순간을 온전히 느껴보시기 바랍니다.
', '600x900', 35000, 23, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(3, '향미', 1, 'Woman with a Chignon', '유화를 통해 작품 속 대상에 감정을 이입시키고 일상을 재해석하는 김병권 작가는 끈질기게 유화라는 외길을 고집한다. 작가가 보는 세상과 공감을 불러일으키는 감정이 유화라는 매체를 통해 가장 잘 전달된다고 생각하기 때문이다. 작가는 우리가 일상에서 무심코 지나치는 풍경과 대상을 물감의 질감을 살려 입체적으로 표현한다. 작가의 흔적과 물성이 가시화된 그의 작품에서는 오히려 형태는 흐려지고 기억과 감정이 두드러지게 발현되어, 작품을 통해 관람자들에게 자신의 경험을 떠올리게 하고 감정을 마주하게 한다.
추천 이유
김병권 작가의 작품은 현실의 풍경을 대상으로 하지만 왜곡된 형태와 물감의 물성이 드러난 표면으로 인해 초현실적인 분위기를 자아냅니다. 길거리, 가게 앞 등 일상적인 공간이지만 작가의 시각으로 재탄생하여 독특하고 고유의 의미를 가진 장소가 된 듯합니다. 물감의 흔적이 그대로 남아 있는 작품을 보면서 작가의 흔적을 느끼고, 환상적인 분위기를 내는 세련된 색감에서 현대적인 감각을 느낄 수 있습니다. 20세기 초에 탄생한 초현실주의 작품을 보듯 상상력을 자극하며 일상 풍경을 자기만의 시선으로 재해석해 의미를 찾아갈 수 있도록 하는 작품으로, 공간에 개성을 부여해 줄 것입니다.
', '900x1200', 450000, 24, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(4, '도원', 1, 'Woman with a Flower', '현미경을 갖다 댄 듯 세밀한 묘사로 그려진 대상은 모두 생명을 가진 존재들이다. 남진숙 작가의 작품은 한 생명의 있는 그대로의 모습에 대한 치밀한 탐구로 이루어져있다. 그 탐구에 스민 절실함과 섬세함은 비단 대상을 그대로 재현하는 것에서 나타나는 것이 아니라 작품을 통해 드러난 작가의 시선을 통해 알 수 있다. 작가의 시선이 멈춘 누군가는 간절한 눈을 통해 돌처럼 굳어진 심정을 절절히 드러낸다. 누군가의 발자취가 남긴 그림자는 바닥의 보도 블록에서 튀어나와 몸 속을 흐르는 생명의 피처럼 순환하며 움직이는 살아있는 형태가 된다. 식물이 꽃을 피울 땐 주변의 모든 배경이 흐려지고 오직 여린 잎과 봉우리를 뚫고 고개를 내미는 꽃잎만이 남을 뿐이다. 이처럼 남진숙 작가는 살아있는 생명에 대한 깊을 고찰을 통해 삶이 의미를 갖게 되는 순간의 비밀을 드러낸다. 그것은 어떤 영원이나 저 멀리 이상의 세계에 있는 것이 아니라 생명이 그 순간을 살아가는 현재 바로 지금에 있는 것이다.
추천 이유
일상 속에서 우리는 작은 식물의 잎을 한없이 바라보는 경우가 아주 가끔씩 생깁니다. 그 순간 그 작은 잎에 미세한 솜털, 강한 줄기로부터 잎 끝까지 뻗어나간 잎맥이 있었음에 놀라게 됩니다. 그저 주변의 푸른 색의 일부분이었던 작은 잎이 지닌 선명함에 순간 압도당하기도 하지요. 이러한 시간은 우리가 무수히 지나쳐가는 삶의 순간순간에 대해 문득 깨닫게 합니다. 어제 오늘 내일 그저 시간의 흐름에 별일 없이 살던 나라는 존재 역시 이 작은 잎처럼 섬세하게 구성되고 강렬한 생명을 순간순간 뿜어내고 있습니다. 남진숙 작가는 살아있는 순간을 치열하게 담은 작품을 통해 살아있음 그 자체에 집중하는 시간을 갖게 합니다. 작품을 따라 작가의 시선으로 한 생명의 순간을 집중해서 보는 경험은 그 어떤 메시지보다도 우리의 삶을 생생하게 느끼고 나의 존재를 고찰하게 해주는 강한 울림을 갖고 있습니다. 남진숙 작가의 작품을 통해 살아있는 이 순간을 온전히 느껴보시기 바랍니다.
', '720x720', 80000, 25, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(5, '난향', 1, 'Young Tormented Girl', '평범한 일상의 시간들이 지나면 추억이 되고 어느 날 우연치 않게 그 시간들을 되새기는 순간이 온다. 매일매일이 비슷해서 특별할 것 없다고 생각하는 시간들이 지나고 나면 소중해지는 순간처럼. 이혜진 작가는 반복되는 생활 속에서 스쳐 지나가는 풍경과 사물, 그리고 공간들을 감각하여 빗 바랜 추억을 곱씹는다. 과거의 기억이 현재의 순간을 만났을 때, 그녀의 작업은 여기서 시작된다. 이혜진 작가는 자신이 느끼고 발견한 섬세하고 감각적인 정서가 시간, 공간 그리고 기억을 재구성하여 새로운 이미지로 재구성한다. 종이와 연필 그리고 수묵 기법을 사용한 고즈넉한 그녀의 풍경들은 익숙하면서도 편안하고 정적이지만 동시에 다사로운 감각을 선사한다.
추천 이유
시간이 지남에도 늘 사랑받는 작품들, 즉 고전이라 일컬어지는 것들은 변치 않음이라기 보다는 다시 볼 때마다 새로운 기분을 주기 때문이 아닐까 합니다. 그렇게 느끼게 되는 연유는 아마 예전의 나와 지금의 내가 달라졌기 때문이겠죠. 불현듯 떠오르는 기억을 붙잡는 이혜진 작가의 작업은 마치, 새로운 나를 마주하게 하는 고전 이야기를 연상시킵니다. 시간이 지나면 증발하는 기억이 뜻밖의 순간에 마치 화학작용처럼 문득 떠오르는 것처럼 말입니다. 안온한 하면서도 신선함을 주는 이혜진 작가의 작품은 익숙하기 때문에 의식하지 못하고 있던 시간과 공간의 풍경을 예리하게 표현하는 일상을 돌이켜 생각해 보게 합니다. 여러분도 이혜진 작가의 작품을 통해 잊고 있던 기억을 또 다른 추억으로 떠올려보는 건 어떨까요?
', '480x480', 150000, 26, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(6, '열빈', 1, '바닥에 앉아 있는 난쟁이', '평범한 일상의 시간들이 지나면 추억이 되고 어느 날 우연치 않게 그 시간들을 되새기는 순간이 온다. 매일매일이 비슷해서 특별할 것 없다고 생각하는 시간들이 지나고 나면 소중해지는 순간처럼. 이혜진 작가는 반복되는 생활 속에서 스쳐 지나가는 풍경과 사물, 그리고 공간들을 감각하여 빗 바랜 추억을 곱씹는다. 과거의 기억이 현재의 순간을 만났을 때, 그녀의 작업은 여기서 시작된다. 이혜진 작가는 자신이 느끼고 발견한 섬세하고 감각적인 정서가 시간, 공간 그리고 기억을 재구성하여 새로운 이미지로 재구성한다. 종이와 연필 그리고 수묵 기법을 사용한 고즈넉한 그녀의 풍경들은 익숙하면서도 편안하고 정적이지만 동시에 다사로운 감각을 선사한다.
추천 이유
시간이 지남에도 늘 사랑받는 작품들, 즉 고전이라 일컬어지는 것들은 변치 않음이라기 보다는 다시 볼 때마다 새로운 기분을 주기 때문이 아닐까 합니다. 그렇게 느끼게 되는 연유는 아마 예전의 나와 지금의 내가 달라졌기 때문이겠죠. 불현듯 떠오르는 기억을 붙잡는 이혜진 작가의 작업은 마치, 새로운 나를 마주하게 하는 고전 이야기를 연상시킵니다. 시간이 지나면 증발하는 기억이 뜻밖의 순간에 마치 화학작용처럼 문득 떠오르는 것처럼 말입니다. 안온한 하면서도 신선함을 주는 이혜진 작가의 작품은 익숙하기 때문에 의식하지 못하고 있던 시간과 공간의 풍경을 예리하게 표현하는 일상을 돌이켜 생각해 보게 합니다. 여러분도 이혜진 작가의 작품을 통해 잊고 있던 기억을 또 다른 추억으로 떠올려보는 건 어떨까요?
', '300x480', 30000, 27, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(7, '태원', 1, '여왕', '이동 수단으로서의 말 위에 정착을 의미하는 집이 올려져 있다. 류지선 작가는 모순적인 말의 모습을 통해 다양한 해석을 독려한다. 그는 집은 한 장소에 고정되어 있지만, 그것의 양식은 시대와 취향을 반영하며 그에 따라 변하기 때문에 항상 움직이는 말과 연결될 수 있음을 예리하게 짚어낸다. 다양한 건축양식이 혼재되어있는 집의 형태와 시공간을 알 수 없는 배경의 결합은 이러한 상징성을 뒷받침하고 서사적인 분위기를 연출한다. 한편, 건축술과 공간의 내부를 채우는 기술은 상당히 발전했지만, 인간 사이의 단절과 소외로 마음을 놓고 정착할 수 있는 곳을 거의 갖지 못한 채 심리적으로는 계속 떠돌아다니는 현대인의 단면을 밝힌다. 상징적 이미지를 통해 보여주는 현대 사회의 모습에서 그의 날카로운 비판 의식을 엿볼 수 있다.
추천 이유
집을 등에 실은 말이 정처 없이 떠돌고 있습니다. 화려하고 선명한 색상과 집을 등에 이고 있는 말이라는 이미지가 환상적인 분위기를 자아내는 한편, 말이 어떠한 곳을 떠돌아다니고 있는지 관찰하게 되는 일련의 과정이 보는 사람의 상상력을 자극합니다. 무엇을 상상하든 자유입니다. 어느 곳이든 갈 수 있지만, 어느 곳에도 머물지 못하는 현대인의 슬픈 모습을 볼 수 있고 동시에 어디든 갈 수 있다는 설렘 또한 느낄 수도 있습니다. 감각적이지만 결코 피상적이지 않아 무게감이 있습니다. 현대에 맞는 간결함이 돋보이지만, 그 의미는 가볍지 않은 공간과 조화를 이룰 수 있는 그림입니다.
', '600x600', 200000, 28, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(1, '목란', 1, '귀족', '작가는 도시 생활의 안식처를 찾아 자연으로 여행을 떠나서 마주쳤던 풍경을 그린다. 감탄을 자아내는 광대한 풍경, 잠깐 스쳐지나가면서 보는 익숙하고 편안한 풍경, 낯설거나 이국적이고 몽환적인 풍경 등 여행과 등산을 하며 마주치는 수많은 존재와 풍경들은 작가의 경험과 느낌을 토대로 새로운 풍경으로 재탄생한다. 작가는 자신이 풍경을 그리면서 갈증을 해소하고 휴식을 상상하듯이 감상자 역시 작가의 작품을 통해 편안하게 휴식하기를 바란다고 한다. 한지에 먹으로 채색하는 지극히 한국적인 방식으로 그려졌지만 현대적인 감각으로 그려져 동서양의 경계를 넘어 자연을 향한 향수를 자극하는 작품이다.
추천 이유
도시가 주는 편리함은 너무 매력적이지만 정신없이 바쁜 생활에서 공허감을 느끼고, 반복되는 일상에서 권태와 우울을 느끼기도 합니다. 그래서 많은 사람이 자연을 느낄 수 있는 곳으로 여행을 떠나고 싶어 합니다. 하지만 해야 할 일을 뒤로하고 어딘가로 훌쩍 떠난다는 게 말처럼 쉬운 일이 아니기에, 권소영 작가의 손에서 멋지게 재탄생한 자연 풍경을 즐겨보기를 추천합니다. 무채색으로 그려진 작가의 풍경화는 안락한 자연과 이상적인 경관을 보여주어 이상향에 한 걸음 다가가는 것 같은 기분이 들고, 마음이 차분히 가라앉고 평온해지는 것을 경험할 수 있을 것입니다. 감성을 자극하는 현대적인 수묵산수화로 일상의 지루함을 달래보세요.
', '480x480', 70000, 29, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(2, '홍원', 1, 'Bildnis Freda Wermel in blauer bluse', '유화를 통해 작품 속 대상에 감정을 이입시키고 일상을 재해석하는 김병권 작가는 끈질기게 유화라는 외길을 고집한다. 작가가 보는 세상과 공감을 불러일으키는 감정이 유화라는 매체를 통해 가장 잘 전달된다고 생각하기 때문이다. 작가는 우리가 일상에서 무심코 지나치는 풍경과 대상을 물감의 질감을 살려 입체적으로 표현한다. 작가의 흔적과 물성이 가시화된 그의 작품에서는 오히려 형태는 흐려지고 기억과 감정이 두드러지게 발현되어, 작품을 통해 관람자들에게 자신의 경험을 떠올리게 하고 감정을 마주하게 한다.
추천 이유
김병권 작가의 작품은 현실의 풍경을 대상으로 하지만 왜곡된 형태와 물감의 물성이 드러난 표면으로 인해 초현실적인 분위기를 자아냅니다. 길거리, 가게 앞 등 일상적인 공간이지만 작가의 시각으로 재탄생하여 독특하고 고유의 의미를 가진 장소가 된 듯합니다. 물감의 흔적이 그대로 남아 있는 작품을 보면서 작가의 흔적을 느끼고, 환상적인 분위기를 내는 세련된 색감에서 현대적인 감각을 느낄 수 있습니다. 20세기 초에 탄생한 초현실주의 작품을 보듯 상상력을 자극하며 일상 풍경을 자기만의 시선으로 재해석해 의미를 찾아갈 수 있도록 하는 작품으로, 공간에 개성을 부여해 줄 것입니다.
', '480x480', 45000, 30, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(3, '향미', 1, 'Cellospieler, Bildnis Dr. Freundlich', '이동 수단으로서의 말 위에 정착을 의미하는 집이 올려져 있다. 류지선 작가는 모순적인 말의 모습을 통해 다양한 해석을 독려한다. 그는 집은 한 장소에 고정되어 있지만, 그것의 양식은 시대와 취향을 반영하며 그에 따라 변하기 때문에 항상 움직이는 말과 연결될 수 있음을 예리하게 짚어낸다. 다양한 건축양식이 혼재되어있는 집의 형태와 시공간을 알 수 없는 배경의 결합은 이러한 상징성을 뒷받침하고 서사적인 분위기를 연출한다. 한편, 건축술과 공간의 내부를 채우는 기술은 상당히 발전했지만, 인간 사이의 단절과 소외로 마음을 놓고 정착할 수 있는 곳을 거의 갖지 못한 채 심리적으로는 계속 떠돌아다니는 현대인의 단면을 밝힌다. 상징적 이미지를 통해 보여주는 현대 사회의 모습에서 그의 날카로운 비판 의식을 엿볼 수 있다.
추천 이유
집을 등에 실은 말이 정처 없이 떠돌고 있습니다. 화려하고 선명한 색상과 집을 등에 이고 있는 말이라는 이미지가 환상적인 분위기를 자아내는 한편, 말이 어떠한 곳을 떠돌아다니고 있는지 관찰하게 되는 일련의 과정이 보는 사람의 상상력을 자극합니다. 무엇을 상상하든 자유입니다. 어느 곳이든 갈 수 있지만, 어느 곳에도 머물지 못하는 현대인의 슬픈 모습을 볼 수 있고 동시에 어디든 갈 수 있다는 설렘 또한 느낄 수도 있습니다. 감각적이지만 결코 피상적이지 않아 무게감이 있습니다. 현대에 맞는 간결함이 돋보이지만, 그 의미는 가볍지 않은 공간과 조화를 이룰 수 있는 그림입니다.
', '480x720', 35000, 31, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(4, '도원', 1, 'dancer', '현미경을 갖다 댄 듯 세밀한 묘사로 그려진 대상은 모두 생명을 가진 존재들이다. 남진숙 작가의 작품은 한 생명의 있는 그대로의 모습에 대한 치밀한 탐구로 이루어져있다. 그 탐구에 스민 절실함과 섬세함은 비단 대상을 그대로 재현하는 것에서 나타나는 것이 아니라 작품을 통해 드러난 작가의 시선을 통해 알 수 있다. 작가의 시선이 멈춘 누군가는 간절한 눈을 통해 돌처럼 굳어진 심정을 절절히 드러낸다. 누군가의 발자취가 남긴 그림자는 바닥의 보도 블록에서 튀어나와 몸 속을 흐르는 생명의 피처럼 순환하며 움직이는 살아있는 형태가 된다. 식물이 꽃을 피울 땐 주변의 모든 배경이 흐려지고 오직 여린 잎과 봉우리를 뚫고 고개를 내미는 꽃잎만이 남을 뿐이다. 이처럼 남진숙 작가는 살아있는 생명에 대한 깊을 고찰을 통해 삶이 의미를 갖게 되는 순간의 비밀을 드러낸다. 그것은 어떤 영원이나 저 멀리 이상의 세계에 있는 것이 아니라 생명이 그 순간을 살아가는 현재 바로 지금에 있는 것이다.
추천 이유
일상 속에서 우리는 작은 식물의 잎을 한없이 바라보는 경우가 아주 가끔씩 생깁니다. 그 순간 그 작은 잎에 미세한 솜털, 강한 줄기로부터 잎 끝까지 뻗어나간 잎맥이 있었음에 놀라게 됩니다. 그저 주변의 푸른 색의 일부분이었던 작은 잎이 지닌 선명함에 순간 압도당하기도 하지요. 이러한 시간은 우리가 무수히 지나쳐가는 삶의 순간순간에 대해 문득 깨닫게 합니다. 어제 오늘 내일 그저 시간의 흐름에 별일 없이 살던 나라는 존재 역시 이 작은 잎처럼 섬세하게 구성되고 강렬한 생명을 순간순간 뿜어내고 있습니다. 남진숙 작가는 살아있는 순간을 치열하게 담은 작품을 통해 살아있음 그 자체에 집중하는 시간을 갖게 합니다. 작품을 따라 작가의 시선으로 한 생명의 순간을 집중해서 보는 경험은 그 어떤 메시지보다도 우리의 삶을 생생하게 느끼고 나의 존재를 고찰하게 해주는 강한 울림을 갖고 있습니다. 남진숙 작가의 작품을 통해 살아있는 이 순간을 온전히 느껴보시기 바랍니다.
', '600x900', 150000, 32, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(5, '난향', 1, 'The Yellow Mask', '평범한 일상의 시간들이 지나면 추억이 되고 어느 날 우연치 않게 그 시간들을 되새기는 순간이 온다. 매일매일이 비슷해서 특별할 것 없다고 생각하는 시간들이 지나고 나면 소중해지는 순간처럼. 이혜진 작가는 반복되는 생활 속에서 스쳐 지나가는 풍경과 사물, 그리고 공간들을 감각하여 빗 바랜 추억을 곱씹는다. 과거의 기억이 현재의 순간을 만났을 때, 그녀의 작업은 여기서 시작된다. 이혜진 작가는 자신이 느끼고 발견한 섬세하고 감각적인 정서가 시간, 공간 그리고 기억을 재구성하여 새로운 이미지로 재구성한다. 종이와 연필 그리고 수묵 기법을 사용한 고즈넉한 그녀의 풍경들은 익숙하면서도 편안하고 정적이지만 동시에 다사로운 감각을 선사한다.
추천 이유
시간이 지남에도 늘 사랑받는 작품들, 즉 고전이라 일컬어지는 것들은 변치 않음이라기 보다는 다시 볼 때마다 새로운 기분을 주기 때문이 아닐까 합니다. 그렇게 느끼게 되는 연유는 아마 예전의 나와 지금의 내가 달라졌기 때문이겠죠. 불현듯 떠오르는 기억을 붙잡는 이혜진 작가의 작업은 마치, 새로운 나를 마주하게 하는 고전 이야기를 연상시킵니다. 시간이 지나면 증발하는 기억이 뜻밖의 순간에 마치 화학작용처럼 문득 떠오르는 것처럼 말입니다. 안온한 하면서도 신선함을 주는 이혜진 작가의 작품은 익숙하기 때문에 의식하지 못하고 있던 시간과 공간의 풍경을 예리하게 표현하는 일상을 돌이켜 생각해 보게 합니다. 여러분도 이혜진 작가의 작품을 통해 잊고 있던 기억을 또 다른 추억으로 떠올려보는 건 어떨까요?
', '480x480', 25000, 33, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(6, '열빈', 1, '마리세잔의 초상화', '나는 유년기의 어려웠던 기억들을 재해석함으로써 현대 사회 속에서 타인으로부터 상처받거나 소외감을 느끼며 살아가는 우리에게 자신을 돌아보고 위로하는 기회를 주는 그림을 그리고 싶다. 이인영 작가는 말한다. 그는 시장에서 하루 종일 야채장사를 하셨던 어머니와 계속된 사업의 실패로 술에 삶을 의지하셨던 아버지를 떠올리며 자신의 가난하고 불우했던 어린 시절을 고백한다. 유년기의 성장통과 불안, 욕망 등 내면의 다양한 감정들을 시각적 언어로 표현하는 그의 작업을 통해 자신의 어두운 감정을 마주할 수 있는 용기를 얻게 된다. 아픔을 마주하는 용기, 그것을 통해 우리는 비로소 자신을 모습을 바라볼 수 있고 성장할 수 있을 것이다.
추천 이유
지하철이나 버스 안에서 사람들을 보고 있으면 스마트폰을 한 손에 쥐고 눈을 그곳에서 떼지 못하고 있습니다. 사람들은 무언가를 상상하거나 생각하기보다 계속해서 어떠한 자료와 정보를 공유 받기를 원하고 있는 것 같습니다. 마치 무언가에 중독된 것처럼 말이죠. 하지만 공상의 시간은 과부화 된 뇌를 쉬게 하고 에너지를 충전하기에 꼭 필요한 시간입니다. 이인영 작가 또한 인생의 절망적인 시기를 공상을 통해 견뎌낼 수 있었다고 합니다. 거친 붓 터치와 깊은 색감으로 그려진 이 작품은 마치 누군가의 꿈속에 들어온 듯한 분위기를 연출하고, 강렬한 느낌을 자아냅니다. 참신한 아이디어가 필요한 곳에 어울리는 곳에 어울리는 작품을 찾고 있는 당신이라면 이 작품을 추천해드립니다. 공상의 세계로 당신을 안내해줄 것입니다
', '600x720', 30000, 34, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(7, '태원', 1, '무용시험', '유화를 통해 작품 속 대상에 감정을 이입시키고 일상을 재해석하는 김병권 작가는 끈질기게 유화라는 외길을 고집한다. 작가가 보는 세상과 공감을 불러일으키는 감정이 유화라는 매체를 통해 가장 잘 전달된다고 생각하기 때문이다. 작가는 우리가 일상에서 무심코 지나치는 풍경과 대상을 물감의 질감을 살려 입체적으로 표현한다. 작가의 흔적과 물성이 가시화된 그의 작품에서는 오히려 형태는 흐려지고 기억과 감정이 두드러지게 발현되어, 작품을 통해 관람자들에게 자신의 경험을 떠올리게 하고 감정을 마주하게 한다.
추천 이유
김병권 작가의 작품은 현실의 풍경을 대상으로 하지만 왜곡된 형태와 물감의 물성이 드러난 표면으로 인해 초현실적인 분위기를 자아냅니다. 길거리, 가게 앞 등 일상적인 공간이지만 작가의 시각으로 재탄생하여 독특하고 고유의 의미를 가진 장소가 된 듯합니다. 물감의 흔적이 그대로 남아 있는 작품을 보면서 작가의 흔적을 느끼고, 환상적인 분위기를 내는 세련된 색감에서 현대적인 감각을 느낄 수 있습니다. 20세기 초에 탄생한 초현실주의 작품을 보듯 상상력을 자극하며 일상 풍경을 자기만의 시선으로 재해석해 의미를 찾아갈 수 있도록 하는 작품으로, 공간에 개성을 부여해 줄 것입니다.
', '600x900', 40000, 35, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(1, '목란', 1, '양치는 소녀', '현미경을 갖다 댄 듯 세밀한 묘사로 그려진 대상은 모두 생명을 가진 존재들이다. 남진숙 작가의 작품은 한 생명의 있는 그대로의 모습에 대한 치밀한 탐구로 이루어져있다. 그 탐구에 스민 절실함과 섬세함은 비단 대상을 그대로 재현하는 것에서 나타나는 것이 아니라 작품을 통해 드러난 작가의 시선을 통해 알 수 있다. 작가의 시선이 멈춘 누군가는 간절한 눈을 통해 돌처럼 굳어진 심정을 절절히 드러낸다. 누군가의 발자취가 남긴 그림자는 바닥의 보도 블록에서 튀어나와 몸 속을 흐르는 생명의 피처럼 순환하며 움직이는 살아있는 형태가 된다. 식물이 꽃을 피울 땐 주변의 모든 배경이 흐려지고 오직 여린 잎과 봉우리를 뚫고 고개를 내미는 꽃잎만이 남을 뿐이다. 이처럼 남진숙 작가는 살아있는 생명에 대한 깊을 고찰을 통해 삶이 의미를 갖게 되는 순간의 비밀을 드러낸다. 그것은 어떤 영원이나 저 멀리 이상의 세계에 있는 것이 아니라 생명이 그 순간을 살아가는 현재 바로 지금에 있는 것이다.
추천 이유
일상 속에서 우리는 작은 식물의 잎을 한없이 바라보는 경우가 아주 가끔씩 생깁니다. 그 순간 그 작은 잎에 미세한 솜털, 강한 줄기로부터 잎 끝까지 뻗어나간 잎맥이 있었음에 놀라게 됩니다. 그저 주변의 푸른 색의 일부분이었던 작은 잎이 지닌 선명함에 순간 압도당하기도 하지요. 이러한 시간은 우리가 무수히 지나쳐가는 삶의 순간순간에 대해 문득 깨닫게 합니다. 어제 오늘 내일 그저 시간의 흐름에 별일 없이 살던 나라는 존재 역시 이 작은 잎처럼 섬세하게 구성되고 강렬한 생명을 순간순간 뿜어내고 있습니다. 남진숙 작가는 살아있는 순간을 치열하게 담은 작품을 통해 살아있음 그 자체에 집중하는 시간을 갖게 합니다. 작품을 따라 작가의 시선으로 한 생명의 순간을 집중해서 보는 경험은 그 어떤 메시지보다도 우리의 삶을 생생하게 느끼고 나의 존재를 고찰하게 해주는 강한 울림을 갖고 있습니다. 남진숙 작가의 작품을 통해 살아있는 이 순간을 온전히 느껴보시기 바랍니다.
', '480x480', 60000, 36, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(2, '홍원', 1, '실잣는 여인', '작가는 도시 생활의 안식처를 찾아 자연으로 여행을 떠나서 마주쳤던 풍경을 그린다. 감탄을 자아내는 광대한 풍경, 잠깐 스쳐지나가면서 보는 익숙하고 편안한 풍경, 낯설거나 이국적이고 몽환적인 풍경 등 여행과 등산을 하며 마주치는 수많은 존재와 풍경들은 작가의 경험과 느낌을 토대로 새로운 풍경으로 재탄생한다. 작가는 자신이 풍경을 그리면서 갈증을 해소하고 휴식을 상상하듯이 감상자 역시 작가의 작품을 통해 편안하게 휴식하기를 바란다고 한다. 한지에 먹으로 채색하는 지극히 한국적인 방식으로 그려졌지만 현대적인 감각으로 그려져 동서양의 경계를 넘어 자연을 향한 향수를 자극하는 작품이다.
추천 이유
도시가 주는 편리함은 너무 매력적이지만 정신없이 바쁜 생활에서 공허감을 느끼고, 반복되는 일상에서 권태와 우울을 느끼기도 합니다. 그래서 많은 사람이 자연을 느낄 수 있는 곳으로 여행을 떠나고 싶어 합니다. 하지만 해야 할 일을 뒤로하고 어딘가로 훌쩍 떠난다는 게 말처럼 쉬운 일이 아니기에, 권소영 작가의 손에서 멋지게 재탄생한 자연 풍경을 즐겨보기를 추천합니다. 무채색으로 그려진 작가의 풍경화는 안락한 자연과 이상적인 경관을 보여주어 이상향에 한 걸음 다가가는 것 같은 기분이 들고, 마음이 차분히 가라앉고 평온해지는 것을 경험할 수 있을 것입니다. 감성을 자극하는 현대적인 수묵산수화로 일상의 지루함을 달래보세요.
', '600x720', 89000, 37, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(3, '향미', 1, '오베르의 초상화', '이동 수단으로서의 말 위에 정착을 의미하는 집이 올려져 있다. 류지선 작가는 모순적인 말의 모습을 통해 다양한 해석을 독려한다. 그는 집은 한 장소에 고정되어 있지만, 그것의 양식은 시대와 취향을 반영하며 그에 따라 변하기 때문에 항상 움직이는 말과 연결될 수 있음을 예리하게 짚어낸다. 다양한 건축양식이 혼재되어있는 집의 형태와 시공간을 알 수 없는 배경의 결합은 이러한 상징성을 뒷받침하고 서사적인 분위기를 연출한다. 한편, 건축술과 공간의 내부를 채우는 기술은 상당히 발전했지만, 인간 사이의 단절과 소외로 마음을 놓고 정착할 수 있는 곳을 거의 갖지 못한 채 심리적으로는 계속 떠돌아다니는 현대인의 단면을 밝힌다. 상징적 이미지를 통해 보여주는 현대 사회의 모습에서 그의 날카로운 비판 의식을 엿볼 수 있다.
추천 이유
집을 등에 실은 말이 정처 없이 떠돌고 있습니다. 화려하고 선명한 색상과 집을 등에 이고 있는 말이라는 이미지가 환상적인 분위기를 자아내는 한편, 말이 어떠한 곳을 떠돌아다니고 있는지 관찰하게 되는 일련의 과정이 보는 사람의 상상력을 자극합니다. 무엇을 상상하든 자유입니다. 어느 곳이든 갈 수 있지만, 어느 곳에도 머물지 못하는 현대인의 슬픈 모습을 볼 수 있고 동시에 어디든 갈 수 있다는 설렘 또한 느낄 수도 있습니다. 감각적이지만 결코 피상적이지 않아 무게감이 있습니다. 현대에 맞는 간결함이 돋보이지만, 그 의미는 가볍지 않은 공간과 조화를 이룰 수 있는 그림입니다.
', '480x480', 20000, 38, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(4, '도원', 1, '중절모 신사', '현미경을 갖다 댄 듯 세밀한 묘사로 그려진 대상은 모두 생명을 가진 존재들이다. 남진숙 작가의 작품은 한 생명의 있는 그대로의 모습에 대한 치밀한 탐구로 이루어져있다. 그 탐구에 스민 절실함과 섬세함은 비단 대상을 그대로 재현하는 것에서 나타나는 것이 아니라 작품을 통해 드러난 작가의 시선을 통해 알 수 있다. 작가의 시선이 멈춘 누군가는 간절한 눈을 통해 돌처럼 굳어진 심정을 절절히 드러낸다. 누군가의 발자취가 남긴 그림자는 바닥의 보도 블록에서 튀어나와 몸 속을 흐르는 생명의 피처럼 순환하며 움직이는 살아있는 형태가 된다. 식물이 꽃을 피울 땐 주변의 모든 배경이 흐려지고 오직 여린 잎과 봉우리를 뚫고 고개를 내미는 꽃잎만이 남을 뿐이다. 이처럼 남진숙 작가는 살아있는 생명에 대한 깊을 고찰을 통해 삶이 의미를 갖게 되는 순간의 비밀을 드러낸다. 그것은 어떤 영원이나 저 멀리 이상의 세계에 있는 것이 아니라 생명이 그 순간을 살아가는 현재 바로 지금에 있는 것이다.
추천 이유
일상 속에서 우리는 작은 식물의 잎을 한없이 바라보는 경우가 아주 가끔씩 생깁니다. 그 순간 그 작은 잎에 미세한 솜털, 강한 줄기로부터 잎 끝까지 뻗어나간 잎맥이 있었음에 놀라게 됩니다. 그저 주변의 푸른 색의 일부분이었던 작은 잎이 지닌 선명함에 순간 압도당하기도 하지요. 이러한 시간은 우리가 무수히 지나쳐가는 삶의 순간순간에 대해 문득 깨닫게 합니다. 어제 오늘 내일 그저 시간의 흐름에 별일 없이 살던 나라는 존재 역시 이 작은 잎처럼 섬세하게 구성되고 강렬한 생명을 순간순간 뿜어내고 있습니다. 남진숙 작가는 살아있는 순간을 치열하게 담은 작품을 통해 살아있음 그 자체에 집중하는 시간을 갖게 합니다. 작품을 따라 작가의 시선으로 한 생명의 순간을 집중해서 보는 경험은 그 어떤 메시지보다도 우리의 삶을 생생하게 느끼고 나의 존재를 고찰하게 해주는 강한 울림을 갖고 있습니다. 남진숙 작가의 작품을 통해 살아있는 이 순간을 온전히 느껴보시기 바랍니다.
', '600x720', 40000, 39, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(5, '난향', 1, '파이프를 문 남자', '나는 유년기의 어려웠던 기억들을 재해석함으로써 현대 사회 속에서 타인으로부터 상처받거나 소외감을 느끼며 살아가는 우리에게 자신을 돌아보고 위로하는 기회를 주는 그림을 그리고 싶다. 이인영 작가는 말한다. 그는 시장에서 하루 종일 야채장사를 하셨던 어머니와 계속된 사업의 실패로 술에 삶을 의지하셨던 아버지를 떠올리며 자신의 가난하고 불우했던 어린 시절을 고백한다. 유년기의 성장통과 불안, 욕망 등 내면의 다양한 감정들을 시각적 언어로 표현하는 그의 작업을 통해 자신의 어두운 감정을 마주할 수 있는 용기를 얻게 된다. 아픔을 마주하는 용기, 그것을 통해 우리는 비로소 자신을 모습을 바라볼 수 있고 성장할 수 있을 것이다.
추천 이유
지하철이나 버스 안에서 사람들을 보고 있으면 스마트폰을 한 손에 쥐고 눈을 그곳에서 떼지 못하고 있습니다. 사람들은 무언가를 상상하거나 생각하기보다 계속해서 어떠한 자료와 정보를 공유 받기를 원하고 있는 것 같습니다. 마치 무언가에 중독된 것처럼 말이죠. 하지만 공상의 시간은 과부화 된 뇌를 쉬게 하고 에너지를 충전하기에 꼭 필요한 시간입니다. 이인영 작가 또한 인생의 절망적인 시기를 공상을 통해 견뎌낼 수 있었다고 합니다. 거친 붓 터치와 깊은 색감으로 그려진 이 작품은 마치 누군가의 꿈속에 들어온 듯한 분위기를 연출하고, 강렬한 느낌을 자아냅니다. 참신한 아이디어가 필요한 곳에 어울리는 곳에 어울리는 작품을 찾고 있는 당신이라면 이 작품을 추천해드립니다. 공상의 세계로 당신을 안내해줄 것입니다
', '500x500', 30000, 40, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(6, '열빈', 2, 'Mahana Maa I Aka The Moment Of Truth I', '이동 수단으로서의 말 위에 정착을 의미하는 집이 올려져 있다. 류지선 작가는 모순적인 말의 모습을 통해 다양한 해석을 독려한다. 그는 집은 한 장소에 고정되어 있지만, 그것의 양식은 시대와 취향을 반영하며 그에 따라 변하기 때문에 항상 움직이는 말과 연결될 수 있음을 예리하게 짚어낸다. 다양한 건축양식이 혼재되어있는 집의 형태와 시공간을 알 수 없는 배경의 결합은 이러한 상징성을 뒷받침하고 서사적인 분위기를 연출한다. 한편, 건축술과 공간의 내부를 채우는 기술은 상당히 발전했지만, 인간 사이의 단절과 소외로 마음을 놓고 정착할 수 있는 곳을 거의 갖지 못한 채 심리적으로는 계속 떠돌아다니는 현대인의 단면을 밝힌다. 상징적 이미지를 통해 보여주는 현대 사회의 모습에서 그의 날카로운 비판 의식을 엿볼 수 있다.
추천 이유
집을 등에 실은 말이 정처 없이 떠돌고 있습니다. 화려하고 선명한 색상과 집을 등에 이고 있는 말이라는 이미지가 환상적인 분위기를 자아내는 한편, 말이 어떠한 곳을 떠돌아다니고 있는지 관찰하게 되는 일련의 과정이 보는 사람의 상상력을 자극합니다. 무엇을 상상하든 자유입니다. 어느 곳이든 갈 수 있지만, 어느 곳에도 머물지 못하는 현대인의 슬픈 모습을 볼 수 있고 동시에 어디든 갈 수 있다는 설렘 또한 느낄 수도 있습니다. 감각적이지만 결코 피상적이지 않아 무게감이 있습니다. 현대에 맞는 간결함이 돋보이지만, 그 의미는 가볍지 않은 공간과 조화를 이룰 수 있는 그림입니다.
', '600x900', 30000, 41, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(7, '태원', 2, 'Cabin Under The Trees', '유화를 통해 작품 속 대상에 감정을 이입시키고 일상을 재해석하는 김병권 작가는 끈질기게 유화라는 외길을 고집한다. 작가가 보는 세상과 공감을 불러일으키는 감정이 유화라는 매체를 통해 가장 잘 전달된다고 생각하기 때문이다. 작가는 우리가 일상에서 무심코 지나치는 풍경과 대상을 물감의 질감을 살려 입체적으로 표현한다. 작가의 흔적과 물성이 가시화된 그의 작품에서는 오히려 형태는 흐려지고 기억과 감정이 두드러지게 발현되어, 작품을 통해 관람자들에게 자신의 경험을 떠올리게 하고 감정을 마주하게 한다.
추천 이유
김병권 작가의 작품은 현실의 풍경을 대상으로 하지만 왜곡된 형태와 물감의 물성이 드러난 표면으로 인해 초현실적인 분위기를 자아냅니다. 길거리, 가게 앞 등 일상적인 공간이지만 작가의 시각으로 재탄생하여 독특하고 고유의 의미를 가진 장소가 된 듯합니다. 물감의 흔적이 그대로 남아 있는 작품을 보면서 작가의 흔적을 느끼고, 환상적인 분위기를 내는 세련된 색감에서 현대적인 감각을 느낄 수 있습니다. 20세기 초에 탄생한 초현실주의 작품을 보듯 상상력을 자극하며 일상 풍경을 자기만의 시선으로 재해석해 의미를 찾아갈 수 있도록 하는 작품으로, 공간에 개성을 부여해 줄 것입니다.
', '600x900', 50000, 42, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(1, '목란', 2, 'Around The Huts', '평범한 일상의 시간들이 지나면 추억이 되고 어느 날 우연치 않게 그 시간들을 되새기는 순간이 온다. 매일매일이 비슷해서 특별할 것 없다고 생각하는 시간들이 지나고 나면 소중해지는 순간처럼. 이혜진 작가는 반복되는 생활 속에서 스쳐 지나가는 풍경과 사물, 그리고 공간들을 감각하여 빗 바랜 추억을 곱씹는다. 과거의 기억이 현재의 순간을 만났을 때, 그녀의 작업은 여기서 시작된다. 이혜진 작가는 자신이 느끼고 발견한 섬세하고 감각적인 정서가 시간, 공간 그리고 기억을 재구성하여 새로운 이미지로 재구성한다. 종이와 연필 그리고 수묵 기법을 사용한 고즈넉한 그녀의 풍경들은 익숙하면서도 편안하고 정적이지만 동시에 다사로운 감각을 선사한다.
추천 이유
시간이 지남에도 늘 사랑받는 작품들, 즉 고전이라 일컬어지는 것들은 변치 않음이라기 보다는 다시 볼 때마다 새로운 기분을 주기 때문이 아닐까 합니다. 그렇게 느끼게 되는 연유는 아마 예전의 나와 지금의 내가 달라졌기 때문이겠죠. 불현듯 떠오르는 기억을 붙잡는 이혜진 작가의 작업은 마치, 새로운 나를 마주하게 하는 고전 이야기를 연상시킵니다. 시간이 지나면 증발하는 기억이 뜻밖의 순간에 마치 화학작용처럼 문득 떠오르는 것처럼 말입니다. 안온한 하면서도 신선함을 주는 이혜진 작가의 작품은 익숙하기 때문에 의식하지 못하고 있던 시간과 공간의 풍경을 예리하게 표현하는 일상을 돌이켜 생각해 보게 합니다. 여러분도 이혜진 작가의 작품을 통해 잊고 있던 기억을 또 다른 추억으로 떠올려보는 건 어떨까요?
', '600x900', 30000, 43, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(2, '홍원', 2, '타히티 풍경', '현미경을 갖다 댄 듯 세밀한 묘사로 그려진 대상은 모두 생명을 가진 존재들이다. 남진숙 작가의 작품은 한 생명의 있는 그대로의 모습에 대한 치밀한 탐구로 이루어져있다. 그 탐구에 스민 절실함과 섬세함은 비단 대상을 그대로 재현하는 것에서 나타나는 것이 아니라 작품을 통해 드러난 작가의 시선을 통해 알 수 있다. 작가의 시선이 멈춘 누군가는 간절한 눈을 통해 돌처럼 굳어진 심정을 절절히 드러낸다. 누군가의 발자취가 남긴 그림자는 바닥의 보도 블록에서 튀어나와 몸 속을 흐르는 생명의 피처럼 순환하며 움직이는 살아있는 형태가 된다. 식물이 꽃을 피울 땐 주변의 모든 배경이 흐려지고 오직 여린 잎과 봉우리를 뚫고 고개를 내미는 꽃잎만이 남을 뿐이다. 이처럼 남진숙 작가는 살아있는 생명에 대한 깊을 고찰을 통해 삶이 의미를 갖게 되는 순간의 비밀을 드러낸다. 그것은 어떤 영원이나 저 멀리 이상의 세계에 있는 것이 아니라 생명이 그 순간을 살아가는 현재 바로 지금에 있는 것이다.
추천 이유
일상 속에서 우리는 작은 식물의 잎을 한없이 바라보는 경우가 아주 가끔씩 생깁니다. 그 순간 그 작은 잎에 미세한 솜털, 강한 줄기로부터 잎 끝까지 뻗어나간 잎맥이 있었음에 놀라게 됩니다. 그저 주변의 푸른 색의 일부분이었던 작은 잎이 지닌 선명함에 순간 압도당하기도 하지요. 이러한 시간은 우리가 무수히 지나쳐가는 삶의 순간순간에 대해 문득 깨닫게 합니다. 어제 오늘 내일 그저 시간의 흐름에 별일 없이 살던 나라는 존재 역시 이 작은 잎처럼 섬세하게 구성되고 강렬한 생명을 순간순간 뿜어내고 있습니다. 남진숙 작가는 살아있는 순간을 치열하게 담은 작품을 통해 살아있음 그 자체에 집중하는 시간을 갖게 합니다. 작품을 따라 작가의 시선으로 한 생명의 순간을 집중해서 보는 경험은 그 어떤 메시지보다도 우리의 삶을 생생하게 느끼고 나의 존재를 고찰하게 해주는 강한 울림을 갖고 있습니다. 남진숙 작가의 작품을 통해 살아있는 이 순간을 온전히 느껴보시기 바랍니다.
', '300x500', 15000, 44, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(3, '향미', 2, 'Children In The Pasture Aka Orchard Below Bihorel Church', '이동 수단으로서의 말 위에 정착을 의미하는 집이 올려져 있다. 류지선 작가는 모순적인 말의 모습을 통해 다양한 해석을 독려한다. 그는 집은 한 장소에 고정되어 있지만, 그것의 양식은 시대와 취향을 반영하며 그에 따라 변하기 때문에 항상 움직이는 말과 연결될 수 있음을 예리하게 짚어낸다. 다양한 건축양식이 혼재되어있는 집의 형태와 시공간을 알 수 없는 배경의 결합은 이러한 상징성을 뒷받침하고 서사적인 분위기를 연출한다. 한편, 건축술과 공간의 내부를 채우는 기술은 상당히 발전했지만, 인간 사이의 단절과 소외로 마음을 놓고 정착할 수 있는 곳을 거의 갖지 못한 채 심리적으로는 계속 떠돌아다니는 현대인의 단면을 밝힌다. 상징적 이미지를 통해 보여주는 현대 사회의 모습에서 그의 날카로운 비판 의식을 엿볼 수 있다.
추천 이유
집을 등에 실은 말이 정처 없이 떠돌고 있습니다. 화려하고 선명한 색상과 집을 등에 이고 있는 말이라는 이미지가 환상적인 분위기를 자아내는 한편, 말이 어떠한 곳을 떠돌아다니고 있는지 관찰하게 되는 일련의 과정이 보는 사람의 상상력을 자극합니다. 무엇을 상상하든 자유입니다. 어느 곳이든 갈 수 있지만, 어느 곳에도 머물지 못하는 현대인의 슬픈 모습을 볼 수 있고 동시에 어디든 갈 수 있다는 설렘 또한 느낄 수도 있습니다. 감각적이지만 결코 피상적이지 않아 무게감이 있습니다. 현대에 맞는 간결함이 돋보이지만, 그 의미는 가볍지 않은 공간과 조화를 이룰 수 있는 그림입니다.
', '600x900', 30000, 45, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(4, '도원', 2, '포플러', '작가는 도시 생활의 안식처를 찾아 자연으로 여행을 떠나서 마주쳤던 풍경을 그린다. 감탄을 자아내는 광대한 풍경, 잠깐 스쳐지나가면서 보는 익숙하고 편안한 풍경, 낯설거나 이국적이고 몽환적인 풍경 등 여행과 등산을 하며 마주치는 수많은 존재와 풍경들은 작가의 경험과 느낌을 토대로 새로운 풍경으로 재탄생한다. 작가는 자신이 풍경을 그리면서 갈증을 해소하고 휴식을 상상하듯이 감상자 역시 작가의 작품을 통해 편안하게 휴식하기를 바란다고 한다. 한지에 먹으로 채색하는 지극히 한국적인 방식으로 그려졌지만 현대적인 감각으로 그려져 동서양의 경계를 넘어 자연을 향한 향수를 자극하는 작품이다.
추천 이유
도시가 주는 편리함은 너무 매력적이지만 정신없이 바쁜 생활에서 공허감을 느끼고, 반복되는 일상에서 권태와 우울을 느끼기도 합니다. 그래서 많은 사람이 자연을 느낄 수 있는 곳으로 여행을 떠나고 싶어 합니다. 하지만 해야 할 일을 뒤로하고 어딘가로 훌쩍 떠난다는 게 말처럼 쉬운 일이 아니기에, 권소영 작가의 손에서 멋지게 재탄생한 자연 풍경을 즐겨보기를 추천합니다. 무채색으로 그려진 작가의 풍경화는 안락한 자연과 이상적인 경관을 보여주어 이상향에 한 걸음 다가가는 것 같은 기분이 들고, 마음이 차분히 가라앉고 평온해지는 것을 경험할 수 있을 것입니다. 감성을 자극하는 현대적인 수묵산수화로 일상의 지루함을 달래보세요.
', '600x1200', 130000, 46, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(5, '난향', 2, '습지', '유화를 통해 작품 속 대상에 감정을 이입시키고 일상을 재해석하는 김병권 작가는 끈질기게 유화라는 외길을 고집한다. 작가가 보는 세상과 공감을 불러일으키는 감정이 유화라는 매체를 통해 가장 잘 전달된다고 생각하기 때문이다. 작가는 우리가 일상에서 무심코 지나치는 풍경과 대상을 물감의 질감을 살려 입체적으로 표현한다. 작가의 흔적과 물성이 가시화된 그의 작품에서는 오히려 형태는 흐려지고 기억과 감정이 두드러지게 발현되어, 작품을 통해 관람자들에게 자신의 경험을 떠올리게 하고 감정을 마주하게 한다.
추천 이유
김병권 작가의 작품은 현실의 풍경을 대상으로 하지만 왜곡된 형태와 물감의 물성이 드러난 표면으로 인해 초현실적인 분위기를 자아냅니다. 길거리, 가게 앞 등 일상적인 공간이지만 작가의 시각으로 재탄생하여 독특하고 고유의 의미를 가진 장소가 된 듯합니다. 물감의 흔적이 그대로 남아 있는 작품을 보면서 작가의 흔적을 느끼고, 환상적인 분위기를 내는 세련된 색감에서 현대적인 감각을 느낄 수 있습니다. 20세기 초에 탄생한 초현실주의 작품을 보듯 상상력을 자극하며 일상 풍경을 자기만의 시선으로 재해석해 의미를 찾아갈 수 있도록 하는 작품으로, 공간에 개성을 부여해 줄 것입니다.
', '600x900', 30000, 47, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(6, '열빈', 2, 'Another day', '나는 유년기의 어려웠던 기억들을 재해석함으로써 현대 사회 속에서 타인으로부터 상처받거나 소외감을 느끼며 살아가는 우리에게 자신을 돌아보고 위로하는 기회를 주는 그림을 그리고 싶다. 이인영 작가는 말한다. 그는 시장에서 하루 종일 야채장사를 하셨던 어머니와 계속된 사업의 실패로 술에 삶을 의지하셨던 아버지를 떠올리며 자신의 가난하고 불우했던 어린 시절을 고백한다. 유년기의 성장통과 불안, 욕망 등 내면의 다양한 감정들을 시각적 언어로 표현하는 그의 작업을 통해 자신의 어두운 감정을 마주할 수 있는 용기를 얻게 된다. 아픔을 마주하는 용기, 그것을 통해 우리는 비로소 자신을 모습을 바라볼 수 있고 성장할 수 있을 것이다.
추천 이유
지하철이나 버스 안에서 사람들을 보고 있으면 스마트폰을 한 손에 쥐고 눈을 그곳에서 떼지 못하고 있습니다. 사람들은 무언가를 상상하거나 생각하기보다 계속해서 어떠한 자료와 정보를 공유 받기를 원하고 있는 것 같습니다. 마치 무언가에 중독된 것처럼 말이죠. 하지만 공상의 시간은 과부화 된 뇌를 쉬게 하고 에너지를 충전하기에 꼭 필요한 시간입니다. 이인영 작가 또한 인생의 절망적인 시기를 공상을 통해 견뎌낼 수 있었다고 합니다. 거친 붓 터치와 깊은 색감으로 그려진 이 작품은 마치 누군가의 꿈속에 들어온 듯한 분위기를 연출하고, 강렬한 느낌을 자아냅니다. 참신한 아이디어가 필요한 곳에 어울리는 곳에 어울리는 작품을 찾고 있는 당신이라면 이 작품을 추천해드립니다. 공상의 세계로 당신을 안내해줄 것입니다
', '720x720', 35000, 48, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(7, '태원', 2, 'Bird on a Tree ( L oiseau )', '현미경을 갖다 댄 듯 세밀한 묘사로 그려진 대상은 모두 생명을 가진 존재들이다. 남진숙 작가의 작품은 한 생명의 있는 그대로의 모습에 대한 치밀한 탐구로 이루어져있다. 그 탐구에 스민 절실함과 섬세함은 비단 대상을 그대로 재현하는 것에서 나타나는 것이 아니라 작품을 통해 드러난 작가의 시선을 통해 알 수 있다. 작가의 시선이 멈춘 누군가는 간절한 눈을 통해 돌처럼 굳어진 심정을 절절히 드러낸다. 누군가의 발자취가 남긴 그림자는 바닥의 보도 블록에서 튀어나와 몸 속을 흐르는 생명의 피처럼 순환하며 움직이는 살아있는 형태가 된다. 식물이 꽃을 피울 땐 주변의 모든 배경이 흐려지고 오직 여린 잎과 봉우리를 뚫고 고개를 내미는 꽃잎만이 남을 뿐이다. 이처럼 남진숙 작가는 살아있는 생명에 대한 깊을 고찰을 통해 삶이 의미를 갖게 되는 순간의 비밀을 드러낸다. 그것은 어떤 영원이나 저 멀리 이상의 세계에 있는 것이 아니라 생명이 그 순간을 살아가는 현재 바로 지금에 있는 것이다.
추천 이유
일상 속에서 우리는 작은 식물의 잎을 한없이 바라보는 경우가 아주 가끔씩 생깁니다. 그 순간 그 작은 잎에 미세한 솜털, 강한 줄기로부터 잎 끝까지 뻗어나간 잎맥이 있었음에 놀라게 됩니다. 그저 주변의 푸른 색의 일부분이었던 작은 잎이 지닌 선명함에 순간 압도당하기도 하지요. 이러한 시간은 우리가 무수히 지나쳐가는 삶의 순간순간에 대해 문득 깨닫게 합니다. 어제 오늘 내일 그저 시간의 흐름에 별일 없이 살던 나라는 존재 역시 이 작은 잎처럼 섬세하게 구성되고 강렬한 생명을 순간순간 뿜어내고 있습니다. 남진숙 작가는 살아있는 순간을 치열하게 담은 작품을 통해 살아있음 그 자체에 집중하는 시간을 갖게 합니다. 작품을 따라 작가의 시선으로 한 생명의 순간을 집중해서 보는 경험은 그 어떤 메시지보다도 우리의 삶을 생생하게 느끼고 나의 존재를 고찰하게 해주는 강한 울림을 갖고 있습니다. 남진숙 작가의 작품을 통해 살아있는 이 순간을 온전히 느껴보시기 바랍니다.
', '600x900', 30000, 49, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(1, '목란', 2, '붉은탑', '유화를 통해 작품 속 대상에 감정을 이입시키고 일상을 재해석하는 김병권 작가는 끈질기게 유화라는 외길을 고집한다. 작가가 보는 세상과 공감을 불러일으키는 감정이 유화라는 매체를 통해 가장 잘 전달된다고 생각하기 때문이다. 작가는 우리가 일상에서 무심코 지나치는 풍경과 대상을 물감의 질감을 살려 입체적으로 표현한다. 작가의 흔적과 물성이 가시화된 그의 작품에서는 오히려 형태는 흐려지고 기억과 감정이 두드러지게 발현되어, 작품을 통해 관람자들에게 자신의 경험을 떠올리게 하고 감정을 마주하게 한다.
추천 이유
김병권 작가의 작품은 현실의 풍경을 대상으로 하지만 왜곡된 형태와 물감의 물성이 드러난 표면으로 인해 초현실적인 분위기를 자아냅니다. 길거리, 가게 앞 등 일상적인 공간이지만 작가의 시각으로 재탄생하여 독특하고 고유의 의미를 가진 장소가 된 듯합니다. 물감의 흔적이 그대로 남아 있는 작품을 보면서 작가의 흔적을 느끼고, 환상적인 분위기를 내는 세련된 색감에서 현대적인 감각을 느낄 수 있습니다. 20세기 초에 탄생한 초현실주의 작품을 보듯 상상력을 자극하며 일상 풍경을 자기만의 시선으로 재해석해 의미를 찾아갈 수 있도록 하는 작품으로, 공간에 개성을 부여해 줄 것입니다.
', '1200x900', 180000, 50, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(2, '홍원', 2, 'La-Torre-Eiffel', '나는 유년기의 어려웠던 기억들을 재해석함으로써 현대 사회 속에서 타인으로부터 상처받거나 소외감을 느끼며 살아가는 우리에게 자신을 돌아보고 위로하는 기회를 주는 그림을 그리고 싶다. 이인영 작가는 말한다. 그는 시장에서 하루 종일 야채장사를 하셨던 어머니와 계속된 사업의 실패로 술에 삶을 의지하셨던 아버지를 떠올리며 자신의 가난하고 불우했던 어린 시절을 고백한다. 유년기의 성장통과 불안, 욕망 등 내면의 다양한 감정들을 시각적 언어로 표현하는 그의 작업을 통해 자신의 어두운 감정을 마주할 수 있는 용기를 얻게 된다. 아픔을 마주하는 용기, 그것을 통해 우리는 비로소 자신을 모습을 바라볼 수 있고 성장할 수 있을 것이다.
추천 이유
지하철이나 버스 안에서 사람들을 보고 있으면 스마트폰을 한 손에 쥐고 눈을 그곳에서 떼지 못하고 있습니다. 사람들은 무언가를 상상하거나 생각하기보다 계속해서 어떠한 자료와 정보를 공유 받기를 원하고 있는 것 같습니다. 마치 무언가에 중독된 것처럼 말이죠. 하지만 공상의 시간은 과부화 된 뇌를 쉬게 하고 에너지를 충전하기에 꼭 필요한 시간입니다. 이인영 작가 또한 인생의 절망적인 시기를 공상을 통해 견뎌낼 수 있었다고 합니다. 거친 붓 터치와 깊은 색감으로 그려진 이 작품은 마치 누군가의 꿈속에 들어온 듯한 분위기를 연출하고, 강렬한 느낌을 자아냅니다. 참신한 아이디어가 필요한 곳에 어울리는 곳에 어울리는 작품을 찾고 있는 당신이라면 이 작품을 추천해드립니다. 공상의 세계로 당신을 안내해줄 것입니다
', '720x720', 99000, 51, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(3, '향미', 2, 'Malven I (Hollyhocks I)', '평범한 일상의 시간들이 지나면 추억이 되고 어느 날 우연치 않게 그 시간들을 되새기는 순간이 온다. 매일매일이 비슷해서 특별할 것 없다고 생각하는 시간들이 지나고 나면 소중해지는 순간처럼. 이혜진 작가는 반복되는 생활 속에서 스쳐 지나가는 풍경과 사물, 그리고 공간들을 감각하여 빗 바랜 추억을 곱씹는다. 과거의 기억이 현재의 순간을 만났을 때, 그녀의 작업은 여기서 시작된다. 이혜진 작가는 자신이 느끼고 발견한 섬세하고 감각적인 정서가 시간, 공간 그리고 기억을 재구성하여 새로운 이미지로 재구성한다. 종이와 연필 그리고 수묵 기법을 사용한 고즈넉한 그녀의 풍경들은 익숙하면서도 편안하고 정적이지만 동시에 다사로운 감각을 선사한다.
추천 이유
시간이 지남에도 늘 사랑받는 작품들, 즉 고전이라 일컬어지는 것들은 변치 않음이라기 보다는 다시 볼 때마다 새로운 기분을 주기 때문이 아닐까 합니다. 그렇게 느끼게 되는 연유는 아마 예전의 나와 지금의 내가 달라졌기 때문이겠죠. 불현듯 떠오르는 기억을 붙잡는 이혜진 작가의 작업은 마치, 새로운 나를 마주하게 하는 고전 이야기를 연상시킵니다. 시간이 지나면 증발하는 기억이 뜻밖의 순간에 마치 화학작용처럼 문득 떠오르는 것처럼 말입니다. 안온한 하면서도 신선함을 주는 이혜진 작가의 작품은 익숙하기 때문에 의식하지 못하고 있던 시간과 공간의 풍경을 예리하게 표현하는 일상을 돌이켜 생각해 보게 합니다. 여러분도 이혜진 작가의 작품을 통해 잊고 있던 기억을 또 다른 추억으로 떠올려보는 건 어떨까요?
', '600x900', 100000, 52, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(4, '도원', 2, 'Nicholas Cvn Road', '평범한 일상의 시간들이 지나면 추억이 되고 어느 날 우연치 않게 그 시간들을 되새기는 순간이 온다. 매일매일이 비슷해서 특별할 것 없다고 생각하는 시간들이 지나고 나면 소중해지는 순간처럼. 이혜진 작가는 반복되는 생활 속에서 스쳐 지나가는 풍경과 사물, 그리고 공간들을 감각하여 빗 바랜 추억을 곱씹는다. 과거의 기억이 현재의 순간을 만났을 때, 그녀의 작업은 여기서 시작된다. 이혜진 작가는 자신이 느끼고 발견한 섬세하고 감각적인 정서가 시간, 공간 그리고 기억을 재구성하여 새로운 이미지로 재구성한다. 종이와 연필 그리고 수묵 기법을 사용한 고즈넉한 그녀의 풍경들은 익숙하면서도 편안하고 정적이지만 동시에 다사로운 감각을 선사한다.
추천 이유
시간이 지남에도 늘 사랑받는 작품들, 즉 고전이라 일컬어지는 것들은 변치 않음이라기 보다는 다시 볼 때마다 새로운 기분을 주기 때문이 아닐까 합니다. 그렇게 느끼게 되는 연유는 아마 예전의 나와 지금의 내가 달라졌기 때문이겠죠. 불현듯 떠오르는 기억을 붙잡는 이혜진 작가의 작업은 마치, 새로운 나를 마주하게 하는 고전 이야기를 연상시킵니다. 시간이 지나면 증발하는 기억이 뜻밖의 순간에 마치 화학작용처럼 문득 떠오르는 것처럼 말입니다. 안온한 하면서도 신선함을 주는 이혜진 작가의 작품은 익숙하기 때문에 의식하지 못하고 있던 시간과 공간의 풍경을 예리하게 표현하는 일상을 돌이켜 생각해 보게 합니다. 여러분도 이혜진 작가의 작품을 통해 잊고 있던 기억을 또 다른 추억으로 떠올려보는 건 어떨까요?
', '600x900', 30000, 53, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(5, '난향', 2, 'Sensitivity of Memory', '유화를 통해 작품 속 대상에 감정을 이입시키고 일상을 재해석하는 김병권 작가는 끈질기게 유화라는 외길을 고집한다. 작가가 보는 세상과 공감을 불러일으키는 감정이 유화라는 매체를 통해 가장 잘 전달된다고 생각하기 때문이다. 작가는 우리가 일상에서 무심코 지나치는 풍경과 대상을 물감의 질감을 살려 입체적으로 표현한다. 작가의 흔적과 물성이 가시화된 그의 작품에서는 오히려 형태는 흐려지고 기억과 감정이 두드러지게 발현되어, 작품을 통해 관람자들에게 자신의 경험을 떠올리게 하고 감정을 마주하게 한다.
추천 이유
김병권 작가의 작품은 현실의 풍경을 대상으로 하지만 왜곡된 형태와 물감의 물성이 드러난 표면으로 인해 초현실적인 분위기를 자아냅니다. 길거리, 가게 앞 등 일상적인 공간이지만 작가의 시각으로 재탄생하여 독특하고 고유의 의미를 가진 장소가 된 듯합니다. 물감의 흔적이 그대로 남아 있는 작품을 보면서 작가의 흔적을 느끼고, 환상적인 분위기를 내는 세련된 색감에서 현대적인 감각을 느낄 수 있습니다. 20세기 초에 탄생한 초현실주의 작품을 보듯 상상력을 자극하며 일상 풍경을 자기만의 시선으로 재해석해 의미를 찾아갈 수 있도록 하는 작품으로, 공간에 개성을 부여해 줄 것입니다.
', '600x900', 30000, 54, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(6, '열빈', 2, '계단길', '현미경을 갖다 댄 듯 세밀한 묘사로 그려진 대상은 모두 생명을 가진 존재들이다. 남진숙 작가의 작품은 한 생명의 있는 그대로의 모습에 대한 치밀한 탐구로 이루어져있다. 그 탐구에 스민 절실함과 섬세함은 비단 대상을 그대로 재현하는 것에서 나타나는 것이 아니라 작품을 통해 드러난 작가의 시선을 통해 알 수 있다. 작가의 시선이 멈춘 누군가는 간절한 눈을 통해 돌처럼 굳어진 심정을 절절히 드러낸다. 누군가의 발자취가 남긴 그림자는 바닥의 보도 블록에서 튀어나와 몸 속을 흐르는 생명의 피처럼 순환하며 움직이는 살아있는 형태가 된다. 식물이 꽃을 피울 땐 주변의 모든 배경이 흐려지고 오직 여린 잎과 봉우리를 뚫고 고개를 내미는 꽃잎만이 남을 뿐이다. 이처럼 남진숙 작가는 살아있는 생명에 대한 깊을 고찰을 통해 삶이 의미를 갖게 되는 순간의 비밀을 드러낸다. 그것은 어떤 영원이나 저 멀리 이상의 세계에 있는 것이 아니라 생명이 그 순간을 살아가는 현재 바로 지금에 있는 것이다.
추천 이유
일상 속에서 우리는 작은 식물의 잎을 한없이 바라보는 경우가 아주 가끔씩 생깁니다. 그 순간 그 작은 잎에 미세한 솜털, 강한 줄기로부터 잎 끝까지 뻗어나간 잎맥이 있었음에 놀라게 됩니다. 그저 주변의 푸른 색의 일부분이었던 작은 잎이 지닌 선명함에 순간 압도당하기도 하지요. 이러한 시간은 우리가 무수히 지나쳐가는 삶의 순간순간에 대해 문득 깨닫게 합니다. 어제 오늘 내일 그저 시간의 흐름에 별일 없이 살던 나라는 존재 역시 이 작은 잎처럼 섬세하게 구성되고 강렬한 생명을 순간순간 뿜어내고 있습니다. 남진숙 작가는 살아있는 순간을 치열하게 담은 작품을 통해 살아있음 그 자체에 집중하는 시간을 갖게 합니다. 작품을 따라 작가의 시선으로 한 생명의 순간을 집중해서 보는 경험은 그 어떤 메시지보다도 우리의 삶을 생생하게 느끼고 나의 존재를 고찰하게 해주는 강한 울림을 갖고 있습니다. 남진숙 작가의 작품을 통해 살아있는 이 순간을 온전히 느껴보시기 바랍니다.
', '720x720', 85000, 55, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(7, '태원', 2, 'Road with Cypresses', '평범한 일상의 시간들이 지나면 추억이 되고 어느 날 우연치 않게 그 시간들을 되새기는 순간이 온다. 매일매일이 비슷해서 특별할 것 없다고 생각하는 시간들이 지나고 나면 소중해지는 순간처럼. 이혜진 작가는 반복되는 생활 속에서 스쳐 지나가는 풍경과 사물, 그리고 공간들을 감각하여 빗 바랜 추억을 곱씹는다. 과거의 기억이 현재의 순간을 만났을 때, 그녀의 작업은 여기서 시작된다. 이혜진 작가는 자신이 느끼고 발견한 섬세하고 감각적인 정서가 시간, 공간 그리고 기억을 재구성하여 새로운 이미지로 재구성한다. 종이와 연필 그리고 수묵 기법을 사용한 고즈넉한 그녀의 풍경들은 익숙하면서도 편안하고 정적이지만 동시에 다사로운 감각을 선사한다.
추천 이유
시간이 지남에도 늘 사랑받는 작품들, 즉 고전이라 일컬어지는 것들은 변치 않음이라기 보다는 다시 볼 때마다 새로운 기분을 주기 때문이 아닐까 합니다. 그렇게 느끼게 되는 연유는 아마 예전의 나와 지금의 내가 달라졌기 때문이겠죠. 불현듯 떠오르는 기억을 붙잡는 이혜진 작가의 작업은 마치, 새로운 나를 마주하게 하는 고전 이야기를 연상시킵니다. 시간이 지나면 증발하는 기억이 뜻밖의 순간에 마치 화학작용처럼 문득 떠오르는 것처럼 말입니다. 안온한 하면서도 신선함을 주는 이혜진 작가의 작품은 익숙하기 때문에 의식하지 못하고 있던 시간과 공간의 풍경을 예리하게 표현하는 일상을 돌이켜 생각해 보게 합니다. 여러분도 이혜진 작가의 작품을 통해 잊고 있던 기억을 또 다른 추억으로 떠올려보는 건 어떨까요?
', '600x900', 30000, 56, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(1, '목란', 2, 'L allée des Alyscamps', '유화를 통해 작품 속 대상에 감정을 이입시키고 일상을 재해석하는 김병권 작가는 끈질기게 유화라는 외길을 고집한다. 작가가 보는 세상과 공감을 불러일으키는 감정이 유화라는 매체를 통해 가장 잘 전달된다고 생각하기 때문이다. 작가는 우리가 일상에서 무심코 지나치는 풍경과 대상을 물감의 질감을 살려 입체적으로 표현한다. 작가의 흔적과 물성이 가시화된 그의 작품에서는 오히려 형태는 흐려지고 기억과 감정이 두드러지게 발현되어, 작품을 통해 관람자들에게 자신의 경험을 떠올리게 하고 감정을 마주하게 한다.
추천 이유
김병권 작가의 작품은 현실의 풍경을 대상으로 하지만 왜곡된 형태와 물감의 물성이 드러난 표면으로 인해 초현실적인 분위기를 자아냅니다. 길거리, 가게 앞 등 일상적인 공간이지만 작가의 시각으로 재탄생하여 독특하고 고유의 의미를 가진 장소가 된 듯합니다. 물감의 흔적이 그대로 남아 있는 작품을 보면서 작가의 흔적을 느끼고, 환상적인 분위기를 내는 세련된 색감에서 현대적인 감각을 느낄 수 있습니다. 20세기 초에 탄생한 초현실주의 작품을 보듯 상상력을 자극하며 일상 풍경을 자기만의 시선으로 재해석해 의미를 찾아갈 수 있도록 하는 작품으로, 공간에 개성을 부여해 줄 것입니다.
', '1200x1200', 75000, 57, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(2, '홍원', 2, 'Le Moulin de Blute-Fin', '이동 수단으로서의 말 위에 정착을 의미하는 집이 올려져 있다. 류지선 작가는 모순적인 말의 모습을 통해 다양한 해석을 독려한다. 그는 집은 한 장소에 고정되어 있지만, 그것의 양식은 시대와 취향을 반영하며 그에 따라 변하기 때문에 항상 움직이는 말과 연결될 수 있음을 예리하게 짚어낸다. 다양한 건축양식이 혼재되어있는 집의 형태와 시공간을 알 수 없는 배경의 결합은 이러한 상징성을 뒷받침하고 서사적인 분위기를 연출한다. 한편, 건축술과 공간의 내부를 채우는 기술은 상당히 발전했지만, 인간 사이의 단절과 소외로 마음을 놓고 정착할 수 있는 곳을 거의 갖지 못한 채 심리적으로는 계속 떠돌아다니는 현대인의 단면을 밝힌다. 상징적 이미지를 통해 보여주는 현대 사회의 모습에서 그의 날카로운 비판 의식을 엿볼 수 있다.
추천 이유
집을 등에 실은 말이 정처 없이 떠돌고 있습니다. 화려하고 선명한 색상과 집을 등에 이고 있는 말이라는 이미지가 환상적인 분위기를 자아내는 한편, 말이 어떠한 곳을 떠돌아다니고 있는지 관찰하게 되는 일련의 과정이 보는 사람의 상상력을 자극합니다. 무엇을 상상하든 자유입니다. 어느 곳이든 갈 수 있지만, 어느 곳에도 머물지 못하는 현대인의 슬픈 모습을 볼 수 있고 동시에 어디든 갈 수 있다는 설렘 또한 느낄 수도 있습니다. 감각적이지만 결코 피상적이지 않아 무게감이 있습니다. 현대에 맞는 간결함이 돋보이지만, 그 의미는 가볍지 않은 공간과 조화를 이룰 수 있는 그림입니다.
', '600x900', 30000, 58, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(3, '향미', 2, 'The Bagpiper', '나는 유년기의 어려웠던 기억들을 재해석함으로써 현대 사회 속에서 타인으로부터 상처받거나 소외감을 느끼며 살아가는 우리에게 자신을 돌아보고 위로하는 기회를 주는 그림을 그리고 싶다. 이인영 작가는 말한다. 그는 시장에서 하루 종일 야채장사를 하셨던 어머니와 계속된 사업의 실패로 술에 삶을 의지하셨던 아버지를 떠올리며 자신의 가난하고 불우했던 어린 시절을 고백한다. 유년기의 성장통과 불안, 욕망 등 내면의 다양한 감정들을 시각적 언어로 표현하는 그의 작업을 통해 자신의 어두운 감정을 마주할 수 있는 용기를 얻게 된다. 아픔을 마주하는 용기, 그것을 통해 우리는 비로소 자신을 모습을 바라볼 수 있고 성장할 수 있을 것이다.
추천 이유
지하철이나 버스 안에서 사람들을 보고 있으면 스마트폰을 한 손에 쥐고 눈을 그곳에서 떼지 못하고 있습니다. 사람들은 무언가를 상상하거나 생각하기보다 계속해서 어떠한 자료와 정보를 공유 받기를 원하고 있는 것 같습니다. 마치 무언가에 중독된 것처럼 말이죠. 하지만 공상의 시간은 과부화 된 뇌를 쉬게 하고 에너지를 충전하기에 꼭 필요한 시간입니다. 이인영 작가 또한 인생의 절망적인 시기를 공상을 통해 견뎌낼 수 있었다고 합니다. 거친 붓 터치와 깊은 색감으로 그려진 이 작품은 마치 누군가의 꿈속에 들어온 듯한 분위기를 연출하고, 강렬한 느낌을 자아냅니다. 참신한 아이디어가 필요한 곳에 어울리는 곳에 어울리는 작품을 찾고 있는 당신이라면 이 작품을 추천해드립니다. 공상의 세계로 당신을 안내해줄 것입니다
', '720x720', 70000, 59, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(4, '도원', 2, '나무2', '이동 수단으로서의 말 위에 정착을 의미하는 집이 올려져 있다. 류지선 작가는 모순적인 말의 모습을 통해 다양한 해석을 독려한다. 그는 집은 한 장소에 고정되어 있지만, 그것의 양식은 시대와 취향을 반영하며 그에 따라 변하기 때문에 항상 움직이는 말과 연결될 수 있음을 예리하게 짚어낸다. 다양한 건축양식이 혼재되어있는 집의 형태와 시공간을 알 수 없는 배경의 결합은 이러한 상징성을 뒷받침하고 서사적인 분위기를 연출한다. 한편, 건축술과 공간의 내부를 채우는 기술은 상당히 발전했지만, 인간 사이의 단절과 소외로 마음을 놓고 정착할 수 있는 곳을 거의 갖지 못한 채 심리적으로는 계속 떠돌아다니는 현대인의 단면을 밝힌다. 상징적 이미지를 통해 보여주는 현대 사회의 모습에서 그의 날카로운 비판 의식을 엿볼 수 있다.
추천 이유
집을 등에 실은 말이 정처 없이 떠돌고 있습니다. 화려하고 선명한 색상과 집을 등에 이고 있는 말이라는 이미지가 환상적인 분위기를 자아내는 한편, 말이 어떠한 곳을 떠돌아다니고 있는지 관찰하게 되는 일련의 과정이 보는 사람의 상상력을 자극합니다. 무엇을 상상하든 자유입니다. 어느 곳이든 갈 수 있지만, 어느 곳에도 머물지 못하는 현대인의 슬픈 모습을 볼 수 있고 동시에 어디든 갈 수 있다는 설렘 또한 느낄 수도 있습니다. 감각적이지만 결코 피상적이지 않아 무게감이 있습니다. 현대에 맞는 간결함이 돋보이지만, 그 의미는 가볍지 않은 공간과 조화를 이룰 수 있는 그림입니다.
', '300x300', 30000, 60, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(5, '난향', 2, '나무3', '현미경을 갖다 댄 듯 세밀한 묘사로 그려진 대상은 모두 생명을 가진 존재들이다. 남진숙 작가의 작품은 한 생명의 있는 그대로의 모습에 대한 치밀한 탐구로 이루어져있다. 그 탐구에 스민 절실함과 섬세함은 비단 대상을 그대로 재현하는 것에서 나타나는 것이 아니라 작품을 통해 드러난 작가의 시선을 통해 알 수 있다. 작가의 시선이 멈춘 누군가는 간절한 눈을 통해 돌처럼 굳어진 심정을 절절히 드러낸다. 누군가의 발자취가 남긴 그림자는 바닥의 보도 블록에서 튀어나와 몸 속을 흐르는 생명의 피처럼 순환하며 움직이는 살아있는 형태가 된다. 식물이 꽃을 피울 땐 주변의 모든 배경이 흐려지고 오직 여린 잎과 봉우리를 뚫고 고개를 내미는 꽃잎만이 남을 뿐이다. 이처럼 남진숙 작가는 살아있는 생명에 대한 깊을 고찰을 통해 삶이 의미를 갖게 되는 순간의 비밀을 드러낸다. 그것은 어떤 영원이나 저 멀리 이상의 세계에 있는 것이 아니라 생명이 그 순간을 살아가는 현재 바로 지금에 있는 것이다.
추천 이유
일상 속에서 우리는 작은 식물의 잎을 한없이 바라보는 경우가 아주 가끔씩 생깁니다. 그 순간 그 작은 잎에 미세한 솜털, 강한 줄기로부터 잎 끝까지 뻗어나간 잎맥이 있었음에 놀라게 됩니다. 그저 주변의 푸른 색의 일부분이었던 작은 잎이 지닌 선명함에 순간 압도당하기도 하지요. 이러한 시간은 우리가 무수히 지나쳐가는 삶의 순간순간에 대해 문득 깨닫게 합니다. 어제 오늘 내일 그저 시간의 흐름에 별일 없이 살던 나라는 존재 역시 이 작은 잎처럼 섬세하게 구성되고 강렬한 생명을 순간순간 뿜어내고 있습니다. 남진숙 작가는 살아있는 순간을 치열하게 담은 작품을 통해 살아있음 그 자체에 집중하는 시간을 갖게 합니다. 작품을 따라 작가의 시선으로 한 생명의 순간을 집중해서 보는 경험은 그 어떤 메시지보다도 우리의 삶을 생생하게 느끼고 나의 존재를 고찰하게 해주는 강한 울림을 갖고 있습니다. 남진숙 작가의 작품을 통해 살아있는 이 순간을 온전히 느껴보시기 바랍니다.
', '600x600', 50000, 61, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(6, '열빈', 2, '나무4', '작가는 도시 생활의 안식처를 찾아 자연으로 여행을 떠나서 마주쳤던 풍경을 그린다. 감탄을 자아내는 광대한 풍경, 잠깐 스쳐지나가면서 보는 익숙하고 편안한 풍경, 낯설거나 이국적이고 몽환적인 풍경 등 여행과 등산을 하며 마주치는 수많은 존재와 풍경들은 작가의 경험과 느낌을 토대로 새로운 풍경으로 재탄생한다. 작가는 자신이 풍경을 그리면서 갈증을 해소하고 휴식을 상상하듯이 감상자 역시 작가의 작품을 통해 편안하게 휴식하기를 바란다고 한다. 한지에 먹으로 채색하는 지극히 한국적인 방식으로 그려졌지만 현대적인 감각으로 그려져 동서양의 경계를 넘어 자연을 향한 향수를 자극하는 작품이다.
추천 이유
도시가 주는 편리함은 너무 매력적이지만 정신없이 바쁜 생활에서 공허감을 느끼고, 반복되는 일상에서 권태와 우울을 느끼기도 합니다. 그래서 많은 사람이 자연을 느낄 수 있는 곳으로 여행을 떠나고 싶어 합니다. 하지만 해야 할 일을 뒤로하고 어딘가로 훌쩍 떠난다는 게 말처럼 쉬운 일이 아니기에, 권소영 작가의 손에서 멋지게 재탄생한 자연 풍경을 즐겨보기를 추천합니다. 무채색으로 그려진 작가의 풍경화는 안락한 자연과 이상적인 경관을 보여주어 이상향에 한 걸음 다가가는 것 같은 기분이 들고, 마음이 차분히 가라앉고 평온해지는 것을 경험할 수 있을 것입니다. 감성을 자극하는 현대적인 수묵산수화로 일상의 지루함을 달래보세요.
', '600x900', 30000, 62, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(7, '태원', 2, '드리우다', '이동 수단으로서의 말 위에 정착을 의미하는 집이 올려져 있다. 류지선 작가는 모순적인 말의 모습을 통해 다양한 해석을 독려한다. 그는 집은 한 장소에 고정되어 있지만, 그것의 양식은 시대와 취향을 반영하며 그에 따라 변하기 때문에 항상 움직이는 말과 연결될 수 있음을 예리하게 짚어낸다. 다양한 건축양식이 혼재되어있는 집의 형태와 시공간을 알 수 없는 배경의 결합은 이러한 상징성을 뒷받침하고 서사적인 분위기를 연출한다. 한편, 건축술과 공간의 내부를 채우는 기술은 상당히 발전했지만, 인간 사이의 단절과 소외로 마음을 놓고 정착할 수 있는 곳을 거의 갖지 못한 채 심리적으로는 계속 떠돌아다니는 현대인의 단면을 밝힌다. 상징적 이미지를 통해 보여주는 현대 사회의 모습에서 그의 날카로운 비판 의식을 엿볼 수 있다.
추천 이유
집을 등에 실은 말이 정처 없이 떠돌고 있습니다. 화려하고 선명한 색상과 집을 등에 이고 있는 말이라는 이미지가 환상적인 분위기를 자아내는 한편, 말이 어떠한 곳을 떠돌아다니고 있는지 관찰하게 되는 일련의 과정이 보는 사람의 상상력을 자극합니다. 무엇을 상상하든 자유입니다. 어느 곳이든 갈 수 있지만, 어느 곳에도 머물지 못하는 현대인의 슬픈 모습을 볼 수 있고 동시에 어디든 갈 수 있다는 설렘 또한 느낄 수도 있습니다. 감각적이지만 결코 피상적이지 않아 무게감이 있습니다. 현대에 맞는 간결함이 돋보이지만, 그 의미는 가볍지 않은 공간과 조화를 이룰 수 있는 그림입니다.
', '600x900', 30000, 63, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(1, '목란', 2, '르네 마그리트 : 빛의제국', '평범한 일상의 시간들이 지나면 추억이 되고 어느 날 우연치 않게 그 시간들을 되새기는 순간이 온다. 매일매일이 비슷해서 특별할 것 없다고 생각하는 시간들이 지나고 나면 소중해지는 순간처럼. 이혜진 작가는 반복되는 생활 속에서 스쳐 지나가는 풍경과 사물, 그리고 공간들을 감각하여 빗 바랜 추억을 곱씹는다. 과거의 기억이 현재의 순간을 만났을 때, 그녀의 작업은 여기서 시작된다. 이혜진 작가는 자신이 느끼고 발견한 섬세하고 감각적인 정서가 시간, 공간 그리고 기억을 재구성하여 새로운 이미지로 재구성한다. 종이와 연필 그리고 수묵 기법을 사용한 고즈넉한 그녀의 풍경들은 익숙하면서도 편안하고 정적이지만 동시에 다사로운 감각을 선사한다.
추천 이유
시간이 지남에도 늘 사랑받는 작품들, 즉 고전이라 일컬어지는 것들은 변치 않음이라기 보다는 다시 볼 때마다 새로운 기분을 주기 때문이 아닐까 합니다. 그렇게 느끼게 되는 연유는 아마 예전의 나와 지금의 내가 달라졌기 때문이겠죠. 불현듯 떠오르는 기억을 붙잡는 이혜진 작가의 작업은 마치, 새로운 나를 마주하게 하는 고전 이야기를 연상시킵니다. 시간이 지나면 증발하는 기억이 뜻밖의 순간에 마치 화학작용처럼 문득 떠오르는 것처럼 말입니다. 안온한 하면서도 신선함을 주는 이혜진 작가의 작품은 익숙하기 때문에 의식하지 못하고 있던 시간과 공간의 풍경을 예리하게 표현하는 일상을 돌이켜 생각해 보게 합니다. 여러분도 이혜진 작가의 작품을 통해 잊고 있던 기억을 또 다른 추억으로 떠올려보는 건 어떨까요?
', '600x900', 250000, 64, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(2, '홍원', 2, '마을에 햇빛이 드리우면', '이동 수단으로서의 말 위에 정착을 의미하는 집이 올려져 있다. 류지선 작가는 모순적인 말의 모습을 통해 다양한 해석을 독려한다. 그는 집은 한 장소에 고정되어 있지만, 그것의 양식은 시대와 취향을 반영하며 그에 따라 변하기 때문에 항상 움직이는 말과 연결될 수 있음을 예리하게 짚어낸다. 다양한 건축양식이 혼재되어있는 집의 형태와 시공간을 알 수 없는 배경의 결합은 이러한 상징성을 뒷받침하고 서사적인 분위기를 연출한다. 한편, 건축술과 공간의 내부를 채우는 기술은 상당히 발전했지만, 인간 사이의 단절과 소외로 마음을 놓고 정착할 수 있는 곳을 거의 갖지 못한 채 심리적으로는 계속 떠돌아다니는 현대인의 단면을 밝힌다. 상징적 이미지를 통해 보여주는 현대 사회의 모습에서 그의 날카로운 비판 의식을 엿볼 수 있다.
추천 이유
집을 등에 실은 말이 정처 없이 떠돌고 있습니다. 화려하고 선명한 색상과 집을 등에 이고 있는 말이라는 이미지가 환상적인 분위기를 자아내는 한편, 말이 어떠한 곳을 떠돌아다니고 있는지 관찰하게 되는 일련의 과정이 보는 사람의 상상력을 자극합니다. 무엇을 상상하든 자유입니다. 어느 곳이든 갈 수 있지만, 어느 곳에도 머물지 못하는 현대인의 슬픈 모습을 볼 수 있고 동시에 어디든 갈 수 있다는 설렘 또한 느낄 수도 있습니다. 감각적이지만 결코 피상적이지 않아 무게감이 있습니다. 현대에 맞는 간결함이 돋보이지만, 그 의미는 가볍지 않은 공간과 조화를 이룰 수 있는 그림입니다.
', '1200x1800', 50000, 65, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(3, '향미', 2, '만찬', '유화를 통해 작품 속 대상에 감정을 이입시키고 일상을 재해석하는 김병권 작가는 끈질기게 유화라는 외길을 고집한다. 작가가 보는 세상과 공감을 불러일으키는 감정이 유화라는 매체를 통해 가장 잘 전달된다고 생각하기 때문이다. 작가는 우리가 일상에서 무심코 지나치는 풍경과 대상을 물감의 질감을 살려 입체적으로 표현한다. 작가의 흔적과 물성이 가시화된 그의 작품에서는 오히려 형태는 흐려지고 기억과 감정이 두드러지게 발현되어, 작품을 통해 관람자들에게 자신의 경험을 떠올리게 하고 감정을 마주하게 한다.
추천 이유
김병권 작가의 작품은 현실의 풍경을 대상으로 하지만 왜곡된 형태와 물감의 물성이 드러난 표면으로 인해 초현실적인 분위기를 자아냅니다. 길거리, 가게 앞 등 일상적인 공간이지만 작가의 시각으로 재탄생하여 독특하고 고유의 의미를 가진 장소가 된 듯합니다. 물감의 흔적이 그대로 남아 있는 작품을 보면서 작가의 흔적을 느끼고, 환상적인 분위기를 내는 세련된 색감에서 현대적인 감각을 느낄 수 있습니다. 20세기 초에 탄생한 초현실주의 작품을 보듯 상상력을 자극하며 일상 풍경을 자기만의 시선으로 재해석해 의미를 찾아갈 수 있도록 하는 작품으로, 공간에 개성을 부여해 줄 것입니다.
', '600x900', 30000, 66, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(4, '도원', 2, '목맨사람의집', '나는 유년기의 어려웠던 기억들을 재해석함으로써 현대 사회 속에서 타인으로부터 상처받거나 소외감을 느끼며 살아가는 우리에게 자신을 돌아보고 위로하는 기회를 주는 그림을 그리고 싶다. 이인영 작가는 말한다. 그는 시장에서 하루 종일 야채장사를 하셨던 어머니와 계속된 사업의 실패로 술에 삶을 의지하셨던 아버지를 떠올리며 자신의 가난하고 불우했던 어린 시절을 고백한다. 유년기의 성장통과 불안, 욕망 등 내면의 다양한 감정들을 시각적 언어로 표현하는 그의 작업을 통해 자신의 어두운 감정을 마주할 수 있는 용기를 얻게 된다. 아픔을 마주하는 용기, 그것을 통해 우리는 비로소 자신을 모습을 바라볼 수 있고 성장할 수 있을 것이다.
추천 이유
지하철이나 버스 안에서 사람들을 보고 있으면 스마트폰을 한 손에 쥐고 눈을 그곳에서 떼지 못하고 있습니다. 사람들은 무언가를 상상하거나 생각하기보다 계속해서 어떠한 자료와 정보를 공유 받기를 원하고 있는 것 같습니다. 마치 무언가에 중독된 것처럼 말이죠. 하지만 공상의 시간은 과부화 된 뇌를 쉬게 하고 에너지를 충전하기에 꼭 필요한 시간입니다. 이인영 작가 또한 인생의 절망적인 시기를 공상을 통해 견뎌낼 수 있었다고 합니다. 거친 붓 터치와 깊은 색감으로 그려진 이 작품은 마치 누군가의 꿈속에 들어온 듯한 분위기를 연출하고, 강렬한 느낌을 자아냅니다. 참신한 아이디어가 필요한 곳에 어울리는 곳에 어울리는 작품을 찾고 있는 당신이라면 이 작품을 추천해드립니다. 공상의 세계로 당신을 안내해줄 것입니다
', '900x900', 440000, 67, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(5, '난향', 2, '백야', '이동 수단으로서의 말 위에 정착을 의미하는 집이 올려져 있다. 류지선 작가는 모순적인 말의 모습을 통해 다양한 해석을 독려한다. 그는 집은 한 장소에 고정되어 있지만, 그것의 양식은 시대와 취향을 반영하며 그에 따라 변하기 때문에 항상 움직이는 말과 연결될 수 있음을 예리하게 짚어낸다. 다양한 건축양식이 혼재되어있는 집의 형태와 시공간을 알 수 없는 배경의 결합은 이러한 상징성을 뒷받침하고 서사적인 분위기를 연출한다. 한편, 건축술과 공간의 내부를 채우는 기술은 상당히 발전했지만, 인간 사이의 단절과 소외로 마음을 놓고 정착할 수 있는 곳을 거의 갖지 못한 채 심리적으로는 계속 떠돌아다니는 현대인의 단면을 밝힌다. 상징적 이미지를 통해 보여주는 현대 사회의 모습에서 그의 날카로운 비판 의식을 엿볼 수 있다.
추천 이유
집을 등에 실은 말이 정처 없이 떠돌고 있습니다. 화려하고 선명한 색상과 집을 등에 이고 있는 말이라는 이미지가 환상적인 분위기를 자아내는 한편, 말이 어떠한 곳을 떠돌아다니고 있는지 관찰하게 되는 일련의 과정이 보는 사람의 상상력을 자극합니다. 무엇을 상상하든 자유입니다. 어느 곳이든 갈 수 있지만, 어느 곳에도 머물지 못하는 현대인의 슬픈 모습을 볼 수 있고 동시에 어디든 갈 수 있다는 설렘 또한 느낄 수도 있습니다. 감각적이지만 결코 피상적이지 않아 무게감이 있습니다. 현대에 맞는 간결함이 돋보이지만, 그 의미는 가볍지 않은 공간과 조화를 이룰 수 있는 그림입니다.
', '720x720', 120000, 68, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(6, '열빈', 2, '사랑으로', '현미경을 갖다 댄 듯 세밀한 묘사로 그려진 대상은 모두 생명을 가진 존재들이다. 남진숙 작가의 작품은 한 생명의 있는 그대로의 모습에 대한 치밀한 탐구로 이루어져있다. 그 탐구에 스민 절실함과 섬세함은 비단 대상을 그대로 재현하는 것에서 나타나는 것이 아니라 작품을 통해 드러난 작가의 시선을 통해 알 수 있다. 작가의 시선이 멈춘 누군가는 간절한 눈을 통해 돌처럼 굳어진 심정을 절절히 드러낸다. 누군가의 발자취가 남긴 그림자는 바닥의 보도 블록에서 튀어나와 몸 속을 흐르는 생명의 피처럼 순환하며 움직이는 살아있는 형태가 된다. 식물이 꽃을 피울 땐 주변의 모든 배경이 흐려지고 오직 여린 잎과 봉우리를 뚫고 고개를 내미는 꽃잎만이 남을 뿐이다. 이처럼 남진숙 작가는 살아있는 생명에 대한 깊을 고찰을 통해 삶이 의미를 갖게 되는 순간의 비밀을 드러낸다. 그것은 어떤 영원이나 저 멀리 이상의 세계에 있는 것이 아니라 생명이 그 순간을 살아가는 현재 바로 지금에 있는 것이다.
추천 이유
일상 속에서 우리는 작은 식물의 잎을 한없이 바라보는 경우가 아주 가끔씩 생깁니다. 그 순간 그 작은 잎에 미세한 솜털, 강한 줄기로부터 잎 끝까지 뻗어나간 잎맥이 있었음에 놀라게 됩니다. 그저 주변의 푸른 색의 일부분이었던 작은 잎이 지닌 선명함에 순간 압도당하기도 하지요. 이러한 시간은 우리가 무수히 지나쳐가는 삶의 순간순간에 대해 문득 깨닫게 합니다. 어제 오늘 내일 그저 시간의 흐름에 별일 없이 살던 나라는 존재 역시 이 작은 잎처럼 섬세하게 구성되고 강렬한 생명을 순간순간 뿜어내고 있습니다. 남진숙 작가는 살아있는 순간을 치열하게 담은 작품을 통해 살아있음 그 자체에 집중하는 시간을 갖게 합니다. 작품을 따라 작가의 시선으로 한 생명의 순간을 집중해서 보는 경험은 그 어떤 메시지보다도 우리의 삶을 생생하게 느끼고 나의 존재를 고찰하게 해주는 강한 울림을 갖고 있습니다. 남진숙 작가의 작품을 통해 살아있는 이 순간을 온전히 느껴보시기 바랍니다.
', '600x900', 30000, 69, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(7, '태원', 2, '서커스', '이동 수단으로서의 말 위에 정착을 의미하는 집이 올려져 있다. 류지선 작가는 모순적인 말의 모습을 통해 다양한 해석을 독려한다. 그는 집은 한 장소에 고정되어 있지만, 그것의 양식은 시대와 취향을 반영하며 그에 따라 변하기 때문에 항상 움직이는 말과 연결될 수 있음을 예리하게 짚어낸다. 다양한 건축양식이 혼재되어있는 집의 형태와 시공간을 알 수 없는 배경의 결합은 이러한 상징성을 뒷받침하고 서사적인 분위기를 연출한다. 한편, 건축술과 공간의 내부를 채우는 기술은 상당히 발전했지만, 인간 사이의 단절과 소외로 마음을 놓고 정착할 수 있는 곳을 거의 갖지 못한 채 심리적으로는 계속 떠돌아다니는 현대인의 단면을 밝힌다. 상징적 이미지를 통해 보여주는 현대 사회의 모습에서 그의 날카로운 비판 의식을 엿볼 수 있다.
추천 이유
집을 등에 실은 말이 정처 없이 떠돌고 있습니다. 화려하고 선명한 색상과 집을 등에 이고 있는 말이라는 이미지가 환상적인 분위기를 자아내는 한편, 말이 어떠한 곳을 떠돌아다니고 있는지 관찰하게 되는 일련의 과정이 보는 사람의 상상력을 자극합니다. 무엇을 상상하든 자유입니다. 어느 곳이든 갈 수 있지만, 어느 곳에도 머물지 못하는 현대인의 슬픈 모습을 볼 수 있고 동시에 어디든 갈 수 있다는 설렘 또한 느낄 수도 있습니다. 감각적이지만 결코 피상적이지 않아 무게감이 있습니다. 현대에 맞는 간결함이 돋보이지만, 그 의미는 가볍지 않은 공간과 조화를 이룰 수 있는 그림입니다.
', '1500x1500', 30000, 70, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(1, '목란', 2, '귀로산수도', '유화를 통해 작품 속 대상에 감정을 이입시키고 일상을 재해석하는 김병권 작가는 끈질기게 유화라는 외길을 고집한다. 작가가 보는 세상과 공감을 불러일으키는 감정이 유화라는 매체를 통해 가장 잘 전달된다고 생각하기 때문이다. 작가는 우리가 일상에서 무심코 지나치는 풍경과 대상을 물감의 질감을 살려 입체적으로 표현한다. 작가의 흔적과 물성이 가시화된 그의 작품에서는 오히려 형태는 흐려지고 기억과 감정이 두드러지게 발현되어, 작품을 통해 관람자들에게 자신의 경험을 떠올리게 하고 감정을 마주하게 한다.
추천 이유
김병권 작가의 작품은 현실의 풍경을 대상으로 하지만 왜곡된 형태와 물감의 물성이 드러난 표면으로 인해 초현실적인 분위기를 자아냅니다. 길거리, 가게 앞 등 일상적인 공간이지만 작가의 시각으로 재탄생하여 독특하고 고유의 의미를 가진 장소가 된 듯합니다. 물감의 흔적이 그대로 남아 있는 작품을 보면서 작가의 흔적을 느끼고, 환상적인 분위기를 내는 세련된 색감에서 현대적인 감각을 느낄 수 있습니다. 20세기 초에 탄생한 초현실주의 작품을 보듯 상상력을 자극하며 일상 풍경을 자기만의 시선으로 재해석해 의미를 찾아갈 수 있도록 하는 작품으로, 공간에 개성을 부여해 줄 것입니다.
', '600x900', 150000, 71, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(2, '홍원', 2, 'Funeral', '현미경을 갖다 댄 듯 세밀한 묘사로 그려진 대상은 모두 생명을 가진 존재들이다. 남진숙 작가의 작품은 한 생명의 있는 그대로의 모습에 대한 치밀한 탐구로 이루어져있다. 그 탐구에 스민 절실함과 섬세함은 비단 대상을 그대로 재현하는 것에서 나타나는 것이 아니라 작품을 통해 드러난 작가의 시선을 통해 알 수 있다. 작가의 시선이 멈춘 누군가는 간절한 눈을 통해 돌처럼 굳어진 심정을 절절히 드러낸다. 누군가의 발자취가 남긴 그림자는 바닥의 보도 블록에서 튀어나와 몸 속을 흐르는 생명의 피처럼 순환하며 움직이는 살아있는 형태가 된다. 식물이 꽃을 피울 땐 주변의 모든 배경이 흐려지고 오직 여린 잎과 봉우리를 뚫고 고개를 내미는 꽃잎만이 남을 뿐이다. 이처럼 남진숙 작가는 살아있는 생명에 대한 깊을 고찰을 통해 삶이 의미를 갖게 되는 순간의 비밀을 드러낸다. 그것은 어떤 영원이나 저 멀리 이상의 세계에 있는 것이 아니라 생명이 그 순간을 살아가는 현재 바로 지금에 있는 것이다.
추천 이유
일상 속에서 우리는 작은 식물의 잎을 한없이 바라보는 경우가 아주 가끔씩 생깁니다. 그 순간 그 작은 잎에 미세한 솜털, 강한 줄기로부터 잎 끝까지 뻗어나간 잎맥이 있었음에 놀라게 됩니다. 그저 주변의 푸른 색의 일부분이었던 작은 잎이 지닌 선명함에 순간 압도당하기도 하지요. 이러한 시간은 우리가 무수히 지나쳐가는 삶의 순간순간에 대해 문득 깨닫게 합니다. 어제 오늘 내일 그저 시간의 흐름에 별일 없이 살던 나라는 존재 역시 이 작은 잎처럼 섬세하게 구성되고 강렬한 생명을 순간순간 뿜어내고 있습니다. 남진숙 작가는 살아있는 순간을 치열하게 담은 작품을 통해 살아있음 그 자체에 집중하는 시간을 갖게 합니다. 작품을 따라 작가의 시선으로 한 생명의 순간을 집중해서 보는 경험은 그 어떤 메시지보다도 우리의 삶을 생생하게 느끼고 나의 존재를 고찰하게 해주는 강한 울림을 갖고 있습니다. 남진숙 작가의 작품을 통해 살아있는 이 순간을 온전히 느껴보시기 바랍니다.
', '720x1800', 30000, 72, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(3, '향미', 2, '에스타크', '나는 유년기의 어려웠던 기억들을 재해석함으로써 현대 사회 속에서 타인으로부터 상처받거나 소외감을 느끼며 살아가는 우리에게 자신을 돌아보고 위로하는 기회를 주는 그림을 그리고 싶다. 이인영 작가는 말한다. 그는 시장에서 하루 종일 야채장사를 하셨던 어머니와 계속된 사업의 실패로 술에 삶을 의지하셨던 아버지를 떠올리며 자신의 가난하고 불우했던 어린 시절을 고백한다. 유년기의 성장통과 불안, 욕망 등 내면의 다양한 감정들을 시각적 언어로 표현하는 그의 작업을 통해 자신의 어두운 감정을 마주할 수 있는 용기를 얻게 된다. 아픔을 마주하는 용기, 그것을 통해 우리는 비로소 자신을 모습을 바라볼 수 있고 성장할 수 있을 것이다.
추천 이유
지하철이나 버스 안에서 사람들을 보고 있으면 스마트폰을 한 손에 쥐고 눈을 그곳에서 떼지 못하고 있습니다. 사람들은 무언가를 상상하거나 생각하기보다 계속해서 어떠한 자료와 정보를 공유 받기를 원하고 있는 것 같습니다. 마치 무언가에 중독된 것처럼 말이죠. 하지만 공상의 시간은 과부화 된 뇌를 쉬게 하고 에너지를 충전하기에 꼭 필요한 시간입니다. 이인영 작가 또한 인생의 절망적인 시기를 공상을 통해 견뎌낼 수 있었다고 합니다. 거친 붓 터치와 깊은 색감으로 그려진 이 작품은 마치 누군가의 꿈속에 들어온 듯한 분위기를 연출하고, 강렬한 느낌을 자아냅니다. 참신한 아이디어가 필요한 곳에 어울리는 곳에 어울리는 작품을 찾고 있는 당신이라면 이 작품을 추천해드립니다. 공상의 세계로 당신을 안내해줄 것입니다
', '600x900', 80000, 73, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(4, '도원', 2, '에펠탑', '평범한 일상의 시간들이 지나면 추억이 되고 어느 날 우연치 않게 그 시간들을 되새기는 순간이 온다. 매일매일이 비슷해서 특별할 것 없다고 생각하는 시간들이 지나고 나면 소중해지는 순간처럼. 이혜진 작가는 반복되는 생활 속에서 스쳐 지나가는 풍경과 사물, 그리고 공간들을 감각하여 빗 바랜 추억을 곱씹는다. 과거의 기억이 현재의 순간을 만났을 때, 그녀의 작업은 여기서 시작된다. 이혜진 작가는 자신이 느끼고 발견한 섬세하고 감각적인 정서가 시간, 공간 그리고 기억을 재구성하여 새로운 이미지로 재구성한다. 종이와 연필 그리고 수묵 기법을 사용한 고즈넉한 그녀의 풍경들은 익숙하면서도 편안하고 정적이지만 동시에 다사로운 감각을 선사한다.
추천 이유
시간이 지남에도 늘 사랑받는 작품들, 즉 고전이라 일컬어지는 것들은 변치 않음이라기 보다는 다시 볼 때마다 새로운 기분을 주기 때문이 아닐까 합니다. 그렇게 느끼게 되는 연유는 아마 예전의 나와 지금의 내가 달라졌기 때문이겠죠. 불현듯 떠오르는 기억을 붙잡는 이혜진 작가의 작업은 마치, 새로운 나를 마주하게 하는 고전 이야기를 연상시킵니다. 시간이 지나면 증발하는 기억이 뜻밖의 순간에 마치 화학작용처럼 문득 떠오르는 것처럼 말입니다. 안온한 하면서도 신선함을 주는 이혜진 작가의 작품은 익숙하기 때문에 의식하지 못하고 있던 시간과 공간의 풍경을 예리하게 표현하는 일상을 돌이켜 생각해 보게 합니다. 여러분도 이혜진 작가의 작품을 통해 잊고 있던 기억을 또 다른 추억으로 떠올려보는 건 어떨까요?
', '720x720', 30000, 74, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(5, '난향', 2, '운동장', '하나의 의식처럼 우리를 스쳐 지나가는 수많은 풍경과 사물은 사소해 보이지만 우리 삶의 생생한 순간을 보여준다. 작가는 일상 속에서 본인에게 감동을 주거나 반향을 일으키는 소재들을 작은 캔버스에 담았다고 말한다. 다른 사람은 크게 관심을 두지 않고 그냥 흘려보내는 것들이지만 누군가에게는 큰 기쁨을 줄 수 있고, 또 어떤 누군가에게는 세상 전부가 될 수도 있다. 특정한 주조색을 사용하여 그림을 조명에 비추면 파랑, 노랑, 보라 등의 색이 빛을 머금어 밝게 빛나고 엷게 칠한 유화물감이 특징적인데, 이렇게 캔버스에 재구성된 새로운 이미지는 감성을 자극하고, 매일 일어나는 사건의 소중한 기억을 돌아보게 하는 힘을 가지고 있다.
추천 이유
나빈 작가의 그림 속 소재들은 전부 우리가 일상에서 쉽게 마주치지만 별로 신경 쓰지 않고 지나가게 되는 것들입니다. 베란다에 널려있는 빨래, 입안에 넣으면 살살 녹을 것 같은 케이크 조각, 테이블 위에 올려진 꽃송이 등 이러한 일상적인 소재들은 평범하지만, 기억과 추억의 재료가 되기도 합니다. 현대인들은 일상에 치여 살아가느라 창문 밖을 내다볼 틈도 없으며, 목적지를 향해 앞만 보고 가느라 주변의 삶과 사물을 돌아볼 여유조차 갖지 못합니다. 일상의 소중함과 아름다움을 들여다볼 여유가 없는 삶에 나빈 작가가 발견한 일상의 아름다움을 더해보는 건 어떨까요?
', '600x900', 90000, 75, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(6, '열빈', 2, '움직이는 집', '유화를 통해 작품 속 대상에 감정을 이입시키고 일상을 재해석하는 김병권 작가는 끈질기게 유화라는 외길을 고집한다. 작가가 보는 세상과 공감을 불러일으키는 감정이 유화라는 매체를 통해 가장 잘 전달된다고 생각하기 때문이다. 작가는 우리가 일상에서 무심코 지나치는 풍경과 대상을 물감의 질감을 살려 입체적으로 표현한다. 작가의 흔적과 물성이 가시화된 그의 작품에서는 오히려 형태는 흐려지고 기억과 감정이 두드러지게 발현되어, 작품을 통해 관람자들에게 자신의 경험을 떠올리게 하고 감정을 마주하게 한다.
추천 이유
김병권 작가의 작품은 현실의 풍경을 대상으로 하지만 왜곡된 형태와 물감의 물성이 드러난 표면으로 인해 초현실적인 분위기를 자아냅니다. 길거리, 가게 앞 등 일상적인 공간이지만 작가의 시각으로 재탄생하여 독특하고 고유의 의미를 가진 장소가 된 듯합니다. 물감의 흔적이 그대로 남아 있는 작품을 보면서 작가의 흔적을 느끼고, 환상적인 분위기를 내는 세련된 색감에서 현대적인 감각을 느낄 수 있습니다. 20세기 초에 탄생한 초현실주의 작품을 보듯 상상력을 자극하며 일상 풍경을 자기만의 시선으로 재해석해 의미를 찾아갈 수 있도록 하는 작품으로, 공간에 개성을 부여해 줄 것입니다.
', '900x900', 45000, 76, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(7, '태원', 2, '풍경화', '하나의 의식처럼 우리를 스쳐 지나가는 수많은 풍경과 사물은 사소해 보이지만 우리 삶의 생생한 순간을 보여준다. 작가는 일상 속에서 본인에게 감동을 주거나 반향을 일으키는 소재들을 작은 캔버스에 담았다고 말한다. 다른 사람은 크게 관심을 두지 않고 그냥 흘려보내는 것들이지만 누군가에게는 큰 기쁨을 줄 수 있고, 또 어떤 누군가에게는 세상 전부가 될 수도 있다. 특정한 주조색을 사용하여 그림을 조명에 비추면 파랑, 노랑, 보라 등의 색이 빛을 머금어 밝게 빛나고 엷게 칠한 유화물감이 특징적인데, 이렇게 캔버스에 재구성된 새로운 이미지는 감성을 자극하고, 매일 일어나는 사건의 소중한 기억을 돌아보게 하는 힘을 가지고 있다.
추천 이유
나빈 작가의 그림 속 소재들은 전부 우리가 일상에서 쉽게 마주치지만 별로 신경 쓰지 않고 지나가게 되는 것들입니다. 베란다에 널려있는 빨래, 입안에 넣으면 살살 녹을 것 같은 케이크 조각, 테이블 위에 올려진 꽃송이 등 이러한 일상적인 소재들은 평범하지만, 기억과 추억의 재료가 되기도 합니다. 현대인들은 일상에 치여 살아가느라 창문 밖을 내다볼 틈도 없으며, 목적지를 향해 앞만 보고 가느라 주변의 삶과 사물을 돌아볼 여유조차 갖지 못합니다. 일상의 소중함과 아름다움을 들여다볼 여유가 없는 삶에 나빈 작가가 발견한 일상의 아름다움을 더해보는 건 어떨까요?
', '600x900', 230000, 77, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(1, '목란', 2, '호텔 우물의경관', '평범한 일상의 시간들이 지나면 추억이 되고 어느 날 우연치 않게 그 시간들을 되새기는 순간이 온다. 매일매일이 비슷해서 특별할 것 없다고 생각하는 시간들이 지나고 나면 소중해지는 순간처럼. 이혜진 작가는 반복되는 생활 속에서 스쳐 지나가는 풍경과 사물, 그리고 공간들을 감각하여 빗 바랜 추억을 곱씹는다. 과거의 기억이 현재의 순간을 만났을 때, 그녀의 작업은 여기서 시작된다. 이혜진 작가는 자신이 느끼고 발견한 섬세하고 감각적인 정서가 시간, 공간 그리고 기억을 재구성하여 새로운 이미지로 재구성한다. 종이와 연필 그리고 수묵 기법을 사용한 고즈넉한 그녀의 풍경들은 익숙하면서도 편안하고 정적이지만 동시에 다사로운 감각을 선사한다.
추천 이유
시간이 지남에도 늘 사랑받는 작품들, 즉 고전이라 일컬어지는 것들은 변치 않음이라기 보다는 다시 볼 때마다 새로운 기분을 주기 때문이 아닐까 합니다. 그렇게 느끼게 되는 연유는 아마 예전의 나와 지금의 내가 달라졌기 때문이겠죠. 불현듯 떠오르는 기억을 붙잡는 이혜진 작가의 작업은 마치, 새로운 나를 마주하게 하는 고전 이야기를 연상시킵니다. 시간이 지나면 증발하는 기억이 뜻밖의 순간에 마치 화학작용처럼 문득 떠오르는 것처럼 말입니다. 안온한 하면서도 신선함을 주는 이혜진 작가의 작품은 익숙하기 때문에 의식하지 못하고 있던 시간과 공간의 풍경을 예리하게 표현하는 일상을 돌이켜 생각해 보게 합니다. 여러분도 이혜진 작가의 작품을 통해 잊고 있던 기억을 또 다른 추억으로 떠올려보는 건 어떨까요?
', '1200x1600', 130000, 78, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(2, '홍원', 2, '휴가', '현미경을 갖다 댄 듯 세밀한 묘사로 그려진 대상은 모두 생명을 가진 존재들이다. 남진숙 작가의 작품은 한 생명의 있는 그대로의 모습에 대한 치밀한 탐구로 이루어져있다. 그 탐구에 스민 절실함과 섬세함은 비단 대상을 그대로 재현하는 것에서 나타나는 것이 아니라 작품을 통해 드러난 작가의 시선을 통해 알 수 있다. 작가의 시선이 멈춘 누군가는 간절한 눈을 통해 돌처럼 굳어진 심정을 절절히 드러낸다. 누군가의 발자취가 남긴 그림자는 바닥의 보도 블록에서 튀어나와 몸 속을 흐르는 생명의 피처럼 순환하며 움직이는 살아있는 형태가 된다. 식물이 꽃을 피울 땐 주변의 모든 배경이 흐려지고 오직 여린 잎과 봉우리를 뚫고 고개를 내미는 꽃잎만이 남을 뿐이다. 이처럼 남진숙 작가는 살아있는 생명에 대한 깊을 고찰을 통해 삶이 의미를 갖게 되는 순간의 비밀을 드러낸다. 그것은 어떤 영원이나 저 멀리 이상의 세계에 있는 것이 아니라 생명이 그 순간을 살아가는 현재 바로 지금에 있는 것이다.
추천 이유
일상 속에서 우리는 작은 식물의 잎을 한없이 바라보는 경우가 아주 가끔씩 생깁니다. 그 순간 그 작은 잎에 미세한 솜털, 강한 줄기로부터 잎 끝까지 뻗어나간 잎맥이 있었음에 놀라게 됩니다. 그저 주변의 푸른 색의 일부분이었던 작은 잎이 지닌 선명함에 순간 압도당하기도 하지요. 이러한 시간은 우리가 무수히 지나쳐가는 삶의 순간순간에 대해 문득 깨닫게 합니다. 어제 오늘 내일 그저 시간의 흐름에 별일 없이 살던 나라는 존재 역시 이 작은 잎처럼 섬세하게 구성되고 강렬한 생명을 순간순간 뿜어내고 있습니다. 남진숙 작가는 살아있는 순간을 치열하게 담은 작품을 통해 살아있음 그 자체에 집중하는 시간을 갖게 합니다. 작품을 따라 작가의 시선으로 한 생명의 순간을 집중해서 보는 경험은 그 어떤 메시지보다도 우리의 삶을 생생하게 느끼고 나의 존재를 고찰하게 해주는 강한 울림을 갖고 있습니다. 남진숙 작가의 작품을 통해 살아있는 이 순간을 온전히 느껴보시기 바랍니다.
', '600x900', 30000, 79, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(3, '향미', 3, 'BlossomingAcaciaBranches', '하나의 의식처럼 우리를 스쳐 지나가는 수많은 풍경과 사물은 사소해 보이지만 우리 삶의 생생한 순간을 보여준다. 작가는 일상 속에서 본인에게 감동을 주거나 반향을 일으키는 소재들을 작은 캔버스에 담았다고 말한다. 다른 사람은 크게 관심을 두지 않고 그냥 흘려보내는 것들이지만 누군가에게는 큰 기쁨을 줄 수 있고, 또 어떤 누군가에게는 세상 전부가 될 수도 있다. 특정한 주조색을 사용하여 그림을 조명에 비추면 파랑, 노랑, 보라 등의 색이 빛을 머금어 밝게 빛나고 엷게 칠한 유화물감이 특징적인데, 이렇게 캔버스에 재구성된 새로운 이미지는 감성을 자극하고, 매일 일어나는 사건의 소중한 기억을 돌아보게 하는 힘을 가지고 있다.
추천 이유
나빈 작가의 그림 속 소재들은 전부 우리가 일상에서 쉽게 마주치지만 별로 신경 쓰지 않고 지나가게 되는 것들입니다. 베란다에 널려있는 빨래, 입안에 넣으면 살살 녹을 것 같은 케이크 조각, 테이블 위에 올려진 꽃송이 등 이러한 일상적인 소재들은 평범하지만, 기억과 추억의 재료가 되기도 합니다. 현대인들은 일상에 치여 살아가느라 창문 밖을 내다볼 틈도 없으며, 목적지를 향해 앞만 보고 가느라 주변의 삶과 사물을 돌아볼 여유조차 갖지 못합니다. 일상의 소중함과 아름다움을 들여다볼 여유가 없는 삶에 나빈 작가가 발견한 일상의 아름다움을 더해보는 건 어떨까요?
', '600x900', 30000, 80, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(4, '도원', 3, 'blue and white', '작가는 도시 생활의 안식처를 찾아 자연으로 여행을 떠나서 마주쳤던 풍경을 그린다. 감탄을 자아내는 광대한 풍경, 잠깐 스쳐지나가면서 보는 익숙하고 편안한 풍경, 낯설거나 이국적이고 몽환적인 풍경 등 여행과 등산을 하며 마주치는 수많은 존재와 풍경들은 작가의 경험과 느낌을 토대로 새로운 풍경으로 재탄생한다. 작가는 자신이 풍경을 그리면서 갈증을 해소하고 휴식을 상상하듯이 감상자 역시 작가의 작품을 통해 편안하게 휴식하기를 바란다고 한다. 한지에 먹으로 채색하는 지극히 한국적인 방식으로 그려졌지만 현대적인 감각으로 그려져 동서양의 경계를 넘어 자연을 향한 향수를 자극하는 작품이다.
추천 이유
도시가 주는 편리함은 너무 매력적이지만 정신없이 바쁜 생활에서 공허감을 느끼고, 반복되는 일상에서 권태와 우울을 느끼기도 합니다. 그래서 많은 사람이 자연을 느낄 수 있는 곳으로 여행을 떠나고 싶어 합니다. 하지만 해야 할 일을 뒤로하고 어딘가로 훌쩍 떠난다는 게 말처럼 쉬운 일이 아니기에, 권소영 작가의 손에서 멋지게 재탄생한 자연 풍경을 즐겨보기를 추천합니다. 무채색으로 그려진 작가의 풍경화는 안락한 자연과 이상적인 경관을 보여주어 이상향에 한 걸음 다가가는 것 같은 기분이 들고, 마음이 차분히 가라앉고 평온해지는 것을 경험할 수 있을 것입니다. 감성을 자극하는 현대적인 수묵산수화로 일상의 지루함을 달래보세요.
', '1600x1600', 110000, 81, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(5, '난향', 3, 'ColeusPlantinaFlowerPot1886', '하나의 의식처럼 우리를 스쳐 지나가는 수많은 풍경과 사물은 사소해 보이지만 우리 삶의 생생한 순간을 보여준다. 작가는 일상 속에서 본인에게 감동을 주거나 반향을 일으키는 소재들을 작은 캔버스에 담았다고 말한다. 다른 사람은 크게 관심을 두지 않고 그냥 흘려보내는 것들이지만 누군가에게는 큰 기쁨을 줄 수 있고, 또 어떤 누군가에게는 세상 전부가 될 수도 있다. 특정한 주조색을 사용하여 그림을 조명에 비추면 파랑, 노랑, 보라 등의 색이 빛을 머금어 밝게 빛나고 엷게 칠한 유화물감이 특징적인데, 이렇게 캔버스에 재구성된 새로운 이미지는 감성을 자극하고, 매일 일어나는 사건의 소중한 기억을 돌아보게 하는 힘을 가지고 있다.
추천 이유
나빈 작가의 그림 속 소재들은 전부 우리가 일상에서 쉽게 마주치지만 별로 신경 쓰지 않고 지나가게 되는 것들입니다. 베란다에 널려있는 빨래, 입안에 넣으면 살살 녹을 것 같은 케이크 조각, 테이블 위에 올려진 꽃송이 등 이러한 일상적인 소재들은 평범하지만, 기억과 추억의 재료가 되기도 합니다. 현대인들은 일상에 치여 살아가느라 창문 밖을 내다볼 틈도 없으며, 목적지를 향해 앞만 보고 가느라 주변의 삶과 사물을 돌아볼 여유조차 갖지 못합니다. 일상의 소중함과 아름다움을 들여다볼 여유가 없는 삶에 나빈 작가가 발견한 일상의 아름다움을 더해보는 건 어떨까요?
', '600x900', 230000, 82, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(6, '열빈', 3, 'Composition with skull', '나는 유년기의 어려웠던 기억들을 재해석함으로써 현대 사회 속에서 타인으로부터 상처받거나 소외감을 느끼며 살아가는 우리에게 자신을 돌아보고 위로하는 기회를 주는 그림을 그리고 싶다. 이인영 작가는 말한다. 그는 시장에서 하루 종일 야채장사를 하셨던 어머니와 계속된 사업의 실패로 술에 삶을 의지하셨던 아버지를 떠올리며 자신의 가난하고 불우했던 어린 시절을 고백한다. 유년기의 성장통과 불안, 욕망 등 내면의 다양한 감정들을 시각적 언어로 표현하는 그의 작업을 통해 자신의 어두운 감정을 마주할 수 있는 용기를 얻게 된다. 아픔을 마주하는 용기, 그것을 통해 우리는 비로소 자신을 모습을 바라볼 수 있고 성장할 수 있을 것이다.
추천 이유
지하철이나 버스 안에서 사람들을 보고 있으면 스마트폰을 한 손에 쥐고 눈을 그곳에서 떼지 못하고 있습니다. 사람들은 무언가를 상상하거나 생각하기보다 계속해서 어떠한 자료와 정보를 공유 받기를 원하고 있는 것 같습니다. 마치 무언가에 중독된 것처럼 말이죠. 하지만 공상의 시간은 과부화 된 뇌를 쉬게 하고 에너지를 충전하기에 꼭 필요한 시간입니다. 이인영 작가 또한 인생의 절망적인 시기를 공상을 통해 견뎌낼 수 있었다고 합니다. 거친 붓 터치와 깊은 색감으로 그려진 이 작품은 마치 누군가의 꿈속에 들어온 듯한 분위기를 연출하고, 강렬한 느낌을 자아냅니다. 참신한 아이디어가 필요한 곳에 어울리는 곳에 어울리는 작품을 찾고 있는 당신이라면 이 작품을 추천해드립니다. 공상의 세계로 당신을 안내해줄 것입니다
', '720x720', 30000, 83, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(7, '태원', 3, 'Corner Of Studio', '유화를 통해 작품 속 대상에 감정을 이입시키고 일상을 재해석하는 김병권 작가는 끈질기게 유화라는 외길을 고집한다. 작가가 보는 세상과 공감을 불러일으키는 감정이 유화라는 매체를 통해 가장 잘 전달된다고 생각하기 때문이다. 작가는 우리가 일상에서 무심코 지나치는 풍경과 대상을 물감의 질감을 살려 입체적으로 표현한다. 작가의 흔적과 물성이 가시화된 그의 작품에서는 오히려 형태는 흐려지고 기억과 감정이 두드러지게 발현되어, 작품을 통해 관람자들에게 자신의 경험을 떠올리게 하고 감정을 마주하게 한다.
추천 이유
김병권 작가의 작품은 현실의 풍경을 대상으로 하지만 왜곡된 형태와 물감의 물성이 드러난 표면으로 인해 초현실적인 분위기를 자아냅니다. 길거리, 가게 앞 등 일상적인 공간이지만 작가의 시각으로 재탄생하여 독특하고 고유의 의미를 가진 장소가 된 듯합니다. 물감의 흔적이 그대로 남아 있는 작품을 보면서 작가의 흔적을 느끼고, 환상적인 분위기를 내는 세련된 색감에서 현대적인 감각을 느낄 수 있습니다. 20세기 초에 탄생한 초현실주의 작품을 보듯 상상력을 자극하며 일상 풍경을 자기만의 시선으로 재해석해 의미를 찾아갈 수 있도록 하는 작품으로, 공간에 개성을 부여해 줄 것입니다.
', '400x400', 75000, 84, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(1, '목란', 3, 'Das rote Teeservice', '하나의 의식처럼 우리를 스쳐 지나가는 수많은 풍경과 사물은 사소해 보이지만 우리 삶의 생생한 순간을 보여준다. 작가는 일상 속에서 본인에게 감동을 주거나 반향을 일으키는 소재들을 작은 캔버스에 담았다고 말한다. 다른 사람은 크게 관심을 두지 않고 그냥 흘려보내는 것들이지만 누군가에게는 큰 기쁨을 줄 수 있고, 또 어떤 누군가에게는 세상 전부가 될 수도 있다. 특정한 주조색을 사용하여 그림을 조명에 비추면 파랑, 노랑, 보라 등의 색이 빛을 머금어 밝게 빛나고 엷게 칠한 유화물감이 특징적인데, 이렇게 캔버스에 재구성된 새로운 이미지는 감성을 자극하고, 매일 일어나는 사건의 소중한 기억을 돌아보게 하는 힘을 가지고 있다.
추천 이유
나빈 작가의 그림 속 소재들은 전부 우리가 일상에서 쉽게 마주치지만 별로 신경 쓰지 않고 지나가게 되는 것들입니다. 베란다에 널려있는 빨래, 입안에 넣으면 살살 녹을 것 같은 케이크 조각, 테이블 위에 올려진 꽃송이 등 이러한 일상적인 소재들은 평범하지만, 기억과 추억의 재료가 되기도 합니다. 현대인들은 일상에 치여 살아가느라 창문 밖을 내다볼 틈도 없으며, 목적지를 향해 앞만 보고 가느라 주변의 삶과 사물을 돌아볼 여유조차 갖지 못합니다. 일상의 소중함과 아름다움을 들여다볼 여유가 없는 삶에 나빈 작가가 발견한 일상의 아름다움을 더해보는 건 어떨까요?
', '300x300', 30000, 85, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(2, '홍원', 3, 'Flowers and Fruit', '현미경을 갖다 댄 듯 세밀한 묘사로 그려진 대상은 모두 생명을 가진 존재들이다. 남진숙 작가의 작품은 한 생명의 있는 그대로의 모습에 대한 치밀한 탐구로 이루어져있다. 그 탐구에 스민 절실함과 섬세함은 비단 대상을 그대로 재현하는 것에서 나타나는 것이 아니라 작품을 통해 드러난 작가의 시선을 통해 알 수 있다. 작가의 시선이 멈춘 누군가는 간절한 눈을 통해 돌처럼 굳어진 심정을 절절히 드러낸다. 누군가의 발자취가 남긴 그림자는 바닥의 보도 블록에서 튀어나와 몸 속을 흐르는 생명의 피처럼 순환하며 움직이는 살아있는 형태가 된다. 식물이 꽃을 피울 땐 주변의 모든 배경이 흐려지고 오직 여린 잎과 봉우리를 뚫고 고개를 내미는 꽃잎만이 남을 뿐이다. 이처럼 남진숙 작가는 살아있는 생명에 대한 깊을 고찰을 통해 삶이 의미를 갖게 되는 순간의 비밀을 드러낸다. 그것은 어떤 영원이나 저 멀리 이상의 세계에 있는 것이 아니라 생명이 그 순간을 살아가는 현재 바로 지금에 있는 것이다.
추천 이유
일상 속에서 우리는 작은 식물의 잎을 한없이 바라보는 경우가 아주 가끔씩 생깁니다. 그 순간 그 작은 잎에 미세한 솜털, 강한 줄기로부터 잎 끝까지 뻗어나간 잎맥이 있었음에 놀라게 됩니다. 그저 주변의 푸른 색의 일부분이었던 작은 잎이 지닌 선명함에 순간 압도당하기도 하지요. 이러한 시간은 우리가 무수히 지나쳐가는 삶의 순간순간에 대해 문득 깨닫게 합니다. 어제 오늘 내일 그저 시간의 흐름에 별일 없이 살던 나라는 존재 역시 이 작은 잎처럼 섬세하게 구성되고 강렬한 생명을 순간순간 뿜어내고 있습니다. 남진숙 작가는 살아있는 순간을 치열하게 담은 작품을 통해 살아있음 그 자체에 집중하는 시간을 갖게 합니다. 작품을 따라 작가의 시선으로 한 생명의 순간을 집중해서 보는 경험은 그 어떤 메시지보다도 우리의 삶을 생생하게 느끼고 나의 존재를 고찰하게 해주는 강한 울림을 갖고 있습니다. 남진숙 작가의 작품을 통해 살아있는 이 순간을 온전히 느껴보시기 바랍니다.
', '600x900', 30000, 86, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(3, '향미', 3, '물병과 바이올린', '유화를 통해 작품 속 대상에 감정을 이입시키고 일상을 재해석하는 김병권 작가는 끈질기게 유화라는 외길을 고집한다. 작가가 보는 세상과 공감을 불러일으키는 감정이 유화라는 매체를 통해 가장 잘 전달된다고 생각하기 때문이다. 작가는 우리가 일상에서 무심코 지나치는 풍경과 대상을 물감의 질감을 살려 입체적으로 표현한다. 작가의 흔적과 물성이 가시화된 그의 작품에서는 오히려 형태는 흐려지고 기억과 감정이 두드러지게 발현되어, 작품을 통해 관람자들에게 자신의 경험을 떠올리게 하고 감정을 마주하게 한다.
추천 이유
김병권 작가의 작품은 현실의 풍경을 대상으로 하지만 왜곡된 형태와 물감의 물성이 드러난 표면으로 인해 초현실적인 분위기를 자아냅니다. 길거리, 가게 앞 등 일상적인 공간이지만 작가의 시각으로 재탄생하여 독특하고 고유의 의미를 가진 장소가 된 듯합니다. 물감의 흔적이 그대로 남아 있는 작품을 보면서 작가의 흔적을 느끼고, 환상적인 분위기를 내는 세련된 색감에서 현대적인 감각을 느낄 수 있습니다. 20세기 초에 탄생한 초현실주의 작품을 보듯 상상력을 자극하며 일상 풍경을 자기만의 시선으로 재해석해 의미를 찾아갈 수 있도록 하는 작품으로, 공간에 개성을 부여해 줄 것입니다.
', '500x500', 70000, 87, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(4, '도원', 3, 'Fruit-on-a-Bench', '평범한 일상의 시간들이 지나면 추억이 되고 어느 날 우연치 않게 그 시간들을 되새기는 순간이 온다. 매일매일이 비슷해서 특별할 것 없다고 생각하는 시간들이 지나고 나면 소중해지는 순간처럼. 이혜진 작가는 반복되는 생활 속에서 스쳐 지나가는 풍경과 사물, 그리고 공간들을 감각하여 빗 바랜 추억을 곱씹는다. 과거의 기억이 현재의 순간을 만났을 때, 그녀의 작업은 여기서 시작된다. 이혜진 작가는 자신이 느끼고 발견한 섬세하고 감각적인 정서가 시간, 공간 그리고 기억을 재구성하여 새로운 이미지로 재구성한다. 종이와 연필 그리고 수묵 기법을 사용한 고즈넉한 그녀의 풍경들은 익숙하면서도 편안하고 정적이지만 동시에 다사로운 감각을 선사한다.
추천 이유
시간이 지남에도 늘 사랑받는 작품들, 즉 고전이라 일컬어지는 것들은 변치 않음이라기 보다는 다시 볼 때마다 새로운 기분을 주기 때문이 아닐까 합니다. 그렇게 느끼게 되는 연유는 아마 예전의 나와 지금의 내가 달라졌기 때문이겠죠. 불현듯 떠오르는 기억을 붙잡는 이혜진 작가의 작업은 마치, 새로운 나를 마주하게 하는 고전 이야기를 연상시킵니다. 시간이 지나면 증발하는 기억이 뜻밖의 순간에 마치 화학작용처럼 문득 떠오르는 것처럼 말입니다. 안온한 하면서도 신선함을 주는 이혜진 작가의 작품은 익숙하기 때문에 의식하지 못하고 있던 시간과 공간의 풍경을 예리하게 표현하는 일상을 돌이켜 생각해 보게 합니다. 여러분도 이혜진 작가의 작품을 통해 잊고 있던 기억을 또 다른 추억으로 떠올려보는 건 어떨까요?
', '250x250', 65000, 88, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(5, '난향', 3, 'FruitsandFlowers', '하나의 의식처럼 우리를 스쳐 지나가는 수많은 풍경과 사물은 사소해 보이지만 우리 삶의 생생한 순간을 보여준다. 작가는 일상 속에서 본인에게 감동을 주거나 반향을 일으키는 소재들을 작은 캔버스에 담았다고 말한다. 다른 사람은 크게 관심을 두지 않고 그냥 흘려보내는 것들이지만 누군가에게는 큰 기쁨을 줄 수 있고, 또 어떤 누군가에게는 세상 전부가 될 수도 있다. 특정한 주조색을 사용하여 그림을 조명에 비추면 파랑, 노랑, 보라 등의 색이 빛을 머금어 밝게 빛나고 엷게 칠한 유화물감이 특징적인데, 이렇게 캔버스에 재구성된 새로운 이미지는 감성을 자극하고, 매일 일어나는 사건의 소중한 기억을 돌아보게 하는 힘을 가지고 있다.
추천 이유
나빈 작가의 그림 속 소재들은 전부 우리가 일상에서 쉽게 마주치지만 별로 신경 쓰지 않고 지나가게 되는 것들입니다. 베란다에 널려있는 빨래, 입안에 넣으면 살살 녹을 것 같은 케이크 조각, 테이블 위에 올려진 꽃송이 등 이러한 일상적인 소재들은 평범하지만, 기억과 추억의 재료가 되기도 합니다. 현대인들은 일상에 치여 살아가느라 창문 밖을 내다볼 틈도 없으며, 목적지를 향해 앞만 보고 가느라 주변의 삶과 사물을 돌아볼 여유조차 갖지 못합니다. 일상의 소중함과 아름다움을 들여다볼 여유가 없는 삶에 나빈 작가가 발견한 일상의 아름다움을 더해보는 건 어떨까요?
', '600x900', 30000, 89, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(6, '열빈', 3, 'GlasswithRoses', '유화를 통해 작품 속 대상에 감정을 이입시키고 일상을 재해석하는 김병권 작가는 끈질기게 유화라는 외길을 고집한다. 작가가 보는 세상과 공감을 불러일으키는 감정이 유화라는 매체를 통해 가장 잘 전달된다고 생각하기 때문이다. 작가는 우리가 일상에서 무심코 지나치는 풍경과 대상을 물감의 질감을 살려 입체적으로 표현한다. 작가의 흔적과 물성이 가시화된 그의 작품에서는 오히려 형태는 흐려지고 기억과 감정이 두드러지게 발현되어, 작품을 통해 관람자들에게 자신의 경험을 떠올리게 하고 감정을 마주하게 한다.
추천 이유
김병권 작가의 작품은 현실의 풍경을 대상으로 하지만 왜곡된 형태와 물감의 물성이 드러난 표면으로 인해 초현실적인 분위기를 자아냅니다. 길거리, 가게 앞 등 일상적인 공간이지만 작가의 시각으로 재탄생하여 독특하고 고유의 의미를 가진 장소가 된 듯합니다. 물감의 흔적이 그대로 남아 있는 작품을 보면서 작가의 흔적을 느끼고, 환상적인 분위기를 내는 세련된 색감에서 현대적인 감각을 느낄 수 있습니다. 20세기 초에 탄생한 초현실주의 작품을 보듯 상상력을 자극하며 일상 풍경을 자기만의 시선으로 재해석해 의미를 찾아갈 수 있도록 하는 작품으로, 공간에 개성을 부여해 줄 것입니다.
', '250x500', 60000, 90, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(7, '태원', 3, 'Irises', '나는 유년기의 어려웠던 기억들을 재해석함으로써 현대 사회 속에서 타인으로부터 상처받거나 소외감을 느끼며 살아가는 우리에게 자신을 돌아보고 위로하는 기회를 주는 그림을 그리고 싶다. 이인영 작가는 말한다. 그는 시장에서 하루 종일 야채장사를 하셨던 어머니와 계속된 사업의 실패로 술에 삶을 의지하셨던 아버지를 떠올리며 자신의 가난하고 불우했던 어린 시절을 고백한다. 유년기의 성장통과 불안, 욕망 등 내면의 다양한 감정들을 시각적 언어로 표현하는 그의 작업을 통해 자신의 어두운 감정을 마주할 수 있는 용기를 얻게 된다. 아픔을 마주하는 용기, 그것을 통해 우리는 비로소 자신을 모습을 바라볼 수 있고 성장할 수 있을 것이다.
추천 이유
지하철이나 버스 안에서 사람들을 보고 있으면 스마트폰을 한 손에 쥐고 눈을 그곳에서 떼지 못하고 있습니다. 사람들은 무언가를 상상하거나 생각하기보다 계속해서 어떠한 자료와 정보를 공유 받기를 원하고 있는 것 같습니다. 마치 무언가에 중독된 것처럼 말이죠. 하지만 공상의 시간은 과부화 된 뇌를 쉬게 하고 에너지를 충전하기에 꼭 필요한 시간입니다. 이인영 작가 또한 인생의 절망적인 시기를 공상을 통해 견뎌낼 수 있었다고 합니다. 거친 붓 터치와 깊은 색감으로 그려진 이 작품은 마치 누군가의 꿈속에 들어온 듯한 분위기를 연출하고, 강렬한 느낌을 자아냅니다. 참신한 아이디어가 필요한 곳에 어울리는 곳에 어울리는 작품을 찾고 있는 당신이라면 이 작품을 추천해드립니다. 공상의 세계로 당신을 안내해줄 것입니다
', '600x900', 30000, 91, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(1, '목란', 3, 'Malven I (Hollyhocks I)', '현미경을 갖다 댄 듯 세밀한 묘사로 그려진 대상은 모두 생명을 가진 존재들이다. 남진숙 작가의 작품은 한 생명의 있는 그대로의 모습에 대한 치밀한 탐구로 이루어져있다. 그 탐구에 스민 절실함과 섬세함은 비단 대상을 그대로 재현하는 것에서 나타나는 것이 아니라 작품을 통해 드러난 작가의 시선을 통해 알 수 있다. 작가의 시선이 멈춘 누군가는 간절한 눈을 통해 돌처럼 굳어진 심정을 절절히 드러낸다. 누군가의 발자취가 남긴 그림자는 바닥의 보도 블록에서 튀어나와 몸 속을 흐르는 생명의 피처럼 순환하며 움직이는 살아있는 형태가 된다. 식물이 꽃을 피울 땐 주변의 모든 배경이 흐려지고 오직 여린 잎과 봉우리를 뚫고 고개를 내미는 꽃잎만이 남을 뿐이다. 이처럼 남진숙 작가는 살아있는 생명에 대한 깊을 고찰을 통해 삶이 의미를 갖게 되는 순간의 비밀을 드러낸다. 그것은 어떤 영원이나 저 멀리 이상의 세계에 있는 것이 아니라 생명이 그 순간을 살아가는 현재 바로 지금에 있는 것이다.
추천 이유
일상 속에서 우리는 작은 식물의 잎을 한없이 바라보는 경우가 아주 가끔씩 생깁니다. 그 순간 그 작은 잎에 미세한 솜털, 강한 줄기로부터 잎 끝까지 뻗어나간 잎맥이 있었음에 놀라게 됩니다. 그저 주변의 푸른 색의 일부분이었던 작은 잎이 지닌 선명함에 순간 압도당하기도 하지요. 이러한 시간은 우리가 무수히 지나쳐가는 삶의 순간순간에 대해 문득 깨닫게 합니다. 어제 오늘 내일 그저 시간의 흐름에 별일 없이 살던 나라는 존재 역시 이 작은 잎처럼 섬세하게 구성되고 강렬한 생명을 순간순간 뿜어내고 있습니다. 남진숙 작가는 살아있는 순간을 치열하게 담은 작품을 통해 살아있음 그 자체에 집중하는 시간을 갖게 합니다. 작품을 따라 작가의 시선으로 한 생명의 순간을 집중해서 보는 경험은 그 어떤 메시지보다도 우리의 삶을 생생하게 느끼고 나의 존재를 고찰하게 해주는 강한 울림을 갖고 있습니다. 남진숙 작가의 작품을 통해 살아있는 이 순간을 온전히 느껴보시기 바랍니다.
', '600x900', 20000, 92, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(2, '홍원', 3, 'NatureDead', '평범한 일상의 시간들이 지나면 추억이 되고 어느 날 우연치 않게 그 시간들을 되새기는 순간이 온다. 매일매일이 비슷해서 특별할 것 없다고 생각하는 시간들이 지나고 나면 소중해지는 순간처럼. 이혜진 작가는 반복되는 생활 속에서 스쳐 지나가는 풍경과 사물, 그리고 공간들을 감각하여 빗 바랜 추억을 곱씹는다. 과거의 기억이 현재의 순간을 만났을 때, 그녀의 작업은 여기서 시작된다. 이혜진 작가는 자신이 느끼고 발견한 섬세하고 감각적인 정서가 시간, 공간 그리고 기억을 재구성하여 새로운 이미지로 재구성한다. 종이와 연필 그리고 수묵 기법을 사용한 고즈넉한 그녀의 풍경들은 익숙하면서도 편안하고 정적이지만 동시에 다사로운 감각을 선사한다.
추천 이유
시간이 지남에도 늘 사랑받는 작품들, 즉 고전이라 일컬어지는 것들은 변치 않음이라기 보다는 다시 볼 때마다 새로운 기분을 주기 때문이 아닐까 합니다. 그렇게 느끼게 되는 연유는 아마 예전의 나와 지금의 내가 달라졌기 때문이겠죠. 불현듯 떠오르는 기억을 붙잡는 이혜진 작가의 작업은 마치, 새로운 나를 마주하게 하는 고전 이야기를 연상시킵니다. 시간이 지나면 증발하는 기억이 뜻밖의 순간에 마치 화학작용처럼 문득 떠오르는 것처럼 말입니다. 안온한 하면서도 신선함을 주는 이혜진 작가의 작품은 익숙하기 때문에 의식하지 못하고 있던 시간과 공간의 풍경을 예리하게 표현하는 일상을 돌이켜 생각해 보게 합니다. 여러분도 이혜진 작가의 작품을 통해 잊고 있던 기억을 또 다른 추억으로 떠올려보는 건 어떨까요?
', '720x720', 25000, 93, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(3, '향미', 3, 'noname', '하나의 의식처럼 우리를 스쳐 지나가는 수많은 풍경과 사물은 사소해 보이지만 우리 삶의 생생한 순간을 보여준다. 작가는 일상 속에서 본인에게 감동을 주거나 반향을 일으키는 소재들을 작은 캔버스에 담았다고 말한다. 다른 사람은 크게 관심을 두지 않고 그냥 흘려보내는 것들이지만 누군가에게는 큰 기쁨을 줄 수 있고, 또 어떤 누군가에게는 세상 전부가 될 수도 있다. 특정한 주조색을 사용하여 그림을 조명에 비추면 파랑, 노랑, 보라 등의 색이 빛을 머금어 밝게 빛나고 엷게 칠한 유화물감이 특징적인데, 이렇게 캔버스에 재구성된 새로운 이미지는 감성을 자극하고, 매일 일어나는 사건의 소중한 기억을 돌아보게 하는 힘을 가지고 있다.
추천 이유
나빈 작가의 그림 속 소재들은 전부 우리가 일상에서 쉽게 마주치지만 별로 신경 쓰지 않고 지나가게 되는 것들입니다. 베란다에 널려있는 빨래, 입안에 넣으면 살살 녹을 것 같은 케이크 조각, 테이블 위에 올려진 꽃송이 등 이러한 일상적인 소재들은 평범하지만, 기억과 추억의 재료가 되기도 합니다. 현대인들은 일상에 치여 살아가느라 창문 밖을 내다볼 틈도 없으며, 목적지를 향해 앞만 보고 가느라 주변의 삶과 사물을 돌아볼 여유조차 갖지 못합니다. 일상의 소중함과 아름다움을 들여다볼 여유가 없는 삶에 나빈 작가가 발견한 일상의 아름다움을 더해보는 건 어떨까요?
', '600x900', 30000, 94, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(4, '도원', 3, 'objet', '작가는 도시 생활의 안식처를 찾아 자연으로 여행을 떠나서 마주쳤던 풍경을 그린다. 감탄을 자아내는 광대한 풍경, 잠깐 스쳐지나가면서 보는 익숙하고 편안한 풍경, 낯설거나 이국적이고 몽환적인 풍경 등 여행과 등산을 하며 마주치는 수많은 존재와 풍경들은 작가의 경험과 느낌을 토대로 새로운 풍경으로 재탄생한다. 작가는 자신이 풍경을 그리면서 갈증을 해소하고 휴식을 상상하듯이 감상자 역시 작가의 작품을 통해 편안하게 휴식하기를 바란다고 한다. 한지에 먹으로 채색하는 지극히 한국적인 방식으로 그려졌지만 현대적인 감각으로 그려져 동서양의 경계를 넘어 자연을 향한 향수를 자극하는 작품이다.
추천 이유
도시가 주는 편리함은 너무 매력적이지만 정신없이 바쁜 생활에서 공허감을 느끼고, 반복되는 일상에서 권태와 우울을 느끼기도 합니다. 그래서 많은 사람이 자연을 느낄 수 있는 곳으로 여행을 떠나고 싶어 합니다. 하지만 해야 할 일을 뒤로하고 어딘가로 훌쩍 떠난다는 게 말처럼 쉬운 일이 아니기에, 권소영 작가의 손에서 멋지게 재탄생한 자연 풍경을 즐겨보기를 추천합니다. 무채색으로 그려진 작가의 풍경화는 안락한 자연과 이상적인 경관을 보여주어 이상향에 한 걸음 다가가는 것 같은 기분이 들고, 마음이 차분히 가라앉고 평온해지는 것을 경험할 수 있을 것입니다. 감성을 자극하는 현대적인 수묵산수화로 일상의 지루함을 달래보세요.
', '900x900', 30000, 95, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(5, '난향', 3, 'objet2', '유화를 통해 작품 속 대상에 감정을 이입시키고 일상을 재해석하는 김병권 작가는 끈질기게 유화라는 외길을 고집한다. 작가가 보는 세상과 공감을 불러일으키는 감정이 유화라는 매체를 통해 가장 잘 전달된다고 생각하기 때문이다. 작가는 우리가 일상에서 무심코 지나치는 풍경과 대상을 물감의 질감을 살려 입체적으로 표현한다. 작가의 흔적과 물성이 가시화된 그의 작품에서는 오히려 형태는 흐려지고 기억과 감정이 두드러지게 발현되어, 작품을 통해 관람자들에게 자신의 경험을 떠올리게 하고 감정을 마주하게 한다.
추천 이유
김병권 작가의 작품은 현실의 풍경을 대상으로 하지만 왜곡된 형태와 물감의 물성이 드러난 표면으로 인해 초현실적인 분위기를 자아냅니다. 길거리, 가게 앞 등 일상적인 공간이지만 작가의 시각으로 재탄생하여 독특하고 고유의 의미를 가진 장소가 된 듯합니다. 물감의 흔적이 그대로 남아 있는 작품을 보면서 작가의 흔적을 느끼고, 환상적인 분위기를 내는 세련된 색감에서 현대적인 감각을 느낄 수 있습니다. 20세기 초에 탄생한 초현실주의 작품을 보듯 상상력을 자극하며 일상 풍경을 자기만의 시선으로 재해석해 의미를 찾아갈 수 있도록 하는 작품으로, 공간에 개성을 부여해 줄 것입니다.
', '600x900', 35000, 96, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(6, '열빈', 3, 'PoppiesandButterflie', '나는 유년기의 어려웠던 기억들을 재해석함으로써 현대 사회 속에서 타인으로부터 상처받거나 소외감을 느끼며 살아가는 우리에게 자신을 돌아보고 위로하는 기회를 주는 그림을 그리고 싶다. 이인영 작가는 말한다. 그는 시장에서 하루 종일 야채장사를 하셨던 어머니와 계속된 사업의 실패로 술에 삶을 의지하셨던 아버지를 떠올리며 자신의 가난하고 불우했던 어린 시절을 고백한다. 유년기의 성장통과 불안, 욕망 등 내면의 다양한 감정들을 시각적 언어로 표현하는 그의 작업을 통해 자신의 어두운 감정을 마주할 수 있는 용기를 얻게 된다. 아픔을 마주하는 용기, 그것을 통해 우리는 비로소 자신을 모습을 바라볼 수 있고 성장할 수 있을 것이다.
추천 이유
지하철이나 버스 안에서 사람들을 보고 있으면 스마트폰을 한 손에 쥐고 눈을 그곳에서 떼지 못하고 있습니다. 사람들은 무언가를 상상하거나 생각하기보다 계속해서 어떠한 자료와 정보를 공유 받기를 원하고 있는 것 같습니다. 마치 무언가에 중독된 것처럼 말이죠. 하지만 공상의 시간은 과부화 된 뇌를 쉬게 하고 에너지를 충전하기에 꼭 필요한 시간입니다. 이인영 작가 또한 인생의 절망적인 시기를 공상을 통해 견뎌낼 수 있었다고 합니다. 거친 붓 터치와 깊은 색감으로 그려진 이 작품은 마치 누군가의 꿈속에 들어온 듯한 분위기를 연출하고, 강렬한 느낌을 자아냅니다. 참신한 아이디어가 필요한 곳에 어울리는 곳에 어울리는 작품을 찾고 있는 당신이라면 이 작품을 추천해드립니다. 공상의 세계로 당신을 안내해줄 것입니다
', '1800x1800', 40000, 97, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(7, '태원', 3, 'Rabbit, Copper Cauldron and Quince', '하나의 의식처럼 우리를 스쳐 지나가는 수많은 풍경과 사물은 사소해 보이지만 우리 삶의 생생한 순간을 보여준다. 작가는 일상 속에서 본인에게 감동을 주거나 반향을 일으키는 소재들을 작은 캔버스에 담았다고 말한다. 다른 사람은 크게 관심을 두지 않고 그냥 흘려보내는 것들이지만 누군가에게는 큰 기쁨을 줄 수 있고, 또 어떤 누군가에게는 세상 전부가 될 수도 있다. 특정한 주조색을 사용하여 그림을 조명에 비추면 파랑, 노랑, 보라 등의 색이 빛을 머금어 밝게 빛나고 엷게 칠한 유화물감이 특징적인데, 이렇게 캔버스에 재구성된 새로운 이미지는 감성을 자극하고, 매일 일어나는 사건의 소중한 기억을 돌아보게 하는 힘을 가지고 있다.
추천 이유
나빈 작가의 그림 속 소재들은 전부 우리가 일상에서 쉽게 마주치지만 별로 신경 쓰지 않고 지나가게 되는 것들입니다. 베란다에 널려있는 빨래, 입안에 넣으면 살살 녹을 것 같은 케이크 조각, 테이블 위에 올려진 꽃송이 등 이러한 일상적인 소재들은 평범하지만, 기억과 추억의 재료가 되기도 합니다. 현대인들은 일상에 치여 살아가느라 창문 밖을 내다볼 틈도 없으며, 목적지를 향해 앞만 보고 가느라 주변의 삶과 사물을 돌아볼 여유조차 갖지 못합니다. 일상의 소중함과 아름다움을 들여다볼 여유가 없는 삶에 나빈 작가가 발견한 일상의 아름다움을 더해보는 건 어떨까요?
', '720x720', 50000, 98, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(1, '목란', 3, 'Spring Flowers', '현미경을 갖다 댄 듯 세밀한 묘사로 그려진 대상은 모두 생명을 가진 존재들이다. 남진숙 작가의 작품은 한 생명의 있는 그대로의 모습에 대한 치밀한 탐구로 이루어져있다. 그 탐구에 스민 절실함과 섬세함은 비단 대상을 그대로 재현하는 것에서 나타나는 것이 아니라 작품을 통해 드러난 작가의 시선을 통해 알 수 있다. 작가의 시선이 멈춘 누군가는 간절한 눈을 통해 돌처럼 굳어진 심정을 절절히 드러낸다. 누군가의 발자취가 남긴 그림자는 바닥의 보도 블록에서 튀어나와 몸 속을 흐르는 생명의 피처럼 순환하며 움직이는 살아있는 형태가 된다. 식물이 꽃을 피울 땐 주변의 모든 배경이 흐려지고 오직 여린 잎과 봉우리를 뚫고 고개를 내미는 꽃잎만이 남을 뿐이다. 이처럼 남진숙 작가는 살아있는 생명에 대한 깊을 고찰을 통해 삶이 의미를 갖게 되는 순간의 비밀을 드러낸다. 그것은 어떤 영원이나 저 멀리 이상의 세계에 있는 것이 아니라 생명이 그 순간을 살아가는 현재 바로 지금에 있는 것이다.
추천 이유
일상 속에서 우리는 작은 식물의 잎을 한없이 바라보는 경우가 아주 가끔씩 생깁니다. 그 순간 그 작은 잎에 미세한 솜털, 강한 줄기로부터 잎 끝까지 뻗어나간 잎맥이 있었음에 놀라게 됩니다. 그저 주변의 푸른 색의 일부분이었던 작은 잎이 지닌 선명함에 순간 압도당하기도 하지요. 이러한 시간은 우리가 무수히 지나쳐가는 삶의 순간순간에 대해 문득 깨닫게 합니다. 어제 오늘 내일 그저 시간의 흐름에 별일 없이 살던 나라는 존재 역시 이 작은 잎처럼 섬세하게 구성되고 강렬한 생명을 순간순간 뿜어내고 있습니다. 남진숙 작가는 살아있는 순간을 치열하게 담은 작품을 통해 살아있음 그 자체에 집중하는 시간을 갖게 합니다. 작품을 따라 작가의 시선으로 한 생명의 순간을 집중해서 보는 경험은 그 어떤 메시지보다도 우리의 삶을 생생하게 느끼고 나의 존재를 고찰하게 해주는 강한 울림을 갖고 있습니다. 남진숙 작가의 작품을 통해 살아있는 이 순간을 온전히 느껴보시기 바랍니다.
', '900x900', 85000, 99, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(2, '홍원', 3, 'Still Life with Decanter and Lemons on a Plate', '하나의 의식처럼 우리를 스쳐 지나가는 수많은 풍경과 사물은 사소해 보이지만 우리 삶의 생생한 순간을 보여준다. 작가는 일상 속에서 본인에게 감동을 주거나 반향을 일으키는 소재들을 작은 캔버스에 담았다고 말한다. 다른 사람은 크게 관심을 두지 않고 그냥 흘려보내는 것들이지만 누군가에게는 큰 기쁨을 줄 수 있고, 또 어떤 누군가에게는 세상 전부가 될 수도 있다. 특정한 주조색을 사용하여 그림을 조명에 비추면 파랑, 노랑, 보라 등의 색이 빛을 머금어 밝게 빛나고 엷게 칠한 유화물감이 특징적인데, 이렇게 캔버스에 재구성된 새로운 이미지는 감성을 자극하고, 매일 일어나는 사건의 소중한 기억을 돌아보게 하는 힘을 가지고 있다.
추천 이유
나빈 작가의 그림 속 소재들은 전부 우리가 일상에서 쉽게 마주치지만 별로 신경 쓰지 않고 지나가게 되는 것들입니다. 베란다에 널려있는 빨래, 입안에 넣으면 살살 녹을 것 같은 케이크 조각, 테이블 위에 올려진 꽃송이 등 이러한 일상적인 소재들은 평범하지만, 기억과 추억의 재료가 되기도 합니다. 현대인들은 일상에 치여 살아가느라 창문 밖을 내다볼 틈도 없으며, 목적지를 향해 앞만 보고 가느라 주변의 삶과 사물을 돌아볼 여유조차 갖지 못합니다. 일상의 소중함과 아름다움을 들여다볼 여유가 없는 삶에 나빈 작가가 발견한 일상의 아름다움을 더해보는 건 어떨까요?
', '600x900', 80000, 100, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(3, '향미', 3, 'Still Life with Lemons', '평범한 일상의 시간들이 지나면 추억이 되고 어느 날 우연치 않게 그 시간들을 되새기는 순간이 온다. 매일매일이 비슷해서 특별할 것 없다고 생각하는 시간들이 지나고 나면 소중해지는 순간처럼. 이혜진 작가는 반복되는 생활 속에서 스쳐 지나가는 풍경과 사물, 그리고 공간들을 감각하여 빗 바랜 추억을 곱씹는다. 과거의 기억이 현재의 순간을 만났을 때, 그녀의 작업은 여기서 시작된다. 이혜진 작가는 자신이 느끼고 발견한 섬세하고 감각적인 정서가 시간, 공간 그리고 기억을 재구성하여 새로운 이미지로 재구성한다. 종이와 연필 그리고 수묵 기법을 사용한 고즈넉한 그녀의 풍경들은 익숙하면서도 편안하고 정적이지만 동시에 다사로운 감각을 선사한다.
추천 이유
시간이 지남에도 늘 사랑받는 작품들, 즉 고전이라 일컬어지는 것들은 변치 않음이라기 보다는 다시 볼 때마다 새로운 기분을 주기 때문이 아닐까 합니다. 그렇게 느끼게 되는 연유는 아마 예전의 나와 지금의 내가 달라졌기 때문이겠죠. 불현듯 떠오르는 기억을 붙잡는 이혜진 작가의 작업은 마치, 새로운 나를 마주하게 하는 고전 이야기를 연상시킵니다. 시간이 지나면 증발하는 기억이 뜻밖의 순간에 마치 화학작용처럼 문득 떠오르는 것처럼 말입니다. 안온한 하면서도 신선함을 주는 이혜진 작가의 작품은 익숙하기 때문에 의식하지 못하고 있던 시간과 공간의 풍경을 예리하게 표현하는 일상을 돌이켜 생각해 보게 합니다. 여러분도 이혜진 작가의 작품을 통해 잊고 있던 기억을 또 다른 추억으로 떠올려보는 건 어떨까요?
', '900x900', 60000, 101, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(4, '도원', 3, 'Stilleben mit Äpfeln und Schneeball', '유화를 통해 작품 속 대상에 감정을 이입시키고 일상을 재해석하는 김병권 작가는 끈질기게 유화라는 외길을 고집한다. 작가가 보는 세상과 공감을 불러일으키는 감정이 유화라는 매체를 통해 가장 잘 전달된다고 생각하기 때문이다. 작가는 우리가 일상에서 무심코 지나치는 풍경과 대상을 물감의 질감을 살려 입체적으로 표현한다. 작가의 흔적과 물성이 가시화된 그의 작품에서는 오히려 형태는 흐려지고 기억과 감정이 두드러지게 발현되어, 작품을 통해 관람자들에게 자신의 경험을 떠올리게 하고 감정을 마주하게 한다.
추천 이유
김병권 작가의 작품은 현실의 풍경을 대상으로 하지만 왜곡된 형태와 물감의 물성이 드러난 표면으로 인해 초현실적인 분위기를 자아냅니다. 길거리, 가게 앞 등 일상적인 공간이지만 작가의 시각으로 재탄생하여 독특하고 고유의 의미를 가진 장소가 된 듯합니다. 물감의 흔적이 그대로 남아 있는 작품을 보면서 작가의 흔적을 느끼고, 환상적인 분위기를 내는 세련된 색감에서 현대적인 감각을 느낄 수 있습니다. 20세기 초에 탄생한 초현실주의 작품을 보듯 상상력을 자극하며 일상 풍경을 자기만의 시선으로 재해석해 의미를 찾아갈 수 있도록 하는 작품으로, 공간에 개성을 부여해 줄 것입니다.
', '600x900', 50000, 102, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(5, '난향', 3, 'The Blue Vase', '현미경을 갖다 댄 듯 세밀한 묘사로 그려진 대상은 모두 생명을 가진 존재들이다. 남진숙 작가의 작품은 한 생명의 있는 그대로의 모습에 대한 치밀한 탐구로 이루어져있다. 그 탐구에 스민 절실함과 섬세함은 비단 대상을 그대로 재현하는 것에서 나타나는 것이 아니라 작품을 통해 드러난 작가의 시선을 통해 알 수 있다. 작가의 시선이 멈춘 누군가는 간절한 눈을 통해 돌처럼 굳어진 심정을 절절히 드러낸다. 누군가의 발자취가 남긴 그림자는 바닥의 보도 블록에서 튀어나와 몸 속을 흐르는 생명의 피처럼 순환하며 움직이는 살아있는 형태가 된다. 식물이 꽃을 피울 땐 주변의 모든 배경이 흐려지고 오직 여린 잎과 봉우리를 뚫고 고개를 내미는 꽃잎만이 남을 뿐이다. 이처럼 남진숙 작가는 살아있는 생명에 대한 깊을 고찰을 통해 삶이 의미를 갖게 되는 순간의 비밀을 드러낸다. 그것은 어떤 영원이나 저 멀리 이상의 세계에 있는 것이 아니라 생명이 그 순간을 살아가는 현재 바로 지금에 있는 것이다.
추천 이유
일상 속에서 우리는 작은 식물의 잎을 한없이 바라보는 경우가 아주 가끔씩 생깁니다. 그 순간 그 작은 잎에 미세한 솜털, 강한 줄기로부터 잎 끝까지 뻗어나간 잎맥이 있었음에 놀라게 됩니다. 그저 주변의 푸른 색의 일부분이었던 작은 잎이 지닌 선명함에 순간 압도당하기도 하지요. 이러한 시간은 우리가 무수히 지나쳐가는 삶의 순간순간에 대해 문득 깨닫게 합니다. 어제 오늘 내일 그저 시간의 흐름에 별일 없이 살던 나라는 존재 역시 이 작은 잎처럼 섬세하게 구성되고 강렬한 생명을 순간순간 뿜어내고 있습니다. 남진숙 작가는 살아있는 순간을 치열하게 담은 작품을 통해 살아있음 그 자체에 집중하는 시간을 갖게 합니다. 작품을 따라 작가의 시선으로 한 생명의 순간을 집중해서 보는 경험은 그 어떤 메시지보다도 우리의 삶을 생생하게 느끼고 나의 존재를 고찰하게 해주는 강한 울림을 갖고 있습니다. 남진숙 작가의 작품을 통해 살아있는 이 순간을 온전히 느껴보시기 바랍니다.
', '1200x1200', 30000, 103, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(6, '열빈', 3, 'The Buffet', '작가는 도시 생활의 안식처를 찾아 자연으로 여행을 떠나서 마주쳤던 풍경을 그린다. 감탄을 자아내는 광대한 풍경, 잠깐 스쳐지나가면서 보는 익숙하고 편안한 풍경, 낯설거나 이국적이고 몽환적인 풍경 등 여행과 등산을 하며 마주치는 수많은 존재와 풍경들은 작가의 경험과 느낌을 토대로 새로운 풍경으로 재탄생한다. 작가는 자신이 풍경을 그리면서 갈증을 해소하고 휴식을 상상하듯이 감상자 역시 작가의 작품을 통해 편안하게 휴식하기를 바란다고 한다. 한지에 먹으로 채색하는 지극히 한국적인 방식으로 그려졌지만 현대적인 감각으로 그려져 동서양의 경계를 넘어 자연을 향한 향수를 자극하는 작품이다.
추천 이유
도시가 주는 편리함은 너무 매력적이지만 정신없이 바쁜 생활에서 공허감을 느끼고, 반복되는 일상에서 권태와 우울을 느끼기도 합니다. 그래서 많은 사람이 자연을 느낄 수 있는 곳으로 여행을 떠나고 싶어 합니다. 하지만 해야 할 일을 뒤로하고 어딘가로 훌쩍 떠난다는 게 말처럼 쉬운 일이 아니기에, 권소영 작가의 손에서 멋지게 재탄생한 자연 풍경을 즐겨보기를 추천합니다. 무채색으로 그려진 작가의 풍경화는 안락한 자연과 이상적인 경관을 보여주어 이상향에 한 걸음 다가가는 것 같은 기분이 들고, 마음이 차분히 가라앉고 평온해지는 것을 경험할 수 있을 것입니다. 감성을 자극하는 현대적인 수묵산수화로 일상의 지루함을 달래보세요.
', '600x900', 35000, 104, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(7, '태원', 3, 'The Copper Drinking Fountain', '하나의 의식처럼 우리를 스쳐 지나가는 수많은 풍경과 사물은 사소해 보이지만 우리 삶의 생생한 순간을 보여준다. 작가는 일상 속에서 본인에게 감동을 주거나 반향을 일으키는 소재들을 작은 캔버스에 담았다고 말한다. 다른 사람은 크게 관심을 두지 않고 그냥 흘려보내는 것들이지만 누군가에게는 큰 기쁨을 줄 수 있고, 또 어떤 누군가에게는 세상 전부가 될 수도 있다. 특정한 주조색을 사용하여 그림을 조명에 비추면 파랑, 노랑, 보라 등의 색이 빛을 머금어 밝게 빛나고 엷게 칠한 유화물감이 특징적인데, 이렇게 캔버스에 재구성된 새로운 이미지는 감성을 자극하고, 매일 일어나는 사건의 소중한 기억을 돌아보게 하는 힘을 가지고 있다.
추천 이유
나빈 작가의 그림 속 소재들은 전부 우리가 일상에서 쉽게 마주치지만 별로 신경 쓰지 않고 지나가게 되는 것들입니다. 베란다에 널려있는 빨래, 입안에 넣으면 살살 녹을 것 같은 케이크 조각, 테이블 위에 올려진 꽃송이 등 이러한 일상적인 소재들은 평범하지만, 기억과 추억의 재료가 되기도 합니다. 현대인들은 일상에 치여 살아가느라 창문 밖을 내다볼 틈도 없으며, 목적지를 향해 앞만 보고 가느라 주변의 삶과 사물을 돌아볼 여유조차 갖지 못합니다. 일상의 소중함과 아름다움을 들여다볼 여유가 없는 삶에 나빈 작가가 발견한 일상의 아름다움을 더해보는 건 어떨까요?
', '600x900', 45000, 105, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(1, '목란', 3, 'untitle', '하나의 의식처럼 우리를 스쳐 지나가는 수많은 풍경과 사물은 사소해 보이지만 우리 삶의 생생한 순간을 보여준다. 작가는 일상 속에서 본인에게 감동을 주거나 반향을 일으키는 소재들을 작은 캔버스에 담았다고 말한다. 다른 사람은 크게 관심을 두지 않고 그냥 흘려보내는 것들이지만 누군가에게는 큰 기쁨을 줄 수 있고, 또 어떤 누군가에게는 세상 전부가 될 수도 있다. 특정한 주조색을 사용하여 그림을 조명에 비추면 파랑, 노랑, 보라 등의 색이 빛을 머금어 밝게 빛나고 엷게 칠한 유화물감이 특징적인데, 이렇게 캔버스에 재구성된 새로운 이미지는 감성을 자극하고, 매일 일어나는 사건의 소중한 기억을 돌아보게 하는 힘을 가지고 있다.
추천 이유
나빈 작가의 그림 속 소재들은 전부 우리가 일상에서 쉽게 마주치지만 별로 신경 쓰지 않고 지나가게 되는 것들입니다. 베란다에 널려있는 빨래, 입안에 넣으면 살살 녹을 것 같은 케이크 조각, 테이블 위에 올려진 꽃송이 등 이러한 일상적인 소재들은 평범하지만, 기억과 추억의 재료가 되기도 합니다. 현대인들은 일상에 치여 살아가느라 창문 밖을 내다볼 틈도 없으며, 목적지를 향해 앞만 보고 가느라 주변의 삶과 사물을 돌아볼 여유조차 갖지 못합니다. 일상의 소중함과 아름다움을 들여다볼 여유가 없는 삶에 나빈 작가가 발견한 일상의 아름다움을 더해보는 건 어떨까요?
', '1000x1000', 50000, 106, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(2, '홍원', 3, 'Vase of Flowers', '나는 유년기의 어려웠던 기억들을 재해석함으로써 현대 사회 속에서 타인으로부터 상처받거나 소외감을 느끼며 살아가는 우리에게 자신을 돌아보고 위로하는 기회를 주는 그림을 그리고 싶다. 이인영 작가는 말한다. 그는 시장에서 하루 종일 야채장사를 하셨던 어머니와 계속된 사업의 실패로 술에 삶을 의지하셨던 아버지를 떠올리며 자신의 가난하고 불우했던 어린 시절을 고백한다. 유년기의 성장통과 불안, 욕망 등 내면의 다양한 감정들을 시각적 언어로 표현하는 그의 작업을 통해 자신의 어두운 감정을 마주할 수 있는 용기를 얻게 된다. 아픔을 마주하는 용기, 그것을 통해 우리는 비로소 자신을 모습을 바라볼 수 있고 성장할 수 있을 것이다.
추천 이유
지하철이나 버스 안에서 사람들을 보고 있으면 스마트폰을 한 손에 쥐고 눈을 그곳에서 떼지 못하고 있습니다. 사람들은 무언가를 상상하거나 생각하기보다 계속해서 어떠한 자료와 정보를 공유 받기를 원하고 있는 것 같습니다. 마치 무언가에 중독된 것처럼 말이죠. 하지만 공상의 시간은 과부화 된 뇌를 쉬게 하고 에너지를 충전하기에 꼭 필요한 시간입니다. 이인영 작가 또한 인생의 절망적인 시기를 공상을 통해 견뎌낼 수 있었다고 합니다. 거친 붓 터치와 깊은 색감으로 그려진 이 작품은 마치 누군가의 꿈속에 들어온 듯한 분위기를 연출하고, 강렬한 느낌을 자아냅니다. 참신한 아이디어가 필요한 곳에 어울리는 곳에 어울리는 작품을 찾고 있는 당신이라면 이 작품을 추천해드립니다. 공상의 세계로 당신을 안내해줄 것입니다
', '800x800', 30000, 107, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(3, '향미', 3, 'White Azaleas in a Pot', '현미경을 갖다 댄 듯 세밀한 묘사로 그려진 대상은 모두 생명을 가진 존재들이다. 남진숙 작가의 작품은 한 생명의 있는 그대로의 모습에 대한 치밀한 탐구로 이루어져있다. 그 탐구에 스민 절실함과 섬세함은 비단 대상을 그대로 재현하는 것에서 나타나는 것이 아니라 작품을 통해 드러난 작가의 시선을 통해 알 수 있다. 작가의 시선이 멈춘 누군가는 간절한 눈을 통해 돌처럼 굳어진 심정을 절절히 드러낸다. 누군가의 발자취가 남긴 그림자는 바닥의 보도 블록에서 튀어나와 몸 속을 흐르는 생명의 피처럼 순환하며 움직이는 살아있는 형태가 된다. 식물이 꽃을 피울 땐 주변의 모든 배경이 흐려지고 오직 여린 잎과 봉우리를 뚫고 고개를 내미는 꽃잎만이 남을 뿐이다. 이처럼 남진숙 작가는 살아있는 생명에 대한 깊을 고찰을 통해 삶이 의미를 갖게 되는 순간의 비밀을 드러낸다. 그것은 어떤 영원이나 저 멀리 이상의 세계에 있는 것이 아니라 생명이 그 순간을 살아가는 현재 바로 지금에 있는 것이다.
추천 이유
일상 속에서 우리는 작은 식물의 잎을 한없이 바라보는 경우가 아주 가끔씩 생깁니다. 그 순간 그 작은 잎에 미세한 솜털, 강한 줄기로부터 잎 끝까지 뻗어나간 잎맥이 있었음에 놀라게 됩니다. 그저 주변의 푸른 색의 일부분이었던 작은 잎이 지닌 선명함에 순간 압도당하기도 하지요. 이러한 시간은 우리가 무수히 지나쳐가는 삶의 순간순간에 대해 문득 깨닫게 합니다. 어제 오늘 내일 그저 시간의 흐름에 별일 없이 살던 나라는 존재 역시 이 작은 잎처럼 섬세하게 구성되고 강렬한 생명을 순간순간 뿜어내고 있습니다. 남진숙 작가는 살아있는 순간을 치열하게 담은 작품을 통해 살아있음 그 자체에 집중하는 시간을 갖게 합니다. 작품을 따라 작가의 시선으로 한 생명의 순간을 집중해서 보는 경험은 그 어떤 메시지보다도 우리의 삶을 생생하게 느끼고 나의 존재를 고찰하게 해주는 강한 울림을 갖고 있습니다. 남진숙 작가의 작품을 통해 살아있는 이 순간을 온전히 느껴보시기 바랍니다.
', '1200x900', 90000, 108, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(4, '도원', 3, '고양이와 어항', '유화를 통해 작품 속 대상에 감정을 이입시키고 일상을 재해석하는 김병권 작가는 끈질기게 유화라는 외길을 고집한다. 작가가 보는 세상과 공감을 불러일으키는 감정이 유화라는 매체를 통해 가장 잘 전달된다고 생각하기 때문이다. 작가는 우리가 일상에서 무심코 지나치는 풍경과 대상을 물감의 질감을 살려 입체적으로 표현한다. 작가의 흔적과 물성이 가시화된 그의 작품에서는 오히려 형태는 흐려지고 기억과 감정이 두드러지게 발현되어, 작품을 통해 관람자들에게 자신의 경험을 떠올리게 하고 감정을 마주하게 한다.
추천 이유
김병권 작가의 작품은 현실의 풍경을 대상으로 하지만 왜곡된 형태와 물감의 물성이 드러난 표면으로 인해 초현실적인 분위기를 자아냅니다. 길거리, 가게 앞 등 일상적인 공간이지만 작가의 시각으로 재탄생하여 독특하고 고유의 의미를 가진 장소가 된 듯합니다. 물감의 흔적이 그대로 남아 있는 작품을 보면서 작가의 흔적을 느끼고, 환상적인 분위기를 내는 세련된 색감에서 현대적인 감각을 느낄 수 있습니다. 20세기 초에 탄생한 초현실주의 작품을 보듯 상상력을 자극하며 일상 풍경을 자기만의 시선으로 재해석해 의미를 찾아갈 수 있도록 하는 작품으로, 공간에 개성을 부여해 줄 것입니다.
', '1200x800', 30000, 109, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(5, '난향', 3, '과일정물', '하나의 의식처럼 우리를 스쳐 지나가는 수많은 풍경과 사물은 사소해 보이지만 우리 삶의 생생한 순간을 보여준다. 작가는 일상 속에서 본인에게 감동을 주거나 반향을 일으키는 소재들을 작은 캔버스에 담았다고 말한다. 다른 사람은 크게 관심을 두지 않고 그냥 흘려보내는 것들이지만 누군가에게는 큰 기쁨을 줄 수 있고, 또 어떤 누군가에게는 세상 전부가 될 수도 있다. 특정한 주조색을 사용하여 그림을 조명에 비추면 파랑, 노랑, 보라 등의 색이 빛을 머금어 밝게 빛나고 엷게 칠한 유화물감이 특징적인데, 이렇게 캔버스에 재구성된 새로운 이미지는 감성을 자극하고, 매일 일어나는 사건의 소중한 기억을 돌아보게 하는 힘을 가지고 있다.
추천 이유
나빈 작가의 그림 속 소재들은 전부 우리가 일상에서 쉽게 마주치지만 별로 신경 쓰지 않고 지나가게 되는 것들입니다. 베란다에 널려있는 빨래, 입안에 넣으면 살살 녹을 것 같은 케이크 조각, 테이블 위에 올려진 꽃송이 등 이러한 일상적인 소재들은 평범하지만, 기억과 추억의 재료가 되기도 합니다. 현대인들은 일상에 치여 살아가느라 창문 밖을 내다볼 틈도 없으며, 목적지를 향해 앞만 보고 가느라 주변의 삶과 사물을 돌아볼 여유조차 갖지 못합니다. 일상의 소중함과 아름다움을 들여다볼 여유가 없는 삶에 나빈 작가가 발견한 일상의 아름다움을 더해보는 건 어떨까요?
', '1500x600', 30000, 110, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(6, '열빈', 3, '금붕어', '작가는 도시 생활의 안식처를 찾아 자연으로 여행을 떠나서 마주쳤던 풍경을 그린다. 감탄을 자아내는 광대한 풍경, 잠깐 스쳐지나가면서 보는 익숙하고 편안한 풍경, 낯설거나 이국적이고 몽환적인 풍경 등 여행과 등산을 하며 마주치는 수많은 존재와 풍경들은 작가의 경험과 느낌을 토대로 새로운 풍경으로 재탄생한다. 작가는 자신이 풍경을 그리면서 갈증을 해소하고 휴식을 상상하듯이 감상자 역시 작가의 작품을 통해 편안하게 휴식하기를 바란다고 한다. 한지에 먹으로 채색하는 지극히 한국적인 방식으로 그려졌지만 현대적인 감각으로 그려져 동서양의 경계를 넘어 자연을 향한 향수를 자극하는 작품이다.
추천 이유
도시가 주는 편리함은 너무 매력적이지만 정신없이 바쁜 생활에서 공허감을 느끼고, 반복되는 일상에서 권태와 우울을 느끼기도 합니다. 그래서 많은 사람이 자연을 느낄 수 있는 곳으로 여행을 떠나고 싶어 합니다. 하지만 해야 할 일을 뒤로하고 어딘가로 훌쩍 떠난다는 게 말처럼 쉬운 일이 아니기에, 권소영 작가의 손에서 멋지게 재탄생한 자연 풍경을 즐겨보기를 추천합니다. 무채색으로 그려진 작가의 풍경화는 안락한 자연과 이상적인 경관을 보여주어 이상향에 한 걸음 다가가는 것 같은 기분이 들고, 마음이 차분히 가라앉고 평온해지는 것을 경험할 수 있을 것입니다. 감성을 자극하는 현대적인 수묵산수화로 일상의 지루함을 달래보세요.
', '600x900', 130000, 111, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(7, '태원', 3, '금붕어가 있는 정물', '하나의 의식처럼 우리를 스쳐 지나가는 수많은 풍경과 사물은 사소해 보이지만 우리 삶의 생생한 순간을 보여준다. 작가는 일상 속에서 본인에게 감동을 주거나 반향을 일으키는 소재들을 작은 캔버스에 담았다고 말한다. 다른 사람은 크게 관심을 두지 않고 그냥 흘려보내는 것들이지만 누군가에게는 큰 기쁨을 줄 수 있고, 또 어떤 누군가에게는 세상 전부가 될 수도 있다. 특정한 주조색을 사용하여 그림을 조명에 비추면 파랑, 노랑, 보라 등의 색이 빛을 머금어 밝게 빛나고 엷게 칠한 유화물감이 특징적인데, 이렇게 캔버스에 재구성된 새로운 이미지는 감성을 자극하고, 매일 일어나는 사건의 소중한 기억을 돌아보게 하는 힘을 가지고 있다.
추천 이유
나빈 작가의 그림 속 소재들은 전부 우리가 일상에서 쉽게 마주치지만 별로 신경 쓰지 않고 지나가게 되는 것들입니다. 베란다에 널려있는 빨래, 입안에 넣으면 살살 녹을 것 같은 케이크 조각, 테이블 위에 올려진 꽃송이 등 이러한 일상적인 소재들은 평범하지만, 기억과 추억의 재료가 되기도 합니다. 현대인들은 일상에 치여 살아가느라 창문 밖을 내다볼 틈도 없으며, 목적지를 향해 앞만 보고 가느라 주변의 삶과 사물을 돌아볼 여유조차 갖지 못합니다. 일상의 소중함과 아름다움을 들여다볼 여유가 없는 삶에 나빈 작가가 발견한 일상의 아름다움을 더해보는 건 어떨까요?
', '600x900', 120000, 112, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(1, '목란', 3, '유리물병과 과일이 있는 정물', '평범한 일상의 시간들이 지나면 추억이 되고 어느 날 우연치 않게 그 시간들을 되새기는 순간이 온다. 매일매일이 비슷해서 특별할 것 없다고 생각하는 시간들이 지나고 나면 소중해지는 순간처럼. 이혜진 작가는 반복되는 생활 속에서 스쳐 지나가는 풍경과 사물, 그리고 공간들을 감각하여 빗 바랜 추억을 곱씹는다. 과거의 기억이 현재의 순간을 만났을 때, 그녀의 작업은 여기서 시작된다. 이혜진 작가는 자신이 느끼고 발견한 섬세하고 감각적인 정서가 시간, 공간 그리고 기억을 재구성하여 새로운 이미지로 재구성한다. 종이와 연필 그리고 수묵 기법을 사용한 고즈넉한 그녀의 풍경들은 익숙하면서도 편안하고 정적이지만 동시에 다사로운 감각을 선사한다.
추천 이유
시간이 지남에도 늘 사랑받는 작품들, 즉 고전이라 일컬어지는 것들은 변치 않음이라기 보다는 다시 볼 때마다 새로운 기분을 주기 때문이 아닐까 합니다. 그렇게 느끼게 되는 연유는 아마 예전의 나와 지금의 내가 달라졌기 때문이겠죠. 불현듯 떠오르는 기억을 붙잡는 이혜진 작가의 작업은 마치, 새로운 나를 마주하게 하는 고전 이야기를 연상시킵니다. 시간이 지나면 증발하는 기억이 뜻밖의 순간에 마치 화학작용처럼 문득 떠오르는 것처럼 말입니다. 안온한 하면서도 신선함을 주는 이혜진 작가의 작품은 익숙하기 때문에 의식하지 못하고 있던 시간과 공간의 풍경을 예리하게 표현하는 일상을 돌이켜 생각해 보게 합니다. 여러분도 이혜진 작가의 작품을 통해 잊고 있던 기억을 또 다른 추억으로 떠올려보는 건 어떨까요?
', '600x900', 80000, 113, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(2, '홍원', 3, '의자', '하나의 의식처럼 우리를 스쳐 지나가는 수많은 풍경과 사물은 사소해 보이지만 우리 삶의 생생한 순간을 보여준다. 작가는 일상 속에서 본인에게 감동을 주거나 반향을 일으키는 소재들을 작은 캔버스에 담았다고 말한다. 다른 사람은 크게 관심을 두지 않고 그냥 흘려보내는 것들이지만 누군가에게는 큰 기쁨을 줄 수 있고, 또 어떤 누군가에게는 세상 전부가 될 수도 있다. 특정한 주조색을 사용하여 그림을 조명에 비추면 파랑, 노랑, 보라 등의 색이 빛을 머금어 밝게 빛나고 엷게 칠한 유화물감이 특징적인데, 이렇게 캔버스에 재구성된 새로운 이미지는 감성을 자극하고, 매일 일어나는 사건의 소중한 기억을 돌아보게 하는 힘을 가지고 있다.
추천 이유
나빈 작가의 그림 속 소재들은 전부 우리가 일상에서 쉽게 마주치지만 별로 신경 쓰지 않고 지나가게 되는 것들입니다. 베란다에 널려있는 빨래, 입안에 넣으면 살살 녹을 것 같은 케이크 조각, 테이블 위에 올려진 꽃송이 등 이러한 일상적인 소재들은 평범하지만, 기억과 추억의 재료가 되기도 합니다. 현대인들은 일상에 치여 살아가느라 창문 밖을 내다볼 틈도 없으며, 목적지를 향해 앞만 보고 가느라 주변의 삶과 사물을 돌아볼 여유조차 갖지 못합니다. 일상의 소중함과 아름다움을 들여다볼 여유가 없는 삶에 나빈 작가가 발견한 일상의 아름다움을 더해보는 건 어떨까요?
', '600x900', 33000, 114, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(3, '향미', 3, '자고새와 철갑용 장갑', '나는 유년기의 어려웠던 기억들을 재해석함으로써 현대 사회 속에서 타인으로부터 상처받거나 소외감을 느끼며 살아가는 우리에게 자신을 돌아보고 위로하는 기회를 주는 그림을 그리고 싶다. 이인영 작가는 말한다. 그는 시장에서 하루 종일 야채장사를 하셨던 어머니와 계속된 사업의 실패로 술에 삶을 의지하셨던 아버지를 떠올리며 자신의 가난하고 불우했던 어린 시절을 고백한다. 유년기의 성장통과 불안, 욕망 등 내면의 다양한 감정들을 시각적 언어로 표현하는 그의 작업을 통해 자신의 어두운 감정을 마주할 수 있는 용기를 얻게 된다. 아픔을 마주하는 용기, 그것을 통해 우리는 비로소 자신을 모습을 바라볼 수 있고 성장할 수 있을 것이다.
추천 이유
지하철이나 버스 안에서 사람들을 보고 있으면 스마트폰을 한 손에 쥐고 눈을 그곳에서 떼지 못하고 있습니다. 사람들은 무언가를 상상하거나 생각하기보다 계속해서 어떠한 자료와 정보를 공유 받기를 원하고 있는 것 같습니다. 마치 무언가에 중독된 것처럼 말이죠. 하지만 공상의 시간은 과부화 된 뇌를 쉬게 하고 에너지를 충전하기에 꼭 필요한 시간입니다. 이인영 작가 또한 인생의 절망적인 시기를 공상을 통해 견뎌낼 수 있었다고 합니다. 거친 붓 터치와 깊은 색감으로 그려진 이 작품은 마치 누군가의 꿈속에 들어온 듯한 분위기를 연출하고, 강렬한 느낌을 자아냅니다. 참신한 아이디어가 필요한 곳에 어울리는 곳에 어울리는 작품을 찾고 있는 당신이라면 이 작품을 추천해드립니다. 공상의 세계로 당신을 안내해줄 것입니다
', '900x450', 55000, 115, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(4, '도원', 3, '푸른창문', '하나의 의식처럼 우리를 스쳐 지나가는 수많은 풍경과 사물은 사소해 보이지만 우리 삶의 생생한 순간을 보여준다. 작가는 일상 속에서 본인에게 감동을 주거나 반향을 일으키는 소재들을 작은 캔버스에 담았다고 말한다. 다른 사람은 크게 관심을 두지 않고 그냥 흘려보내는 것들이지만 누군가에게는 큰 기쁨을 줄 수 있고, 또 어떤 누군가에게는 세상 전부가 될 수도 있다. 특정한 주조색을 사용하여 그림을 조명에 비추면 파랑, 노랑, 보라 등의 색이 빛을 머금어 밝게 빛나고 엷게 칠한 유화물감이 특징적인데, 이렇게 캔버스에 재구성된 새로운 이미지는 감성을 자극하고, 매일 일어나는 사건의 소중한 기억을 돌아보게 하는 힘을 가지고 있다.
추천 이유
나빈 작가의 그림 속 소재들은 전부 우리가 일상에서 쉽게 마주치지만 별로 신경 쓰지 않고 지나가게 되는 것들입니다. 베란다에 널려있는 빨래, 입안에 넣으면 살살 녹을 것 같은 케이크 조각, 테이블 위에 올려진 꽃송이 등 이러한 일상적인 소재들은 평범하지만, 기억과 추억의 재료가 되기도 합니다. 현대인들은 일상에 치여 살아가느라 창문 밖을 내다볼 틈도 없으며, 목적지를 향해 앞만 보고 가느라 주변의 삶과 사물을 돌아볼 여유조차 갖지 못합니다. 일상의 소중함과 아름다움을 들여다볼 여유가 없는 삶에 나빈 작가가 발견한 일상의 아름다움을 더해보는 건 어떨까요?
', '1200x800', 30000, 116, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(5, '난향', 3, '푸른탁자가있는 정물', '현미경을 갖다 댄 듯 세밀한 묘사로 그려진 대상은 모두 생명을 가진 존재들이다. 남진숙 작가의 작품은 한 생명의 있는 그대로의 모습에 대한 치밀한 탐구로 이루어져있다. 그 탐구에 스민 절실함과 섬세함은 비단 대상을 그대로 재현하는 것에서 나타나는 것이 아니라 작품을 통해 드러난 작가의 시선을 통해 알 수 있다. 작가의 시선이 멈춘 누군가는 간절한 눈을 통해 돌처럼 굳어진 심정을 절절히 드러낸다. 누군가의 발자취가 남긴 그림자는 바닥의 보도 블록에서 튀어나와 몸 속을 흐르는 생명의 피처럼 순환하며 움직이는 살아있는 형태가 된다. 식물이 꽃을 피울 땐 주변의 모든 배경이 흐려지고 오직 여린 잎과 봉우리를 뚫고 고개를 내미는 꽃잎만이 남을 뿐이다. 이처럼 남진숙 작가는 살아있는 생명에 대한 깊을 고찰을 통해 삶이 의미를 갖게 되는 순간의 비밀을 드러낸다. 그것은 어떤 영원이나 저 멀리 이상의 세계에 있는 것이 아니라 생명이 그 순간을 살아가는 현재 바로 지금에 있는 것이다.
추천 이유
일상 속에서 우리는 작은 식물의 잎을 한없이 바라보는 경우가 아주 가끔씩 생깁니다. 그 순간 그 작은 잎에 미세한 솜털, 강한 줄기로부터 잎 끝까지 뻗어나간 잎맥이 있었음에 놀라게 됩니다. 그저 주변의 푸른 색의 일부분이었던 작은 잎이 지닌 선명함에 순간 압도당하기도 하지요. 이러한 시간은 우리가 무수히 지나쳐가는 삶의 순간순간에 대해 문득 깨닫게 합니다. 어제 오늘 내일 그저 시간의 흐름에 별일 없이 살던 나라는 존재 역시 이 작은 잎처럼 섬세하게 구성되고 강렬한 생명을 순간순간 뿜어내고 있습니다. 남진숙 작가는 살아있는 순간을 치열하게 담은 작품을 통해 살아있음 그 자체에 집중하는 시간을 갖게 합니다. 작품을 따라 작가의 시선으로 한 생명의 순간을 집중해서 보는 경험은 그 어떤 메시지보다도 우리의 삶을 생생하게 느끼고 나의 존재를 고찰하게 해주는 강한 울림을 갖고 있습니다. 남진숙 작가의 작품을 통해 살아있는 이 순간을 온전히 느껴보시기 바랍니다.
', '600x900', 50000, 117, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(6, '열빈', 3, '푸토가있는정물', '유화를 통해 작품 속 대상에 감정을 이입시키고 일상을 재해석하는 김병권 작가는 끈질기게 유화라는 외길을 고집한다. 작가가 보는 세상과 공감을 불러일으키는 감정이 유화라는 매체를 통해 가장 잘 전달된다고 생각하기 때문이다. 작가는 우리가 일상에서 무심코 지나치는 풍경과 대상을 물감의 질감을 살려 입체적으로 표현한다. 작가의 흔적과 물성이 가시화된 그의 작품에서는 오히려 형태는 흐려지고 기억과 감정이 두드러지게 발현되어, 작품을 통해 관람자들에게 자신의 경험을 떠올리게 하고 감정을 마주하게 한다.
추천 이유
김병권 작가의 작품은 현실의 풍경을 대상으로 하지만 왜곡된 형태와 물감의 물성이 드러난 표면으로 인해 초현실적인 분위기를 자아냅니다. 길거리, 가게 앞 등 일상적인 공간이지만 작가의 시각으로 재탄생하여 독특하고 고유의 의미를 가진 장소가 된 듯합니다. 물감의 흔적이 그대로 남아 있는 작품을 보면서 작가의 흔적을 느끼고, 환상적인 분위기를 내는 세련된 색감에서 현대적인 감각을 느낄 수 있습니다. 20세기 초에 탄생한 초현실주의 작품을 보듯 상상력을 자극하며 일상 풍경을 자기만의 시선으로 재해석해 의미를 찾아갈 수 있도록 하는 작품으로, 공간에 개성을 부여해 줄 것입니다.
', '900x600', 30000, 118, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(7, '태원', 3, '피카소 : Flowers on the Table', '하나의 의식처럼 우리를 스쳐 지나가는 수많은 풍경과 사물은 사소해 보이지만 우리 삶의 생생한 순간을 보여준다. 작가는 일상 속에서 본인에게 감동을 주거나 반향을 일으키는 소재들을 작은 캔버스에 담았다고 말한다. 다른 사람은 크게 관심을 두지 않고 그냥 흘려보내는 것들이지만 누군가에게는 큰 기쁨을 줄 수 있고, 또 어떤 누군가에게는 세상 전부가 될 수도 있다. 특정한 주조색을 사용하여 그림을 조명에 비추면 파랑, 노랑, 보라 등의 색이 빛을 머금어 밝게 빛나고 엷게 칠한 유화물감이 특징적인데, 이렇게 캔버스에 재구성된 새로운 이미지는 감성을 자극하고, 매일 일어나는 사건의 소중한 기억을 돌아보게 하는 힘을 가지고 있다.
추천 이유
나빈 작가의 그림 속 소재들은 전부 우리가 일상에서 쉽게 마주치지만 별로 신경 쓰지 않고 지나가게 되는 것들입니다. 베란다에 널려있는 빨래, 입안에 넣으면 살살 녹을 것 같은 케이크 조각, 테이블 위에 올려진 꽃송이 등 이러한 일상적인 소재들은 평범하지만, 기억과 추억의 재료가 되기도 합니다. 현대인들은 일상에 치여 살아가느라 창문 밖을 내다볼 틈도 없으며, 목적지를 향해 앞만 보고 가느라 주변의 삶과 사물을 돌아볼 여유조차 갖지 못합니다. 일상의 소중함과 아름다움을 들여다볼 여유가 없는 삶에 나빈 작가가 발견한 일상의 아름다움을 더해보는 건 어떨까요?
', '450x450', 40000, 119, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(1, '목란', 1, 'Bauhaus Stairway', '현미경을 갖다 댄 듯 세밀한 묘사로 그려진 대상은 모두 생명을 가진 존재들이다. 남진숙 작가의 작품은 한 생명의 있는 그대로의 모습에 대한 치밀한 탐구로 이루어져있다. 그 탐구에 스민 절실함과 섬세함은 비단 대상을 그대로 재현하는 것에서 나타나는 것이 아니라 작품을 통해 드러난 작가의 시선을 통해 알 수 있다. 작가의 시선이 멈춘 누군가는 간절한 눈을 통해 돌처럼 굳어진 심정을 절절히 드러낸다. 누군가의 발자취가 남긴 그림자는 바닥의 보도 블록에서 튀어나와 몸 속을 흐르는 생명의 피처럼 순환하며 움직이는 살아있는 형태가 된다. 식물이 꽃을 피울 땐 주변의 모든 배경이 흐려지고 오직 여린 잎과 봉우리를 뚫고 고개를 내미는 꽃잎만이 남을 뿐이다. 이처럼 남진숙 작가는 살아있는 생명에 대한 깊을 고찰을 통해 삶이 의미를 갖게 되는 순간의 비밀을 드러낸다. 그것은 어떤 영원이나 저 멀리 이상의 세계에 있는 것이 아니라 생명이 그 순간을 살아가는 현재 바로 지금에 있는 것이다.
추천 이유
일상 속에서 우리는 작은 식물의 잎을 한없이 바라보는 경우가 아주 가끔씩 생깁니다. 그 순간 그 작은 잎에 미세한 솜털, 강한 줄기로부터 잎 끝까지 뻗어나간 잎맥이 있었음에 놀라게 됩니다. 그저 주변의 푸른 색의 일부분이었던 작은 잎이 지닌 선명함에 순간 압도당하기도 하지요. 이러한 시간은 우리가 무수히 지나쳐가는 삶의 순간순간에 대해 문득 깨닫게 합니다. 어제 오늘 내일 그저 시간의 흐름에 별일 없이 살던 나라는 존재 역시 이 작은 잎처럼 섬세하게 구성되고 강렬한 생명을 순간순간 뿜어내고 있습니다. 남진숙 작가는 살아있는 순간을 치열하게 담은 작품을 통해 살아있음 그 자체에 집중하는 시간을 갖게 합니다. 작품을 따라 작가의 시선으로 한 생명의 순간을 집중해서 보는 경험은 그 어떤 메시지보다도 우리의 삶을 생생하게 느끼고 나의 존재를 고찰하게 해주는 강한 울림을 갖고 있습니다. 남진숙 작가의 작품을 통해 살아있는 이 순간을 온전히 느껴보시기 바랍니다.
', '850x550', 45000, 120, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(2, '홍원', 1, 'Dr. Waldmann from Expressionist Woodcuts', '하나의 의식처럼 우리를 스쳐 지나가는 수많은 풍경과 사물은 사소해 보이지만 우리 삶의 생생한 순간을 보여준다. 작가는 일상 속에서 본인에게 감동을 주거나 반향을 일으키는 소재들을 작은 캔버스에 담았다고 말한다. 다른 사람은 크게 관심을 두지 않고 그냥 흘려보내는 것들이지만 누군가에게는 큰 기쁨을 줄 수 있고, 또 어떤 누군가에게는 세상 전부가 될 수도 있다. 특정한 주조색을 사용하여 그림을 조명에 비추면 파랑, 노랑, 보라 등의 색이 빛을 머금어 밝게 빛나고 엷게 칠한 유화물감이 특징적인데, 이렇게 캔버스에 재구성된 새로운 이미지는 감성을 자극하고, 매일 일어나는 사건의 소중한 기억을 돌아보게 하는 힘을 가지고 있다.
추천 이유
나빈 작가의 그림 속 소재들은 전부 우리가 일상에서 쉽게 마주치지만 별로 신경 쓰지 않고 지나가게 되는 것들입니다. 베란다에 널려있는 빨래, 입안에 넣으면 살살 녹을 것 같은 케이크 조각, 테이블 위에 올려진 꽃송이 등 이러한 일상적인 소재들은 평범하지만, 기억과 추억의 재료가 되기도 합니다. 현대인들은 일상에 치여 살아가느라 창문 밖을 내다볼 틈도 없으며, 목적지를 향해 앞만 보고 가느라 주변의 삶과 사물을 돌아볼 여유조차 갖지 못합니다. 일상의 소중함과 아름다움을 들여다볼 여유가 없는 삶에 나빈 작가가 발견한 일상의 아름다움을 더해보는 건 어떨까요?
', '600x900', 45000, 121, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(3, '향미', 1, 'volume II', '창가에 가만히 놓인 장식물과 창밖으로 비치는 도시의 풍경이 보인다. 이토록 일상적이고 소박한 풍경이 또 있을까? 그래서인지 류채민 작가의 그림은 보는 이에게 아주 익숙하고 편안하게 다가온다. 전경에 보이는 장식물도 뒤편으로 보이는 건물들도 새롭거나 유별나지 않다. 그럼에도 불구하고 작품이 특별하다고 말할 수 있는 이유는 풍경과 오브제에 깃든 인간적인 따뜻함 덕분일 것이다. 어떤 심오한 의미나 철학을 담으려 하기보다는 일상적인 풍경을 다시 소재로 삼아 생명을 불어넣기를 원한 작가의 애정 어린 시선이 고스란히 담겨 있다. 작품 전체를 감싸고 있는 채도 낮은 색감은 아련함과 온기를 배가한다.
추천 이유
일상에서 보기 어려운 생경한 풍경을 담거나 심오한 주제나 철학을 떠올리게 하는 작품은 우리에게 신선한 충격이나 지성적 자극이 됩니다. 그에 비하면 얼핏 너무나 평범해보이는 류채민 작가의 그림은 충격이나 자극보다는 편안함이나 따뜻함이라는 단어와 더 가까워 보입니다. 편안함이나 따뜻함은 우리가 삶을 살아가면서 무엇보다 필요로 하는 것이며 언제나 갈망하는 것입니다. 일상 속에 마주하고 지나치는 그림이 언제나 나에게 안식처가 될 수 있다면, 그 그림은 더없이 우리 삶에서 중요한 역할을 해준다고 할 수 있을 것입니다. 모든 것이 특별하거나 새롭거나 다르기를 요구하는 현대 사회에서 류채민 작가의 그림이 가진 평범함은 어떤 특별함보다도 더 특별한, 그 자체로는 모순적인 ‘특별한 평범함’이 아닐까요?
', '1500x900', 50000, 122, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(4, '도원', 1, '고뇌에 찬 자화상', '유화를 통해 작품 속 대상에 감정을 이입시키고 일상을 재해석하는 김병권 작가는 끈질기게 유화라는 외길을 고집한다. 작가가 보는 세상과 공감을 불러일으키는 감정이 유화라는 매체를 통해 가장 잘 전달된다고 생각하기 때문이다. 작가는 우리가 일상에서 무심코 지나치는 풍경과 대상을 물감의 질감을 살려 입체적으로 표현한다. 작가의 흔적과 물성이 가시화된 그의 작품에서는 오히려 형태는 흐려지고 기억과 감정이 두드러지게 발현되어, 작품을 통해 관람자들에게 자신의 경험을 떠올리게 하고 감정을 마주하게 한다.
추천 이유
김병권 작가의 작품은 현실의 풍경을 대상으로 하지만 왜곡된 형태와 물감의 물성이 드러난 표면으로 인해 초현실적인 분위기를 자아냅니다. 길거리, 가게 앞 등 일상적인 공간이지만 작가의 시각으로 재탄생하여 독특하고 고유의 의미를 가진 장소가 된 듯합니다. 물감의 흔적이 그대로 남아 있는 작품을 보면서 작가의 흔적을 느끼고, 환상적인 분위기를 내는 세련된 색감에서 현대적인 감각을 느낄 수 있습니다. 20세기 초에 탄생한 초현실주의 작품을 보듯 상상력을 자극하며 일상 풍경을 자기만의 시선으로 재해석해 의미를 찾아갈 수 있도록 하는 작품으로, 공간에 개성을 부여해 줄 것입니다.
', '1200x900', 60000, 123, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(5, '난향', 1, '압생트를 마시는 남자', '작가는 도시 생활의 안식처를 찾아 자연으로 여행을 떠나서 마주쳤던 풍경을 그린다. 감탄을 자아내는 광대한 풍경, 잠깐 스쳐지나가면서 보는 익숙하고 편안한 풍경, 낯설거나 이국적이고 몽환적인 풍경 등 여행과 등산을 하며 마주치는 수많은 존재와 풍경들은 작가의 경험과 느낌을 토대로 새로운 풍경으로 재탄생한다. 작가는 자신이 풍경을 그리면서 갈증을 해소하고 휴식을 상상하듯이 감상자 역시 작가의 작품을 통해 편안하게 휴식하기를 바란다고 한다. 한지에 먹으로 채색하는 지극히 한국적인 방식으로 그려졌지만 현대적인 감각으로 그려져 동서양의 경계를 넘어 자연을 향한 향수를 자극하는 작품이다.
추천 이유
도시가 주는 편리함은 너무 매력적이지만 정신없이 바쁜 생활에서 공허감을 느끼고, 반복되는 일상에서 권태와 우울을 느끼기도 합니다. 그래서 많은 사람이 자연을 느낄 수 있는 곳으로 여행을 떠나고 싶어 합니다. 하지만 해야 할 일을 뒤로하고 어딘가로 훌쩍 떠난다는 게 말처럼 쉬운 일이 아니기에, 권소영 작가의 손에서 멋지게 재탄생한 자연 풍경을 즐겨보기를 추천합니다. 무채색으로 그려진 작가의 풍경화는 안락한 자연과 이상적인 경관을 보여주어 이상향에 한 걸음 다가가는 것 같은 기분이 들고, 마음이 차분히 가라앉고 평온해지는 것을 경험할 수 있을 것입니다. 감성을 자극하는 현대적인 수묵산수화로 일상의 지루함을 달래보세요.
', '300x300', 150000, 124, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(6, '열빈', 1, '압생트를 마시는 무명화가', '평범한 일상의 시간들이 지나면 추억이 되고 어느 날 우연치 않게 그 시간들을 되새기는 순간이 온다. 매일매일이 비슷해서 특별할 것 없다고 생각하는 시간들이 지나고 나면 소중해지는 순간처럼. 이혜진 작가는 반복되는 생활 속에서 스쳐 지나가는 풍경과 사물, 그리고 공간들을 감각하여 빗 바랜 추억을 곱씹는다. 과거의 기억이 현재의 순간을 만났을 때, 그녀의 작업은 여기서 시작된다. 이혜진 작가는 자신이 느끼고 발견한 섬세하고 감각적인 정서가 시간, 공간 그리고 기억을 재구성하여 새로운 이미지로 재구성한다. 종이와 연필 그리고 수묵 기법을 사용한 고즈넉한 그녀의 풍경들은 익숙하면서도 편안하고 정적이지만 동시에 다사로운 감각을 선사한다.
추천 이유
시간이 지남에도 늘 사랑받는 작품들, 즉 고전이라 일컬어지는 것들은 변치 않음이라기 보다는 다시 볼 때마다 새로운 기분을 주기 때문이 아닐까 합니다. 그렇게 느끼게 되는 연유는 아마 예전의 나와 지금의 내가 달라졌기 때문이겠죠. 불현듯 떠오르는 기억을 붙잡는 이혜진 작가의 작업은 마치, 새로운 나를 마주하게 하는 고전 이야기를 연상시킵니다. 시간이 지나면 증발하는 기억이 뜻밖의 순간에 마치 화학작용처럼 문득 떠오르는 것처럼 말입니다. 안온한 하면서도 신선함을 주는 이혜진 작가의 작품은 익숙하기 때문에 의식하지 못하고 있던 시간과 공간의 풍경을 예리하게 표현하는 일상을 돌이켜 생각해 보게 합니다. 여러분도 이혜진 작가의 작품을 통해 잊고 있던 기억을 또 다른 추억으로 떠올려보는 건 어떨까요?
', '900x900', 200000, 125, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(7, '태원', 1, '압생트를 마시는 사람들', '작가는 도시 생활의 안식처를 찾아 자연으로 여행을 떠나서 마주쳤던 풍경을 그린다. 감탄을 자아내는 광대한 풍경, 잠깐 스쳐지나가면서 보는 익숙하고 편안한 풍경, 낯설거나 이국적이고 몽환적인 풍경 등 여행과 등산을 하며 마주치는 수많은 존재와 풍경들은 작가의 경험과 느낌을 토대로 새로운 풍경으로 재탄생한다. 작가는 자신이 풍경을 그리면서 갈증을 해소하고 휴식을 상상하듯이 감상자 역시 작가의 작품을 통해 편안하게 휴식하기를 바란다고 한다. 한지에 먹으로 채색하는 지극히 한국적인 방식으로 그려졌지만 현대적인 감각으로 그려져 동서양의 경계를 넘어 자연을 향한 향수를 자극하는 작품이다.
추천 이유
도시가 주는 편리함은 너무 매력적이지만 정신없이 바쁜 생활에서 공허감을 느끼고, 반복되는 일상에서 권태와 우울을 느끼기도 합니다. 그래서 많은 사람이 자연을 느낄 수 있는 곳으로 여행을 떠나고 싶어 합니다. 하지만 해야 할 일을 뒤로하고 어딘가로 훌쩍 떠난다는 게 말처럼 쉬운 일이 아니기에, 권소영 작가의 손에서 멋지게 재탄생한 자연 풍경을 즐겨보기를 추천합니다. 무채색으로 그려진 작가의 풍경화는 안락한 자연과 이상적인 경관을 보여주어 이상향에 한 걸음 다가가는 것 같은 기분이 들고, 마음이 차분히 가라앉고 평온해지는 것을 경험할 수 있을 것입니다. 감성을 자극하는 현대적인 수묵산수화로 일상의 지루함을 달래보세요.
', '1200x800', 80000, 126, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(1, '목란', 1, 'absinthe', '창가에 가만히 놓인 장식물과 창밖으로 비치는 도시의 풍경이 보인다. 이토록 일상적이고 소박한 풍경이 또 있을까? 그래서인지 류채민 작가의 그림은 보는 이에게 아주 익숙하고 편안하게 다가온다. 전경에 보이는 장식물도 뒤편으로 보이는 건물들도 새롭거나 유별나지 않다. 그럼에도 불구하고 작품이 특별하다고 말할 수 있는 이유는 풍경과 오브제에 깃든 인간적인 따뜻함 덕분일 것이다. 어떤 심오한 의미나 철학을 담으려 하기보다는 일상적인 풍경을 다시 소재로 삼아 생명을 불어넣기를 원한 작가의 애정 어린 시선이 고스란히 담겨 있다. 작품 전체를 감싸고 있는 채도 낮은 색감은 아련함과 온기를 배가한다.
추천 이유
일상에서 보기 어려운 생경한 풍경을 담거나 심오한 주제나 철학을 떠올리게 하는 작품은 우리에게 신선한 충격이나 지성적 자극이 됩니다. 그에 비하면 얼핏 너무나 평범해보이는 류채민 작가의 그림은 충격이나 자극보다는 편안함이나 따뜻함이라는 단어와 더 가까워 보입니다. 편안함이나 따뜻함은 우리가 삶을 살아가면서 무엇보다 필요로 하는 것이며 언제나 갈망하는 것입니다. 일상 속에 마주하고 지나치는 그림이 언제나 나에게 안식처가 될 수 있다면, 그 그림은 더없이 우리 삶에서 중요한 역할을 해준다고 할 수 있을 것입니다. 모든 것이 특별하거나 새롭거나 다르기를 요구하는 현대 사회에서 류채민 작가의 그림이 가진 평범함은 어떤 특별함보다도 더 특별한, 그 자체로는 모순적인 ‘특별한 평범함’이 아닐까요?
', '800x800', 45000, 127, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(2, '홍원', 1, 'Embarkation of St Paula Romana at Ostia', '현미경을 갖다 댄 듯 세밀한 묘사로 그려진 대상은 모두 생명을 가진 존재들이다. 남진숙 작가의 작품은 한 생명의 있는 그대로의 모습에 대한 치밀한 탐구로 이루어져있다. 그 탐구에 스민 절실함과 섬세함은 비단 대상을 그대로 재현하는 것에서 나타나는 것이 아니라 작품을 통해 드러난 작가의 시선을 통해 알 수 있다. 작가의 시선이 멈춘 누군가는 간절한 눈을 통해 돌처럼 굳어진 심정을 절절히 드러낸다. 누군가의 발자취가 남긴 그림자는 바닥의 보도 블록에서 튀어나와 몸 속을 흐르는 생명의 피처럼 순환하며 움직이는 살아있는 형태가 된다. 식물이 꽃을 피울 땐 주변의 모든 배경이 흐려지고 오직 여린 잎과 봉우리를 뚫고 고개를 내미는 꽃잎만이 남을 뿐이다. 이처럼 남진숙 작가는 살아있는 생명에 대한 깊을 고찰을 통해 삶이 의미를 갖게 되는 순간의 비밀을 드러낸다. 그것은 어떤 영원이나 저 멀리 이상의 세계에 있는 것이 아니라 생명이 그 순간을 살아가는 현재 바로 지금에 있는 것이다.
추천 이유
일상 속에서 우리는 작은 식물의 잎을 한없이 바라보는 경우가 아주 가끔씩 생깁니다. 그 순간 그 작은 잎에 미세한 솜털, 강한 줄기로부터 잎 끝까지 뻗어나간 잎맥이 있었음에 놀라게 됩니다. 그저 주변의 푸른 색의 일부분이었던 작은 잎이 지닌 선명함에 순간 압도당하기도 하지요. 이러한 시간은 우리가 무수히 지나쳐가는 삶의 순간순간에 대해 문득 깨닫게 합니다. 어제 오늘 내일 그저 시간의 흐름에 별일 없이 살던 나라는 존재 역시 이 작은 잎처럼 섬세하게 구성되고 강렬한 생명을 순간순간 뿜어내고 있습니다. 남진숙 작가는 살아있는 순간을 치열하게 담은 작품을 통해 살아있음 그 자체에 집중하는 시간을 갖게 합니다. 작품을 따라 작가의 시선으로 한 생명의 순간을 집중해서 보는 경험은 그 어떤 메시지보다도 우리의 삶을 생생하게 느끼고 나의 존재를 고찰하게 해주는 강한 울림을 갖고 있습니다. 남진숙 작가의 작품을 통해 살아있는 이 순간을 온전히 느껴보시기 바랍니다.
', '1800x800', 45000, 128, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(3, '향미', 1, 'Landscape with the Finding', '나는 유년기의 어려웠던 기억들을 재해석함으로써 현대 사회 속에서 타인으로부터 상처받거나 소외감을 느끼며 살아가는 우리에게 자신을 돌아보고 위로하는 기회를 주는 그림을 그리고 싶다. 이인영 작가는 말한다. 그는 시장에서 하루 종일 야채장사를 하셨던 어머니와 계속된 사업의 실패로 술에 삶을 의지하셨던 아버지를 떠올리며 자신의 가난하고 불우했던 어린 시절을 고백한다. 유년기의 성장통과 불안, 욕망 등 내면의 다양한 감정들을 시각적 언어로 표현하는 그의 작업을 통해 자신의 어두운 감정을 마주할 수 있는 용기를 얻게 된다. 아픔을 마주하는 용기, 그것을 통해 우리는 비로소 자신을 모습을 바라볼 수 있고 성장할 수 있을 것이다.
추천 이유
지하철이나 버스 안에서 사람들을 보고 있으면 스마트폰을 한 손에 쥐고 눈을 그곳에서 떼지 못하고 있습니다. 사람들은 무언가를 상상하거나 생각하기보다 계속해서 어떠한 자료와 정보를 공유 받기를 원하고 있는 것 같습니다. 마치 무언가에 중독된 것처럼 말이죠. 하지만 공상의 시간은 과부화 된 뇌를 쉬게 하고 에너지를 충전하기에 꼭 필요한 시간입니다. 이인영 작가 또한 인생의 절망적인 시기를 공상을 통해 견뎌낼 수 있었다고 합니다. 거친 붓 터치와 깊은 색감으로 그려진 이 작품은 마치 누군가의 꿈속에 들어온 듯한 분위기를 연출하고, 강렬한 느낌을 자아냅니다. 참신한 아이디어가 필요한 곳에 어울리는 곳에 어울리는 작품을 찾고 있는 당신이라면 이 작품을 추천해드립니다. 공상의 세계로 당신을 안내해줄 것입니다
', '900x600', 45000, 129, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(4, '도원', 1, '설경', '현미경을 갖다 댄 듯 세밀한 묘사로 그려진 대상은 모두 생명을 가진 존재들이다. 남진숙 작가의 작품은 한 생명의 있는 그대로의 모습에 대한 치밀한 탐구로 이루어져있다. 그 탐구에 스민 절실함과 섬세함은 비단 대상을 그대로 재현하는 것에서 나타나는 것이 아니라 작품을 통해 드러난 작가의 시선을 통해 알 수 있다. 작가의 시선이 멈춘 누군가는 간절한 눈을 통해 돌처럼 굳어진 심정을 절절히 드러낸다. 누군가의 발자취가 남긴 그림자는 바닥의 보도 블록에서 튀어나와 몸 속을 흐르는 생명의 피처럼 순환하며 움직이는 살아있는 형태가 된다. 식물이 꽃을 피울 땐 주변의 모든 배경이 흐려지고 오직 여린 잎과 봉우리를 뚫고 고개를 내미는 꽃잎만이 남을 뿐이다. 이처럼 남진숙 작가는 살아있는 생명에 대한 깊을 고찰을 통해 삶이 의미를 갖게 되는 순간의 비밀을 드러낸다. 그것은 어떤 영원이나 저 멀리 이상의 세계에 있는 것이 아니라 생명이 그 순간을 살아가는 현재 바로 지금에 있는 것이다.
추천 이유
일상 속에서 우리는 작은 식물의 잎을 한없이 바라보는 경우가 아주 가끔씩 생깁니다. 그 순간 그 작은 잎에 미세한 솜털, 강한 줄기로부터 잎 끝까지 뻗어나간 잎맥이 있었음에 놀라게 됩니다. 그저 주변의 푸른 색의 일부분이었던 작은 잎이 지닌 선명함에 순간 압도당하기도 하지요. 이러한 시간은 우리가 무수히 지나쳐가는 삶의 순간순간에 대해 문득 깨닫게 합니다. 어제 오늘 내일 그저 시간의 흐름에 별일 없이 살던 나라는 존재 역시 이 작은 잎처럼 섬세하게 구성되고 강렬한 생명을 순간순간 뿜어내고 있습니다. 남진숙 작가는 살아있는 순간을 치열하게 담은 작품을 통해 살아있음 그 자체에 집중하는 시간을 갖게 합니다. 작품을 따라 작가의 시선으로 한 생명의 순간을 집중해서 보는 경험은 그 어떤 메시지보다도 우리의 삶을 생생하게 느끼고 나의 존재를 고찰하게 해주는 강한 울림을 갖고 있습니다. 남진숙 작가의 작품을 통해 살아있는 이 순간을 온전히 느껴보시기 바랍니다.
', '800x800', 80000, 130, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(5, '난향', 1, '성월화', '유화를 통해 작품 속 대상에 감정을 이입시키고 일상을 재해석하는 김병권 작가는 끈질기게 유화라는 외길을 고집한다. 작가가 보는 세상과 공감을 불러일으키는 감정이 유화라는 매체를 통해 가장 잘 전달된다고 생각하기 때문이다. 작가는 우리가 일상에서 무심코 지나치는 풍경과 대상을 물감의 질감을 살려 입체적으로 표현한다. 작가의 흔적과 물성이 가시화된 그의 작품에서는 오히려 형태는 흐려지고 기억과 감정이 두드러지게 발현되어, 작품을 통해 관람자들에게 자신의 경험을 떠올리게 하고 감정을 마주하게 한다.
추천 이유
김병권 작가의 작품은 현실의 풍경을 대상으로 하지만 왜곡된 형태와 물감의 물성이 드러난 표면으로 인해 초현실적인 분위기를 자아냅니다. 길거리, 가게 앞 등 일상적인 공간이지만 작가의 시각으로 재탄생하여 독특하고 고유의 의미를 가진 장소가 된 듯합니다. 물감의 흔적이 그대로 남아 있는 작품을 보면서 작가의 흔적을 느끼고, 환상적인 분위기를 내는 세련된 색감에서 현대적인 감각을 느낄 수 있습니다. 20세기 초에 탄생한 초현실주의 작품을 보듯 상상력을 자극하며 일상 풍경을 자기만의 시선으로 재해석해 의미를 찾아갈 수 있도록 하는 작품으로, 공간에 개성을 부여해 줄 것입니다.
', '500x500', 45000, 131, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(6, '열빈', 1, '트리에스테 항구', '나는 유년기의 어려웠던 기억들을 재해석함으로써 현대 사회 속에서 타인으로부터 상처받거나 소외감을 느끼며 살아가는 우리에게 자신을 돌아보고 위로하는 기회를 주는 그림을 그리고 싶다. 이인영 작가는 말한다. 그는 시장에서 하루 종일 야채장사를 하셨던 어머니와 계속된 사업의 실패로 술에 삶을 의지하셨던 아버지를 떠올리며 자신의 가난하고 불우했던 어린 시절을 고백한다. 유년기의 성장통과 불안, 욕망 등 내면의 다양한 감정들을 시각적 언어로 표현하는 그의 작업을 통해 자신의 어두운 감정을 마주할 수 있는 용기를 얻게 된다. 아픔을 마주하는 용기, 그것을 통해 우리는 비로소 자신을 모습을 바라볼 수 있고 성장할 수 있을 것이다.
추천 이유
지하철이나 버스 안에서 사람들을 보고 있으면 스마트폰을 한 손에 쥐고 눈을 그곳에서 떼지 못하고 있습니다. 사람들은 무언가를 상상하거나 생각하기보다 계속해서 어떠한 자료와 정보를 공유 받기를 원하고 있는 것 같습니다. 마치 무언가에 중독된 것처럼 말이죠. 하지만 공상의 시간은 과부화 된 뇌를 쉬게 하고 에너지를 충전하기에 꼭 필요한 시간입니다. 이인영 작가 또한 인생의 절망적인 시기를 공상을 통해 견뎌낼 수 있었다고 합니다. 거친 붓 터치와 깊은 색감으로 그려진 이 작품은 마치 누군가의 꿈속에 들어온 듯한 분위기를 연출하고, 강렬한 느낌을 자아냅니다. 참신한 아이디어가 필요한 곳에 어울리는 곳에 어울리는 작품을 찾고 있는 당신이라면 이 작품을 추천해드립니다. 공상의 세계로 당신을 안내해줄 것입니다
', '800x800', 50000, 132, 5000);
INSERT INTO `todayart`.`product`(`artist_id`, `artist_name`, `category_id`, `product_name`, `product_content`, `product_size`, `product_price`, `thumbnail_id`, `shipping_fee`)
VALUE(7, '태원', 1, '호숫가를 거니는 여인이 있는 풍경', '평범한 일상의 시간들이 지나면 추억이 되고 어느 날 우연치 않게 그 시간들을 되새기는 순간이 온다. 매일매일이 비슷해서 특별할 것 없다고 생각하는 시간들이 지나고 나면 소중해지는 순간처럼. 이혜진 작가는 반복되는 생활 속에서 스쳐 지나가는 풍경과 사물, 그리고 공간들을 감각하여 빗 바랜 추억을 곱씹는다. 과거의 기억이 현재의 순간을 만났을 때, 그녀의 작업은 여기서 시작된다. 이혜진 작가는 자신이 느끼고 발견한 섬세하고 감각적인 정서가 시간, 공간 그리고 기억을 재구성하여 새로운 이미지로 재구성한다. 종이와 연필 그리고 수묵 기법을 사용한 고즈넉한 그녀의 풍경들은 익숙하면서도 편안하고 정적이지만 동시에 다사로운 감각을 선사한다.
추천 이유
시간이 지남에도 늘 사랑받는 작품들, 즉 고전이라 일컬어지는 것들은 변치 않음이라기 보다는 다시 볼 때마다 새로운 기분을 주기 때문이 아닐까 합니다. 그렇게 느끼게 되는 연유는 아마 예전의 나와 지금의 내가 달라졌기 때문이겠죠. 불현듯 떠오르는 기억을 붙잡는 이혜진 작가의 작업은 마치, 새로운 나를 마주하게 하는 고전 이야기를 연상시킵니다. 시간이 지나면 증발하는 기억이 뜻밖의 순간에 마치 화학작용처럼 문득 떠오르는 것처럼 말입니다. 안온한 하면서도 신선함을 주는 이혜진 작가의 작품은 익숙하기 때문에 의식하지 못하고 있던 시간과 공간의 풍경을 예리하게 표현하는 일상을 돌이켜 생각해 보게 합니다. 여러분도 이혜진 작가의 작품을 통해 잊고 있던 기억을 또 다른 추억으로 떠올려보는 건 어떨까요?
', '1200x900', 90000, 133, 5000);




-- -----------------------------------------------------
-- Table `todayart`.`cart`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `todayart`.`cart` (
  `cart_id` INT(11) NOT NULL AUTO_INCREMENT,
  `member_id` INT(11) NOT NULL,
  `product_id` INT(11) NOT NULL,
  `product_price` int not null,
  `product_size` varchar(255) not null,
  `quantity` int not null default 1,
  `shipping_fee` int null default 0,
  `enroll_dated` DATETIME NULL DEFAULT current_timestamp,
  `is_deleted` CHAR(1) NOT NULL DEFAULT 'n' comment 'n: not deleted, y: deleted ',
  `is_stock` CHAR(1) NOT NULL DEFAULT 'y' COMMENT 'n:재고없음, t: 재고있음',
  PRIMARY KEY (`cart_id`),
  INDEX `fk_cart_member_idx` (`member_id` ASC) VISIBLE,
  CONSTRAINT `fk_cart_member`
    FOREIGN KEY (`member_id`)
    REFERENCES `todayart`.`member` (`member_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_cart_product`
	FOREIGN KEY (`product_id`)
	REFERENCES `todayart`.`product` (`product_id`)
	ON DELETE NO ACTION
	ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `todayart`.`member_address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `todayart`.`member_address` (
  `address_id` INT(11) NOT NULL AUTO_INCREMENT,
  `member_id` INT(11) NOT NULL,
  `consignee` varchar(255)null comment '대표수령인',
  `consignee_phone` varchar(255)null comment '대표연락처',
  `postal_number` CHAR(5) NOT NULL,
  `address` VARCHAR(255) NOT NULL,
  `address_detail` VARCHAR(255) NULL DEFAULT NULL,
  `main_address`CHAR(1) NOT NULL DEFAULT 'n' COMMENT 'n:일반배송지, y:대표배송지',
  `is_delete`CHAR(1) NOT NULL DEFAULT 'n' COMMENT 'n:미삭제, y:삭제',
  PRIMARY KEY (`address_id`),
  INDEX `fk_memberAddress_member_idx` (`member_id` ASC) VISIBLE,
  CONSTRAINT `fk_memberAddress_member`
    FOREIGN KEY (`member_id`)
    REFERENCES `todayart`.`member` (`member_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `todayart`.`mileage_invoice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `todayart`.`mileage_invoice` (
  `mileage_id` INT(11) NOT NULL AUTO_INCREMENT,
  `artist_id` INT(11) NOT NULL,
  `exchange_dated` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `exchange_mileage` INT(11) NOT NULL,
  `exchange_cash` INT(11) NOT NULL,
  `bank_name` VARCHAR(255) NOT NULL,
  `deposit_account` VARCHAR(255) NOT NULL,
  `balance` INT(11) NOT NULL DEFAULT 0,
  `is_delete`CHAR(1) NOT NULL DEFAULT 'n' COMMENT 'n: 미삭제, y: 삭제',
  PRIMARY KEY (`mileage_id`),
  INDEX `fk_mileageInvoice_artist_idx` (`artist_id` ASC) VISIBLE,
  CONSTRAINT `fk_mileageInvoice_artist`
    FOREIGN KEY (`artist_id`)
    REFERENCES `todayart`.`artist` (`artist_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `todayart`.`ordered`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `todayart`.`ordered` (
  `ordered_id` INT(11) NOT NULL AUTO_INCREMENT,
  `member_id` INT(11) NOT NULL COMMENT "구매자의 ID",
  `order_dated` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `total_price` INT(11) NOT NULL,
  `shipping_fee` INT(11) NULL DEFAULT NULL,
  `isHidden`CHAR(1) NOT NULL DEFAULT 'n' COMMENT "n:보이기 y:감추기",
  PRIMARY KEY (`ordered_id`),
  INDEX `fk_ordered_member_idx` (`member_id` ASC) VISIBLE,
  CONSTRAINT `fk_ordered_member`
    FOREIGN KEY (`member_id`)
    REFERENCES `todayart`.`member` (`member_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;



-- -----------------------------------------------------
-- Table `todayart`.`mileage_statement`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `todayart`.`mileage_statement` (
  `trade_id` INT(11) NOT NULL AUTO_INCREMENT,
  `artist_id` INT(11) NOT NULL,
  `order_id` INT(11) NOT NULL,
  `balance` INT(11) NULL DEFAULT NULL,
  `income` INT(11) NULL DEFAULT NULL,
  `commission_rate` INT(11) NULL DEFAULT NULL,
  `commission` INT(11) NULL DEFAULT NULL,
  `deposit_mileage` INT(11) NULL DEFAULT NULL,
  `invoice_id` INT(11) NULL DEFAULT NULL,
  `withdraw_mileage` INT(11) NULL DEFAULT NULL,
  `create_dated` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_delete` CHAR(1) NOT NULL DEFAULT 'n' COMMENT 'n: 삭제안됨, y: 삭제',
  PRIMARY KEY (`trade_id`),
  INDEX `fk_mileageStatement_artist_idx` (`artist_id` ASC) VISIBLE,
  INDEX `fk_mileageStatement_ordered_idx` (`order_id` ASC) VISIBLE,
  CONSTRAINT `fk_mileageStatement_artist`
    FOREIGN KEY (`artist_id`)
    REFERENCES `todayart`.`artist` (`artist_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_mileageStatement_ordered`
    FOREIGN KEY (`order_id`)
    REFERENCES `todayart`.`ordered` (`ordered_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `todayart`.`oauth_access_token`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `todayart`.`oauth_access_token` (
  `token_id` VARCHAR(255) NULL DEFAULT NULL,
  `token` BLOB NULL DEFAULT NULL,
  `authentication_id` VARCHAR(255) NOT NULL,
  `user_name` VARCHAR(255) NULL DEFAULT NULL,
  `client_id` VARCHAR(255) NULL DEFAULT NULL,
  `authentication` BLOB NULL DEFAULT NULL,
  `refresh_token` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`authentication_id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `todayart`.`oauth_approvals`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `todayart`.`oauth_approvals` (
  `userid` VARCHAR(255) NULL DEFAULT NULL,
  `clientid` VARCHAR(255) NULL DEFAULT NULL,
  `scope` VARCHAR(255) NULL DEFAULT NULL,
  `status` VARCHAR(10) NULL DEFAULT NULL,
  `expiresat` TIMESTAMP NULL DEFAULT NULL,
  `lastmodifiedat` TIMESTAMP NULL DEFAULT NULL)
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `todayart`.`oauth_client_details`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `todayart`.`oauth_client_details` (
  `client_id` VARCHAR(255) NOT NULL,
  `resource_ids` VARCHAR(255) NULL DEFAULT NULL,
  `client_secret` VARCHAR(255) NULL DEFAULT NULL,
  `scope` VARCHAR(255) NULL DEFAULT NULL,
  `authorized_grant_types` VARCHAR(255) NULL DEFAULT NULL,
  `web_server_redirect_uri` VARCHAR(255) NULL DEFAULT NULL,
  `authorities` VARCHAR(255) NULL DEFAULT NULL,
  `access_token_validity` INT(11) NULL DEFAULT NULL,
  `refresh_token_validity` INT(11) NULL DEFAULT NULL,
  `additional_information` VARCHAR(4096) NULL DEFAULT NULL,
  `autoapprove` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`client_id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;


INSERT INTO `oauth_client_details` (`client_id`, `resource_ids`, `client_secret`, `scope`, `authorized_grant_types`, `authorities`, `access_token_validity`, `refresh_token_validity`, `autoapprove`)
  VALUES ('test', 'todayart-server-rest-api', 'test', 'read,write', 'password,authorization_code,refresh_token,client_credentials', 'ROLE_GUEST', 86400, 2592000, true);

-- -----------------------------------------------------
-- Table `todayart`.`oauth_client_token`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `todayart`.`oauth_client_token` (
  `token_id` VARCHAR(255) NULL DEFAULT NULL,
  `token` BLOB NULL DEFAULT NULL,
  `authentication_id` VARCHAR(255) NOT NULL,
  `user_name` VARCHAR(255) NULL DEFAULT NULL,
  `client_id` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`authentication_id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `todayart`.`oauth_code`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `todayart`.`oauth_code` (
  `code` VARCHAR(255) NULL DEFAULT NULL,
  `authentication` BLOB NULL DEFAULT NULL)
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `todayart`.`oauth_refresh_token`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `todayart`.`oauth_refresh_token` (
  `token_id` VARCHAR(255) NULL DEFAULT NULL,
  `token` BLOB NULL DEFAULT NULL,
  `authentication` BLOB NULL DEFAULT NULL)
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `todayart`.`ordered_detail`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `todayart`.`ordered_detail` (
  `ordered_detail_id` INT(11) NOT NULL AUTO_INCREMENT,
  `ordered_id` INT(11) NOT NULL,
  `product_id` INT(11) NOT NULL,
  `cart_id` INT(11) NOT NULL,
  `product_price` INT(11) NOT NULL,
  `product_name` VARCHAR(255) NOT NULL,
  `product_size` VARCHAR(255) NOT NULL,
  `quantity` INT(11) NOT NULL,
  `total_product_price` INT(11) NOT NULL,
  `shipping_fee` INT(11) NOT NULL,
  `total_price` INT(11) NOT NULL,
  `tracking_number` VARCHAR(255) NULL DEFAULT NULL,
  `status` ENUM('결제대기', '결제취소', '결제완료', '배송준비', '배송중', '배송완료', '주문확정', '주문취소', '반품대기','반품중','반품완료', '환불처리중', '환불완료') NOT NULL DEFAULT '결제대기',
  PRIMARY KEY (`ordered_detail_id`),
  INDEX `fk_orderedDetail_ordered_idx` (`ordered_id` ASC) VISIBLE,
  INDEX `fk_orderedDetail_product_idx` (`product_id` ASC) VISIBLE,
  INDEX `fk_orderedDetail_cart_idx` (`cart_id` ASC) VISIBLE,
  CONSTRAINT `fk_orderedDetail_ordered`
    FOREIGN KEY (`ordered_id`)
    REFERENCES `todayart`.`ordered` (`ordered_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_orderedDetail_product`
    FOREIGN KEY (`product_id`)
    REFERENCES `todayart`.`product` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
CONSTRAINT `fk_orderedDetail_cart`
    FOREIGN KEY (`cart_id`)
    REFERENCES `todayart`.`cart` (`cart_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `todayart`.`payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `todayart`.`payment` (
  `payment_id` INT(11) NOT NULL AUTO_INCREMENT,
  `order_id` INT(11) NOT NULL,
  `ordered_detail_id` INT(11) NOT NULL,
  `pay_dated` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `pay_method` VARCHAR(255) NOT NULL,
  `card_number` VARCHAR(255) NULL DEFAULT NULL,
  `order_detail_price` INT(11) NULL DEFAULT NULL,
  `total_order_price` INT(11) NULL DEFAULT NULL,
  `status` ENUM ('결제대기', '결제완료', '결제취소', '결제환불') NOT NULL DEFAULT '결제대기',
  `pg_number` varchar(30) default null,
  `refund_comment` VARCHAR(255) DEFAULT NULL COMMENT '환불사유',
  PRIMARY KEY (`payment_id`),
  INDEX `fk_payment_ordered_idx` (`order_id` ASC) VISIBLE,
  INDEX `fk_payment_ordered_detail_idx` (`ordered_detail_id` ASC) VISIBLE,
  CONSTRAINT `fk_payment_ordered`
    FOREIGN KEY (`order_id`)
    REFERENCES `todayart`.`ordered` (`ordered_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_payment_ordered_detail`
    FOREIGN KEY (`ordered_detail_id`)
    REFERENCES `todayart`.`ordered_detail` (`ordered_detail_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;





-- -----------------------------------------------------
-- Table `todayart`.`shipping`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `todayart`.`shipping` (
  `shipping_id` INT(11) NOT NULL AUTO_INCREMENT,
  `ordered_id` INT(11) NOT NULL,
  `shipping_dated` DATETIME NULL DEFAULT NULL,
  `shipping_fee` INT(11) NULL DEFAULT NULL,
  `consignee` VARCHAR(255) NOT NULL,
  `postal_code` CHAR(5) NOT NULL,
  `receive_addr` VARCHAR(255) NOT NULL,
  `consignee_phone` VARCHAR(255) NOT NULL,
  `artist_id` INT(11) NOT NULL,
  `member_id` INT(11) NOT NULL,
  `courier` VARCHAR(255) NULL DEFAULT NULL,
  `tracking_number` VARCHAR(255) NULL DEFAULT NULL,
  `is_delete` CHAR(1) NOT NULL DEFAULT 'n' COMMENT 'n:미삭제, y:삭제',
  PRIMARY KEY (`shipping_id`),
  UNIQUE INDEX `tracking_number` (`tracking_number` ASC) VISIBLE,
  INDEX `fk_shipping_ordered_idx` (`ordered_id` ASC) VISIBLE,
  INDEX `fk_shipping_artist_idx` (`artist_id` ASC) VISIBLE,
  INDEX `fk_shipping_member_idx` (`member_id` ASC) VISIBLE,
  CONSTRAINT `fk_shipping_ordered`
    FOREIGN KEY (`ordered_id`)
    REFERENCES `todayart`.`ordered` (`ordered_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_shipping_artist`
    FOREIGN KEY (`artist_id`)
    REFERENCES `todayart`.`artist` (`artist_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_shipping_member`
    FOREIGN KEY (`member_id`)
    REFERENCES `todayart`.`member` (`member_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `todayart`.`shipping_items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `todayart`.`shipping_items` (
  `item_id` INT(11) NOT NULL AUTO_INCREMENT,
  `shipping_id` INT(11) NOT NULL,
  `ordered_id` INT(11) NOT NULL,
  `product_id` INT(11) NOT NULL,
  `last_updated` DATETIME DEFAULT current_timestamp,
  `status` enum('배송중', '배송완료', '수취거부', '반송대기', '반송중', '반송완료') NOT NULL DEFAULT '배송중',
  PRIMARY KEY (`item_id`),
  INDEX `fk_shippingItems_shipping_idx` (`shipping_id` ASC) VISIBLE,
  INDEX `fk_shippingItems_ordered_idx` (`ordered_id` ASC) VISIBLE,
  INDEX `fk_shippingItems_product_idx` (`product_id` ASC) VISIBLE,
  CONSTRAINT `fk_shippingItems_shipping`
    FOREIGN KEY (`shipping_id`)
    REFERENCES `todayart`.`shipping` (`shipping_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_shippingItems_ordered`
    FOREIGN KEY (`ordered_id`)
    REFERENCES `todayart`.`ordered` (`ordered_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_shippingItems_product`
    FOREIGN KEY (`product_id`)
    REFERENCES `todayart`.`product` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `todayart`.`update_log`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `todayart`.`update_log` (
  `log_id` INT(11) NOT NULL AUTO_INCREMENT,
  `member_id` INT(11) NOT NULL,
  `updated` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_type` VARCHAR(255) NOT NULL COMMENT 'tablename_pk_action',
  `log_desc` JSON NOT NULL COMMENT '{log_data: [{\"column\":\"column_name\"\\n
			\"before\":\"before_data\",\\n										
			\"after\":\"afer_data\"},{},{}...]}',
  PRIMARY KEY (`log_id`),
  INDEX `fk_updateLog_member_idx` (`member_id` ASC) VISIBLE,
  CONSTRAINT `fk_updateLog_member`
    FOREIGN KEY (`member_id`)
    REFERENCES `todayart`.`member` (`member_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;



-- -----------------------------------------------------
-- Table `todayart`.`wishlist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `todayart`.`wishlist` (
  `wishlist_id` INT(11) NOT NULL AUTO_INCREMENT,
  `member_id` INT(11) NOT NULL,
  `product_id` INT(11) NOT NULL,
  `artist_name` varchar(255) not NULL, 
  `product_price` int not null,
  `product_size` varchar(255) not null,
  `enroll_dated` DATETIME NULL DEFAULT current_timestamp,
  `is_deleted` CHAR(1) NOT NULL DEFAULT 'n' comment 'n: not deleted, y: deleted ',
  `is_stock` CHAR(1) NOT NULL DEFAULT 'y' COMMENT 'n:재고없음, y:재고있음',
  PRIMARY KEY (`wishlist_id`),
  INDEX `fk_wishlist_member_idx` (`member_id` ASC) VISIBLE,
  INDEX `fk_wishlist_product_idx` (`product_id` ASC) VISIBLE,
  CONSTRAINT `fk_wishlist_member`
    FOREIGN KEY (`member_id`)
    REFERENCES `todayart`.`member` (`member_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_wishlist_product`
    FOREIGN KEY (`product_id`)
    REFERENCES `todayart`.`product` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;



CREATE TABLE IF NOT EXISTS `todayart`.`pg_kakaopay` (
`aid` varchar(20),
`tid` varchar(20),
`cid` varchar(10),
`sid` varchar(20),
`partner_order_id` int(11),
`partner_user_id` int(11),
`amount` json,
`card_info` json,
`item_name` varchar(100),
`item_code` varchar(100),
`quantity` int,
`created_at` datetime,
`approved_at` datetime,
`payload` varchar(255),
  PRIMARY KEY (`aid`),
  INDEX `fk_kakao_tid_idx` (`tid` ASC) VISIBLE,
  INDEX `fk_kakao_order_idx` (`partner_order_id` ASC) VISIBLE,
  INDEX `fk_kakao_user_id` (`partner_user_id` ASC) VISIBLE,
  CONSTRAINT `fk_kakao_order`
    FOREIGN KEY (`partner_order_id`)
    REFERENCES `todayart`.`ordered` (`ordered_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_kakao_user`
    FOREIGN KEY (`partner_user_id`)
    REFERENCES `todayart`.`member` (`member_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `todayart`.`email_verify`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `todayart`.`email_verify` (
  `verify_id` INT(11) NOT NULL AUTO_INCREMENT,
  `member_id` INT(11) NOT NULL,
  `type` VARCHAR(255) NOT NULL,
  `expire_dated` DATETIME not NULL,
  `verify_text` TEXT not NULL,
  PRIMARY KEY (`verify_id`),
  INDEX `fk_emailVerify_member_idx` (`member_id` ASC) VISIBLE,
  CONSTRAINT `fk_emailVerify_member`
    FOREIGN KEY (`member_id`)
    REFERENCES `todayart`.`member` (`member_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;