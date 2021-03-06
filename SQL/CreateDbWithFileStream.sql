USE MASTER
GO

CREATE DATABASE [MyDb]
ON PRIMARY
(
	NAME = 'MyDb_data',
	FILENAME = N'H:\SQLData\MyDb_data.mdf',
	SIZE = 5GB,
	MAXSIZE = UNLIMITED,
	FILEGROWTH = 10% 
),
FILEGROUP [FileStreamGroup] CONTAINS FILESTREAM DEFAULT
(
	NAME = 'MyDb_blobs',
	FILENAME = N'S:\SQLFileStreamData\MyDbFiles'
)
LOG ON
(
	NAME = 'MyDb_log',
	FILENAME = N'L:\SQLLogs\MyDb_log.ldf',
	SIZE = 1024KB , 
	MAXSIZE = UNLIMITED, 
	FILEGROWTH = 10%
)
WITH FILESTREAM (NON_TRANSACTED_ACCESS = FULL, DIRECTORY_NAME = N'MyDbFiles')
GO

ALTER DATABASE [MyDb] SET RECOVERY SIMPLE
GO
