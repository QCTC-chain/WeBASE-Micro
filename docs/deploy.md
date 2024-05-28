# WeBASE-Micro开发部署文档

## 1 部署前准备

### 主工程下载、配置修改、编译

下载主工程：

```
git clone https://github.com/QCTC-chain/WeBASE-Micro.git
```

切换到main分支

```
cd WeBASE-Micro
git checkout main
```

修改WeBASE-Micro中的对应环境nacos地址(主工程的pom.xml文件)，生产环境选择`prod`。同时修改`webase-nacos`工程的数据库连接配置。webase-nacos在主工程的`./webase-visual/webase-nacos`目录下， 修改`application.properties`文件中的以下配置，即nacos连接的数据库环境。

```
### Connect URL of DB:
db.url.0=jdbc:mysql://mysql:3306/webase-config?characterEncoding=utf8&connectTimeout=1000&socketTimeout=3000&autoReconnect=true&useUnicode=true&useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true
db.user.0=root
db.password.0=webase123
```

编译、打包jar包，可以使用idea编译器，也可以用以下命令：

```
mvn clean install -D maven.test.skip=true -P prod
```

### bcos相关镜像构建

涉及到的项目有：

1、签名服务：https://github.com/WeBankBlockchain/WeBASE-Sign，master-3.0分支。需要添加application-docker.yml文件到resource目录，同时修改docker/build/build.sh中的镜像名称为webase-sign-micro。

2、节点管理服务：https://github.com/WeBankBlockchain/WeBASE-Node-Manager, lab-3.0-microservice分支。

#### 签名服务的镜像构建

1、进入docker/build 目录

```
cd ./docker/build
```

2、执行镜像构建脚本

```
./build.sh -t v3.1.1 
```

#### 节点管理服务的镜像构建

1、进入docker/build 目录

```
cd ./docker/build
```

2、执行镜像构建脚本

```
./build.sh -t v3.1.1 
```

### WeBASE-Micro前端构建

1、进入主工程的`webase-ui`目录

```
cd ./webase-ui
```

2、编译打包，执行以下命令：

```
npm install
npm run build:prod
```

3、将生成的dist目录修改为html目录，拷贝到主工程的`./docker/nginx`目录中。

### BCOS的BAAS前端构建

bcos的前端仓库路径为：https://github.com/WeBankBlockchain/WeBASE-Web，分支为lab-3.0-microservice。

1、下载项目之后，进入主目录

```
cd ./WeBASE-Web
```

2、执行以下命令构建

```
npm install
npm run update
npm run build
```

3、构建完成后，生成dist目录

4、将dist目录修改为`bcos3`，然后拷贝到主工程的`./docker/nginx/html/child`目录中。

### 部署文件上传

将WeBASE-Micro工程的修改后的`docker`目录上传至目标服务器的部署目录下。**重点注意: 一定要确保目录 `docker` 及其所有子目录具有写权限 如果后续出现权限异常问题 重新执行一遍分配权限**

```
sudo chmod -R 777 ./docker
```

## 2 部署

### 创建基础服务

```shell
docker-compose up -d mysql redis minio 
```

### 数据库初始化

1、创建`webase-cloud、webase-config、webase-seata、webase-host` 数据库，将WeBASE-Micro的sql目录下的`webase-cloud.sql`、`webase-config.sql`、`webase-seata.sql、webase-host.sql`分别导入对应的数据库中。

2、创建`webasenodemanager3`数据库，对应的是bcos3.4版本，需要执行节点管理服务项目下的`./script/webase-ddl`和`./script/webase-dml`文件。

3、创建`webasesign3`数据库，对应的是bcos3.4版本。

4、修改资源服务中对应数据库表中文件服务地址，webase-cloud数据库，sys_oss_config表中的minio记录中的endpoint字段

### 创建nacos服务并配置

```
docker-compose up -d nacos
```

进入nacos页面http://ip:8848/nacos，默认用户名密码为nacos/nacos，将项目 `config/nacos` 下所有配置复制到 `nacos` 内(建议手动复制内容 防止编码不一致问题)，同时根据实际修改配置，包括但不限于:

1、`common.yml `部署主机的ssh key和公钥信息

3、修改`bcos3-node-mgr.yml`文件中的

````
 加密类型 encryptType: 1
 部署类型 deployType: 1
 签名服务地址(填写nginx开放的签名服务地址)： webaseSignAddress: "http://ip/WeBASE-Sign"
````

### 启动其他服务

启动seata-server、sentinel、webase-gateway、webase-auth、 webase-system、 webase-host、 webase-resource、node-mgr、sign

```
docker-compose up -d
```

## 3 启动测试

以上步骤执行完之后，即完成了WeBASE-Micro的部署，浏览器访问对应的ip地址即可进入webase的登录页面。初始账户密码：admin/admin123。

## 4 其他说明

bcos3.4版本可视化部署使用的是将front和节点打包的镜像，目前已经上传到docker hub上了，如果后续有改动，则需要进行以下步骤

1、webase-front编译：https://github.com/WeBankBlockchain/WeBASE-Front/tree/lab-3.0-microservice，进入项目目录，执行`./gradlew build -x test`，生成dist目录。

2、使用**[WeBASE-Docker](https://github.com/WeBankBlockchain/WeBASE-Docker)**进行打包。

3、进入WeBASE-Docker的`./docker/build`目录，执行构建命令，示例如下：

```
./docker-build.sh -t v3.4.0
```

4、完成构建后会生成相应版本的镜像。

