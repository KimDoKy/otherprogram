from urllib.request import urlopen
from bs4 import BeautifulSoup
import time
import smtplib
from email.mime.text import MIMEText
import getpass
import re

# 필요한 기본 정보들을 입력 받습니다
days = str(input("갱신 될 일자를 입력하세요(숫자만)  : "))
id = str(input("구글 ID를 입력하세요. : ")) + "@gmail.com"
pw = getpass.getpass("구글 비밀번호를 입력하세요.")
to = str(input("받으실 메일 주소를 입력하세요. : "))

# 이메일 검증입니다
while not re.match("^([A-za-z\.0-9_-]+)@([A-Za-z-_]+)\.([a-z\.]{2,6})", to):
    to = str(input("메일주소가 잘못 되었습니다. 다시 입력하세요. : "))


msg = MIMEText("example")
body_content = ""

def getBody(aUrl):
    global body_content
    html = urlopen('http://imbbs.imbc.com/view.mbc?list_id=' + aUrl+ '&bid=evening_info')
    body_bsObj = BeautifulSoup(html, 'html.parser')
    content = body_bsObj.find('div', {'id':'divContents'})
    body_content = content.text.strip()
    return body_content

def sendMail(sub, body_content):
    global id
    global pw
    global msg
    global to
    msg = MIMEText(body_content)
    msg['Subject'] = sub
    msg['To'] = to
    msg['From'] = id
    s = smtplib.SMTP_SSL('smtp.gmail.com', 465)
    try:
        s.login(id, pw)
        s.sendmail("",to, msg.as_string())
        s.quit()
        print("메일이 발송되었습니다. 프로그램을 종료합니다.")
    except smtplib.SMTPAuthenticationError as e:
        print("아이디 또는 비밀번호를 잘못 입력하였습니다.")
        id = str(input("ID를 입력하세요 : "))
        pw = getpass.getpass("비밀번호를 입력하세요")
        sendMail(sub, body_content)
    except TypeError as e:
        check(days)

def check(days):
    global fin
    global aUrl
    url = "http://imbbs.imbc.com/list.mbc?bid=evening_info&page=1"
    html = urlopen(url)
    bsObj = BeautifulSoup(html, "html.parser")
    list = bsObj.find_all("a", {"class":"bbs_list_text_title"})
    for i in list:
        if (' ' + days+'일') in i.text:
            fin = days + "일이 갱신되었습니다."
            aUrl = i.get('href')[21:-2]
            getBody(aUrl)
        else:
            pass
    try:
        print(fin + to + "으로 메일을 발송합니다.")
        sendMail(fin, body_content)
    except NameError as e:
        print("게시판을 재검색합니다.")
        time.sleep(5)
        check(days)

check(days)
