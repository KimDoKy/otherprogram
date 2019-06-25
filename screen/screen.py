from selenium import webdriver

url = 'https://www.naver.com/'

options = webdriver.ChromeOptions()
options.add_argument('headless')
options.add_argument('window-size=800x700')
options.add_argument("--disable-gpu")

driver = webdriver.Chrome('./chromedriver.exe', chrome_options=options)

driver.get(url)

driver.implicitly_wait(1)

driver.find_element_by_xpath('//*[@id="query"]').send_keys('홍대맛집')
driver.find_element_by_xpath('//*[@id="search_btn"]').click()

driver.save_screenshot('2.png')

driver.quit()
