CREATE TABLE calisanlar(
    [id] INTEGER IDENTITY(1,1) NOT NULL,
	[calisan_ad] [varchar](100) NOT NULL,
	[calisan_soyad] [varchar](100) NOT NULL,
	[calisan_cinsiyet] [varchar](20) NOT NULL,
	[calisan_yas] [varchar](10) NOT NULL,
	[subesi] [int] ,
	[mudurleri] [int],
	PRIMARY KEY CLUSTERED 
 (
    id ASC
 )WITH(PAD_INDEX=OFF, STATISTICS_NORECOMPUTE=OFF, IGNORE_DUP_KEY=OFF, ALLOW_ROW_LOCKS=ON, ALLOW_PAGE_LOCKS=ON) ON [PRIMARY] 
)ON [PRIMARY]



CREATE TABLE magaza(
    [id] INTEGER IDENTITY(1,1) NOT NULL,
	[magaza_ad] [varchar](255) NOT NULL,
	[magaza_sehir] [varchar](100) NOT NULL,
	[magaza_telefon] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
 (
   id ASC
 )WITH(PAD_INDEX=OFF, STATISTICS_NORECOMPUTE=OFF, IGNORE_DUP_KEY=OFF, ALLOW_ROW_LOCKS=ON, ALLOW_PAGE_LOCKS=ON) ON [PRIMARY] 
)ON [PRIMARY]



CREATE TABLE mudurler(
    [id] [int] IDENTITY(1,1) NOT NULL,
	[mudur_ad] [varchar](100) NOT NULL,
	[mudur_soyad] [varchar](100) NOT NULL,
	[mudur_cinsiyet] [varchar](20) NOT NULL,
	[mudur_yas] varchar(10) NOT NULL,
	[subesi] [int] ,
PRIMARY KEY CLUSTERED 
 (
    id ASC
 )WITH(PAD_INDEX=OFF, STATISTICS_NORECOMPUTE=OFF, IGNORE_DUP_KEY=OFF, ALLOW_ROW_LOCKS=ON, ALLOW_PAGE_LOCKS=ON) ON [PRIMARY] 
)ON [PRIMARY]



CREATE TABLE subeler(
	[id] [int] IDENTITY(1,1) NOT NULL,
	[sube_ad] [varchar](100) NOT NULL,
	[sube_sehir] [varchar](100) NOT NULL,
	[sube_telefon] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
 (
    id ASC
 )WITH(PAD_INDEX=OFF, STATISTICS_NORECOMPUTE=OFF, IGNORE_DUP_KEY=OFF, ALLOW_ROW_LOCKS=ON, ALLOW_PAGE_LOCKS=ON) ON [PRIMARY] 
)ON [PRIMARY]




ALTER TABLE mudurler WITH CHECK ADD CONSTRAINT [FK_mudursube] FOREIGN KEY(subesi) REFERENCES subeler (id) 
ALTER TABLE mudurler CHECK CONSTRAINT [FK_mudursube]

ALTER TABLE calisanlar WITH CHECK ADD CONSTRAINT [FK_calisansube] FOREIGN KEY(subesi) REFERENCES subeler (id) 
ALTER TABLE calisanlar CHECK CONSTRAINT [FK_calisansube]

ALTER TABLE calisanlar WITH CHECK ADD CONSTRAINT [FK_calisanmudur] FOREIGN KEY(mudurleri) REFERENCES mudurler (id) 
ALTER TABLE calisanlar CHECK CONSTRAINT [FK_calisanmudur]






INSERT INTO subeler(sube_ad,sube_sehir,sube_telefon) VALUES ('A Subesi','ÝSTANBUL','02163544298')
INSERT INTO subeler(sube_ad,sube_sehir,sube_telefon) VALUES ('B Subesi','ANKARA','02823548965')
INSERT INTO subeler(sube_ad,sube_sehir,sube_telefon) VALUES ('C Subesi','ÝZMÝR','02578912328')


