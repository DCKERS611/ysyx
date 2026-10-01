# chmod 使用

## 查看chmod手册
    man chmod

## 查看semester权限
    ls -l semester
    得到: -rw-r--r-- 1 ysyx ysyx 61 Sep 19 15:14 semester  
    head -n 1 semester
    得到: #!/bin/sh

    说明内核会根据shebang用/bin/sh来解析

## 添加执行权限
    chmod +x semester
    给semester添加执行权限
    得到:-rwxr-xr-x 1 ysyx ysyx  61 Sep 19 15:14 semester 

    |   符号   |            含义              |
        u           user，文件所有者（owner）
        +           添加权限。表示在原有权限基础上增加
        x           execute，执行权限

    其他常见符号:
    g：group，所属组

    o：others，其他人

    a：all，所有人（相当于 u+g+o）

    -：移除权限

    =：设置权限（覆盖原来的

## 直接执行
    ./semester

    不要用sh semester   
    :sh semester 是手动指定 sh 来解析，绕过了 shebang，也不需要文件有可执行权限

## 用管道重定向
    ./semester | grep -i "last-modified" > ~/last-modified.txt
    cat ~/last-modified.txt

    | : 把./semester 的输出交给grep

    grep -i "last-modified" : 忽略大小写,筛选last-modifid

    >: 覆盖写入

    ~/last-modified.txt：主目录下的文件

    >>: 追加内容
