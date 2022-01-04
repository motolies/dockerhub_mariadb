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