INSERT INTO mudurler (mudur_ad, mudur_soyad,mudur_cinsiyet, mudur_yas, subesi) VALUES  ('Ali','Kýrýk','E','46','1')
INSERT INTO mudurler (mudur_ad, mudur_soyad,mudur_cinsiyet, mudur_yas, subesi) VALUES  ('Özlem','Gündüz','K','37','3')
INSERT INTO mudurler (mudur_ad, mudur_soyad,mudur_cinsiyet, mudur_yas, subesi) VALUES  ('Ýpek','Karbuz','k','32','2')


INSERT INTO calisanlar(calisan_ad, calisan_soyad, calisan_cinsiyet, calisan_yas,subesi, mudurleri)VALUES ('Esra','Sezer','K','24','1','1')
INSERT INTO calisanlar(calisan_ad, calisan_soyad, calisan_cinsiyet, calisan_yas,subesi, mudurleri)VALUES ('Kaan','Kurt','E','24','2','2')
INSERT INTO calisanlar(calisan_ad, calisan_soyad, calisan_cinsiyet, calisan_yas,subesi, mudurleri)VALUES ('Elif','Kutun','K','25','3','3')
INSERT INTO calisanlar(calisan_ad, calisan_soyad, calisan_cinsiyet, calisan_yas,subesi, mudurleri)VALUES ('Melisa','Bal','K','21','1','1')
INSERT INTO calisanlar(calisan_ad, calisan_soyad, calisan_cinsiyet, calisan_yas,subesi, mudurleri)VALUES ('Hasan','Zeblin','E','28','2','2')
INSERT INTO calisanlar(calisan_ad, calisan_soyad, calisan_cinsiyet, calisan_yas,subesi, mudurleri)VALUES ('Gece','Demir','E','20','3','3')
INSERT INTO calisanlar(calisan_ad, calisan_soyad, calisan_cinsiyet, calisan_yas,subesi, mudurleri)VALUES ('Araf','Ay','E','27','1','1')


INSERT INTO magaza (magaza_ad,magaza_sehir,magaza_telefon) VALUES ('X Firmasý','Ýstanbul','02127460132')


/* **** SORGULAR  **** */


CREATE PROCEDURE  calisansorgu
@calisan_ad varchar(100)
AS
BEGIN

SELECT * FROM calisanlar
WHERE calisan_ad like '%'+@calisan_ad+'%'
END
GO

/*  exec calisansorgu @calisan_ad= 'elif'  */



CREATE PROCEDURE  mudursorgu
@mudur_ad varchar(100)
AS
BEGIN

SELECT * FROM mudurler
WHERE mudur_ad like '%'+@mudur_ad+'%'
END
GO

/*  exec mudursorgu @mudur_ad= 'Ýpek'  */


CREATE PROCEDURE  subesorgu
@sube_sehir varchar(100)
AS
BEGIN

SELECT * FROM subeler
WHERE sube_sehir like '%'+@sube_sehir+'%'
END
GO

 /*  exec subesorgu @sube_sehir= 'Ýzmir'  */



 /* **** SORGULAR (INSERT INTO) **** */

 CREATE PROCEDURE calisanlarekleme
@calisan_ad varchar(100),
@calisan_soyad varchar(100),
@calisan_cinsiyet varchar(20),
@calisan_yas int,
@subesi int,
@mudurleri int

AS
BEGIN

INSERT INTO calisanlar (calisan_ad, calisan_cinsiyet, calisan_soyad, calisan_yas, subesi, mudurleri )
  VALUES (@calisan_ad, @calisan_soyad, @calisan_cinsiyet, @calisan_yas, @subesi, @mudurleri )
  END
  GO

 /* exec calisanlarekleme @calisan_ad = 'Yaðmur', @calisan_cinsiyet = 'K', @calisan_soyad = 'Bol', @calisan_yas = '32', @subesi = '3', @mudurleri = '2'  */


