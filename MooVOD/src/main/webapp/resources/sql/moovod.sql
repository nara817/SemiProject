------------------------------ITEM 드랍

DROP TABLE ITEM_COUPON;
DROP TABLE ITEM_PURCHASE;
DROP TABLE ITEM_ORDER;
DROP TABLE ITEM_COUPON_LIST;
DROP TABLE ITEM_CART;
DROP TABLE ITEM_IMG;
DROP TABLE ITEM;


----------고객센터 드랍 테이블
DROP TABLE QCOMMENT;
DROP TABLE SUMMERNOTE_NIMAGE;
DROP TABLE SUMMERNOTE_QIMAGE;
DROP TABLE NOTICE;
DROP TABLE FAQ;
DROP TABLE QNA;





-- DROP REVIEW_FREE TABLE
DROP TABLE FREE_GOOD;
DROP TABLE FREE_COMMENT;
DROP TABLE FREE_ATTACH;
DROP TABLE FREE;
DROP TABLE REVIEWS_ATTACH;
DROP TABLE REVIEWS;


-- VOD드랍 테이블
DROP TABLE VOD_PURCHASE; -- 구매내역 테이블
DROP TABLE VOD_USER_COUPON; -- VOD 유저 쿠폰 리스트
DROP TABLE VOD_COUPON_LIST; -- VOD 쿠폰 리스트
DROP TABLE VOD_ZZIM;        -- VOD 찜 리스트
DROP TABLE VOD; -- 영화 테이블

-- USER 드랍 테이블
DROP TABLE SLEEP_USER_T;
DROP TABLE LEAVE_USER_T;
DROP TABLE USER_ACCESS_T;
DROP TABLE USER_T;









-- 회원 USER
CREATE TABLE USER_T (
    USER_NO        NUMBER             NOT NULL,         -- PK
    ID             VARCHAR2(40 BYTE)  NOT NULL UNIQUE,  -- ID 정규식에 반영
    PW             VARCHAR2(64 BYTE)  NOT NULL,         -- SHA-256 암호화 방식 사용
    NAME           VARCHAR2(40 BYTE),                   -- 이름
    GENDER         VARCHAR2(2 BYTE),                    -- M, F, NO
    EMAIL          VARCHAR2(100 BYTE) NOT NULL UNIQUE,  -- 이메일
    MOBILE         VARCHAR2(15 BYTE),                   -- 하이픈 제외(-) 후 저장
    BIRTHYEAR      VARCHAR2(4 BYTE),                    -- 출생년도(YYYY)
    BIRTHDATE      VARCHAR2(4 BYTE),                    -- 출생월일(MMDD)
    POSTCODE       VARCHAR2(5 BYTE),                    -- 우편번호
    ROAD_ADDRESS   VARCHAR2(100 BYTE),                  -- 도로명주소
    JIBUN_ADDRESS  VARCHAR2(100 BYTE),                  -- 지번주소
    DETAIL_ADDRESS VARCHAR2(100 BYTE),                  -- 상세주소
    EXTRA_ADDRESS  VARCHAR2(100 BYTE),                  -- 참고항목
    AGREECODE      NUMBER             NOT NULL,         -- 동의여부(0:필수, 1:위치, 2:이벤트, 3:위치+이벤트)
    JOINED_AT      DATE,                                -- 가입일
    PW_MODIFIED_AT DATE,                                -- 비밀번호변경일
    AUTOLOGIN_ID   VARCHAR2(32 BYTE),                   -- 자동로그인할 때 사용하는 ID(SESSION_ID를 사용함)
    AUTOLOGIN_EXPIRED_AT DATE                           -- 자동로그인 만료일
);

-- 회원 접속 기록(회원마다 마지막 로그인 날짜 1개만 기록)
CREATE TABLE USER_ACCESS_T (
    ID            VARCHAR2(40 BYTE) NOT NULL UNIQUE,    -- 로그인한 사용자 ID
    LAST_LOGIN_AT DATE                                  -- 마지막 로그인 날짜
);

-- 탈퇴 (탈퇴한 아이디로 재가입이 불가능)
CREATE TABLE LEAVE_USER_T (
    ID        VARCHAR2(40 BYTE)  NOT NULL UNIQUE,
    EMAIL     VARCHAR2(100 BYTE) NOT NULL UNIQUE,
    JOINED_AT DATE,  -- 가입일
    LEAVED_AT DATE   -- 탈퇴일
);

