


-- 2 학사관리 db 구축 
/*

create database 학사관리_db;
CREATE USER '학사관리_db'@'localhost' IDENTIFIED BY '학사관리_db';
GRANT ALL PRIVILEGES ON 학사관리_db.* to 학사관리_db@localhost;
FLUSH PRIVILEGES;


SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema 학사관리_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema 학사관리_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `학사관리_db` DEFAULT CHARACTER SET utf8 ;
USE `학사관리_db` ;

-- -----------------------------------------------------
-- Table `학사관리_db`.`학과`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `학사관리_db`.`학과` (
  `학과번호` INT NOT NULL AUTO_INCREMENT,
  `학과명` VARCHAR(45) NOT NULL,
  `학과전화번호` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`학과번호`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `학사관리_db`.`학생`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `학사관리_db`.`학생` (
  `학생번호` INT NOT NULL AUTO_INCREMENT,
  `학생이름` VARCHAR(45) NOT NULL,
  `학생주민번호` VARCHAR(45) NOT NULL,
  `학생주소` VARCHAR(45) NOT NULL,
  `학생전화번호` VARCHAR(45) NOT NULL,
  `학생이메일` VARCHAR(45) NOT NULL,
  `학과번호` INT NOT NULL,
  PRIMARY KEY (`학생번호`),
  INDEX `fk_학생_학과1_idx` (`학과번호` ASC) VISIBLE,
  CONSTRAINT `fk_학생_학과1`
    FOREIGN KEY (`학과번호`)
    REFERENCES `학사관리_db`.`학과` (`학과번호`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `학사관리_db`.`교수`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `학사관리_db`.`교수` (
  `교수번호` INT NOT NULL AUTO_INCREMENT,
  `교수이름` VARCHAR(45) NOT NULL,
  `교수주민번호` VARCHAR(45) NOT NULL,
  `교수주소` VARCHAR(45) NOT NULL,
  `교수전화번호` VARCHAR(45) NOT NULL,
  `교수이메일` VARCHAR(45) NOT NULL,
  `학과번호` INT NOT NULL,
  PRIMARY KEY (`교수번호`),
  INDEX `fk_교수_학과_idx` (`학과번호` ASC) VISIBLE,
  CONSTRAINT `fk_교수_학과`
    FOREIGN KEY (`학과번호`)
    REFERENCES `학사관리_db`.`학과` (`학과번호`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `학사관리_db`.`강좌`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `학사관리_db`.`강좌` (
  `강좌번호` INT NOT NULL AUTO_INCREMENT,
  `강좌명` VARCHAR(45) NOT NULL,
  `취득학점` VARCHAR(45) NOT NULL,
  `강의시간` VARCHAR(45) NULL,
  `강의실정보` VARCHAR(45) NULL,
  `교수번호` INT NOT NULL,
  PRIMARY KEY (`강좌번호`, `교수번호`),
  INDEX `fk_강좌_교수1_idx` (`교수번호` ASC) VISIBLE,
  CONSTRAINT `fk_강좌_교수1`
    FOREIGN KEY (`교수번호`)
    REFERENCES `학사관리_db`.`교수` (`교수번호`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `학사관리_db`.`수강내역`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `학사관리_db`.`수강내역` (
  `출결점수` INT NOT NULL,
  `중간고사점수` VARCHAR(45) NOT NULL,
  `기말고사점수` VARCHAR(45) NOT NULL,
  `기타점수` VARCHAR(45) NOT NULL,
  `총점` VARCHAR(45) NOT NULL,
  `평점` VARCHAR(45) NOT NULL,
  `강좌번호` INT NOT NULL,
  `교수번호` INT NOT NULL,
  `학생번호` INT NOT NULL,
  PRIMARY KEY (`출결점수`, `교수번호`, `학생번호`, `총점`, `평점`, `강좌번호`),
  INDEX `fk_수강내역_강좌1_idx` (`강좌번호` ASC, `교수번호` ASC) VISIBLE,
  INDEX `fk_수강내역_학생1_idx` (`학생번호` ASC) VISIBLE,
  CONSTRAINT `fk_수강내역_강좌1`
    FOREIGN KEY (`강좌번호` , `교수번호`)
    REFERENCES `학사관리_db`.`강좌` (`강좌번호` , `교수번호`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_수강내역_학생1`
    FOREIGN KEY (`학생번호`)
    REFERENCES `학사관리_db`.`학생` (`학생번호`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `학사관리_db`.`담당`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `학사관리_db`.`담당` (
  `학년/학기` VARCHAR(5) NOT NULL,
  `교수번호` INT NULL,
  `학생번호` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`학생번호`),
  INDEX `fk_담당_교수1_idx` (`교수번호` ASC) VISIBLE,
  INDEX `fk_담당_학생1_idx` (`학생번호` ASC) VISIBLE,
  CONSTRAINT `fk_담당_교수1`
    FOREIGN KEY (`교수번호`)
    REFERENCES `학사관리_db`.`교수` (`교수번호`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_담당_학생1`
    FOREIGN KEY (`학생번호`)
    REFERENCES `학사관리_db`.`학생` (`학생번호`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
*/






 -- 3번  구현된 데이터베이스에 자료 입력
