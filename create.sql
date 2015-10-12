DROP TABLE IF EXISTS DH_CHARGE;

DROP TABLE IF EXISTS DH_CURRENCY;

DROP TABLE IF EXISTS DH_DATAITEM;

DROP TABLE IF EXISTS DH_DENYGROUP;

DROP TABLE IF EXISTS DH_DENYUSER;

DROP TABLE IF EXISTS DH_DOWNLOADLOG;

DROP TABLE IF EXISTS DH_FIELD;

DROP TABLE IF EXISTS DH_GROUP;

DROP TABLE IF EXISTS DH_LOG;

DROP TABLE IF EXISTS DH_PERMITGROUP;

DROP TABLE IF EXISTS DH_PERMITTYPE;

DROP TABLE IF EXISTS DH_PERMITUSER;

DROP TABLE IF EXISTS DH_REPOSITORY;

DROP TABLE IF EXISTS DH_SUPPLYSTYLE;

DROP TABLE IF EXISTS DH_UPLOADLOG;

DROP TABLE IF EXISTS DH_USER;

DROP TABLE IF EXISTS DH_USERLEVEL;

DROP TABLE IF EXISTS DH_USERLIST;

DROP TABLE IF EXISTS DH_USERSTATUS;

/*==============================================================*/
/* Table: DH_CHARGE                                             */
/*==============================================================*/
CREATE TABLE DH_CHARGE
(
   ACCOUNT_ID           VARCHAR(64) NOT NULL COMMENT '�˺�',
   CURRENCY_TYPE        INT NOT NULL,
   FEE_TYPE             CHAR(10) COMMENT '��ֵ��������
            1-Ѻ��
            2-Ԥ���
            3-���ö�',
   PAYMENT              DECIMAL(10,3),
   OPTIME               DATETIME NOT NULL COMMENT '�ʻ��䶯����',
   USER_ID              INT
);

/*==============================================================*/
/* Table: DH_CURRENCY                                           */
/*==============================================================*/
CREATE TABLE DH_CURRENCY
(
   CURRENCY_TYPE        INT NOT NULL,
   CURRENCY_NAME        VARCHAR(64) COMMENT '�������ƣ���Q�ҡ�����ҡ�ŷԪ',
   COMMENT              VARCHAR(1024)
);

/*==============================================================*/
/* Table: DH_DATAITEM                                           */
/*==============================================================*/
CREATE TABLE DH_DATAITEM
(
   REPOSITORY_ID        INT,
   USER_ID              INT,
   DATAITEM_ID          INT NOT NULL,
   DATAITEM_NAME        VARCHAR(1024) COMMENT '������������ֵ�
            ���������ҳ����չʾ��',
   ICO_NAME             VARCHAR(64) COMMENT 'ͼ���ļ���',
   TAG                  VARCHAR(1024) COMMENT '�ö��ŷָ����tag���',
   PERMIT_TYPE          INT COMMENT '1-˽�У�������ѪԵ��ϵ���ʺ�ʹ��
            2-�������û�����
            3-�û�����������
            4-�û�������������
            5-�û������������
            6-�û��������������',
   SUPPLY_STYLE         INT COMMENT 'ʵʱ������������ ��',
   PRICEUNIT_TYPE       INT COMMENT '���۵�λ',
   PRICE                DECIMAL(12,3) COMMENT '����',
   OPTIME               DATE COMMENT '��ʼ�����޸�ʱ��',
   REFRESH_TYPE         INT COMMENT '���ݵ�ˢ�����ڣ�ȱʡΪ��',
   REFRESH_DATE         DATE COMMENT '�����������ڣ��ϴ�ʱ����',
   FILE_TYPE            VARCHAR(64) COMMENT '�ļ���ʽ',
   SAMPLE_FILENAME      VARCHAR(1024) COMMENT '��������',
   PASSWORD             VARCHAR(64) COMMENT '�鿴���ص����룬�����룬admin��ѯ�ṩ��������û�������ʱ�鿴',
   COMMENT              VARCHAR(1024)
);

/*==============================================================*/
/* Table: DH_DENYGROUP                                          */
/*==============================================================*/
CREATE TABLE DH_DENYGROUP
(
   GROUP_ID             INT NOT NULL,
   REPOSITORY_ID        INT NOT NULL,
   DATAITEM_ID          INT NOT NULL
);