-- 휴면 (1년 이상 로그인을 안하면 휴면 처리)
CREATE TABLE SLEEP_USER_T (
    USER_NO        NUMBER             NOT NULL,
    ID             VARCHAR2(40 BYTE)  NOT NULL UNIQUE,  -- ID 정규식에 반영
    PW             VARCHAR2(64 BYTE)  NOT NULL,         -- SHA-256 암호화 방식 사용
    NAME           VARCHAR2(40 BYTE),                   -- 이름
    GENDER         VARCHAR2(2 BYTE),                    -- M, F, NO
    EMAIL          VARCHAR2(100 BYTE) NOT NULL UNIQUE,  -- 이메일
    MOBILE         VARCHAR2(15 BYTE),                   -- 하이픈 제외(-) 후 저장
    BIRTHYEAR      VARCHAR2(4 BYTE),                    -- 출생년도(YYYY)
    BIRTHDATE      VARCHAR2(4 BYTE),                    -- 출생월일(MMDD)
    POSTCODE       VARCHAR2(5 BYTE),                    -- 우편번호
    ROAD_ADDRESS   VARCHAR2(100 BYTE),                  -- 도로명주소
    JIBUN_ADDRESS  VARCHAR2(100 BYTE),                  -- 지번주소
    DETAIL_ADDRESS VARCHAR2(100 BYTE),                  -- 상세주소
    EXTRA_ADDRESS  VARCHAR2(100 BYTE),                  -- 참고항목
    AGREECODE      NUMBER             NOT NULL,         -- 동의여부(0:필수, 1:위치, 2:이벤트, 3:위치+이벤트)
    JOINED_AT      DATE,                                -- 가입일
    PW_MODIFIED_AT DATE,                                -- 비밀번호변경일
    SLEPT_AT       DATE                                 -- 휴면일
);


----------------------------------------------VOD 테이블

CREATE TABLE VOD (
	VOD_NO	        NUMBER		NOT NULL,
	VOD_TITLE	    CLOB		NOT NULL,
	VOD_CONTENT	    CLOB,
	VOD_DATE	    DATE,
	VOD_PRICE   	NUMBER,
	VOD_STAR	    NUMBER,
	VOD_ACTOR	    CLOB,
	VOD_DIRECTOR	CLOB,
	VOD_CATEGORY	VARCHAR2(100 BYTE),
	VOD_COMPANY	    VARCHAR2(100 BYTE),
	VOD_PHOTO	    CLOB,
	VOD_YOUTUBE	    CLOB,
    VOD_SHOT        CLOB
);

       
-- 유저가 구매 완료 할 경우 저장 되는 테이블       

CREATE TABLE VOD_PURCHASE(
 PURCHASE_NO NUMBER NOT NULL,   -- PK
 ID VARCHAR2(40 BYTE), -- USER에 FK 탈퇴 시 NULL로 남기기 (구매 내역은 남아야함.. 맘 같아선 ID도 남기고 싶음)
 VOD_NO NUMBER,                 -- VOD FK영화 삭제 시 남겨야함 NULL? 아니면 그 번호 그대로??
 PURCHASE_DATE DATE,
 PURCHASE_SALE NUMBER,
 PURCHASE_LAST_PRICE NUMBER
);


-- VOD 전체 쿠폰 리스트

CREATE TABLE VOD_COUPON_LIST(
    COUPON_NAME VARCHAR2(100 BYTE) NOT NULL,
    COUPON_SALE NUMBER NOT NULL,
    COUPON_END DATE
);	  

-- 유저가 보유한 쿠폰

CREATE TABLE VOD_USER_COUPON(
    USER_COUPON_NO NUMBER NOT NULL,
    COUPON_NAME VARCHAR2(100 BYTE), -- VOD_COUPON_LIST에 COUPON_NAME의 FK임 쿠폰 삭제 되면 유저 쿠폰도 삭제
    ID VARCHAR2(40 BYTE),           -- USER ID의 FK 유저 삭제 되면 쿠폰들 삭제
    COUPON_USE NUMBER
);

           
-- 유저가 찜 눌렀을 경우 찜한 정보가 저장되는 테이블 (이 테이블의 VOD_NO를 이용해 찜 갯수 구하기)

