# Docker FluffOS

Docker 镜像 : FluffOS 的 Ubuntu 编译环境。

推荐直接使用以下指令使用镜像：

    docker pull fluffos/fluffos

如果需要 2017 版，请使用以下指令：

    docker pull fluffos/fluffos:v2017

具体说明请查看：https://hub.docker.com/r/fluffos/fluffos

**如果你想自己编译，请看以下编译说明。**

### 1. 准备工作

创建编译 fluffos 源码的 docker 镜像，请确定已经安装了 docker 1.12+ 和 git ，docker 安装可以参考以下教程：

* [Windows Docker 安装](https://www.runoob.com/docker/windows-docker-install.html)
* [MacOS Docker 安装](https://www.runoob.com/docker/macos-docker-install.html)

> 以下命令可能需要 `sudo` ，假设我们在 `~` 目录下操作，真正操作时，记得将下面代码中 `~` 替换为你新建 `docker` 目录位置的绝对路径。

下载镜像编译脚本到 `~/docker` 目录中

```bash
cd ~ && mkdir docker && cd docker
git clone https://github.com/MudRen/docker_fluffos.git
```

下载 fluffos 源码到 `~/docker` 目录中

```bash
cd ~/docker/
git clone https://github.com/fluffos/fluffos.git
```

### 2. 创建编译镜像

输入以下指令使用镜像脚本目录 `docker_fluffos` 中的配置文件创建编译镜像：

```bash
cd ~/docker/docker_fluffos/
./build.sh
```

成功后，输入 `docker images` 指令可以看到 REPOSITORY 下增加了 ubuntu 和 fluffos/build 两个 image，类似下面这样：

```bash
$ docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
fluffos/build       latest              cb172d841205        36 seconds ago      498MB
ubuntu              latest              2ca708c1c9cc        2 days ago          64.2MB
$
```

### 3. 编译驱动

利用镜像 fluffos/build 编译 fluffos 源码，生成驱动, 最终产生包括 `driver` 和 `portbind` 的 2 个二进制文件。

在 `docker_fluffos` 目录中输入以下指令创建驱动

```bash
./build.sh 2019
```

如果需要编译 2017 版，请用以下指令：

```bash
./build.sh 2017
```

成功后，输入 `ls -la docker_fluffos/bin/` 指令可以看到 `driver` 和 `portbind` 两个二进制文件。

### 4. 创建驱动镜像

生成 fluffos 驱动镜像，实际就是把 2 个二进制文件 copy 进 docker image ，同时安装其运行需要的依赖库。

在 `docker_fluffos` 目录中输入以下指令创建驱动镜像

```bash
./build.sh fluffos
```

成功后，输入 `docker images` 指令可以看到 REPOSITORY 下增加了 fluffos，类似下面这样：

```
$ docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
fluffos/fluffos     latest              28b77a51812d        4 minutes ago       119MB
fluffos/build       latest              cb172d841205        33 minutes ago      498MB
ubuntu              latest              2ca708c1c9cc        2 days ago          64.2MB
$
```

### 5. 运行游戏

运行 MUD ，即用 fluffos 驱动 mudlib ，比如 fy、xkx、xyj 等，这里以炎黄（ https://github.com/oiuv/mud ）为例。

> 注意运行前修改运行时配置文件 config.ini 中 mudlib 目录位置

```bash
cd ~/docker
git clone https://github.com/oiuv/mud.git
# 修改 mud 中 config.ini 配置文件：mudlib directory : /opt/docker/mud
# 运行以下指令启动 mud (config.ini 中配置的端口为 6666，如果是其它 mud 请自己换成对应端口)
docker run -d --name mud -p 6666:6666 -v ~/docker/mud:/opt/docker/mud fluffos/fluffos /opt/docker/mud/config.ini
```
成功后，输入 `docker ps` 指令可以看到 `0.0.0.0:6666->6666/tcp`，失败可以输入 `docker logs -f mud` 指令查看 log，也可以进一步查看 mudlib 的 debug.log (比如 `tail -f ~/docker/mud/log/debug.log`)。

> 游戏地址

    # MacOS
    127.0.0.1 6666
    # Windows
    192.168.99.100 6666

> 游戏服务器管理

    启动服务器：docker start mud
    关闭服务器：docker stop mud  (推荐游戏中shutdown)
    重启服务器：docker restart mud
