-- Kill all clients

declare @kill varchar(8000) = '';
select @kill=@kill+'kill '+convert(varchar(5),spid)+';'
    from master..sysprocesses 
where dbid=db_id('MyDB');
exec (@kill);

-- Delete information about the  database from the backup and restore history tables

EXEC msdb.dbo.sp_delete_database_backuphistory @database_name = N'MyDB'
GO

-- Drop DB

USE [master]
GO

DROP DATABASE MyDb
GO