/*==============================================================*/
/* Table: DH_DENYUSER                                           */
/*==============================================================*/
CREATE TABLE DH_DENYUSER
(
   REPOSITORY_ID        INT NOT NULL,
   DATAITEM_ID          INT NOT NULL,
   USER_ID              INT NOT NULL
);

/*==============================================================*/
/* Table: DH_DOWNLOADLOG                                        */
/*==============================================================*/
CREATE TABLE DH_DOWNLOADLOG
(
   DATAITEM_ID          INT NOT NULL,
   DATA_DATE            DATE NOT NULL,
   DOWN_USER            INT NOT NULL,
   OP_TIME              DATETIME NOT NULL
);

/*==============================================================*/
/* Table: DH_FIELD                                              */
/*==============================================================*/
CREATE TABLE DH_FIELD
(
   DATAITEM_ID          INT NOT NULL,
   FIELD_ID             INT NOT NULL,
   FIELD_RAWNAME        VARCHAR(64) COMMENT '�ֶ������ļ�������������ȡ����ʹ��',
   FIELD_NAME           VARCHAR(64) COMMENT '���������ƣ����������ҳ����չʾ',
   PRIMARY_KEY          INT COMMENT '�Ƿ���ԭ���е������������ݽ������ӵ�id',
   FIELD_DATATYPE       INT COMMENT '���������������',
   FIELD_DATALENGTH     INT COMMENT '������ĳ���',
   COMMENT              VARCHAR(1024)
);

/*==============================================================*/
/* Table: DH_GROUP                                              */
/*==============================================================*/
CREATE TABLE DH_GROUP
(
   GROUP_ID             INT NOT NULL,
   GROUP_NAME           VARCHAR(64),
   CREATE_USER          INT,
   OPTIME               DATETIME,
   COMMENT              VARCHAR(1024)
);

/*==============================================================*/
/* Table: DH_LOG                                                */
/*==============================================================*/
CREATE TABLE DH_LOG
(
   USER_ID              INT NOT NULL,
   INTERFACE            VARCHAR(64) NOT NULL,
   PARAMETER            VARCHAR(1024) NOT NULL,
   OPTIME               DATETIME NOT NULL COMMENT '������޸�ʱ��'
);

/*==============================================================*/
/* Table: DH_PERMITGROUP                                        */
/*==============================================================*/
CREATE TABLE DH_PERMITGROUP
(
   GROUP_ID             INT NOT NULL,
   REPOSITORY_ID        INT NOT NULL,
   DATAITEM_ID          INT NOT NULL
);

/*==============================================================*/
/* Table: DH_PERMITTYPE                                         */
/*==============================================================*/
CREATE TABLE DH_PERMITTYPE
(
   PERMIT_TYPE          INT NOT NULL,
   PERMIT_NAME          VARCHAR(64) NOT NULL
);

/*==============================================================*/
/* Table: DH_PERMITUSER                                         */
/*==============================================================*/
CREATE TABLE DH_PERMITUSER
(
   REPOSITORY_ID        INT NOT NULL,
   DATAITEM_ID          INT NOT NULL,
   USER_ID              INT NOT NULL
);

/*==============================================================*/
/* Table: DH_REPOSITORY                                         */
/*==============================================================*/
CREATE TABLE DH_REPOSITORY
(
   REPOSITORY_ID        INT NOT NULL,
   REPOSITORY_NAME      VARCHAR(64) COMMENT '�����ṩ��������֣���������������������',
   USER_ID              INT,
   PERMIT_TYPE          INT COMMENT '1-˽�У�������ѪԵ��ϵ���ʺſɼ�
            2-�����û��ɼ�
            3-�û��������ɼ�
            4-�û����������ɼ�
            5-�û���������ɼ�
            6-�û�����������ɼ�'
);

/*==============================================================*/
/* Table: DH_SUPPLYSTYLE                                        */
/*==============================================================*/
CREATE TABLE DH_SUPPLYSTYLE
(
   SUPPLY_STYLE         INT NOT NULL,
   SUPPLY_NAME          VARCHAR(64) NOT NULL
);

