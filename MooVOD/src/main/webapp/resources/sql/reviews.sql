

-- 기본키


-- 외래키


-- 시퀀스
DROP SEQUENCE REVIEWS_SEQ;
CREATE SEQUENCE REVIEWS_SEQ NOCACHE;

DROP TABLE REVIEWS;
CREATE TABLE REVIEWS(
    REVIEW_NO           NUMBER NOT NULL,
    REVIEW_CATEGORY     VARCHAR2(30 BYTE) NOT NULL,
    REVIEW_TITLE        VARCHAR2(1000 BYTE) NOT NULL,
    REVIEW_WRITER       VARCHAR2(30 BYTE) NOT NULL,
    REVIEW_CONTENT      CLOB,
    REVIEW_CREATED_AT   TIMESTAMP,                     
    REVIEW_MODIFIED_AT  TIMESTAMP,
    REVIEW_HITS         NUMBER DEFAULT 0 NOT NULL
    
);
INSERT INTO REVIEWS VALUES(REVIEWS_SEQ.NEXTVAL, '호러', '테스트1', '테스터1', '테스트1', SYSDATE, SYSDATE, 0);
INSERT INTO REVIEWS VALUES(REVIEWS_SEQ.NEXTVAL, '액션', '테스트2', '테스터2', '테스트2', SYSDATE, SYSDATE, 0);
INSERT INTO REVIEWS VALUES(REVIEWS_SEQ.NEXTVAL, '멜로', '테스트3', '테스터3', '테스트3', SYSDATE, SYSDATE, 0);
INSERT INTO REVIEWS VALUES(REVIEWS_SEQ.NEXTVAL, '코미디', '테스트4', '테스터4', '테스트4', SYSDATE, SYSDATE, 0);
INSERT INTO REVIEWS VALUES(REVIEWS_SEQ.NEXTVAL, '독립영화', '테스트5', '테스터5', '테스트5', SYSDATE, SYSDATE, 0);

INSERT INTO REVIEWS VALUES(REVIEWS_SEQ.NEXTVAL, '호러', '테스트6', '테스터6', '테스트6', SYSDATE, SYSDATE, 0);
INSERT INTO REVIEWS VALUES(REVIEWS_SEQ.NEXTVAL, '액션', '테스트7', '테스터7', '테스트7', SYSDATE, SYSDATE, 0);
INSERT INTO REVIEWS VALUES(REVIEWS_SEQ.NEXTVAL, '멜로', '테스트8', '테스터8', '테스트8', SYSDATE, SYSDATE, 0);
INSERT INTO REVIEWS VALUES(REVIEWS_SEQ.NEXTVAL, '코미디', '테스트9', '테스터9', '테스트9', SYSDATE, SYSDATE, 0);
INSERT INTO REVIEWS VALUES(REVIEWS_SEQ.NEXTVAL, '독립영화', '테스트10', '테스터10', '테스트10', SYSDATE, SYSDATE, 0);

INSERT INTO REVIEWS VALUES(REVIEWS_SEQ.NEXTVAL, '호러', '테스트11', '테스터11', '테스트11', SYSDATE, SYSDATE, 0);
INSERT INTO REVIEWS VALUES(REVIEWS_SEQ.NEXTVAL, '액션', '테스트12', '테스터12', '테스트12', SYSDATE, SYSDATE, 0);
INSERT INTO REVIEWS VALUES(REVIEWS_SEQ.NEXTVAL, '멜로', '테스트13', '테스터13', '테스트13', SYSDATE, SYSDATE, 0);
INSERT INTO REVIEWS VALUES(REVIEWS_SEQ.NEXTVAL, '코미디', '테스트14', '테스터14', '테스트14', SYSDATE, SYSDATE, 0);
INSERT INTO REVIEWS VALUES(REVIEWS_SEQ.NEXTVAL, '독립영화', '테스트15', '테스터15', '테스트15', SYSDATE, SYSDATE, 0);

INSERT INTO REVIEWS VALUES(REVIEWS_SEQ.NEXTVAL, '호러', '테스트16', '테스터16', '테스트16', SYSDATE, SYSDATE, 0);
INSERT INTO REVIEWS VALUES(REVIEWS_SEQ.NEXTVAL, '액션', '테스트17', '테스터17', '테스트17', SYSDATE, SYSDATE, 0);
INSERT INTO REVIEWS VALUES(REVIEWS_SEQ.NEXTVAL, '멜로', '테스트18', '테스터18', '테스트18', SYSDATE, SYSDATE, 0);
INSERT INTO REVIEWS VALUES(REVIEWS_SEQ.NEXTVAL, '코미디', '테스트19', '테스터19', '테스트19', SYSDATE, SYSDATE, 0);
INSERT INTO REVIEWS VALUES(REVIEWS_SEQ.NEXTVAL, '독립영화', '테스트20', '테스터20', '테스트20', SYSDATE, SYSDATE, 0);

