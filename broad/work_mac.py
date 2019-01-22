from multiprocessing import Pool
from naver_work_mac import naver_worker
import time

urls = [url]

if __name__ == '__main__':
    p = Pool(processes=6)
    for i in range(6):
        try:
            print(i)
            p.map(naver_worker, urls)
        except:
            pass
