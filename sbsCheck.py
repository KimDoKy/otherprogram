from urllib.request import urlopen
from bs4 import BeautifulSoup
import time
import smtplib
from email.mime.text import MIMEText
import getpass

days = str(input("갱신 될 일자를 입력하세요(숫자만)  : "))
id = str(input("구글 ID를 입력하세요. : ")) + "@gmail.com"
pw = getpass.getpass("구글 비밀번호를 입력하세요.")
to = str(input("받으실 메일 주소를 입력하세요. : "))
msg = MIMEText("example")

def sendMail(sub):
    global id
    global pw
    global msg
    global to
    msg = MIMEText(sub)
    msg['Subject'] = sub
    msg['To'] = id
    msg['From'] = to
    s = smtplib.SMTP_SSL('smtp.gmail.com', 465)
    try:
        s.login(id, pw)
        s.sendmail("",to, msg.as_string())
        s.quit()
        print("메일이 발송되었습니다. 프로그램을 종료합니다.")
    except smtplib.SMTPRecipientsRefused as e:
        print("메일 주소를 잘못 입력하였습니다. 다시 확인해주세요.")
        to = str(input("받으실 메일 주소를 다시 입력해주세요. : "))
        sendMail(sub)
    except smtplib.SMTPAuthenticationError as e:
        print("아이디 또는 비밀번호를 잘못 입력하였습니다.")
        id = str(input("ID를 입력하세요 : "))
        pw = str(input("비밀번호를 입력하세요"))
        sendMail(sub)

def check(days):
    global fin
    url = "http://program.sbs.co.kr/builder/verticalBoard.do?pgm_id=00000338038&pgm_build_id=25&pgm_mnu_id=22901"
    html = urlopen(url)
    bsObj = BeautifulSoup(html, "html.parser")
    td = bsObj.find_all("td")
    for i in td:
        if i.text.find(days + '일') != -1:
            fin = days + "일이 갱신되었습니다."
        else:
            pass
    try:
        print(fin + to + "으로 메일을 발송합니다.")
        sendMail(fin)
    except NameError as e:
        print(e)
        print("게시판을 재검색합니다.")
        time.sleep(5)
        check(days)

check(days)
