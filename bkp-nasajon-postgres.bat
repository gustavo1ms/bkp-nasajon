@echo off
   for /f "tokens=1-4 delims=/ " %%i in ("%date%") do (
     set dow=%%i
     set month=%%j
     set day=%%k
     set year=%%l
   )
   set datestr=%dow%%month%%day%_%year%
   echo datestr is %datestr%
    
   set BACKUP_FILE=backup_%datestr%.backup
   echo backup file name is %BACKUP_FILE%
   SET PGPASSWORD=postgres
   echo on
   C:
   cd "Program Files\PostgreSQL\9.3\bin"
   pg_dump -i -h 127.0.0.1 -p 5432 -U postgres -F c -b -v -f "D:\Banco de Dados\Postgre\%BACKUP_FILE%" integrattodb1
   copy "D:\Banco de Dados\Postgre\%BACKUP_FILE%" "F:\Backup_Nasajon\Postgres"