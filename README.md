# docker lnmp

Lnmp Service Environment

### 切换Nginx使用的PHP版本

首先，需要启动其他版本的PHP，比如PHP5.4，那就先在`docker-compose.yml`文件中删除PHP5.4前面的注释，再启动PHP5.4容器。

PHP7启动后，打开Nginx 配置，修改`fastcgi_pass`的主机地址，由`php`改为`php54`，如下：

```
    fastcgi_pass   php7:9000;
```

为：

```
    fastcgi_pass   php56:9000;
```

其中 `php7` 和 `php56` 是`docker-compose.yml`文件中服务器的名称。

最后，**重启 Nginx** 生效。

```bash
$ docker exec -it nginx nginx -s reload
```

### 启动

```
docker-compose -f docker-compose.yml up -d
```

### 停止

```
docker-compose -f docker-compose.yml stop
```

### 删除

```
docker-compose -f docker-compose.yml down
```