CREATE TABLE VOD_ZZIM(
    ZZIM_NO NUMBER NOT NULL,
    VOD_NO NUMBER,         -- VOD의 FK 영화 삭제 되면 찜도 삭제
    ID VARCHAR2(40 BYTE)   -- USER의 FK 영화 삭제 되면 찜 목록도 삭제
);


------------------------------------------------------------------------------------------------ 리뷰게시판 테이블

CREATE TABLE REVIEWS(
    REVIEW_NO           NUMBER NOT NULL,            -- PK
    VOD_NO              NUMBER NOT NULL,  --FK(VOD TABLE)
    REVIEW_TITLE        VARCHAR2(1000 BYTE) NOT NULL,
    ID                 VARCHAR2(40 BYTE) NOT NULL,  --FK (USER TABLE)
    REVIEW_CONTENT      CLOB,
    REVIEW_CREATED_AT   TIMESTAMP,                     
    REVIEW_MODIFIED_AT  TIMESTAMP,
    REVIEW_HITS         NUMBER DEFAULT 0 NOT NULL,
    REVIEW_STAR         NUMBER NOT NULL
    
);

-- 첨부 파일 정보 테이블

CREATE TABLE REVIEWS_ATTACH (
    REVIEW_ATTACH_NO       NUMBER NOT NULL,              -- PK
    REVIEW_PATH            VARCHAR2(300 BYTE) NOT NULL,  -- 첨부 파일 경로
    REVIEW_ORIGIN_NAME     VARCHAR2(300 BYTE) NOT NULL,  -- 첨부 파일의 원래 이름
    REVIEW_FILESYSTEM_NAME VARCHAR2(50 BYTE) NOT NULL,   -- 첨부 파일의 저장 이름
    REVIEW_DOWNLOAD_COUNT  NUMBER,                       -- 다운로드 횟수
    REVIEW_HAS_THUMBNAIL   NUMBER,                       -- 썸네일이 있으면 1, 없으면 0
    REVIEW_NO       NUMBER  -- 리뷰게시판 FK (REVIEW TABLE)
);


-- 자유게시판

CREATE TABLE FREE (
    FREE_NO           NUMBER NOT NULL,              -- PK
    FREE_CATEGORY      VARCHAR2(100 BYTE) NOT NULL,
    FREE_TITLE        VARCHAR2(1000 BYTE) NOT NULL,
    ID                 VARCHAR2(40 BYTE) NOT NULL,  --FK (USER TABLE)
    FREE_CONTENT      CLOB NOT NULL,                   
    FREE_CREATED_AT   TIMESTAMP NOT NULL,                     
    FREE_MODIFIED_AT  TIMESTAMP NOT NULL,
    FREE_HITS         NUMBER DEFAULT 0 NOT NULL,
    FREE_STAR         NUMBER NOT NULL
    
);
-- 자유게시판 첨부파일 테이블

CREATE TABLE FREE_ATTACH (
    FREE_ATTACH_NO       NUMBER NOT NULL,              -- PK
    FREE_PATH            VARCHAR2(300 BYTE) NOT NULL,  -- 첨부 파일 경로
    FREE_ORIGIN_NAME     VARCHAR2(300 BYTE) NOT NULL,  -- 첨부 파일의 원래 이름
    FREE_FILESYSTEM_NAME VARCHAR2(50 BYTE) NOT NULL,   -- 첨부 파일의 저장 이름
    FREE_DOWNLOAD_COUNT  NUMBER,                       -- 다운로드 횟수
    FREE_HAS_THUMBNAIL   NUMBER,                       -- 썸네일이 있으면 1, 없으면 0
    FREE_NO              NUMBER NOT NULL               -- FK(FREE TABLE)
);


--  댓글 (1단 계층형, 대댓글 불가한 형태)

