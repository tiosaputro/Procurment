--------------------------------------------------------
--  File created - Wednesday-December-08-2021   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence FAILED_JOBS_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PROCURMENT"."FAILED_JOBS_ID_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence MIGRATIONS_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PROCURMENT"."MIGRATIONS_ID_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence PERSONAL_ACCESS_TOKENS_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PROCURMENT"."PERSONAL_ACCESS_TOKENS_ID_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence RFM_BENTU_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PROCURMENT"."RFM_BENTU_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence RFS_BENTU_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PROCURMENT"."RFS_BENTU_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence USERS_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PROCURMENT"."USERS_ID_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table DETAIL_RFS_BENTU
--------------------------------------------------------

  CREATE TABLE "PROCURMENT"."DETAIL_RFS_BENTU" 
   (	"RFSD_ID" VARCHAR2(20 BYTE), 
	"RFS_ID" VARCHAR2(20 BYTE), 
	"RFS_CURRENT" VARCHAR2(250 BYTE), 
	"RFS_NEXT" VARCHAR2(250 BYTE), 
	"RFS_REMARK" VARCHAR2(250 BYTE), 
	"CREATED_BY" VARCHAR2(20 BYTE), 
	"LAST_UPDATE_DATE" DATE, 
	"CREATION_DATE" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(20 BYTE), 
	"PROGRAM_NAME" VARCHAR2(30 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table FAILED_JOBS
--------------------------------------------------------

  CREATE TABLE "PROCURMENT"."FAILED_JOBS" 
   (	"ID" NUMBER(19,0), 
	"CONNECTION" CLOB, 
	"QUEUE" CLOB, 
	"PAYLOAD" CLOB, 
	"EXCEPTION" CLOB, 
	"FAILED_AT" TIMESTAMP (6)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" 
 LOB ("CONNECTION") STORE AS BASICFILE (
  TABLESPACE "SYSTEM" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) 
 LOB ("QUEUE") STORE AS BASICFILE (
  TABLESPACE "SYSTEM" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) 
 LOB ("PAYLOAD") STORE AS BASICFILE (
  TABLESPACE "SYSTEM" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) 
 LOB ("EXCEPTION") STORE AS BASICFILE (
  TABLESPACE "SYSTEM" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;
--------------------------------------------------------
--  DDL for Table MIGRATIONS
--------------------------------------------------------

  CREATE TABLE "PROCURMENT"."MIGRATIONS" 
   (	"ID" NUMBER(10,0), 
	"MIGRATION" VARCHAR2(255 BYTE), 
	"BATCH" NUMBER(10,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table MNG_USER
--------------------------------------------------------

  CREATE TABLE "PROCURMENT"."MNG_USER" 
   (	"USR_ID" VARCHAR2(20 BYTE), 
	"USR_NAME" VARCHAR2(20 BYTE), 
	"USR_FULLNAME" VARCHAR2(50 BYTE), 
	"USR_IMAGE" VARCHAR2(225 BYTE), 
	"CREATED_BY" VARCHAR2(20 BYTE), 
	"CREATION_DATE" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(20 BYTE), 
	"LAST_UPDATE_DATE" DATE, 
	"PROGRAM_NAME" VARCHAR2(30 BYTE), 
	"USR_PASSWD" VARCHAR2(100 BYTE), 
	"USR_EMAIL" VARCHAR2(30 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table PERSONAL_ACCESS_TOKENS
--------------------------------------------------------

  CREATE TABLE "PROCURMENT"."PERSONAL_ACCESS_TOKENS" 
   (	"ID" NUMBER(19,0), 
	"TOKENABLE_TYPE" VARCHAR2(255 BYTE), 
	"TOKENABLE_ID" NUMBER(19,0), 
	"NAME" VARCHAR2(255 BYTE), 
	"TOKEN" VARCHAR2(64 BYTE), 
	"ABILITIES" CLOB, 
	"LAST_USED_AT" TIMESTAMP (6), 
	"CREATED_AT" TIMESTAMP (6), 
	"UPDATED_AT" TIMESTAMP (6)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" 
 LOB ("ABILITIES") STORE AS BASICFILE (
  TABLESPACE "SYSTEM" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;
--------------------------------------------------------
--  DDL for Table RFS_BENTU
--------------------------------------------------------

  CREATE TABLE "PROCURMENT"."RFS_BENTU" 
   (	"RFS_ID" VARCHAR2(20 BYTE), 
	"RFS_NAME" VARCHAR2(100 BYTE), 
	"RFS_DATE" DATE, 
	"RFS_HPS" VARCHAR2(20 BYTE), 
	"RFS_VALUTA_CODE" VARCHAR2(5 BYTE), 
	"RFS_METHODE" VARCHAR2(20 BYTE), 
	"RFS_STATUS" VARCHAR2(5 BYTE), 
	"CREATION_DATE" DATE, 
	"CREATED_BY" VARCHAR2(20 BYTE), 
	"LAST_UPDATE_DATE" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(20 BYTE), 
	"PROGRAM_NAME" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
REM INSERTING into PROCURMENT.DETAIL_RFS_BENTU
SET DEFINE OFF;
Insert into PROCURMENT.DETAIL_RFS_BENTU (RFSD_ID,RFS_ID,RFS_CURRENT,RFS_NEXT,RFS_REMARK,CREATED_BY,LAST_UPDATE_DATE,CREATION_DATE,LAST_UPDATED_BY,PROGRAM_NAME) values ('2','1','-','Backdated untuk kontrak 1-31 Januari 2010
sampai saat ini user tdk kooperatif dan Unilab belum memberikan penawaran','Menunggu penawaran harga dari PT. Unilab sejak 27/11/20','wahyu',null,to_date('07-12-2021','DD-MM-RRRR'),null,'DetailBentuRfs_Save');
Insert into PROCURMENT.DETAIL_RFS_BENTU (RFSD_ID,RFS_ID,RFS_CURRENT,RFS_NEXT,RFS_REMARK,CREATED_BY,LAST_UPDATE_DATE,CREATION_DATE,LAST_UPDATED_BY,PROGRAM_NAME) values ('1','1','-','Pengajuan proses LOA. Kontraktor PT. Wira Cipta Perkasa','-','wahyu',to_date('07-12-2021','DD-MM-RRRR'),to_date('07-12-2021','DD-MM-RRRR'),'wahyu','DetailBentuRfs_Update');
REM INSERTING into PROCURMENT.FAILED_JOBS
SET DEFINE OFF;
REM INSERTING into PROCURMENT.MIGRATIONS
SET DEFINE OFF;
Insert into PROCURMENT.MIGRATIONS (ID,MIGRATION,BATCH) values ('1','2014_10_12_000000_create_users_table','1');
Insert into PROCURMENT.MIGRATIONS (ID,MIGRATION,BATCH) values ('2','2019_08_19_000000_create_failed_jobs_table','1');
Insert into PROCURMENT.MIGRATIONS (ID,MIGRATION,BATCH) values ('3','2019_12_14_000001_create_personal_access_tokens_table','1');
REM INSERTING into PROCURMENT.MNG_USER
SET DEFINE OFF;
Insert into PROCURMENT.MNG_USER (USR_ID,USR_NAME,USR_FULLNAME,USR_IMAGE,CREATED_BY,CREATION_DATE,LAST_UPDATED_BY,LAST_UPDATE_DATE,PROGRAM_NAME,USR_PASSWD,USR_EMAIL) values ('1','wahyu','wahyu sisoko','1636343615.png',null,null,null,null,null,'$2y$10$aSnURcCO6shHGo3G6lD7GuNTlABuZE7X2u6PPwSdMmMLb0ciN8HjO','admin@gmail.com');
Insert into PROCURMENT.MNG_USER (USR_ID,USR_NAME,USR_FULLNAME,USR_IMAGE,CREATED_BY,CREATION_DATE,LAST_UPDATED_BY,LAST_UPDATE_DATE,PROGRAM_NAME,USR_PASSWD,USR_EMAIL) values ('2','wahyuu','wahyu sisokoo','1636343615.png',null,null,null,null,null,'$2y$10$X.Kkc18POd9Je5p2rq1EOeQwcRL5sSw7ybNZpDOWUyI389XZu.nYG','admin2@gmail.com');
REM INSERTING into PROCURMENT.PERSONAL_ACCESS_TOKENS
SET DEFINE OFF;
Insert into PROCURMENT.PERSONAL_ACCESS_TOKENS (ID,TOKENABLE_TYPE,TOKENABLE_ID,NAME,TOKEN,LAST_USED_AT,CREATED_AT,UPDATED_AT) values ('11','App\User','2','ApiToken','9b9fdd29370d5951f3865806d48e21e00dbc4ae01708332ad0b8b017d9038ba9',to_timestamp('06-12-2021 09.53.53000000000','DD-MM-RRRR HH24.MI.SSFF'),to_timestamp('06-12-2021 09.53.52000000000','DD-MM-RRRR HH24.MI.SSFF'),to_timestamp('06-12-2021 09.53.53000000000','DD-MM-RRRR HH24.MI.SSFF'));
Insert into PROCURMENT.PERSONAL_ACCESS_TOKENS (ID,TOKENABLE_TYPE,TOKENABLE_ID,NAME,TOKEN,LAST_USED_AT,CREATED_AT,UPDATED_AT) values ('13','App\User','1','ApiToken','65f0f433d5decb9fd4cbbaaad6bd9a6653ebe764ef2be67dc2d24d6aa8e97c98',to_timestamp('08-12-2021 09.07.41000000000','DD-MM-RRRR HH24.MI.SSFF'),to_timestamp('08-12-2021 07.45.31000000000','DD-MM-RRRR HH24.MI.SSFF'),to_timestamp('08-12-2021 09.07.41000000000','DD-MM-RRRR HH24.MI.SSFF'));
Insert into PROCURMENT.PERSONAL_ACCESS_TOKENS (ID,TOKENABLE_TYPE,TOKENABLE_ID,NAME,TOKEN,LAST_USED_AT,CREATED_AT,UPDATED_AT) values ('12','App\User','1','ApiToken','f5fb2afb3b63b63945482e728be296af1a337c27ad78d204c5c6de70a3ae9c37',to_timestamp('08-12-2021 07.35.33000000000','DD-MM-RRRR HH24.MI.SSFF'),to_timestamp('06-12-2021 09.54.28000000000','DD-MM-RRRR HH24.MI.SSFF'),to_timestamp('08-12-2021 07.35.33000000000','DD-MM-RRRR HH24.MI.SSFF'));
REM INSERTING into PROCURMENT.RFS_BENTU
SET DEFINE OFF;
Insert into PROCURMENT.RFS_BENTU (RFS_ID,RFS_NAME,RFS_DATE,RFS_HPS,RFS_VALUTA_CODE,RFS_METHODE,RFS_STATUS,CREATION_DATE,CREATED_BY,LAST_UPDATE_DATE,LAST_UPDATED_BY,PROGRAM_NAME) values ('2','RFS 7703 Pengangkutan Limbah B3 EMP Bentu Ltd',to_date('22-12-2021','DD-MM-RRRR'),'450000','USD','3','1',to_date('07-12-2021','DD-MM-RRRR'),'wahyu',null,null,'RfsBentuController_Save');
Insert into PROCURMENT.RFS_BENTU (RFS_ID,RFS_NAME,RFS_DATE,RFS_HPS,RFS_VALUTA_CODE,RFS_METHODE,RFS_STATUS,CREATION_DATE,CREATED_BY,LAST_UPDATE_DATE,LAST_UPDATED_BY,PROGRAM_NAME) values ('1','Provision of Drilling & Workover Personnel Project',to_date('15-12-2021','DD-MM-RRRR'),'3444444.56','IDR','2','2',to_date('07-12-2021','DD-MM-RRRR'),'wahyu',to_date('08-12-2021','DD-MM-RRRR'),'wahyu','RfsBentuController@changeStatus');
--------------------------------------------------------
--  DDL for Index MIGRATIONS_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "PROCURMENT"."MIGRATIONS_ID_PK" ON "PROCURMENT"."MIGRATIONS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index PERSONA_ACCES_TOKEN_TOKE_UK
--------------------------------------------------------

  CREATE UNIQUE INDEX "PROCURMENT"."PERSONA_ACCES_TOKEN_TOKE_UK" ON "PROCURMENT"."PERSONAL_ACCESS_TOKENS" (LOWER("TOKEN")) 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index PERSONAL_ACCESS_TOKENS_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "PROCURMENT"."PERSONAL_ACCESS_TOKENS_ID_PK" ON "PROCURMENT"."PERSONAL_ACCESS_TOKENS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index RFS_BENTU_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "PROCURMENT"."RFS_BENTU_PK" ON "PROCURMENT"."RFS_BENTU" ("RFS_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index PER_AC_TO_TOKE_TY_TOKE_ID_IN
--------------------------------------------------------

  CREATE INDEX "PROCURMENT"."PER_AC_TO_TOKE_TY_TOKE_ID_IN" ON "PROCURMENT"."PERSONAL_ACCESS_TOKENS" ("TOKENABLE_TYPE", "TOKENABLE_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index FAILED_JOBS_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "PROCURMENT"."FAILED_JOBS_ID_PK" ON "PROCURMENT"."FAILED_JOBS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index MNG_USER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "PROCURMENT"."MNG_USER_PK" ON "PROCURMENT"."MNG_USER" ("USR_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index DETAIL_RFS_BENTU_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "PROCURMENT"."DETAIL_RFS_BENTU_PK" ON "PROCURMENT"."DETAIL_RFS_BENTU" ("RFSD_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Trigger BI_RFS_BENTU
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "PROCURMENT"."BI_RFS_BENTU" 
   before insert on "PROCURMENT"."RFS_BENTU" 
   for each row 
begin  
   if inserting then 
      if :NEW."RFS_ID" is null then 
         select RFS_BENTU_SEQ.nextval into :NEW."RFS_ID" from dual; 
      end if; 
   end if; 
end;

/
ALTER TRIGGER "PROCURMENT"."BI_RFS_BENTU" DISABLE;
--------------------------------------------------------
--  DDL for Trigger FAILED_JOBS_ID_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "PROCURMENT"."FAILED_JOBS_ID_TRG" 
            before insert on FAILED_JOBS
            for each row
                begin
            if :new.ID is null then
                select failed_jobs_id_seq.nextval into :new.ID from dual;
            end if;
            end;
/
ALTER TRIGGER "PROCURMENT"."FAILED_JOBS_ID_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger MIGRATIONS_ID_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "PROCURMENT"."MIGRATIONS_ID_TRG" 
            before insert on MIGRATIONS
            for each row
                begin
            if :new.ID is null then
                select migrations_id_seq.nextval into :new.ID from dual;
            end if;
            end;
/
ALTER TRIGGER "PROCURMENT"."MIGRATIONS_ID_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger PERSONAL_ACCESS_TOKENS_ID_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "PROCURMENT"."PERSONAL_ACCESS_TOKENS_ID_TRG" 
            before insert on PERSONAL_ACCESS_TOKENS
            for each row
                begin
            if :new.ID is null then
                select personal_access_tokens_id_seq.nextval into :new.ID from dual;
            end if;
            end;
/
ALTER TRIGGER "PROCURMENT"."PERSONAL_ACCESS_TOKENS_ID_TRG" ENABLE;
--------------------------------------------------------
--  Constraints for Table FAILED_JOBS
--------------------------------------------------------

  ALTER TABLE "PROCURMENT"."FAILED_JOBS" ADD CONSTRAINT "FAILED_JOBS_ID_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "PROCURMENT"."FAILED_JOBS" MODIFY ("FAILED_AT" NOT NULL ENABLE);
  ALTER TABLE "PROCURMENT"."FAILED_JOBS" MODIFY ("EXCEPTION" NOT NULL ENABLE);
  ALTER TABLE "PROCURMENT"."FAILED_JOBS" MODIFY ("PAYLOAD" NOT NULL ENABLE);
  ALTER TABLE "PROCURMENT"."FAILED_JOBS" MODIFY ("QUEUE" NOT NULL ENABLE);
  ALTER TABLE "PROCURMENT"."FAILED_JOBS" MODIFY ("CONNECTION" NOT NULL ENABLE);
  ALTER TABLE "PROCURMENT"."FAILED_JOBS" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table RFS_BENTU
--------------------------------------------------------

  ALTER TABLE "PROCURMENT"."RFS_BENTU" ADD CONSTRAINT "RFS_BENTU_PK" PRIMARY KEY ("RFS_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "PROCURMENT"."RFS_BENTU" MODIFY ("RFS_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PERSONAL_ACCESS_TOKENS
--------------------------------------------------------

  ALTER TABLE "PROCURMENT"."PERSONAL_ACCESS_TOKENS" ADD CONSTRAINT "PERSONAL_ACCESS_TOKENS_ID_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "PROCURMENT"."PERSONAL_ACCESS_TOKENS" MODIFY ("TOKEN" NOT NULL ENABLE);
  ALTER TABLE "PROCURMENT"."PERSONAL_ACCESS_TOKENS" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "PROCURMENT"."PERSONAL_ACCESS_TOKENS" MODIFY ("TOKENABLE_ID" NOT NULL ENABLE);
  ALTER TABLE "PROCURMENT"."PERSONAL_ACCESS_TOKENS" MODIFY ("TOKENABLE_TYPE" NOT NULL ENABLE);
  ALTER TABLE "PROCURMENT"."PERSONAL_ACCESS_TOKENS" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MIGRATIONS
--------------------------------------------------------

  ALTER TABLE "PROCURMENT"."MIGRATIONS" ADD CONSTRAINT "MIGRATIONS_ID_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "PROCURMENT"."MIGRATIONS" MODIFY ("BATCH" NOT NULL ENABLE);
  ALTER TABLE "PROCURMENT"."MIGRATIONS" MODIFY ("MIGRATION" NOT NULL ENABLE);
  ALTER TABLE "PROCURMENT"."MIGRATIONS" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table DETAIL_RFS_BENTU
--------------------------------------------------------

  ALTER TABLE "PROCURMENT"."DETAIL_RFS_BENTU" ADD CONSTRAINT "DETAIL_RFS_BENTU_PK" PRIMARY KEY ("RFSD_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "PROCURMENT"."DETAIL_RFS_BENTU" MODIFY ("RFSD_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MNG_USER
--------------------------------------------------------

  ALTER TABLE "PROCURMENT"."MNG_USER" ADD CONSTRAINT "MNG_USER_PK" PRIMARY KEY ("USR_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "PROCURMENT"."MNG_USER" MODIFY ("USR_ID" NOT NULL ENABLE);