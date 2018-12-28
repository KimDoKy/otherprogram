from selenium import webdriver
from urllib.request import urlopen
import time

url = 'http://programs.sbs.co.kr/cnbc/cnbctalktalk/board/56556/?cmd=view&page=1&board_no='
num_list = ['2399']
driver = webdriver.Chrome('chromedriver.exe')
driver.set_window_size(100, 100)

for i in range(700):
    print(i)
    for n in num_list:
        driver.get(url + str(n))
        time.sleep(0.5)

driver.close()