/*==============================================================*/
/* Table: DH_UPLOADLOG                                          */
/*==============================================================*/
CREATE TABLE DH_UPLOADLOG
(
   DATAITEM_ID          INT NOT NULL,
   DATA_DATE            DATE NOT NULL,
   FILENAME             VARCHAR(1024)
);

/*==============================================================*/
/* Table: DH_USER                                               */
/*==============================================================*/
CREATE TABLE DH_USER
(
   USER_ID              INT NOT NULL,
   USER_LEVEL           INT COMMENT '1-����û�
            2-��֤�û����˶������ʣ�
            3-��Ȩ�û�����Ѻ��',
   COMPANY_ID           BIGINT,
   LOGIN_NAME           VARCHAR(64) COMMENT '��¼�û���',
   LOGIN_PASSWD         VARCHAR(1024) COMMENT '���룬�����Ĵ洢',
   PHONE_NO             VARCHAR(64),
   EMAIL                VARCHAR(1024),
   USER_STATUS          INT COMMENT '����û��ʻ�״̬��-1��ֹ��¼',
   CLONE_USER           INT
);

/*==============================================================*/
/* Table: DH_USERLEVEL                                          */
/*==============================================================*/
CREATE TABLE DH_USERLEVEL
(
   USER_LEVEL           INT NOT NULL,
   LEVEL_NAME           VARCHAR(64)
);

/*==============================================================*/
/* Table: DH_USERLIST                                           */
/*==============================================================*/
CREATE TABLE DH_USERLIST
(
   GROUP_ID             INT NOT NULL,
   USER_ID              INT NOT NULL
);

/*==============================================================*/
/* Table: DH_USERSTATUS                                         */
/*==============================================================*/
CREATE TABLE DH_USERSTATUS
(
   USER_STATUS          INT NOT NULL,
   STATUS_NAME          VARCHAR(64)
);

#SET @@CHARACTER_SET_SERVER='utf8'; 

INSERT INTO DH_USER VALUES ('1001', '3', NULL, 'zhhs888888', '5dc828c0e0fc5ff0e94dec595251259b', '13609251885', 'gongjing5@asiainfo.com', '1', NULL);
INSERT INTO DH_USER VALUES ('1002', '3', NULL, 'sya666666', 'bde202e8ab686fec2a848e15b61744cb', '13808305511', 'gongjing5@asiainfo.com', '1', NULL);
INSERT INTO DH_USER VALUES ('1004', '5', NULL, 'admin', '0192023a7bbd73250516f069df18b500', '82166436', 'gongjing5@asiainfo.com', '1', NULL);
INSERT INTO DH_USER VALUES ('2001', '5', NULL, 'fenghw', '86edd721bd0c5533aef7856bd0eb96ed', NULL, NULL, '1', NULL);
INSERT INTO DH_USER VALUES ('2002', '5', NULL, 'gongjing', '2ae630ce03d318325426a807057d2be6', '13311288822', 'gongjing5@asiainfo.com', '1', NULL);


INSERT INTO DH_REPOSITORY VALUES ('10', '�ֻ���Ϣ��ȫ', '1002', '2');
INSERT INTO DH_REPOSITORY VALUES ('11', 'λ����Ϣ��ȫ', '1002', '2');
INSERT INTO DH_REPOSITORY VALUES ('20', '��������', '2002', '2');

