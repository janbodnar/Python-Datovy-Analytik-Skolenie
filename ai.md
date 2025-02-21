# AI

## Ollama vision

```python
import ollama

response = ollama.chat(
    model='llama3.2-vision',
    messages=[{
        'role': 'user',
        'content': 'What is in this image?',
        'images': ['image2.jpg']
    }]
)

print(response)
```

## List models

list local models

```python
from ollama import list
from ollama import ListResponse

response: ListResponse = list()

for model in response.models:
    print('Name:', model.model)
    print('  Size (MB):', f'{(model.size.real / 1024 / 1024):.2f}')
    if model.details:
        print('  Format:', model.details.format)
        print('  Family:', model.details.family)
        print('  Parameter Size:', model.details.parameter_size)
        print('  Quantization Level:', model.details.quantization_level)
    print('\n')
```

## Ollama via OpenAI API

```python
import openai

client = openai.OpenAI(
    base_url="http://localhost:11434/v1",
    api_key="nokeyneeded",
)

response = client.chat.completions.create(
    model="deepseek-r1",
    temperature=0.7,
    n=1,
    messages=[
        {"role": "system", "content": "You are a helpful assistant."},
        {"role": "user", "content": "Write a haiku about a hungry cat"},
    ],
)

print("Response:")
print(response.choices[0].message.content)
```