CREATE PROCEDURE mudurekleme
@mudur_ad varchar(100),
@mudur_soyad varchar(100),
@mudur_cinsiyet varchar(20),
@mudur_yas varchar(10),
@subesi int

AS
BEGIN

INSERT INTO mudurler (mudur_ad,mudur_cinsiyet, mudur_soyad, mudur_yas,subesi)
VALUES (@mudur_ad,@mudur_cinsiyet,@mudur_soyad,@mudur_yas,@subesi)
END
GO


  /*  EXEC mudurekleme @mudur_ad = 'Yusuf', @mudur_soyad = 'Sev', @mudur_cinsiyet = 'E', @mudur_yas = '42', @subesi = '2'  */


  CREATE PROCEDURE subeekleme
  @sube_ad varchar(100),
  @sube_sehir varchar(100),
  @sube_telefon varchar(20)

  AS
  BEGIN

  INSERT INTO subeler (sube_ad,sube_sehir,sube_telefon)
  VALUES (@sube_ad,@sube_sehir,@sube_telefon)
  END
  GO


   /* EXEC subeekleme @sube_ad = 'D Þubesi', @sube_sehir = 'Tekirdað', @sube_telefon = '02822622548'  */




  CREATE PROCEDURE magazaekleme
  @magaza_ad varchar(255),
  @magaza_sehir varchar(100),
  @magaza_telefon varchar(255)

  AS
  BEGIN

  INSERT INTO magaza (magaza_ad,magaza_sehir,magaza_telefon)
  VALUES (@magaza_ad,@magaza_sehir,@magaza_telefon)
  END
  GO







   /* **** SORGULAR (JOIN) **** */



CREATE PROCEDURE Spcalisansube 

AS  
BEGIN

SET NOCOUNT ON;  
SELECT * FROM calisanlar   
INNER JOIN subeler ON calisanlar.id = subeler.id  
INNER JOIN magaza ON calisanlar.id = magaza.id 
INNER JOIN mudurler ON subeler.id = mudurler.id
END


 /*   EXEC Spcalisansube  */

CREATE PROCEDURE  Spmudurcalisan

AS  
BEGIN  
SET NOCOUNT ON; 
SELECT * FROM mudurler  
INNER JOIN calisanlar ON mudurler.id = calisanlar.mudurleri
END 

 /*  EXEC Spmudurcalisan   */


 
CREATE PROCEDURE  calisansube

AS  
BEGIN  
SET NOCOUNT ON; 
SELECT * FROM calisanlar  
INNER JOIN subeler ON calisanlar.id = subeler.id
 
END 

  /* EXEC calisansube  */


  CREATE PROCEDURE  subecalisan
  AS
  BEGIN
  SET NOCOUNT ON;
  SELECT * FROM subeler
  LEFT JOIN calisanlar ON subeler.id = calisanlar.id

  END

 /* EXEC subecalisan  */





/**************   INDEX   ***********/


CREATE INDEX calisanidx
ON calisanlar(calisan_ad);





CREATE INDEX calisanadsoyad
ON calisanlar(calisan_ad,calisan_soyad);





CREATE NONCLUSTERED INDEX idxcalisanyas ON calisanlar (subesi ASC, calisan_yas DESC)





CREATE NONCLUSTERED INDEX idxsube ON  subeler (id ASC)





CREATE NONCLUSTERED INDEX idxmudur ON mudurler (subesi ASC, id)  





ALTER INDEX ALL ON mudurler REBUILD;
GO


ALTER INDEX ALL ON subeler REBUILD;
GO


ALTER INDEX idxsube ON subeler REBUILD;
GO


ALTER INDEX calisanidx ON calisanlar REBUILD;
GO


ALTER INDEX idxcalisanyas ON calisanlar REORGANIZE;
GO


ALTER INDEX calisanadsoyad ON calisanlar REORGANIZE;
GO
  

ALTER INDEX ALL ON mudurler REORGANIZE;
GO








