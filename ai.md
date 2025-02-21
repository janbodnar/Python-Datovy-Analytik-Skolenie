# AI

## Models


| **Name**       | **Date of Publishing** | **Country of Origin** | **Company Name**       | **Model Category**      |
|----------------|------------------------|-----------------------|------------------------|-------------------------|
| ChatGPT        | November 30, 2022      | USA                   | OpenAI                 | Conversational AI (Text)|
| DeepSeek       | January 20, 2025       | USA                   | Microsoft              | Reasoning Model (Text)  |
| Mistral        | September 27, 2023     | France                | Mistral AI             | Open-Source (Text)      |
| Phi            | April 23, 2024         | USA                   | Anthropic              | Both (Text)             |
| GPT-4o         | May 13, 2024           | USA                   | OpenAI                 | Multimodal (Text & Vision)|
| Claude 3.5     | June 20, 2024          | USA                   | Anthropic              | Conversational AI (Text)|
| Grok-1         | November 4, 2023       | USA                   | Stability AI           | Open-Source (Text)      |
| PaLM 2         | May 10, 2023           | USA                   | Google                 | Open-Source (Text)      |
| Falcon 180B    | September 6, 2023      | UAE                   | Technology Innovation Institute | Open-Source (Text)      |
| Stable LM 2    | January 19, 2024       | USA                   | Stability AI           | Open-Source (Text)      |
| Gemini 1.5     | February 2, 2024       | USA                   | Google                 | API (Text)              |
| Llama 3.1      | June 23, 2024          | USA                   | Meta                   | Open-Source (Text)      |
| Mixtral 8x22B  | April 10, 2024         | France                | Mistral AI             | Open-Source (Text)      |
| Inflection-2.5 | March 10, 2024         | USA                   | Inflection AI          | Proprietary (Text)      |
| Jamba          | March 29, 2024         | Israel                | AI21 Labs              | Open-Source (Text)      |
| Command R      | March 11, 2024         | Canada                | Cohere                 | Both (Text & Vision)    |
| Gemma          | February 21, 2024      | USA                   | EleutherAI             | Open-Source (Text)      |
| XGen-7B        | July 3, 2023           | USA                   | Salesforce             | Open-Source (Text)      |
| DBRX           | March 27, 2024         | USA                   | n/a                    | Open-Source (Text)      |
| Pythia         | February 13, 2023      | USA                   | EleutherAI             | Open-Source (Text)      |
| Sora           | February 15, 2024      | USA                   | Amazon                 | API (Text)              |
| Alpaca 7B      | March 13, 2023         | USA                   | Stanford University    | Open-Source (Text)      |
| Nemotron-4     | June 14, 2024          | USA                   | n/a                    | Open-Source (Text)      |

I hope this provides all the information you need! If you have any more questions or need further details, feel free to ask. 😊




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


