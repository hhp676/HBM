@echo off

cd %~dp0/../..
echo [INFO] install hdf into local repository.
call mvn clean install -N

cd %~dp0/..
echo [INFO] install hbm into local repository.
call mvn clean install -Dmaven.test.skip=true
cd bin
pause