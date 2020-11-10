@echo off

set curdir=%~dp0

:: 배포할 버전정보 받기
set /p deployVersion=배포할 버전을 입력하세요:

echo %deployVersion% 버전 푸쉬시작
docker tag knw1234/mariadb:base knw1234/mariadb:%deployVersion%
docker push knw1234/mariadb:%deployVersion%

echo latest 버전 푸쉬시작
docker tag knw1234/mariadb:base knw1234/mariadb:latest
docker push knw1234/mariadb:latest


pause