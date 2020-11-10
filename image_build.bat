@echo off

:: docker image build
docker build -t knw1234/mariadb:base .

docker images

pause