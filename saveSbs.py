from urllib.request import urlopen
from bs4 import BeautifulSoup
import csv

inputPage = int(input("저장할 범위의 페이지 숫자를 입력하세요. : "))

url = "http://program.sbs.co.kr/builder/verticalBoard.do?pgm_id=00000338038&pgm_build_id=25&pgm_mnu_id=22901&pageIdx="

body_content = ""

def getUrl(inputPage):
    global url
    url = url + str(inputPage)
    return url

def getBody(aUrl):
    global body_content
    html = urlopen('http://program.sbs.co.kr/builder/verticalEndpage.do?pgm_id=00000338038&pgm_mnu_id=22901&pgm_build_id=25&pageIdx=1&bbsCd=ct_today2&searchCondition=title&searchKeyword=&contNo=' + aUrl)
    body_bsObj = BeautifulSoup(html, 'html.parser')
    contents = body_bsObj.find_all('div', {'id':'post_cont_wrap'})
    for content in contents:
        body_content = body_content + '\n' + content.text
    return body_content

def saveCSV(day, body):
    f = open('sbsInfo.csv', 'w', encoding='utf-8', newline= '')
    wr = csv.writer(f)
    wr.writerow([day, body])
    f.close

def getBsObj(inputPage):
    getUrl(inputPage)
    html = urlopen(url)
    bsObj = BeautifulSoup(html, 'html.parser')
    title = bsObj.find_all('td', {"class":"sbsbrd_tit"})
    for i in title:
        if i.text.find('일') != -1:
            day = i.text.strip()
            aUrl = i.find('a').attrs['onclick'].split('\'')[1]
            print(day)
            print(aUrl)
            getBody(aUrl)
            print(body_content)
            saveCSV(day, body_content) 

getBsObj(inputPage)
