from urllib.request import urlopen
from bs4 import BeautifulSoup as bs
import time

num = str(input('방영일자를 입력하세요: '))
url = "https://tv.naver.com/sbs.cnbctalktalk/playlists"

# 크롬을 실행시켜 원하는 조건을 판단합니다.
def find_num(num, url):
    html = urlopen(url)
    obj = bs(html, 'html.parser')
    tit = obj.select('h2')[4].text
    if tit[18:20] == num:
        return True
    else:
        return False

# 10분 기준으로 조건이 충족될때까지 실행합니다.
def main():
    global num
    global url
    while True:
        boolean_value = find_num(num, url)
        if boolean_value == True:
            print("업데이트 되었어요")
            break
        else:
            print('아직 안올라왔어요... 10분 후에 다시 검색합니다.')
            time.sleep(600)
            
if __name__ == '__main__':
    main()