CREATE TABLE FREE_COMMENT (
    FREE_COMMENT_NO NUMBER NOT NULL,  -- PK
    FREE_CONTENT    VARCHAR2(4000 BYTE) NOT NULL,
    FREE_STATE      NUMBER,    -- 정상 1, 삭제 -1
    FREE_DEPTH      NUMBER,    -- 댓글 0, 댓글에 달린 댓글 1
    FREE_GROUP_NO   NUMBER,    -- 댓글과 댓글에 달린 댓글은 같은 그룹
    FREE_CREATED_AT DATE,
    FREE_NO    NUMBER,    -- FK(FREE TABLE)
    ID         VARCHAR2(40 BYTE) NOT NULL     -- FK(USER TABLE)
);

-- 좋아요 테이블

CREATE TABLE FREE_GOOD (
    ID  VARCHAR2(40 BYTE) NOT NULL,  -- FK(USER TABLE)
    FREE_NO   NUMBER,  -- FK(FREE TABLE)
    MARKED_AT DATE
);


--------------------------------------------------------------------------고객센터 테이블 생성
-- 테이블
CREATE TABLE SUMMERNOTE_QIMAGE (
    FILESYSTEM_NAME VARCHAR2(50 BYTE),
    QNA_NO         NUMBER  -- FK (QNA TABLE)                    
);

CREATE TABLE SUMMERNOTE_NIMAGE (
    FILESYSTEM_NAME VARCHAR2(50 BYTE),
    NOTICE_NO         NUMBER  -- FK (NOTICE TABLE)                                  
);

CREATE TABLE QNA ( -- 업로드O -- 비밀글 칼럼넣어야하는데.. 어떻게해야하는지 모르겠어요
    QNA_NO          NUMBER NOT NULL,
    CATEGORY        VARCHAR2(30   BYTE) NOT NULL,
    TITLE           VARCHAR2(300 BYTE) NOT NULL,
    CONTENT         CLOB,
    CREATED_AT      TIMESTAMP,
    MODIFIED_AT     TIMESTAMP,               
    HIT             NUMBER NOT NULL,
    SECRET          NUMBER(1) NOT NULL,
    ID              VARCHAR2(40 BYTE)  -- 나라테이블 회원정보 -- FK (USER TABLE)      
    
);

CREATE TABLE NOTICE ( --업로드O
    NOTICE_NO     NUMBER NOT NULL, 
    CATEGORY      VARCHAR2(30    BYTE) NOT NULL, 
    TITLE         VARCHAR2(1000  BYTE) NOT NULL, 
    CONTENT       CLOB, 
    CREATED_AT    TIMESTAMP,                    
    MODIFIED_AT   TIMESTAMP,
    HIT           NUMBER NOT NULL,
    ID             VARCHAR2(40 BYTE)  -- FK (USER TABLE) 
    
);

CREATE TABLE FAQ ( -- 업로드X -- 단독 별거없는 테이블임
    FAQ_NO        NUMBER NOT NULL, 
    CATEGORY      VARCHAR2(30    BYTE) NOT NULL,
    TITLE         VARCHAR2(1000  BYTE) NOT NULL, 
    CONTENT       CLOB, 
    CREATED_AT    TIMESTAMP,                    
    MODIFIED_AT   TIMESTAMP,
    HIT           NUMBER NOT NULL,
    ID             VARCHAR2(40 BYTE)  -- FK (USER TABLE) 
);

CREATE TABLE QCOMMENT (
    QCOMMENT_NO NUMBER NOT NULL,
    CONTENT    VARCHAR2(4000 BYTE) NOT NULL,
    STATE      NUMBER,    -- 정상 1, 삭제 -1
    DEPTH      NUMBER,    -- 댓글 0, 댓글에 달린 댓글 1
    GROUP_NO   NUMBER,    -- 댓글과 댓글에 달린 댓글은 같은 그룹
    CREATED_AT DATE,
    QNA_NO     NUMBER,    -- FK (QNA TABLE) 
    ID             VARCHAR2(40 BYTE)     -- FK (USER TABLE) 
);



--------------------------------------------ITEM 테이블 생성

CREATE TABLE ITEM(
    ITEM_ID NUMBER NOT NULL,
    ITEM_NAME VARCHAR2(50 BYTE),
    ITEM_PRICE NUMBER,
    ITEM_INFO VARCHAR2(200 BYTE),
    ITEM_CATEGORY VARCHAR2(200 BYTE)
);

CREATE TABLE ITEM_IMG(
    ITEM_IMG VARCHAR2(200 BYTE),
    ITEM_ID NUMBER
);


