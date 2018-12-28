from urllib.request import urlopen
from bs4 import BeautifulSoup
import time
from tkinter import messagebox

# 필요한 기본 정보들을 입력 받습니다
days = str(input("갱신 될 일자를 입력하세요(숫자만)  : "))

def Click(body_content):
    messagebox.showinfo("방송정보: ", body_content)

def getBody(aUrl):
    global body_content
    html = urlopen('http://imbbs.imbc.com/view.mbc?next_list_id=' + aUrl+ '&bid=evening_info')
    body_bsObj = BeautifulSoup(html, 'html.parser')
    content = body_bsObj.find('div', {'id':'divContents2'})
    body_content = content.text.strip()
    return body_content

def check(days):
    global fin
    global aUrl
    url = "http://imbbs.imbc.com/list.mbc?bid=evening_info"
    html = urlopen(url)
    bsObj = BeautifulSoup(html, "html.parser")
    list = bsObj.find_all("a", {"class":"bbs_list_text_title"})
    for i in list:
        if (' ' + days+'일') in i.text:
            fin = days + "일이 갱신되었습니다."
            aUrl = i.get('href')[21:-2]
            body_content = getBody(aUrl)
            Click(body_content)
            return False 
        else:
            continue
    return True

bool_value = check(days)

while bool_value:
    print("재검색합니다.")
    time.sleep(5)
    bool_value = check(days)
