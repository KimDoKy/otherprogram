from selenium import webdriver
import time
from tkinter import messagebox

# 조건 충족시 PC에 알림창을 띄웁니다.
def Click():
    messagebox.showinfo('업데이트 됐어요!', '업데이트 됐으니 작업하시죠.')

num = str(input('마지막 다음 번호를 입력하세요 : '))

url = 'http://programs.sbs.co.kr/cnbc/cnbctalktalk/boards/56556'
url_2 = 'https://programs.sbs.co.kr/cnbc/cnbctalktalk/board/56556/?cmd=view&page=1&board_no='

# 크롬을 실행시켜 원하는 조건을 판단합니다.
def find_num(num, url):
    global url_2
    driver = webdriver.Chrome('chromedriver.exe')
    driver.get(url)
    board_num = driver.find_elements_by_tag_name('tr') 
    for t in board_num:
        if t.text[1]:
            num_text = t.text[:2]
        else:
            num_text = t.text[0]
        if num_text.find(num) == 0:
            print('num: ', num)
            # Click()
            a_link = driver.find_element_by_xpath('//*[@id="program-front-end-board-area"]/div[1]/table/tbody/tr[3]/td[2]/a').get_attribute('href')[-4:]
            print(a_link)
            for i in range(5780):
                print(i)
                driver.get(url_2+a_link)
                driver.set_window_size(100, 100)
                time.sleep(0.5)
            driver.close()
            return True
        else:
            print('num_text: ', num_text)
    driver.close()
    return False

# 10분 기준으로 조건이 충족될때까지 실행합니다.
def main():
    global num
    global url
    while True:
        boolean_value = find_num(num, url)
        if boolean_value == True:
            break
        else:
            print('아직 안올라왔어요... 10분 후에 다시 검색합니다.')
            time.sleep(600)
            
if __name__ == '__main__':
    main()
