# 使用最新的 Ubuntu 镜像
FROM ubuntu:latest

# 更新软件包列表并安装 openssh-server
RUN apt-get update && apt-get install -y openssh-server

# 创建 SSH 服务运行所需的目录
RUN mkdir /var/run/sshd

# 设置 root 用户的密码（请务必修改为一个更安全的密码）
RUN echo 'root:Kj#8mP2w!xQ1' | chpasswd

# 允许 root 用户通过 SSH 登录
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# 暴露 22 端口
EXPOSE 22

# 启动 SSH 服务
CMD ["/usr/sbin/sshd", "-D"]