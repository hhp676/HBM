@echo off

cd %~dp0/../..
echo [INFO] install hdf into local repository.
call mvn clean install -N

cd %~dp0/..
echo [INFO] install base into local repository.
call mvn clean install -pl base -am -Dmaven.test.skip=true

echo [INFO] install agent and its modules into local repository.
call mvn clean install -pl agent -am -amd -Dmaven.test.skip=true
cd bin
pause