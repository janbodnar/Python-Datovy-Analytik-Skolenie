# Web scraping


```python
import itertools
from bs4 import BeautifulSoup
import httpx
import time
import asyncio

base_url = 'https://reality.bazos.sk'
url = 'https://reality.bazos.sk/predam/byt/'
urls = []
pages = []


def get_main_content_div(soup):
    main_content_div = soup.find('div', class_='maincontent')
    return main_content_div


def get_number_of_ads(main_content_div):
    inzer_text = main_content_div.find('div', class_='inzeratynadpis').text
    return int(inzer_text[inzer_text.find('inzerátov z') + len('inzerátov z'):].replace(' ', ''))


def get_links(main_content_div):
    h2_tags = main_content_div.find_all(
        'h2', class_='nadpis') if main_content_div else []

    # Find all links within these h2 tags
    links = [h2_tag.find('a')['href']
             for h2_tag in h2_tags if h2_tag.find('a')]

    if not links:
        print('No links found')
        exit(1)

    return links


def write_to_file(urls):
    with open('links.txt', 'w') as f:
        for url in urls:
            f.write(f'{url}\n')


async def get_async(url):
    async with httpx.AsyncClient() as client:
        return await client.get(url)

# def batched(iterable, n):
#     it = iter(iterable)
#     batch = list(itertools.islice(it, n))
#     while batch:
#         yield batch
#         batch = list(itertools.islice(it, n))


async def launch():

    resp = httpx.get(url)
    soup = BeautifulSoup(resp.text, 'lxml')

    main_content_div = get_main_content_div(soup)
    n_ads = get_number_of_ads(main_content_div)
    print(n_ads)

    for n in range(1, n_ads + 1, 20):
        page = f'{base_url}/predam/byt/{n}/'
        pages.append(page)

    # print(pages)
    # for batch in itertools.batched(pages, 20):
    #     print(batch)

    for batch in itertools.batched(pages, 20):
        print('start batch', time.time())
        resps = await asyncio.gather(*[get_async(page) for page in batch])
        for resp in resps:
            soup = BeautifulSoup(resp.text, 'lxml')
            main_content_div = get_main_content_div(soup)
            new_links = get_links(main_content_div)
            new_urls = [f'{base_url}{link}' for link in new_links]
            urls.extend(new_urls)
        
        print('finished batch')
        await asyncio.sleep(2)

    write_to_file(urls)

asyncio.run(launch())
```



