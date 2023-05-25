-- 업로드 게시물 테이블
DROP TABLE CSATTACH;
CREATE TABLE CSATTACH (
    ATTACH_NO       NUMBER NOT NULL,              
    PATH            VARCHAR2(300 BYTE) NOT NULL,  
    ORIGIN_NAME     VARCHAR2(300 BYTE) NOT NULL,  
    FILESYSTEM_NAME VARCHAR2(50 BYTE) NOT NULL,   
    DOWNLOAD_COUNT  NUMBER,                       
    HAS_THUMBNAIL   NUMBER,                       
    QNA_NO        NUMBER                        
);



-- CS QNA 게시판 -- OK
-- 비회원 안할건데, 비밀번호 글 구현을 할수 있는지 마는지.
-- CSQNA_PW            VARCHAR2(4 BYTE), -- 제거
-- 계층 게시판 
DROP TABLE QNA;
-- 답변이 달리면 , 이메일전송  코드 :  EMAIL               VARCHAR2(100 BYTE), -- USER의 이메일 필요
CREATE TABLE QNA (
    QNA_NO            NUMBER NOT NULL, -- 게시글번호
    ID                  VARCHAR2(40 BYTE), -- USER의 ID
    EMAIL               VARCHAR2(100 BYTE),
    QNA_CATEGORY      VARCHAR2(100 BYTE) NOT NULL, -- QNA 카테고리 : 결제문의, 포인트문의, 일반문의 등
    QNA_TITLE         VARCHAR2(1000 BYTE) NOT NULL, -- 제목
    QNA_CONTENT       CLOB, -- 내용
    QNA_CREATED_AT    TIMESTAMP, -- 작성일자                    
    QNA_MODIFIED_AT   TIMESTAMP, -- 수정일자
    QNA_SECRET        VARCHAR2(10 BYTE), -- 비밀글 생년월일 끌어와서 쓸거임
    QNA_IP                  VARCHAR2(30 BYTE) NOT NULL,
    QNA_STATE               NUMBER(1) NOT NULL,           /* 정상:1, 삭제:0 */
    QNA_DEPTH               NUMBER(2) NOT NULL,           /* 원글:0, 1차댓글:1, 2차댓글:2, ... */
    QNA_GROUP_NO            NUMBER NOT NULL,            /* 원글과 모든 댓글은 같은 GROUP_NO, 원글:BBS_NO, 댓글:원글의 BBS_NO */
    QNA_GROUP_ORDER         NUMBER NOT NULL         /* 동일 그룹 내 표시 순서 */
);

-- CS FAQ 게시판 --
DROP TABLE FAQ;
CREATE TABLE FAQ ( 
    FAQ_NO          NUMBER NOT NULL,
    FAQ_CATEGORY    VARCHAR2(100 BYTE) NOT NULL,
    FAQ_TITLE       VARCHAR2(1000 BYTE) NOT NULL,
    FAQ_WRITER      VARCHAR2(30 BYTE) NOT NULL,
    FAQ_CONTENT     CLOB, -- 내용
    FAQ_CREATED_AT  TIMESTAMP, -- 작성일자   
    FAQ_HIT         NUMBER NOT NULL
);

-- CS NOTICE 게시판 --
DROP TABLE NOTICE;
CREATE TABLE NOTICE ( 
    NOTICE_NO          NUMBER NOT NULL,
    NOTICE_CATEGORY    VARCHAR2(100 BYTE) NOT NULL,
    NOTICE_TITLE       VARCHAR2(1000 BYTE) NOT NULL,
    NOTICE_WRITER      VARCHAR2(30 BYTE) NOT NULL,
    NOTICE_CONTENT     CLOB,
    NOTICE_CREATED_AT  TIMESTAMP,
    NOTICE_HIT         NUMBER NOT NULL
);

-- 기본키
ALTER TABLE CSATTACH
    ADD CONSTRAINT PK_CSATTACH
           PRIMARY KEY(ATTACH_NO);
           
ALTER TABLE QNA
    ADD CONSTRAINT PK_QNA
           PRIMARY KEY(QNA_NO);
           
ALTER TABLE FAQ
    ADD CONSTRAINT PK_FAQ
           PRIMARY KEY(FAQ_NO);

ALTER TABLE NOTICE
    ADD CONSTRAINT PK_NOTICE
           PRIMARY KEY(NOTICE_NO);
               
               
-- 외래키
ALTER TABLE CSATTACH
    ADD CONSTRAINT FK_CSATTACH_QNA
           FOREIGN KEY(QNA_NO) REFERENCES QNA(QNA_NO)
            ON DELETE CASCADE;


--
--
--
--

ALTER TABLE QNA
    ADD CONSTRAINT FK_USER_T_ID
           FOREIGN KEY(USER_T_ID) REFERENCES USER_T(ID)
            ON DELETE CASCADE;

-- 시퀀스
DROP SEQUENCE CSATTACH_SEQ;
CREATE SEQUENCE CSATTACH_SEQ NOCACHE;

DROP SEQUENCE QNA_SEQ;
CREATE SEQUENCE QNA_SEQ NOCACHE;

DROP SEQUENCE FAQ_SEQ;
CREATE SEQUENCE FAQ_SEQ NOCACHE;

DROP SEQUENCE NOTICE_SEQ;
CREATE SEQUENCE NOTICE_SEQ NOCACHE;





