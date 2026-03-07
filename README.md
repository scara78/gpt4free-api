# GPT4Free API

免费 AI API 服务，无需 API Key。

## 支持的模型

- gpt-4o-mini
- gpt-4o
- gpt-4
- claude-3
- gemini
- deepseek
- 更多...

## 使用方法

### API 地址
```
https://你的地址/v1
```

### 请求示例
```bash
curl https://你的地址/v1/chat/completions \
  -H "Content-Type: application/json" \
  -d '{"model":"gpt-4o-mini","messages":[{"role":"user","content":"Hello"}]}'
```

### Python 示例
```python
from openai import OpenAI

client = OpenAI(
    api_key="any",  # 任意值
    base_url="https://你的地址/v1"
)

response = client.chat.completions.create(
    model="gpt-4o-mini",
    messages=[{"role": "user", "content": "Hello"}]
)
print(response.choices[0].message.content)
```

## 部署

### Docker
```bash
docker build -t gpt4free-api .
docker run -p 8080:8080 gpt4free-api
```

### Railway / Render / Fly.io
直接连接此仓库部署。

## 免责声明

本项目仅供学习研究使用，请勿用于商业用途。
