# HTML data scraping with selectolax

## Test file

```html
<!DOCTYPE html>
<html>
    <head>
        <title>Header</title>
        <meta charset="utf-8">
    </head>

    <body>
        <h2>Operating systems</h2>

        <ul id="mylist" style="width:150px">
            <li>Solaris</li>
            <li>FreeBSD</li>
            <li>Debian</li>
            <li>NetBSD</li>
            <li>Windows</li>
        </ul>

        <p>
          FreeBSD is an advanced computer operating system used to
          power modern servers, desktops, and embedded platforms.
        </p>

        <p>
          Debian is a Unix-like computer operating system that is
          composed entirely of free software.
        </p>

    </body>
</html>
```

## Load from HTML text

Get the first match with `css_first`.  

```python
#!/usr/bin/python

from selectolax.parser import HTMLParser

import httpx 

html = '''
<html>
<body>
<p>an old falcon</p>
</body>
</html>
'''

tree = HTMLParser(html)
p = tree.css_first('p')
print(p.text())

body = tree.css_first('body')
print(repr(body.html))
```

## Fetch title from webpage

Create HTTP GET request with `httpx` module and fetch the `title` tag. 

```python
#!/usr/bin/python

from selectolax.parser import HTMLParser

import httpx 

r = httpx.get('http://webcode.me')
html = r.text

tree = HTMLParser(html)
title = tree.css_first('title')
print(title.text())
```

## Child iteration

Iterating children with `iter()`

```python
#!/usr/bin/python

from selectolax.parser import HTMLParser

with open('index.html', 'r') as f:

    html = f.read()

    tree = HTMLParser(html)
    node = tree.css_first('ul')
    print(node.html)

    print('---------------------')

    for e in node.iter():
        print(f'tag: {e.tag}, text: {e.text()}')
  ```

## Extract text data 

We get tag text with `text` method. To strip excessive white space, we  
can use the `strip` parameter or regular expressions. The `strip` parameter is  
not very flexible.  

```python
#!/usr/bin/python

from selectolax.parser import HTMLParser

import httpx 
import re

with open('index.html', 'r') as f:

    html = f.read()

    tree = HTMLParser(html)
    ps = tree.css('p')

    for tag in ps:
        # print(tag.text(strip=True))
        # print(tag.text(strip=True).strip())
        pattern = re.compile(r' {2,}')
        line = tag.text()
        print(re.sub(pattern, ' ', line))
```

## Unwrapping tags

We can remove/unwrap tags with `unwrap` or `unwrap_tags`.  

```python
#!/usr/bin/python

from selectolax.parser import HTMLParser

with open('index.html', 'r') as f:

    html = f.read()

    tree = HTMLParser(html)
    tree.unwrap_tags(['ul', 'h2', 'p'])

    # tags = tree.tags('p')
    # for e in tags:
    #     e.unwrap()

    print(tree.root.html)

    print('---------------------')
```

## The text_contains method

We can select specific text with `text_contains`

```python
#!/usr/bin/python

from selectolax.parser import HTMLParser

with open('index.html', 'r') as f:

    html = f.read()

    tree = HTMLParser(html)
    matches = [node.text().strip() for node in tree.select('p').text_contains("FreeBSD").matches]

    print(matches)
```