INSERT INTO REVIEWS VALUES(REVIEWS_SEQ.NEXTVAL, '호러', '테스트21', '테스터21', '테스트21', SYSDATE, SYSDATE, 0);
INSERT INTO REVIEWS VALUES(REVIEWS_SEQ.NEXTVAL, '액션', '테스트22', '테스터22', '테스트22', SYSDATE, SYSDATE, 0);
INSERT INTO REVIEWS VALUES(REVIEWS_SEQ.NEXTVAL, '멜로', '테스트23', '테스터23', '테스트23', SYSDATE, SYSDATE, 0);
INSERT INTO REVIEWS VALUES(REVIEWS_SEQ.NEXTVAL, '코미디', '테스트24', '테스터24', '테스트24', SYSDATE, SYSDATE, 0);
INSERT INTO REVIEWS VALUES(REVIEWS_SEQ.NEXTVAL, '독립영화', '테스트25', '테스터25', '테스트25', SYSDATE, SYSDATE, 0);

INSERT INTO REVIEWS VALUES(REVIEWS_SEQ.NEXTVAL, '호러', '테스트26', '테스터26', '테스트26', SYSDATE, SYSDATE, 0);
INSERT INTO REVIEWS VALUES(REVIEWS_SEQ.NEXTVAL, '액션', '테스트27', '테스터27', '테스트27', SYSDATE, SYSDATE, 0);
INSERT INTO REVIEWS VALUES(REVIEWS_SEQ.NEXTVAL, '멜로', '테스트28', '테스터28', '테스트28', SYSDATE, SYSDATE, 0);
INSERT INTO REVIEWS VALUES(REVIEWS_SEQ.NEXTVAL, '코미디', '테스트29', '테스터29', '테스트29', SYSDATE, SYSDATE, 0);
INSERT INTO REVIEWS VALUES(REVIEWS_SEQ.NEXTVAL, '독립영화', '테스트30', '테스터30', '테스트30', SYSDATE, SYSDATE, 0);

INSERT INTO REVIEWS VALUES(REVIEWS_SEQ.NEXTVAL, '호러', '테스트31', '테스터31', '테스트31', SYSDATE, SYSDATE, 0);
INSERT INTO REVIEWS VALUES(REVIEWS_SEQ.NEXTVAL, '액션', '테스트32', '테스터32', '테스트32', SYSDATE, SYSDATE, 0);
INSERT INTO REVIEWS VALUES(REVIEWS_SEQ.NEXTVAL, '멜로', '테스트33', '테스터33', '테스트33', SYSDATE, SYSDATE, 0);
INSERT INTO REVIEWS VALUES(REVIEWS_SEQ.NEXTVAL, '코미디', '테스트34', '테스터34', '테스트34', SYSDATE, SYSDATE, 0);
INSERT INTO REVIEWS VALUES(REVIEWS_SEQ.NEXTVAL, '독립영화', '테스트35', '테스터35', '테스트35', SYSDATE, SYSDATE, 0);

INSERT INTO REVIEWS VALUES(REVIEWS_SEQ.NEXTVAL, '호러', '테스트36', '테스터36', '테스트36', SYSDATE, SYSDATE, 0);
INSERT INTO REVIEWS VALUES(REVIEWS_SEQ.NEXTVAL, '액션', '테스트37', '테스터37', '테스트37', SYSDATE, SYSDATE, 0);
INSERT INTO REVIEWS VALUES(REVIEWS_SEQ.NEXTVAL, '멜로', '테스트38', '테스터38', '테스트38', SYSDATE, SYSDATE, 0);
INSERT INTO REVIEWS VALUES(REVIEWS_SEQ.NEXTVAL, '코미디', '테스트39', '테스터39', '테스트39', SYSDATE, SYSDATE, 0);
INSERT INTO REVIEWS VALUES(REVIEWS_SEQ.NEXTVAL, '독립영화', '테스트40', '테스터40', '테스트40', SYSDATE, SYSDATE, 0);

