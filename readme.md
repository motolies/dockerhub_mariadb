# knw1234/mariadb ([dockerhub](https://hub.docker.com/r/knw1234/mariadb))

내 마음대로 수정한 mariadb

## Docker Buildx Usage

```
# 기본 docker buildx 로는 바로 빌드가 되지 않는다.
# 그래서 신규로 하나 생성하여 주자
docker buildx create --name jarvis \
&& docker buildx use jarvis \
&& docker buildx inspect --bootstrap

# Dockerfile로 빌드해서 푸쉬까지 하기
docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7 -t knw1234/mariadb --push .

# -t 옵션을 붙이면 tag를 추가해서 업로드 가능하다
docker buildx build --platform linux/amd64,linux/arm64 -t knw1234/mariadb -t knw1234/mariadb:10.6 --push .

```

## Docker Build Usage

```
# 빌드
docker build -t knw1234/mariadb -t knw1234/mariadb:{특정버전} .

# 빌드 후 테스트(--restart=unless-stopped 재부팅시도 다시 시작)
docker run -d --restart=unless-stopped -p 13306:3306 -e MYSQL_ROOT_PASSWORD=root --name mydb knw1234/mariadb

# 이미지 푸쉬(한번에 다 올라감, latest 및 특정버전태그)
docker push --all-tags knw1234/mariadb
```

---

<br>

# 파일 복사해서 복구하기

<br>

## shell 작업

```bash
# 복사하기
docker cp {hostFile} {containerName}:{containerPath}
docker cp skyscape-2022-03-29.sql.gz mariadb:/root

# 접속하기
docker exec -it mariadb bash

# 사용자 만들기
# insert에 맞는 사용자를 만들어야 하며, 아래에 기술


# 디비 복구하기
gunzip < skyscape-2022-03-29.sql.gz | mysql -uroot -p --max_allowed_packet=64M

```

<br>

## 사용자 만들기

```sql
# 사용자 만들기
CREATE USER 'skyscape'@'%' IDENTIFIED BY 'skyscape';

# 모든 권한 주기(프로덕션 환경에서는 안됩니다...)
GRANT ALTER, SHOW VIEW, SHOW DATABASES, SELECT, PROCESS, EXECUTE, ALTER ROUTINE, CREATE, CREATE ROUTINE, CREATE TABLESPACE, CREATE TEMPORARY TABLES, CREATE VIEW, DELETE, DROP, EVENT, INDEX, INSERT, REFERENCES, TRIGGER, UPDATE, BINLOG ADMIN, BINLOG REPLAY, CONNECTION ADMIN, CREATE USER, FEDERATED ADMIN, FILE, LOCK TABLES, READ_ONLY ADMIN, RELOAD, REPLICATION MASTER ADMIN, REPLICATION SLAVE, REPLICATION SLAVE ADMIN, SET USER, SHUTDOWN, SUPER  ON *.* TO 'skyscape'@'%' WITH GRANT OPTION;

# 갱신 및 권한 확인
FLUSH PRIVILEGES;
SHOW GRANTS FOR 'skyscape'@'%';
```