CREATE TABLE ITEM_CART(
    CART_ID NUMBER,
    ID VARCHAR2(40 BYTE),
    ITEM_ID NUMBER,
    AMOUNT NUMBER
);

CREATE TABLE ITEM_PURCHASE(
    PURCHASE_ID NUMBER,
    ORDER_ID NUMBER,
    ITEM_ID NUMBER,
    QUANTITY NUMBER
);

CREATE TABLE ITEM_ORDER(
    ORDER_ID NUMBER,
    ITEM_COUPON_NO NUMBER,
    ID VARCHAR2(40 BYTE),
    ORDER_DATE DATE,
    SHIP_NAME VARCHAR2(50 BYTE),
    SHIP_ZIPCODE VARCHAR2(50 BYTE),
    SHIP_ADDRESS VARCHAR2(100 BYTE),
    SHIP_DETAIL VARCHAR2(100 BYTE)
);

CREATE TABLE ITEM_COUPON(
    USER_COUPON_NO NUMBER,
    ID VARCHAR2(40 BYTE),
    ITEM_COUPON_NO NUMBER,
    ITEM_COUPON_USE NUMBER
);

CREATE TABLE ITEM_COUPON_LIST(
    ITEM_COUPON_NO NUMBER,
    ITEM_COUPON_SALE NUMBER,
    ITEM_COUPON_END DATE,
    COUPON_NAME VARCHAR2(50 BYTE)
);













----------------------------------- USER 기본키
-- USER_TABLE PK
ALTER TABLE USER_T
    ADD CONSTRAINT PK_USER
        PRIMARY KEY(USER_NO);
        
------------------------------------ VOD 기본키 
-- VOD 테이블의 PK
ALTER TABLE VOD
    ADD CONSTRAINT PK_VOD
        PRIMARY KEY(VOD_NO);
-- VOD_PURCHASE 테이블의 PK
ALTER TABLE VOD_PURCHASE
    ADD CONSTRAINT PK_VOD_PURCHASE
        PRIMARY KEY(PURCHASE_NO); 
-- VOD 쿠폰 전체 리스트 기본 키
ALTER TABLE VOD_COUPON_LIST
    ADD CONSTRAINT PK_VOD_COUPON_LIST
        PRIMARY KEY(COUPON_NAME);
-- VOD_USER_COUPON 유저가 보유한 쿠폰 번호 PK
ALTER TABLE VOD_USER_COUPON
    ADD CONSTRAINT PK_VOD_USER_COUPON
        PRIMARY KEY(USER_COUPON_NO);        
-- 찜 PK
ALTER TABLE VOD_ZZIM
    ADD CONSTRAINT PK_VOD_ZZIM
        PRIMARY KEY(ZZIM_NO);
        
        
---------------------------------REVIEW_FREE 기본키


-- REVIEWS_TABLE
ALTER TABLE REVIEWS
ADD CONSTRAINT PK_REVIEWS PRIMARY KEY (REVIEW_NO);

-- REVIEWS_ATTACH_TABLE
ALTER TABLE REVIEWS_ATTACH
ADD CONSTRAINT PK_REVIEWS_ATTACH PRIMARY KEY (REVIEW_ATTACH_NO);

-- FREE_TABLE
ALTER TABLE FREE
ADD CONSTRAINT PK_FREE PRIMARY KEY (FREE_NO);

-- FREE_COMMENT_TABLE
ALTER TABLE FREE_COMMENT
ADD CONSTRAINT PK_FREE_COMMENT PRIMARY KEY (FREE_COMMENT_NO);

-- FREE_ATTACH_TABLE
ALTER TABLE FREE_ATTACH
ADD CONSTRAINT PK_FREE_ATTACH PRIMARY KEY (FREE_ATTACH_NO);

        
----------------------------------------고객센터 기본키
-- 기본키
ALTER TABLE QNA
    ADD CONSTRAINT PK_QNA
           PRIMARY KEY(QNA_NO);

ALTER TABLE FAQ
    ADD CONSTRAINT PK_FAQ
           PRIMARY KEY(FAQ_NO);

ALTER TABLE NOTICE
    ADD CONSTRAINT PK_NOTICE
           PRIMARY KEY(NOTICE_NO);
           
