from selenium import webdriver
import time
from tkinter import messagebox

# 조건 충족시 PC에 알림창을 띄웁니다.
def Click():
    messagebox.showinfo('업데이트 됐어요!', '업데이트 됐으니 작업하시죠.')

num = str(input('마지막 다음 번호를 입력하세요 : '))

url = 'http://programs.sbs.co.kr/cnbc/cnbctalktalk/boards/56556'

# 크롬을 실행시켜 원하는 조건을 판단합니다.
def find_num(num, url):
    driver = webdriver.Chrome('chromedriver.exe')
    driver.get(url)
    board_num = driver.find_elements_by_tag_name('tr') 
    for t in board_num:
        num_text = t.text[0]
        if num_text.find(num) == 0:
            print('num: ', num)
            print(num_text)
            Click()
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
