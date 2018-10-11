# 상품명으로 품목 이름 추출하기
def change_category(product):
    if product.find('녹용') != -1:
        cate = '설화사슴목장'
    elif product.find('잉어곰') != -1 or product.find('다슬기') != -1:
        cate = '자연잉어'
    elif product.find('꿀') != -1 or product.find('비폴렌') != -1:
        cate = '장수농장'
    elif product.find('식초') != -1 or product.find('청') != -1 or product.find('장') != -1:
        cate = '채연가'
    elif product.find('철갑상어') != -1:
        cate = '철갑상어'
    elif product.find('호신보') != -1:
        cate = '제주해마'
    elif product.find('흑염소') != -1 or product.find('우슬') != -1 or product.find('울금') != -1 or product.find('헛개') != -1:
        cate = '흑염소농장'
    elif product.find('전복') != -1:
        cate = '완도전복'
    elif product.find('오미자') != -1:
        cate = '문경사랑'
    elif product.find('버섯 진액') != -1:
        cate = '천금상황버섯'
    elif product.find('버섯차') != -1 or product.find('오벗차') != -1 or product.find('오벗환') != -1:
        cate = '송일품'
    elif product.find('잉어곰') != -1 or product.find('반건시') != -1 or product.find('혼합') != -1:
        cate = '청도원감'
    elif product.find('붕어') != -1:
        cate = '당진붕어'
    elif product.find('해마') != -1:
        cate = '제주해천마'
    elif (product.find('마늘') != -1 or product.find('산수유') != -1 
          or product.find('야관문') != -1 or product.find('민들레') != -1 or product.find('오가피') != -1):
        cate = '스트로아일랜드'
    elif product.find('도라지') != -1:
        cate = '담은'
    elif product.find('잉어즙') != -1:
        cate = '잉어보감'
    else:
        cate = product
    return cate

# 주문파일 함수로 결과물 파일 생성
# row_index : 주문 갯수
# index : 결과 파일 작업 위치
# order_file : 각 쇼핑몰 함수를 통해 나온 주문 정리 데이터
# order_ws : 결과물 파일.

index = 2

def create_file(order_file, order_ws, row_index):
    global index
    print('~~~~~파일 생성중입니다~~~~~~')
    
    file_index = 0
    for num in range(row_index):
        print('파일 기록중입니다.')
        order_ws['A'+str(index)] = order_file['path'+str(file_index)]
        order_ws['B'+str(index)] = order_file['category'+str(file_index)]
        order_ws['C'+str(index)] = order_file['product'+str(file_index)]
        order_ws['D'+str(index)] = order_file['option'+str(file_index)]
        order_ws['E'+str(index)] = order_file['count'+str(file_index)]
        order_ws['F'+str(index)] = order_file['price'+str(file_index)]
        order_ws['G'+str(index)] = order_file['delivery'+str(file_index)]
        print(order_file['orderer'+str(file_index)])
        order_ws['H'+str(index)] = order_file['orderer'+str(file_index)]
        order_ws['I'+str(index)] = order_file['payee'+str(file_index)]
        order_ws['J'+str(index)] = order_file['call'+str(file_index)]
        order_ws['K'+str(index)] = order_file['address'+str(file_index)]
        order_ws['L'+str(index)] = order_file['postal_code'+str(file_index)]
        order_ws['M'+str(index)] = order_file['message'+str(file_index)]
        index += 1
        file_index += 1