/*
insert into 학생(학생번호,학생이름,학생주민번호,학생주소,학생전화번호,학생이메일,학과번호)
values(
		   '1',
		   '강매성',
           '980225-1144171',
           '연수동 592',
           '010-4477-2255',
           'rkdaotjd@naver.com',
           '2042'
           );
 
 
 insert into 학생(학생이름,학생주민번호,학생주소,학생전화번호,학생이메일,학과번호)
values(
		   '고효준',
           '970227-1354871',
           '인천 능허대로 570',
           '010-6547-2185',
           '고효준@naver.com',
           '2042'
           );
 
insert into 학생(학생이름,학생주민번호,학생주소,학생전화번호,학생이메일,학과번호)
values(
		 
		   '김건우',
           '940425-1371171',
           '연수구 원인재로 71',
           '010-7531-7525',
           'rlarjsdn@naver.com',
           '7080'
           
           );


           
insert into 학생(학생이름,학생주민번호,학생주소,학생전화번호,학생이메일,학과번호)
values(
		 
		   '김도현',
           '970805-1140282',
           '동춘동 801-12',
           '010-9512-2825',
           'rlaehgus@naver.com',
           '7080'
           
           );
           
insert into 학생(학생이름,학생주민번호,학생주소,학생전화번호,학생이메일,학과번호)
values(
		
		   '김상수',
           '990905-1180718',
           '송도동 149 ',
           '010-8523-1741',
           '김상수@naver.com',
           '4'
           );
           
insert into 학생(학생이름,학생주민번호,학생주소,학생전화번호,학생이메일,학과번호)
values(
		   '김정빈',
           '980723-1144231',
           '연수동 592',
           '010-5241-6374',
           'rlaqjwdlqs@naver.com',
           '4'
           );
           
insert into 학생(학생이름,학생주민번호,학생주소,학생전화번호,학생이메일,학과번호)
values(
		 
		   '김주온',
           '965031-1144375',
           '문학동 3680-10',
           '010-3574-2754',
           'rlawndhs@naver.com',
			'4'
           );
           
insert into 학생(학생이름,학생주민번호,학생주소,학생전화번호,학생이메일,학과번호)
values(
		   
		   '김태훈',
           '971425-1145378',
           '학익동 239-13',
           '010-4196-7354',
           'rlaxogns@naver.com',
           '4'
           
           );
           
insert into 학생(학생이름,학생주민번호,학생주소,학생전화번호,학생이메일,학과번호)
values(
		 
		   '김택형',
           '950715-1143754',
           '옥련동 462-13',
           '010-3825-7419',
           'rlaxorgud@naver.com',
           '4'
           
           );
           
insert into 학생(학생이름,학생주민번호,학생주소,학생전화번호,학생이메일,학과번호)
values(
	
		   '문승원',
           '940721-1147841',
           '송도동 173',
           '010-2267-8070',
           'anstmddnjs@naver.com',
           '4'
           
           );
           
           
           
select *
from 학생;








insert into 교수
values(
	
		   '1',
           '고준우',
           '800721-1147241',
           '송도동 234',
           '010-2827-1070',
           'rhwnsdn@naver.com',
           '4'
           
           );


insert into 교수(교수이름,교수주민번호,교수주소,교수전화번호,교수이메일,학과번호)
values(
	
	
           '안승훈',
           '800321-1234541',
           '방배동 271',
           '010-2765-1370',
           'dkstmdgns@naver.com',
           '4'
           
           );

insert into 교수(교수이름,교수주민번호,교수주소,교수전화번호,교수이메일,학과번호)
values(
	
	
           '풍민하',
           '760721-2175241',
           '원인재로 43',
           '010-8120-3167',
           'vndalsfgk@naver.com',
           '2042'
           
           );
           
insert into 교수(교수이름,교수주민번호,교수주소,교수전화번호,교수이메일,학과번호)
values(
	
	
           '장순재',
           '780721-1176224',
           '독배로 961',
           '010-8762-3479',
           'wkdtnswo@naver.com',
           '2042'
           );
           
insert into 교수(교수이름,교수주민번호,교수주소,교수전화번호,교수이메일,학과번호)
values(
	
	
           '전경석',
           '810721-1176224',
           '투모로 357',
           '010-3915-1648',
           'wjsrudtjr@naver.com',
           '7080'
           );


select *
from 교수;

insert into 강좌(강좌번호,강좌명,취득학점,강의시간,강의실정보,교수번호)
values(
           '56',
           'c++ 기초',
           '4',
           '2',
           '공학관 302호',
           '2'
           );

insert into 강좌(강좌명,취득학점,강의시간,강의실정보,교수번호)
values(
         
           '리눅스 프로그래밍',
           '4',
           '3',
           '공학관 307호',
           '1'
           );
           
insert into 강좌(강좌명,취득학점,강의시간,강의실정보,교수번호)
values(
           '말하기와 글쓰기',
           '2',
           '2',
           '공학관 502호',
           '5'
           );
           
insert into 강좌(강좌명,취득학점,강의시간,강의실정보,교수번호)
values(
	
           '회로이론',
           '4',
           '3',
           '공학관 402호',
           '4'
           );




select *
from 강좌;



insert into 수강내역
values(
			'10',
            '30',
            '40',
            '20',
            '100',
            'A+',
            '56',
            '2',
            '10'
           );
           


insert into 수강내역
values(
			'10',
            '25',
            '30',
            '20',
            '85',
            'A',
            '56',
            '2',
            '9'
           );
           
insert into 수강내역
values(
			'5',
            '15',
            '20',
            '10',
            '50',
            'D-',
            '56',
            '2',
            '8'
           );
           
insert into 수강내역
values(
			'10',
            '20',
            '40',
            '15',
            '85',
            'A',
            '57',
            '1',
            '7'
           );
insert into 수강내역
values(
			'10',
            '20',
            '30',
            '20',
            '80',
            'B',
            '57',
            '1',
            '6'
           );
           
insert into 수강내역
values(
			'10',
            '30',
            '40',
            '20',
            '100',
            'A+',
            '58',
            '5',
            '5'
           );
           
insert into 수강내역
values(
			'10',
            '20',
            '30',
            '10',
            '70',
            'C',
            '59',
            '4',
            '2'
           );
           
insert into 수강내역
values(
			'2',
            '10',
            '10',
            '10',
            '32',
            'F',
            '59',
            '4',
            '1'
           );
           
select *
from 수강내역;


insert into 학과
value(
			'4',
            '컴퓨터학과',
            '02-828-4351'
		);

insert into 학과
value(
			'2042',
            '디지털전자과',
            '02-828-4357'
		);
        
insert into 학과
value(
			'7080',
            '경영학과',
            '02-828-4325'
		);




select * 
from 학과;


insert into 담당
value(
			'3 -1',
            '2',
            '10'
		);
        
insert into 담당
value(
			'3-1',
            '2',
            '9'
		);

insert into 담당
value(
			'3-1',
            '2',
            '8'
		);

insert into 담당
value(
			'2-1',
            '2',
            '7'
		);

insert into 담당
value(
			'1-1',
            '1',
            '6'
		);

insert into 담당
value(
			'1-1',
            '1',
            '5'
		);

insert into 담당
value(
			'2-1',
            '5',
            '4'
		);

insert into 담당
value(
			'2-1',
            '5',
            '3'
		);

insert into 담당
value(
			'3-1',
            '3',
            '2'
		);

insert into 담당
value(
			'1-1',
            '4',
            '1'
		);


select * 
from 담당;
*/






