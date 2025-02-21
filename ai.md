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
