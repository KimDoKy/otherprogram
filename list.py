from selenium import webdriver
from urllib.request import urlopen
import time

url = 'http://programs.sbs.co.kr/cnbc/cnbctalktalk/board/56556/?cmd=view&page=1&board_no='
num_list = ['2089']
driver = webdriver.Chrome('chromedriver.exe')

while 1:
    for n in num_list:
        driver.get(url + str(n))
        time.sleep(0.5)

driver.close()
