CREATE DATABASE WIPRO


create table tb_Processo(
	[IdProcesso] [int] IDENTITY(1,1),
	nroProcesso bigint not null,
	Autor varchar(90) ,
	DtEntrada date ,
	DtEncerramento  date ,
	IdStatus int ,					
	PRIMARY KEY ([IdProcesso]),	    
	FOREIGN KEY ([IdStatus]) REFERENCES tb_Status([IdStatus]))

create table tb_Status(
	[IdStatus] [int] IDENTITY(1,1) PRIMARY KEY,
	dsStatus varchar(50))

create table tb_Andamento(
	[IdAndamento] [int] IDENTITY(1,1),
	[IdProcesso] [int] not null,
	dtAndamento date,
	dsMovimento  varchar(2000),
		PRIMARY KEY ([IdAndamento]),
		FOREIGN KEY ([IdProcesso]) REFERENCES tb_Processo([IdProcesso]))


--1. Com base no modelo acima, escreva um comando SQL que liste a quantidade de processos por Status com sua descrição.

select 
[IdProcesso] ,
nroProcesso ,
Autor ,
DtEntrada ,
DtEncerramento,
tb_Status.dsStatus
from tb_Processo 
inner join  tb_Status on tb_Status.IdStatus = tb_Processo.IdStatus 

--2. Com base no modelo acima, construa um comando SQL que liste a maior data de andamento 
--por número de processo, com processos encerrados no ano de 2013.

select 
tb_Andamento.[IdProcesso] ,
dtAndamento
from tb_Andamento 
inner join  tb_Processo on tb_Andamento.[IdProcesso] = tb_Processo.[IdProcesso] 
where tb_Processo.DtEncerramento <= '2013-12-31'
 order  by dtAndamento desc

-- 3. Com base no modelo acima, construa um comando SQL que liste a quantidade de Data de 
--Encerramento agrupada por ela mesma onde a quantidade da contagem seja maior que 5.

select 
tb_Processo.DtEncerramento,
Count(tb_Processo.DtEncerramento)
from tb_Processo 
 group by  tb_Processo.DtEncerramento
 HAVING Count(tb_Processo.DtEncerramento) > 5

--4 Possuímos um número de identificação do processo, onde o mesmo contém 12 caracteres 
--com zero à esquerda, contudo nosso modelo e dados ele é apresentado como bigint. Como 
--fazer para apresenta-lo com 12 caracteres considerando os zeros a esquerda

SELECT TOP (1000) [IdProcesso]
      , REPLICATE('0', 12 - LEN([nroProcesso])) + RTrim([nroProcesso]) as [nroProcesso]
      ,[Autor]
      ,[DtEntrada]
      ,[DtEncerramento]
      ,[IdStatus]
  FROM [Desafio].[dbo].[tb_Processo]




 --PopulandoBanco
 USE [Desafio]
GO

INSERT INTO [dbo].[tb_Processo] VALUES(FLOOR(RAND()*(10000000)),'gabriel serafim','2013-01-05','2013-09-05',1)
INSERT INTO [dbo].[tb_Processo] VALUES(FLOOR(RAND()*(10000000)),'miguel serafim','2013-01-05','2014-01-05',2)
INSERT INTO [dbo].[tb_Processo] VALUES(FLOOR(RAND()*(10000000)),'isabelle','2010-01-05','2011-09-05',2)
INSERT INTO [dbo].[tb_Processo] VALUES(FLOOR(RAND()*(10000000)),'aleide','2015-01-05','2015-09-05',4)
INSERT INTO [dbo].[tb_Processo] VALUES(FLOOR(RAND()*(10000000)),'joao','2012-01-05','2013-09-05',1)
INSERT INTO [dbo].[tb_Processo] VALUES(FLOOR(RAND()*(10000000)),'fulano','2013-01-05','2013-12-30',5)
INSERT INTO [dbo].[tb_Processo] VALUES(FLOOR(RAND()*(10000000)),'betrano','2013-01-05','2013-12-31',3)
INSERT INTO [dbo].[tb_Processo] VALUES(FLOOR(RAND()*(10000000)),'cicrano','2013-12-31','2014-01-01',3)
INSERT INTO [dbo].[tb_Processo] VALUES(FLOOR(RAND()*(10000000)),'cicrano','2013-12-31','2014-01-01',3)
INSERT INTO [dbo].[tb_Processo] VALUES(FLOOR(RAND()*(10000000)),'olivia',null,null,3)
INSERT INTO [dbo].[tb_Processo] VALUES(FLOOR(RAND()*(10000000)),'cleide',null,null,3)
INSERT INTO [dbo].[tb_Processo] VALUES(FLOOR(RAND()*(10000000)),'carlos',null,null,3)
INSERT INTO [dbo].[tb_Processo] VALUES(FLOOR(RAND()*(10000000)),'wendel','2013-12-31','2015-01-01',3)
INSERT INTO [dbo].[tb_Processo] VALUES(FLOOR(RAND()*(10000000)),'wendel','2013-12-31','2015-01-01',3)
INSERT INTO [dbo].[tb_Processo] VALUES(FLOOR(RAND()*(10000000)),'wendel','2013-12-31','2015-01-01',3)
INSERT INTO [dbo].[tb_Processo] VALUES(FLOOR(RAND()*(10000000)),'wendel','2013-12-31','2015-01-01',3)
INSERT INTO [dbo].[tb_Processo] VALUES(FLOOR(RAND()*(10000000)),'wendel','2013-12-31','2015-01-01',3)
INSERT INTO [dbo].[tb_Processo] VALUES(FLOOR(RAND()*(10000000)),'wendel','2013-12-31','2015-01-01',3)
INSERT INTO [dbo].[tb_Processo] VALUES(FLOOR(RAND()*(10000000)),'wendel','2013-12-31','2015-01-01',3)
INSERT INTO [dbo].[tb_Processo] VALUES(FLOOR(RAND()*(10000000)),'wendel','2013-12-31','2015-01-01',3)
INSERT INTO [dbo].[tb_Processo] VALUES(FLOOR(RAND()*(10000000)),'wendel','2013-12-31','2015-01-01',3)