INSERT INTO REVIEWS VALUES(REVIEWS_SEQ.NEXTVAL, '호러', '테스트41', '테스터41', '테스트41', SYSDATE, SYSDATE, 0);
INSERT INTO REVIEWS VALUES(REVIEWS_SEQ.NEXTVAL, '액션', '테스트42', '테스터42', '테스트42', SYSDATE, SYSDATE, 0);
INSERT INTO REVIEWS VALUES(REVIEWS_SEQ.NEXTVAL, '멜로', '테스트43', '테스터43', '테스트43', SYSDATE, SYSDATE, 0);
INSERT INTO REVIEWS VALUES(REVIEWS_SEQ.NEXTVAL, '코미디', '테스트44', '테스터44', '테스트44', SYSDATE, SYSDATE, 0);
INSERT INTO REVIEWS VALUES(REVIEWS_SEQ.NEXTVAL, '독립영화', '테스트45', '테스터45', '테스트45', SYSDATE, SYSDATE, 0);

INSERT INTO REVIEWS VALUES(REVIEWS_SEQ.NEXTVAL, '호러', '테스트46', '테스터46', '테스트46', SYSDATE, SYSDATE, 0);
INSERT INTO REVIEWS VALUES(REVIEWS_SEQ.NEXTVAL, '액션', '테스트47', '테스터47', '테스트47', SYSDATE, SYSDATE, 0);
INSERT INTO REVIEWS VALUES(REVIEWS_SEQ.NEXTVAL, '멜로', '테스트48', '테스터48', '테스트48', SYSDATE, SYSDATE, 0);
INSERT INTO REVIEWS VALUES(REVIEWS_SEQ.NEXTVAL, '코미디', '테스트49', '테스터49', '테스트49', SYSDATE, SYSDATE, 0);
INSERT INTO REVIEWS VALUES(REVIEWS_SEQ.NEXTVAL, '독립영화', '테스트50', '테스터50', '테스트50', SYSDATE, SYSDATE, 0);

INSERT INTO REVIEWS VALUES(REVIEWS_SEQ.NEXTVAL, '호러', '테스트51', '테스터51', '테스트51', SYSDATE, SYSDATE, 0);
INSERT INTO REVIEWS VALUES(REVIEWS_SEQ.NEXTVAL, '액션', '테스트52', '테스터52', '테스트52', SYSDATE, SYSDATE, 0);
INSERT INTO REVIEWS VALUES(REVIEWS_SEQ.NEXTVAL, '멜로', '테스트53', '테스터53', '테스트53', SYSDATE, SYSDATE, 0);
INSERT INTO REVIEWS VALUES(REVIEWS_SEQ.NEXTVAL, '코미디', '테스트54', '테스터54', '테스트54', SYSDATE, SYSDATE, 0);
INSERT INTO REVIEWS VALUES(REVIEWS_SEQ.NEXTVAL, '독립영화', '테스트55', '테스터55', '테스트55', SYSDATE, SYSDATE, 0);

INSERT INTO REVIEWS VALUES(REVIEWS_SEQ.NEXTVAL, '호러', '테스트56', '테스터56', '테스트56', SYSDATE, SYSDATE, 0);
INSERT INTO REVIEWS VALUES(REVIEWS_SEQ.NEXTVAL, '액션', '테스트57', '테스터57', '테스트57', SYSDATE, SYSDATE, 0);
INSERT INTO REVIEWS VALUES(REVIEWS_SEQ.NEXTVAL, '멜로', '테스트58', '테스터58', '테스트58', SYSDATE, SYSDATE, 0);
INSERT INTO REVIEWS VALUES(REVIEWS_SEQ.NEXTVAL, '코미디', '테스트59', '테스터59', '테스트59', SYSDATE, SYSDATE, 0);
INSERT INTO REVIEWS VALUES(REVIEWS_SEQ.NEXTVAL, '독립영화', '테스트60', '테스터60', '테스트60', SYSDATE, SYSDATE, 0);

INSERT INTO REVIEWS VALUES(REVIEWS_SEQ.NEXTVAL, '호러', '테스트61', '테스터61', '테스트61', SYSDATE, SYSDATE, 0);
INSERT INTO REVIEWS VALUES(REVIEWS_SEQ.NEXTVAL, '액션', '테스트62', '테스터62', '테스트62', SYSDATE, SYSDATE, 0);
INSERT INTO REVIEWS VALUES(REVIEWS_SEQ.NEXTVAL, '멜로', '테스트63', '테스터63', '테스트63', SYSDATE, SYSDATE, 0);




COMMIT;


	