@echo off & setlocal enabledelayedexpansion

if not defined JAVA_HOME (
  echo Error: JAVA_HOME is not set.
  goto :eof
)

set JAVA_HOME=%JAVA_HOME:"=%

if not exist "%JAVA_HOME%"\bin\java.exe (
  echo Error: JAVA_HOME is incorrectly set.
  goto :eof
)

set JAVA="%JAVA_HOME%"\bin\java

set LIB_JARS=""

cd ..\lib
for %%i in (*) do set LIB_JARS=!LIB_JARS!;..\lib\%%i
cd ..\bin

echo on
call %JAVA% -Xms64m -Xmx1024m -XX:PermSize=64M -XX:MaxPermSize=512M -classpath ..;../etc;%LIB_JARS% com.alibaba.dubbo.container.Main
