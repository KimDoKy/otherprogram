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

---

list.py : 조회수 늘리기....
check_list.py : 게시판 업데이트 체크. 업데이트 될때까지 10분 단위로 검사. 조건에 합당하면 알림창을 띄우고 종료            