INSERT INTO DH_DATAITEM VALUES ('10', '1002', '1010', '�ն���Ϣ', 'terminal.png', '�ֻ�,iphone', '2', '1', '1', '1.000', '2015-08-01', '1', '2015-07-31', 'EXCEL�ļ�', 'terminal.del', '888888', '�г���������������ת�ն�Ʒ�ơ����͡�������������ն�ARUP��DOU�����䡢������Ǩ�㡢���������APP��װ�����');
INSERT INTO DH_DATAITEM VALUES ('20', '1004', '2000', '��������', 'unionpay.png', NULL, '2', '1', '1', '1.000', '2015-08-01', '1', '2015-07-31', 'RARѹ����', NULL, '888855', 'ͨ����ʮ��ά�ȵ�����ָ�꣬���û�Ⱥ������������������������̻����ճ���ϸ���û�Ⱥ������');
INSERT INTO DH_DATAITEM VALUES ('20', '1004', '2001', '��������', 'industry_commerc.png', NULL, '2', '1', '1', '1.000', '2015-08-01', '1', '2015-07-31', 'RARѹ����', NULL, '888866', '1800�����ҵ���ݣ�������ҵ����ҵ�����ء�������塢������ҵ�������Ϸ���֯������������������ȫ���������������ݶ�̬ÿ�ջ��ܣ����ո������ߣ�ͨ����̬����ʵʱУ���û���ݵĺϷ��ԣ�ʵʱ���ݷ���ӿ�');
INSERT INTO DH_DATAITEM VALUES ('20', '1004', '2002', '�罻����', 'social.png', NULL, '2', '1', '1', '1.000', '2015-08-01', '1', '2015-07-31', 'RARѹ����', NULL, '111111', '�������Ϲ������ݣ���̳�����ɣ�΢����΢�Ź��ںŵȣ����û����ۡ�ת��������ΪƷ��Ч�����ۣ�Ҳ������Ϊ��Ʒ�Ľ�����Ӫ����������ݡ�');
INSERT INTO DH_DATAITEM VALUES ('20', '1004', '2003', '��������', 'bus.png', NULL, '2', '1', '1', '1.000', '2015-08-01', '1', '2015-07-31', 'RARѹ����', NULL, '111111', '��ĩ�෢�������������˦վ����վ���г��ٶȡ��켣��ܡ����㷢��������Уʱ������׼���Լ����ڡ����١�ƫ����');
INSERT INTO DH_DATAITEM VALUES ('20', '1004', '2004', '��������', 'weather.png', NULL, '2', '1', '1', '1.000', '2015-08-01', '1', '2015-07-31', 'RARѹ����', NULL, '111111', '��������ÿ��ƽ���¶ȡ�ÿ���������¶ȡ���ˮ�������ʪ�ȡ���ѹ���׵��Խ�������ȫ��2000+���Ҽ�����۲�վ���˹�ְ��վ���ķ���ʪѹ�꣨��������ÿ��ƽ���¶ȡ�ÿ���������¶ȡ���ˮ�������ʪ�ȣ��ȸ�����Ҫ�ؼ�¼���Լ�5W+�����Զ�վ������ְ��վ��2009����룩��ʵʱ������ݡ�');
INSERT INTO DH_DATAITEM VALUES ('20', '1004', '2005', 'GIS��ͼ', 'GIS_map.png', NULL, '2', '1', '1', '1.000', '2015-08-01', '1', '2015-07-31', 'RARѹ����', NULL, '111111', 'ȫ��������ͼ���ݣ�1:500/1:1000/1:2000/1:5000/1:10000/1:50000������άģ�����ݡ�360ȫ�����ݡ�ң��Ӱ�����ݡ���׼��ַ���ݡ�');
INSERT INTO DH_DATAITEM VALUES ('20', '1004', '2006', 'ũҵ����', 'farming.png', NULL, '2', '1', '1', '1.000', '2015-08-01', '1', '2015-07-31', 'RARѹ����', NULL, '111111', '������۾��þ������ݡ�ũ��ͳ�����ݡ�ũҵͳ�����ݡ���ҵͳ�����ݡ�����ҵͳ�����ݡ���ҵͳ�����ݡ���ʳר�����ݡ�ũ��Ʒó��ͳ�����ݡ�����ר�����ݡ���ҵר�����ݡ��޻�ר�����ݣ��߲ˡ�ˮ������Ҷ����ҩ�ġ�ˮ��Ʒ�۸��⡣');
INSERT INTO DH_DATAITEM VALUES ('20', '1004', '2007', '���ϵ�����������', 'sell.png', NULL, '2', '1', '1', '1.000', '2015-08-01', '1', '2015-07-31', 'RARѹ����', NULL, '111111', '������������è������ѷ��1�ŵꡢ�������������������������������������ַ�������Ѹ�����ϵ������ݡ�');
INSERT INTO DH_DATAITEM VALUES ('20', '1004', '2008', '����ҽҩ����', 'medicine.png', NULL, '2', '1', '1', '1.000', '2015-08-01', '1', '2015-07-31', 'RARѹ����', NULL, '111111', '����Ҽҩ�����������ϰ��մ�ҩ������ҩʦ����������');
INSERT INTO DH_DATAITEM VALUES ('20', '1004', '2009', 'Ӱ������', 'film.png', NULL, '2', '1', '1', '1.000', '2015-08-01', '1', '2015-07-31', 'RARѹ����', NULL, '111111', '�����ſᡢ�����ա��Ѻ���Ƶ����Ѷ��Ƶ�������������ꡢ1905��');
INSERT INTO DH_DATAITEM VALUES ('20', '1004', '2010', '������Ϣ', 'trip.png', NULL, '2', '1', '1', '1.000', '2015-08-01', '1', '2015-07-31', 'RARѹ����', NULL, '111111', '����Я�̡�ȥ�Ķ���;ţ�����ݡ�');
INSERT INTO DH_DATAITEM VALUES ('20', '1004', '2011', '��ͨ����', 'traffic.png', NULL, '2', '1', '1', '1.000', '2015-08-01', '1', '2015-07-31', 'RARѹ����', NULL, '111111', 'ȫ��31��ʡ���ص�Ӫ�˳���200����');
INSERT INTO DH_DATAITEM VALUES ('20', '1004', '2012', 'APP����', 'app.png', NULL, '2', '1', '1', '1.000', '2015-08-01', '1', '2015-07-31', 'RARѹ����', NULL, '111111', 'ȫ����׿ϵͳ��AppӦ�õ������û��������û��������û����������ݡ��û������Ϊ�Ⱥ�������');
INSERT INTO DH_DATAITEM VALUES ('20', '1004', '2013', '����΢������', 'sina_weibo.png', NULL, '2', '1', '1', '1.000', '2015-08-01', '1', '2015-07-31', 'RARѹ����', NULL, '111111', '����΢���˺�ͳ�����ݣ�7��24hȫ���ʵʱ��⣬�˺ŷ�����������������˿����3���湲��11��רҵ����ά�ȣ���Ѷ΢���˺�ͳ�����ݣ���˿���Լ���Ϊ������΢���������ݷ������˺Ż�����������ҵ������ݶԱȷ�����');
INSERT INTO DH_DATAITEM VALUES ('20', '1004', '2014', '����Υ�²�ѯ��������񡢶�λ���񡢽�������', 'car_peccancy.png', NULL, '2', '1', '1', '1.000', '2015-08-01', '1', '2015-07-31', 'RARѹ����', NULL, '111111', 'ȫ������Υ�²�ѯ��');
INSERT INTO DH_DATAITEM VALUES ('20', '1004', '2015', '����ʶ��', 'face_identify.png', NULL, '2', '1', '1', '1.000', '2015-08-01', '1', '2015-07-31', 'RARѹ����', NULL, '111111', '����ʶ�������Ϣ��');