ALTER TABLE QCOMMENT
    ADD CONSTRAINT PK_QCOMMENT
           PRIMARY KEY(QCOMMENT_NO);
        
        
-------------------------------------------ITEM 기본키
ALTER TABLE ITEM ADD CONSTRAINT PK_ITEM PRIMARY KEY(ITEM_ID);
ALTER TABLE ITEM_IMG ADD CONSTRAINT PK_ITEM_IMG PRIMARY KEY(ITEM_IMG);
ALTER TABLE ITEM_CART ADD CONSTRAINT PK_ITEM_CART PRIMARY KEY(CART_ID);
ALTER TABLE ITEM_PURCHASE ADD CONSTRAINT PK_ITEM_PURCHASE PRIMARY KEY(PURCHASE_ID);
ALTER TABLE ITEM_ORDER ADD CONSTRAINT PK_ITEM_ORDER PRIMARY KEY(ORDER_ID);
ALTER TABLE ITEM_COUPON ADD CONSTRAINT PK_ITEM_COUPON PRIMARY KEY(USER_COUPON_NO);
ALTER TABLE ITEM_COUPON_LIST ADD CONSTRAINT PK_ITEM_COUPON_LIST PRIMARY KEY(ITEM_COUPON_NO);
        
        
        
        

----------------------------------------------USER 외래키
-- USER_ACCESS_T FK
ALTER TABLE USER_ACCESS_T
    ADD CONSTRAINT FK_USER_ACCESS
        FOREIGN KEY(ID) REFERENCES USER_T(ID)
            ON DELETE CASCADE;
--------------------------VOD 외래키


-- 외래키
-- 구매내역 외래키 : ID -> USER 테이블 ID, VOD_NO -> VOD 테이블 VOD_NO, 삭제 할 시 구매내역은 남아야 하기 때문에 널 처리
ALTER TABLE VOD_PURCHASE
    ADD CONSTRAINT FK_PURCHASE_USER
        FOREIGN KEY(ID) REFERENCES USER_T(ID)
            ON DELETE SET NULL;    
ALTER TABLE VOD_PURCHASE
    ADD CONSTRAINT FK_PURCHASE_VOD
        FOREIGN KEY(VOD_NO) REFERENCES VOD(VOD_NO)
            ON DELETE SET NULL;  
-- 유저 쿠폰 보유 리스트 : ID -> USER 테이블 ID, COUPON_NAME ->  테이블 VOD_COUPON_LIST COUPON_NAME 삭제 할 시 유저 쿠폰 내역은 삭제
ALTER TABLE VOD_USER_COUPON
    ADD CONSTRAINT FK_VOD_USERCOUPON_COUPON
        FOREIGN KEY(COUPON_NAME) REFERENCES VOD_COUPON_LIST(COUPON_NAME)
            ON DELETE CASCADE;
ALTER TABLE VOD_USER_COUPON
    ADD CONSTRAINT FK_VOD_USERCOUPON_USER
        FOREIGN KEY(ID) REFERENCES USER_T(ID)
            ON DELETE CASCADE; 
-- 찜 외래키 : ID -> USER ID VOD_NO -> VOD 테이블 , 각각 삭제 될 경우 찜 내역도 삭제
ALTER TABLE VOD_ZZIM
    ADD CONSTRAINT FK_VOD_ZZIM_USER
        FOREIGN KEY(ID) REFERENCES USER_T(ID)
            ON DELETE CASCADE; 
ALTER TABLE VOD_ZZIM
    ADD CONSTRAINT FK_VOD_ZZIM_VOD
        FOREIGN KEY(VOD_NO) REFERENCES VOD(VOD_NO)
            ON DELETE CASCADE;
            


------------------------------------------REVIEW_FREE 외래키

---------------------------------FK
-- REVIEWS_TABLE
ALTER TABLE REVIEWS
ADD CONSTRAINT FK_REVIEWS_VOD
FOREIGN KEY (VOD_NO)
REFERENCES VOD(VOD_NO);
-- REVIEWS_TABLE
ALTER TABLE REVIEWS
ADD CONSTRAINT FK_REVIEWS_USER
FOREIGN KEY (ID)
REFERENCES USER_T(ID);

