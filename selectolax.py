# HTML data scraping with selectolax

## Cvičný súbor 

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