INSERT INTO DH_FIELD VALUES ('1010', '1', 'phone_id', '�ֻ��ͺ�', '1', '1', NULL,'');
INSERT INTO DH_FIELD VALUES ('1010', '2', 'phone_brand', 'Ʒ��', '0', '2', '16','');
INSERT INTO DH_FIELD VALUES ('1010', '3', 'company', '��Ʒ����', '0', '2', '16','');
INSERT INTO DH_FIELD VALUES ('1010', '4', 'price', '����', '0', '3', NULL,'');
INSERT INTO DH_FIELD VALUES ('1010', '5', 'first_date', '��������', '0', '4', NULL,'');
INSERT INTO DH_FIELD VALUES ('1010', '6', 'amount', '����', '0', '1', NULL,'');



INSERT INTO DH_FIELD VALUES ('1011', '1', 'phone_id', '�ֻ��ͺ�', '1', '1', NULL,NULL);
INSERT INTO DH_FIELD VALUES ('1011', '2', 'phone_brand', '�ֻ�Ʒ��', '0', '2', '16',NULL);
INSERT INTO DH_FIELD VALUES ('1011', '3', 'time_band', 'ʱ���', '0', '2', '16',NULL);
INSERT INTO DH_FIELD VALUES ('1011', '4', 'call_counts', 'ͨ������', '0', '3', NULL,NULL);
INSERT INTO DH_FIELD VALUES ('1011', '5', 'amount', '��������������', '0', '4', NULL,NULL);

