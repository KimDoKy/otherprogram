from bs4 import BeautifulSoup as b
from urllib.request import urlopen
url = 'https://tv.naver.com/sbs.cnbctalktalk/playlists'
html = urlopen(url)
bs = b(html, 'html.parser')
p_list = bs.find_all('div', class_='playlist')

for i in range(len(p_list)):
    print('-' * 20)
    print(p_list[i].find('h2', class_='play_tit').text[0:-5])
    product = p_list[i].find_all('li')
    for j in range(len(product)):
        print(product[j].find('tooltip').text)
        print(product[j].find('span', class_='hit').text)
        print('  ')
