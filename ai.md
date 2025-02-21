# AI

LLMs, or Large Language Models, are advanced AI systems designed to understand and generate human-like  
text based on vast amounts of data. They are trained on diverse text sources, enabling them to perform  
a variety of tasks such as:

- **Natural Language Understanding**: Comprehending and interpreting text to derive meaning.
- **Text Generation**: Creating coherent and contextually appropriate text based on a given prompt.
- **Conversation**: Engaging in human-like dialogue, answering questions, and carrying out conversations.
- **Summarization**: Condensing long texts into brief summaries while retaining key information.
- **Translation**: Converting text from one language to another with high accuracy.

LLMs have applications in chatbots, content creation, language translation, and much more,  
revolutionizing the way we interact with technology.


## Models


| Name             | Date of Publishing | Country of Origin | Model Category          |
|------------------|--------------------|-------------------|-------------------------|
| **ChatGPT**      | November 2022      | USA               | General-purpose LLM     |
| **GPT-4**        | March 2023         | USA               | Advanced multi-modal LLM|
| **DeepSeek R1**  | January 2025       | China             | General-purpose LLM     |
| **Mistral 7B**   | September 2023     | France            | Open-weight LLM         |
| **Claude 3.5**   | June 2024          | USA               | Safety-focused LLM      |
| **Grok-1**       | November 2023      | USA               | Open-source LLM         |
| **PaLM 2**       | May 2023           | USA               | Multilingual LLM        |
| **Falcon 180B**  | September 2023     | UAE               | Open-weight LLM         |
| **Gemini 1.5**   | February 2024      | USA               | Multimodal LLM          |
| **Llama 2**      | July 2023          | USA               | Open-source LLM         |
| **Command R**    | 2024               | Canada            | Retrieval-augmented LLM |
| **Phi-2**        | December 2023      | USA               | Small-scale LLM         |
| **GPT-Neo**      | March 2021         | USA               | Open-source LLM         |
| **BERT**         | October 2018       | USA               | Bidirectional Encoder    |
| **LaMDA**        | May 2021           | USA               | Conversational LLM      |




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

## Streaming example

```python
from ollama import chat

prompt = "When was Alien movie released?"
for chunk in chat(model="deepseek-r1", messages=[{"role": "user", "content": prompt}], stream=True):
    print(chunk['message']['content'], end='', flush=True)
```