INSERT INTO [dbo].[tb_Processo] VALUES(FLOOR(RAND()*(10000000)),'clara','2013-12-31','2015-01-01',3)
INSERT INTO [dbo].[tb_Processo] VALUES(FLOOR(RAND()*(10000000)),'clara','2013-12-31','2015-01-01',3)
INSERT INTO [dbo].[tb_Processo] VALUES(FLOOR(RAND()*(10000000)),'clara','2013-12-31','2015-01-01',3)

INSERT INTO [dbo].[tb_Processo] VALUES(FLOOR(RAND()*(10000000)),'leticia','2013-01-31','2013-06-07',3)
INSERT INTO [dbo].[tb_Processo] VALUES(FLOOR(RAND()*(10000000)),'leticia','2013-01-31','2013-06-07',3)
INSERT INTO [dbo].[tb_Processo] VALUES(FLOOR(RAND()*(10000000)),'leticia','2013-01-31','2013-06-07',3)
INSERT INTO [dbo].[tb_Processo] VALUES(FLOOR(RAND()*(10000000)),'leticia','2013-01-31','2013-06-07',3)
INSERT INTO [dbo].[tb_Processo] VALUES(FLOOR(RAND()*(10000000)),'leticia','2013-01-31','2013-06-07',3)
INSERT INTO [dbo].[tb_Processo] VALUES(FLOOR(RAND()*(10000000)),'leticia','2013-01-31','2013-06-07',3)

INSERT INTO [dbo].[tb_Processo] VALUES(0000000000001,'stefani','2013-01-31','2013-12-20',1)


INSERT INTO [dbo].[tb_Andamento] VALUES(1,'2013-01-05','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially un')
INSERT INTO [dbo].[tb_Andamento] VALUES(2,'2012-01-05','text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially un')
INSERT INTO [dbo].[tb_Andamento] VALUES(5,'2009-01-05','Lorof the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially un')
INSERT INTO [dbo].[tb_Andamento] VALUES(3,'2014-01-05','Lorem industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially un')
INSERT INTO [dbo].[tb_Andamento] VALUES(2,'2011-01-05','Lorem text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially un')
INSERT INTO [dbo].[tb_Andamento] VALUES(1,'2012-01-05','remprinting and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially un')
INSERT INTO [dbo].[tb_Andamento] VALUES(4,'2012-01-05','text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially un')
INSERT INTO [dbo].[tb_Andamento] VALUES(1,'2012-01-05','galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially un')


INSERT INTO [dbo].[tb_Status] VALUES('c#')
INSERT INTO [dbo].[tb_Status] VALUES('js')
INSERT INTO [dbo].[tb_Status] VALUES('html')
INSERT INTO [dbo].[tb_Status] VALUES('java')
INSERT INTO [dbo].[tb_Status] VALUES('python')
INSERT INTO [dbo].[tb_Status] VALUES('node')

GO


 --PopulandoBanco
