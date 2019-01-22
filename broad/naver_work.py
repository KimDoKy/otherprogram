from selenium import webdriver
from selenium.common.exceptions import WebDriverException
import time
import random

def naver_worker(url):
    for i in range(2000):
        try:
            print(url)
            driver = webdriver.Chrome('./chromedriver.exe')
            driver.set_window_size(100, 300)
            driver.get(url)
            times = random.randrange(30,45)
            time.sleep(30)
            driver.close()
            print(i+1, '회차 작업 종료')
        except WebDriverException as e:
            driver.close()
            print(e)
            pass
        except:
            driver.close()
            print('에러가 일어나서 다시 실행합니다.')
            pass