-- 4번 수강하지 않은 학생의 명단 출력 
/*
select 학생번호,학생이름
from 학생
where 학생번호 between 3 and 4;
*/

-- 5번 교수별 담당학생 명단 출력 
/*
select 교수.교수번호,교수.교수이름,학생.학생번호,학생.학생이름
from 교수,담당,학생
where 교수.교수번호=담당.교수번호
and 학생.학생번호=담당.학생번호;
*/

-- 6 학과명이 컴퓨터학과인 자료의 학과번호와 학과명을 각각 0111,컴퓨터공학과로 변경
/*
update 학과 set 학과번호='0111'
where 학과번호='4';

update 학과 set 학과명='컴퓨터공학과'
where 학과명='컴퓨터학과';

update 학생 set 학과번호='0111'
where 학과번호='4';

update 교수 set 학과번호='0111'
where 학과번호='4';


select * 
from 학과;

select * 
from 학생;

select * 
from 교수;
*/


--   7 강좌를 진행하지 않는 교수 관련 데이터 제거
/*
delete from 교수 
where 교수이름 = '풍민하';

delete from 담당 
where 교수번호 = 3;

select * 
from 담당;

select * 
from 교수;
*/




/*
drop database if exists 학사관리_db;
drop user if exists '학사관리_db'@'localhost';
*/