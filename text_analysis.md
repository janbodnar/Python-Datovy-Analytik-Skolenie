# Text analysis

## Basic analysis

### Words and unique words

```python
#!/usr/bin/python

import sys
import re
from collections import Counter

filename = sys.argv[1]

with open(filename, 'r') as f:
    
    data = f.read()
    cleaned = re.sub("[,.?!]", '', data) # remove punctuation marks
    
    data2 = re.split("\s+", cleaned)
    words = [e for e in data2 if e] # remove empty elements
    
    n1 = len(words)
    n2 = len(Counter(words))

    print(f'{n1} words')
    print(f'{n2} unique words')
```

### Count lines

```python
#!/usr/bin/python

import sys

filename = sys.argv[1]

with open(filename, 'r') as f:
    
    lines = f.readlines()
    cleaned = [e for e in lines if e.strip()] # remove blank lines

    n = len(cleaned)

    print(f'# of lines: {n}')
````

### Count word occurrences

```python
#!/usr/bin/python

import sys
import re

filename = sys.argv[1]
word = sys.argv[2]

with open(filename, 'r') as f:
    
    data = f.read()

    found = re.findall(fr"\b{word}\b", data, re.IGNORECASE)
    n = len(found)
    
    print(f'# of occurences of word {word}: {n}')
```

### Count three-letter words

```python
#!/usr/bin/python

import sys
import re

filename = sys.argv[1]

with open(filename, 'r') as f:
    
    data = f.read()

    found = re.findall(r"\b\w{3}\b", data, re.IGNORECASE)
    n = len(found)
    
    print(f'# of three-letter words: {n}')
```

### Count vowels & consonants 

```python
#!/usr/bin/python

import sys
import re

filename = sys.argv[1]

with open(filename, 'r') as f:
    
    data = f.read()

    found = re.findall(r"[aeiou]", data, re.IGNORECASE)
    n = len(found)
    
    print(f'# of vowels: {n}')

    found = re.findall(r"[bcdfghjklmnpqrstvwxyz]", data, re.IGNORECASE)
    n = len(found)
    
    print(f'# of consonants: {n}')
```


### Count punctuation marks

```python
#!/usr/bin/python

import sys
import re

filename = sys.argv[1]

with open(filename, 'r') as f:
    
    data = f.read()

    found = re.findall(r"[,.?!\-\"']", data)
    n = len(found)
    
    print(f'# of punctuation marks: {n}')
```

### Count capitalized words

```python
#!/usr/bin/python

import sys
import re

filename = sys.argv[1]

with open(filename, 'r') as f:
    
    data = f.read()

    found = re.findall(r"[A-Z]\w*", data)
    n = len(found)
    
    print(f'# of capitalized words: {n}')
```

### Count words starting in o/b (ci)

```python
#!/usr/bin/python

import sys
import re

filename = sys.argv[1]

with open(filename, 'r') as f:
    
    data = f.read()

    found = re.findall(r"\b[ob]\w*\b", data)
    n = len(found)

    print(f'# of words starting in o/b: {n}')

    found = re.findall(r"\b[ob]\w*\b", data, re.I)
    n = len(found)

    print(f'# of words starting in o/b or O/B: {n}')
```

### Count words ending in e

```python
#!/usr/bin/python

import sys
import re

filename = sys.argv[1]

with open(filename, 'r') as f:
    
    data = f.read()

    found = re.findall(r"\b\w*e\b", data)
    n = len(found)
    
    print(f'# of words ending in e: {n}')
```



## Word frequency

### Example I

```python
#!/usr/bin/python

import collections
import re

filename = 'the-king-james-bible.txt'

def get_words():

    words = []

    with open(filename) as f:

        for line in f:

            fields = re.split(r"\W+", line)

            for w in fields:

                if w and not w.isdigit():
                    words.append(w)

    return words

words = get_words()
c = collections.Counter(words)

top_ten = c.most_common(10)

for e, i in top_ten:
    print(f'{e}: {i}')
``` 

### Example II
 
```python
#!/usr/bin/python

from itertools import (groupby, starmap)
from operator import itemgetter
from pathlib import Path
import re

def most_frequent_words(filepath, *, encoding='utf-8'):
    """
    A list of word-frequency pairs sorted by their occurrences.
    The words are read from the given file.
    """
    def word_and_frequency(word, words_group):
        return word, capacity(words_group)
 
    file_contents = filepath.read_text(encoding=encoding)
    # words = file_contents.lower().split()
    words = re.split(r"\W+", file_contents)
    grouped_words = groupby(sorted(words))
    
    # print(type(grouped_words))

    # for word in grouped_words:
    #     print(list(word))

    for key, group in grouped_words:
        key_and_group = {key : list(group)}
        print(key_and_group)

    words_and_frequencies = starmap(word_and_frequency, grouped_words)

    return sorted(words_and_frequencies, key=itemgetter(1), reverse=True)
 
 
def capacity(iterable):
    """Returns a number of elements in an iterable"""
    return sum(1 for _ in iterable)
 
filename = Path('the-king-james-bible.txt')
n = 70

words_and_counts = most_frequent_words(filename)

for w, i in words_and_counts[:n]:
    print(f'{w} {i}')

# print(*words_and_counts[:n], sep='\n')
```