-- REVIEWS_ATTACH_TABLE
ALTER TABLE REVIEWS_ATTACH
ADD CONSTRAINT FK_REVIEWS_ATTACH_REVIEWS
FOREIGN KEY (REVIEW_NO)
REFERENCES REVIEWS(REVIEW_NO);


-- FREE_TABLE
ALTER TABLE FREE
ADD CONSTRAINT FK_FREE_USER
FOREIGN KEY (ID)
REFERENCES USER_T(ID);

-- FREE_ATTACH_TABLE
ALTER TABLE FREE_ATTACH
ADD CONSTRAINT FK_FREE_ATTACH_FREE
FOREIGN KEY (FREE_NO)
REFERENCES FREE(FREE_NO);

-- FREE_COMMENT_TABLE
ALTER TABLE FREE_COMMENT
ADD CONSTRAINT FK_FREE_COMMENT_FREE
FOREIGN KEY (FREE_NO)
REFERENCES FREE(FREE_NO);
-- FREE_COMMENT_TABLE
ALTER TABLE FREE_COMMENT
ADD CONSTRAINT FK_FREE_COMMENT_USER
FOREIGN KEY (ID)
REFERENCES USER_T(ID);

-- FREE_GOOD TABLE
ALTER TABLE FREE_GOOD
ADD CONSTRAINT FK_FREE_GOOD_USER
FOREIGN KEY (ID)
REFERENCES USER_T(ID);
-- FREE_GOOD TABLE
ALTER TABLE FREE_GOOD
ADD CONSTRAINT FK_FREE_GOOD_FREE
FOREIGN KEY (FREE_NO)
REFERENCES FREE(FREE_NO);


---------------------------------------------- 고객센터 외래키
-- 외래키
ALTER TABLE SUMMERNOTE_QIMAGE
    ADD CONSTRAINT FK_SUMMERNOTE_QIMAGE_QNA
           FOREIGN KEY(QNA_NO) REFERENCES QNA(QNA_NO)
                ON DELETE CASCADE;
            
ALTER TABLE SUMMERNOTE_NIMAGE
    ADD CONSTRAINT FK_SUMMERNOTE_NIMAGE_NOTICE
           FOREIGN KEY(NOTICE_NO) REFERENCES NOTICE(NOTICE_NO)
                ON DELETE CASCADE;

ALTER TABLE QNA
    ADD CONSTRAINT FK_QNA_USER_T
        FOREIGN KEY (ID) REFERENCES USER_T(ID)
             ON DELETE CASCADE;
            
ALTER TABLE NOTICE
    ADD CONSTRAINT FK_NOTICE_USER_T
        FOREIGN KEY (ID) REFERENCES USER_T(ID)
             ON DELETE CASCADE;

            
ALTER TABLE FAQ
    ADD CONSTRAINT FK_FAQ_USER_T
        FOREIGN KEY (ID) REFERENCES USER_T(ID)
             ON DELETE CASCADE;


------------------------------------------------------ITEM 테이블 외래키
ALTER TABLE ITEM_IMG ADD CONSTRAINT FK_ITEM_IMG_ITEM FOREIGN KEY(ITEM_ID) REFERENCES ITEM(ITEM_ID) ON DELETE CASCADE;
ALTER TABLE ITEM_CART ADD CONSTRAINT FK_ITEM_CART_USER FOREIGN KEY(ID) REFERENCES USER_T(ID) ON DELETE CASCADE;
ALTER TABLE ITEM_CART ADD CONSTRAINT FK_ITEM_CART_ITEM FOREIGN KEY(ITEM_ID) REFERENCES ITEM(ITEM_ID) ON DELETE CASCADE;
ALTER TABLE ITEM_ORDER ADD CONSTRAINT FK_ITEM_ORDER_ID FOREIGN KEY(ID) REFERENCES USER_T(ID) ON DELETE CASCADE;
ALTER TABLE ITEM_ORDER ADD CONSTRAINT FK_ITEM_ORDER_ITEM_COUPON_LIST FOREIGN KEY(ITEM_COUPON_NO) REFERENCES ITEM_COUPON_LIST(ITEM_COUPON_NO) ON DELETE CASCADE;
ALTER TABLE ITEM_PURCHASE ADD CONSTRAINT FK_ITEM_PURCHASE_ITEM_ORDER FOREIGN KEY(ORDER_ID) REFERENCES ITEM_ORDER(ORDER_ID) ON DELETE CASCADE;
ALTER TABLE ITEM_PURCHASE ADD CONSTRAINT FK_ITEM_PURCHASE_ITEM FOREIGN KEY(ITEM_ID) REFERENCES ITEM(ITEM_ID) ON DELETE CASCADE;
ALTER TABLE ITEM_COUPON ADD CONSTRAINT FK_ITEM_COUPON_USER FOREIGN KEY(ID) REFERENCES USER_T(ID) ON DELETE CASCADE;
ALTER TABLE ITEM_COUPON ADD CONSTRAINT FK_ITEM_COUPON_LIST FOREIGN KEY(ITEM_COUPON_NO) REFERENCES ITEM_COUPON_LIST(ITEM_COUPON_NO) ON DELETE CASCADE;