INSERT INTO DH_FIELD VALUES ('1012', '1', 'phone_id', '�ֻ��ͺ�', '1', '1', NULL,NULL);
INSERT INTO DH_FIELD VALUES ('1012', '2', 'phone_brand', '�ֻ�Ʒ��', '0', '2', '16',NULL);
INSERT INTO DH_FIELD VALUES ('1012', '3', 'position_name', 'λ������', '0', '2', '16',NULL);
INSERT INTO DH_FIELD VALUES ('1012', '4', 'call_counts', 'ͨ������', '0', '3', NULL,NULL);
INSERT INTO DH_FIELD VALUES ('1012', '5', 'amount', '��������������', '0','4',NULL,NULL);
INSERT INTO DH_FIELD VALUES ('1012', '6', 'call_time', '�״�ͨ��ʱ��', '0', '4',NULL,NULL);

INSERT INTO DH_FIELD VALUES ('1013', '1', 'phone_id', '�ֻ��ͺ�', '1', '1', NULL,NULL);
INSERT INTO DH_FIELD VALUES ('1013', '2', 'gender', '�Ա�', '0', '2', '16',NULL);
INSERT INTO DH_FIELD VALUES ('1013', '3', 'age', '����', '0', '2', '16',NULL);
INSERT INTO DH_FIELD VALUES ('1013', '4', 'in_years', '����ʱ��', '0', '3', NULL,NULL);
INSERT INTO DH_FIELD VALUES ('1013', '5', 'hobby', '��Ȥ����', '0','4',NULL,NULL);


INSERT INTO DH_USERLEVEL VALUES ('1', 'ע���û�');
INSERT INTO DH_USERLEVEL VALUES ('2', '��֤�û�');
INSERT INTO DH_USERLEVEL VALUES ('3', 'VIP�û�');

INSERT INTO DH_USERSTATUS VALUES ('1', '����');
INSERT INTO DH_USERSTATUS VALUES ('2', '����');
INSERT INTO DH_USERSTATUS VALUES ('3', 'ע��');

INSERT INTO DH_CURRENCY VALUES ('1', '�����', '�й����з��еĳ�Ʊ');
INSERT INTO DH_CURRENCY VALUES ('2', '��Ԫ', 'ɽķ�������ֽ');
INSERT INTO DH_CURRENCY VALUES ('3', 'Q��', '��Ѷ��˾�������');
INSERT INTO DH_CURRENCY VALUES ('4', '���ر�', 'һ������ı���');

INSERT INTO DH_PERMITTYPE VALUES ('1', '˽��');
INSERT INTO DH_PERMITTYPE VALUES ('2', '����');
INSERT INTO DH_PERMITTYPE VALUES ('3', '�û��������ɼ�');
INSERT INTO DH_PERMITTYPE VALUES ('4', '�û����������ɼ�');
INSERT INTO DH_PERMITTYPE VALUES ('5', '��������ɼ�');
INSERT INTO DH_PERMITTYPE VALUES ('6', '����������ɼ�');


INSERT INTO DH_PRICEUNIT VALUES ('10', '1', '����');
INSERT INTO DH_PRICEUNIT VALUES ('11', '1', '1ǧ��');
INSERT INTO DH_PRICEUNIT VALUES ('20', '1', '1������ȫ������');
INSERT INTO DH_PRICEUNIT VALUES ('30', '1', '1Сʱ����');

INSERT INTO DH_SUPPLYSTYLE VALUES ('1', '����');
INSERT INTO DH_SUPPLYSTYLE VALUES ('2', 'С��');
INSERT INTO DH_SUPPLYSTYLE VALUES ('3', '������');
INSERT INTO DH_SUPPLYSTYLE VALUES ('4', '������ѯ');
COMMIT;


## DH_USER��DH_REPOSITORY ��������������
ALTER TABLE DH_USER MODIFY USER_ID INT UNSIGNED NOT NULL AUTO_INCREMENT,
ADD PRIMARY KEY(USER_ID);

ALTER TABLE DH_REPOSITORY MODIFY REPOSITORY_ID INT UNSIGNED NOT NULL AUTO_INCREMENT,
ADD PRIMARY KEY(REPOSITORY_ID);

SELECT * FROM DH_DATAITEM WHERE DATAITEM_NAME="�ֻ���ͨ";
;
;
