@echo off

set curdir=%~dp0

:: ������ �������� �ޱ�
set /p deployVersion=������ ������ �Է��ϼ���:

echo %deployVersion% ���� Ǫ������
docker tag knw1234/mariadb:base knw1234/mariadb:%deployVersion%
docker push knw1234/mariadb:%deployVersion%

echo latest ���� Ǫ������
docker tag knw1234/mariadb:base knw1234/mariadb:latest
docker push knw1234/mariadb:latest


pause