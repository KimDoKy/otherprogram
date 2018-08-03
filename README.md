# other program

---

업무 도중 자잘하게 시간을 잡아먹는 업무를 스크립트화 한 것입니다.

---

### sbsCheck.py

sbs 특정 게시판에 입력 날짜의 게시물이 갱신되었는지 확인하는 스크립트입니다.  

sbs 특정 게시판에서 원하는 날짜의 게시물이 갱신되었다면 갱신되었다는 메시지를 출력하고 메일로 발송해줍니다.  
(gmail.smtp 를 이용하였습니다. 구글 계정이 필요합니다.)  

갱신되지 않았다면 5초 간격으로 갱신 재확인을 합니다.

또한 메일을 보내는 과정에서 정보를 잘못 입력하면 재확인하여 진행합니다.

#### 업데이트
패스워드 입력시 커맨드 라인에서 비밀번호 숨기기  
구글 계정 입력할때 ID 만 입력 처리 (@를 포함한 이메일 형식은 생략)  
갱신 된 게시물의 내용을 다시 크롤링해서 내용을 이메일 본문에 추가합니다.  
이메일 형식 검증이 추가되었습니다.

갱신 주기를 랜덤으로 설정하였습니다.  
갱신횟수와 갱신텀 시간을 같이 출력합니다.

---

## saveSbs.py  

검색할 게시판 페이지 분량을 입력받아 해당 게시판의 모든 내용들을 CSV파일로 저장합니다.

현재 개발중.

---

## mbcCheck.py  

sbsCheck의 mbc 버젼.

---

## zip_code  

엑셀파일에 주소리스트를 입력하면  

네이버에서 우편번호를 크롤링하여 엑셀에 저장합니다.

---

## ranking

특정키워드의 연관,추천 검색어의 순위를 엑셀에 저장합니다.

샘플 엑셀 데이터  

search_rank_list.xlsx -> result_search_rank_list.xlsx  
select_rank_list.xlsx -> result_select_rank_list.xlsx

--- 

## call_profile

회사의 녹취 시스템에서 얻은 전화통화 통계 엑셀파일에서  
담당자별로 filtering 후에 전 통화와 다음 통화 사이의 시간이  
20분 이상 지체되는지 확인한 후 결과를 엑셀 파일로 출력시킵니다.

---

## shopping admin (예정)

바빠서 만들 시간이 없다...

---

### shopping order

MD의 빈자리 업무 자동화.  
사내 쇼핑몰, 티몬, 스토어팜, 11번가, 쿠팡, 인터파크, 네이버페이, g마켓, 위메프, 김약사몰, 와우김약사몰, 임박몰  
그냥 봐도 주문 마감 체크해야 할 파일이 너무나도 많다.  
문제는 각 쇼핑몰마다 파일 양식도 다르고, 각 파일안에는 주문에 필요하지 않은 쓸데 없는 정보들로 인해 눈이 굉장히 피곤하다.  

그래서 주문에 필요한 정보만 하나의 엑셀 파일로 저장하는 프로그램을 개발하였다.  

집계 정보는 다음과 같다.

주문경로, 품목, 상품, 옵션, 수량, 결제금액, 택배비, 주문자, 수령자, 연락처, 주소, 우편번호, 배송메시지  

openpyxl 라이브러리를 이용하여 엑셀파일을 컨트롤한다.

하지만 openpyxl은 xls 같은 파일은 다루지 않는다.  

그래서 각 주문 파일들은  .xlsx 파일로 변환하여 주어야 한다.

각각 파일 파싱 업데이트 예정.

---

## ad_rank

키워드별 네이버 파워링크 광고 현황을 엑셀로 저장한다.

- 키워드를 key_list.txt 에 입력한다.  
각 키워드 구분은 줄넘김(엔터)로 한다.

- 결과는 실행시간, 키워드, 노출 업체의 제목, URL이다.

스케쥴링을 적용하여 운영하고 있는 키워드들이 시간대별로 어떻게 노출되는지, 경쟁사는 어떻게 광고를 진행하는지 자료를 축적할 수 있다. 스케쥴링은 시간되는대로 적용 예정.