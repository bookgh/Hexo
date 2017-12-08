@echo off

REM ------------------------------------------------------------------------------
REM 备份web服务器,Mysql
REM date 格式化输出日期
REM mysqldump mysqldump路径及登录用户信息
REM winrar 指定winrar压缩文件路径(由于路径有空格需用引号)
REM backuppath 备份路径
REM 自动删除100天以前的目录
REM ------------------------------------------------------------------------------

REM 设置变量
set date=%date:~0,4%-%date:~5,2%-%date:~8,2%
set backuppath="E:\File_Softwart_Backup\web_0.6_backup\%date%"
set mysqldump=D:\xampp\mysql\bin\mysqldump.exe -uroot -pDtBnGFAXnLD1mPRL
set winrar="c:\Program Files\WinRAR\WinRAR.exe"

REM 创建备份目录
mkdir %backuppath%

REM 备份mysql,压缩备份后的文件,删除sql文件
%mysqldump% -A -B > %backuppath%\mysq.sql
%winrar% a -k -r -s -m1 %backuppath%\mysql.sql.rar %backuppath%\mysq.sql
del %backuppath%\*.sql

REM 备份网页数据
%winrar% a -k -r -s -m1 %backuppath%\htdocs.rar  D:\xampp\htdocs

REM 指定待删除文件的存放路径
set SrcDir=E:\File_Softwart_Backup\web_0.6_backup

REM 指定天数
set DaysAgo=100


REM 删除文件   (删除echo)  forfiles /p %SrcDir% /s /m *.* /d -%DaysAgo% /c "cmd /c echo del /f /q /a @path"
REM 删除文件夹 (删除echo)  forfiles /p %SrcDir% /s /m * /d -%DaysAgo% /c "cmd /c echo rd /s /q  @path"
forfiles /p %SrcDir% /s /m * /d -%DaysAgo% /c "cmd /c rd /s /q  @path"



