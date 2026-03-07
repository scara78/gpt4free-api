FROM python:3.11-slim

WORKDIR /app

# 安装依赖
RUN pip install --no-cache-dir g4f[all]

# 暴露端口
EXPOSE 8080

# 设置环境变量
ENV G4F_PROVIDER=Yqcloud

# 启动服务
CMD ["python", "-m", "g4f", "api", "--port", "8080", "--host", "0.0.0.0"]
