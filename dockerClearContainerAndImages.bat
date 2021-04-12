:: 모든 container, image 삭제(동작중 포함)
@echo off
FOR /f "tokens=*" %%i IN ('docker ps -q') DO docker stop %%i
FOR /f "tokens=*" %%i IN ('docker ps -aq') DO docker rm %%i
FOR /f "tokens=*" %%i IN ('docker images --format "{{.ID}}"') DO docker rmi -f %%i
docker images