-----------------------------------------USER DROP시퀀스
DROP SEQUENCE USER_SEQ;



--------------------------------------- 영화 정보 테이블 시퀀스 드롭
DROP SEQUENCE VOD_SEQ;
-- 유저가 구매 완료할 경우 저장되는 테이블 시퀀스 드롭
DROP SEQUENCE VOD_PURCHASE_SEQ;
-- 유저가 보유한 쿠폰 테이블 시퀀스 드롭
DROP SEQUENCE VOD_COUPON_LIST_SEQ;
-- 유저가 찜한 정보가 저장되는 테이블 시퀀스 드롭
DROP SEQUENCE VOD_ZZIM_SEQ;
---------------------------------------------------------- DROP REVIEW_FREE SEQUENCES
DROP SEQUENCE REVIEWS_ATTACH_SEQ;
DROP SEQUENCE REVIEWS_SEQ;
DROP SEQUENCE FREE_SEQ;
DROP SEQUENCE FREE_COMMENT_SEQ;
DROP SEQUENCE FREE_ATTACH_SEQ;

---------------------------------------------------drop 고객센터 시퀀스
DROP SEQUENCE QNA_SEQ;
DROP SEQUENCE FAQ_SEQ;
DROP SEQUENCE NOTICE_SEQ;
DROP SEQUENCE QCOMMENT_SEQ;

----------------------------------------------------------DROP ITEM 시퀀스

DROP SEQUENCE CART_ID;
DROP SEQUENCE ORDER_ID;
DROP SEQUENCE PURCHASE_ID;





-------------------------------------------USER CREATE 시퀀스
CREATE SEQUENCE USER_SEQ NOCACHE;



---------------------------------------------- 영화 정보 테이블 시퀀스
CREATE SEQUENCE VOD_SEQ NOCACHE;
-- 유저가 구매 완료할 경우 저장되는 테이블 시퀀스
CREATE SEQUENCE VOD_PURCHASE_SEQ NOCACHE;
-- 유저가 보유한 쿠폰 테이블 시퀀스
CREATE SEQUENCE VOD_COUPON_LIST_SEQ NOCACHE;
-- 유저가 찜한 정보가 저장되는 테이블 시퀀스
CREATE SEQUENCE VOD_ZZIM_SEQ NOCACHE;

------------------------------------------------ CREATE REVIEW_FREE SEQUENCES
CREATE SEQUENCE REVIEWS_SEQ NOCACHE;
CREATE SEQUENCE REVIEWS_ATTACH_SEQ NOCACHE;
CREATE SEQUENCE FREE_SEQ NOCACHE;
CREATE SEQUENCE FREE_COMMENT_SEQ NOCACHE;
CREATE SEQUENCE FREE_ATTACH_SEQ NOCACHE;
-----------------------------------------------------고객센터 시퀀스 생성
CREATE SEQUENCE QNA_SEQ NOCACHE;
CREATE SEQUENCE FAQ_SEQ NOCACHE;
CREATE SEQUENCE NOTICE_SEQ NOCACHE;
CREATE SEQUENCE QCOMMENT_SEQ NOCACHE;


-------------------------------------ITEM 시퀀스 생성

CREATE SEQUENCE CART_ID NOCACHE;
CREATE SEQUENCE ORDER_ID NOCACHE;
CREATE SEQUENCE PURCHASE_ID NOCACHE;
