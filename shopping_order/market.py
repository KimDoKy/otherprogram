from util import change_category

# 11번가
def eleven(order_ws):
    print('-------11번가 파일 분석중---------')
    file_order = {}
    row_index =  0
    for r in order_ws.rows:
        if r[0].value == None: continue
        elif r[0].value == '번호': continue
        cate = change_category(r[1].value)
        file_order['category'+str(row_index)] = cate
        file_order['path'+str(row_index)] = '11번가'
        file_order['product'+str(row_index)] = r[1].value
        file_order['option'+str(row_index)] = r[2].value
        file_order['count'+str(row_index)] = r[3].value
        file_order['price'+str(row_index)] = r[4].value
        file_order['delivery'+str(row_index)] = r[6].value
        file_order['orderer'+str(row_index)] = r[12].value
        file_order['payee'+str(row_index)] = r[7].value
        file_order['call'+str(row_index)] = r[8].value
        file_order['address'+str(row_index)] = r[10].value
        file_order['postal_code'+str(row_index)] = r[9].value
        file_order['message'+str(row_index)] = r[11].value
        row_index += 1
    return file_order, row_index

# 카페24 쇼핑몰
def shop(order_ws):
    print('-------춘하추동 파일 분석중---------')
    file_order = {}
    row_index =  0
    for r in order_ws.rows:
        if r[0].value == None: continue
        elif r[0].value == '주문번호': continue
        cate = change_category(r[6].value)
        file_order['category'+str(row_index)] = cate
        file_order['path'+str(row_index)] = '춘하추동'
        file_order['product'+str(row_index)] = r[6].value
        file_order['option'+str(row_index)] = r[7].value
        file_order['count'+str(row_index)] = r[8].value
        file_order['price'+str(row_index)] = r[4].value
        file_order['delivery'+str(row_index)] = ''
        file_order['orderer'+str(row_index)] = r[10].value
        file_order['payee'+str(row_index)] = r[10].value
        file_order['call'+str(row_index)] = r[11].value
        file_order['address'+str(row_index)] = r[13].value + r[14].value
        file_order['postal_code'+str(row_index)] = r[12].value
        file_order['message'+str(row_index)] = r[2].value
        row_index += 1
    return file_order, row_index

# 인터파크
# 수정 필요(주소 관련)
def interpark(order_ws):
    print('-------인터파크 파일 분석중---------')
    file_order = {}
    row_index =  0
    for r in order_ws.rows:
        if r[0].value == None: continue
        elif r[0].value == '주문번호': continue
        file_order['category'+str(row_index)] = r[33].value
        file_order['path'+str(row_index)] = '인터파크'
        file_order['product'+str(row_index)] = r[4].value
        file_order['option'+str(row_index)] = r[5].value
        file_order['count'+str(row_index)] = r[6].value
        file_order['price'+str(row_index)] = r[8].value
        file_order['delivery'+str(row_index)] = r[20].value
        file_order['orderer'+str(row_index)] = r[25].value
        file_order['payee'+str(row_index)] = r[29].value
        file_order['call'+str(row_index)] = r[30].value
        file_order['address'+str(row_index)] = '인터파크방문'
        file_order['postal_code'+str(row_index)] = '인터파크방문'
        file_order['message'+str(row_index)] = '인터파크방문'
        row_index += 1
    return file_order, row_index

# 네이버 페이
def naverpay(order_ws):
    print('-------네이버페이 파일 분석중---------')
    file_order = {}
    row_index =  0
    for r in order_ws.rows:
        if r[0].value == None: continue
        elif r[0].value == '상품주문번호': continue
        cate = change_category(r[15].value)
        file_order['category'+str(row_index)] = cate
        file_order['path'+str(row_index)] = '네이버페이'
        file_order['product'+str(row_index)] = r[15].value
        file_order['option'+str(row_index)] = r[17].value
        file_order['count'+str(row_index)] = r[19].value
        file_order['price'+str(row_index)] = r[24].value
        file_order['delivery'+str(row_index)] = r[31].value
        file_order['orderer'+str(row_index)] = r[2].value
        file_order['payee'+str(row_index)] = r[9].value
        file_order['call'+str(row_index)] = r[33].value
        file_order['address'+str(row_index)] = r[35].value
        file_order['postal_code'+str(row_index)] = r[37].value
        file_order['message'+str(row_index)] = r[38].value
        row_index += 1
    return file_order, row_index

# g마켓, 옥션
def gmarket(order_ws):
    print('-------지마켓,옥션 파일 분석중---------')
    file_order = {}
    row_index =  0
    for r in order_ws.rows:
        if r[0].value == None: continue
        elif r[0].value == '아이디': continue
        cate = change_category(r[8].value)
        file_order['category'+str(row_index)] = cate
        if r[0].value == '지마켓(4seasonst)':
            file_order['path'+str(row_index)] = 'g마켓'
        elif r[0].value == '옥션(4seasonst)':
            file_order['path'+str(row_index)] = '옥션'
        file_order['product'+str(row_index)] = r[8].value
        file_order['option'+str(row_index)] = r[10].value
        file_order['count'+str(row_index)] = r[9].value
        file_order['price'+str(row_index)] = r[4].value
        file_order['delivery'+str(row_index)] = r[20].value
        file_order['orderer'+str(row_index)] = r[6].value
        file_order['payee'+str(row_index)] = r[12].value
        file_order['call'+str(row_index)] = r[13].value
        file_order['address'+str(row_index)] = r[16].value
        file_order['postal_code'+str(row_index)] = r[15].value
        file_order['message'+str(row_index)] = r[17].value
        row_index += 1
    return file_order, row_index

# 스토어팜
def farm(order_ws):
    print('-------스토어팜 파일 분석중---------')
    file_order = {}
    row_index =  0
    for r in order_ws.rows:
        if r[0].value == None: continue
        elif r[0].value == '상품주문번호': continue
        cate = change_category(r[15].value)
        file_order['category'+str(row_index)] = cate
        file_order['path'+str(row_index)] = '스토어팜'
        file_order['product'+str(row_index)] = r[15].value
        file_order['option'+str(row_index)] = r[17].value
        file_order['count'+str(row_index)] = r[19].value
        file_order['price'+str(row_index)] = r[24].value
        file_order['delivery'+str(row_index)] = r[33].value
        file_order['orderer'+str(row_index)] = r[7].value
        file_order['payee'+str(row_index)] = r[9].value
        file_order['call'+str(row_index)] = r[39].value
        file_order['address'+str(row_index)] = r[41].value
        file_order['postal_code'+str(row_index)] = r[43].value
        file_order['message'+str(row_index)] = r[44].value
        row_index += 1
    return file_order, row_index

# 위메프
def wemape(order_ws):
    print('-------위메프 파일 분석중---------')
    file_order = {}
    row_index =  0
    for r in order_ws.rows:
        if r[0].value == None: continue
        elif r[0].value == '주문번호': continue
        cate = change_category(r[8].value)
        file_order['category'+str(row_index)] = cate
        file_order['path'+str(row_index)] = '위메프'
        file_order['product'+str(row_index)] = r[8].value
        file_order['option'+str(row_index)] = r[10].value
        file_order['count'+str(row_index)] = r[11].value
        file_order['price'+str(row_index)] = r[12].value
        file_order['delivery'+str(row_index)] = r[17].value
        file_order['orderer'+str(row_index)] = r[6].value
        file_order['payee'+str(row_index)] = r[13].value
        file_order['call'+str(row_index)] = r[14].value
        file_order['address'+str(row_index)] = r[16].value
        file_order['postal_code'+str(row_index)] = r[15].value
        file_order['message'+str(row_index)] = r[18].value
        row_index += 1
    return file_order, row_index

# 와우김약사몰
def wow_kim(order_ws):
    print('-------와우김약사몰 파일 분석중---------')
    file_order = {}
    row_index =  0
    for r in order_ws.rows:
        if r[0].value == None: continue
        elif r[0].value == '주문일시': continue
        cate = change_category(r[13].value)
        file_order['category'+str(row_index)] = cate
        file_order['path'+str(row_index)] = '와우김약사'
        file_order['product'+str(row_index)] = r[13].value
        file_order['option'+str(row_index)] = r[10].value
        file_order['count'+str(row_index)] = r[16].value
        file_order['price'+str(row_index)] = r[20].value
        file_order['delivery'+str(row_index)] = r[19].value
        file_order['orderer'+str(row_index)] = r[3].value
        file_order['payee'+str(row_index)] = r[5].value
        file_order['call'+str(row_index)] = r[6].value
        file_order['address'+str(row_index)] = r[9].value
        file_order['postal_code'+str(row_index)] = r[8].value
        file_order['message'+str(row_index)] = r[10].value
        row_index += 1
    return file_order, row_index

# 임박몰
def imbak(order_ws):
    print('-------임박몰 파일 분석중---------')
    file_order = {}
    row_index =  0
    for r in order_ws.rows:
        if r[0].value == None: continue
        elif r[0].value == '번호': continue
        elif r[0].value == 'no': continue
        cate = change_category(r[1].value)
        file_order['category'+str(row_index)] = cate
        file_order['path'+str(row_index)] = '임박몰'
        file_order['product'+str(row_index)] = r[1].value
        file_order['option'+str(row_index)] = r[2].value
        file_order['count'+str(row_index)] = r[5].value
        file_order['price'+str(row_index)] = r[4].value
        file_order['delivery'+str(row_index)] = '무료'
        file_order['orderer'+str(row_index)] = r[20].value
        file_order['payee'+str(row_index)] = r[6].value
        file_order['call'+str(row_index)] = r[7].value
        file_order['address'+str(row_index)] = r[10].value
        file_order['postal_code'+str(row_index)] = r[9].value
        file_order['message'+str(row_index)] = r[11].value
        row_index += 1
    return file_order, row_index

# 티몬
def tmon(order_ws):
    print('-------티몬 파일 분석중---------')
    file_order = {}
    row_index =  0
    for r in order_ws.rows:
        if r[0].value == None: continue
        elif r[0].value == '딜번호': continue
        cate = change_category(r[13].value)
        file_order['category'+str(row_index)] = cate
        file_order['path'+str(row_index)] = '티몬'
        file_order['product'+str(row_index)] = r[13].value
        file_order['option'+str(row_index)] = r[14].value
        file_order['count'+str(row_index)] = r[16].value
        file_order['price'+str(row_index)] = r[17].value
        file_order['delivery'+str(row_index)] = r[17].value
        file_order['orderer'+str(row_index)] = r[10].value
        file_order['payee'+str(row_index)] = r[20].value
        file_order['call'+str(row_index)] = r[23].value
        file_order['address'+str(row_index)] = r[24].value
        file_order['postal_code'+str(row_index)] = r[25].value
        file_order['message'+str(row_index)] = r[26].value
        row_index += 1
    return file_order, row_index

# 쿠팡
def coupang(order_ws):
    print('-------쿠팡 파일 분석중---------')
    file_order = {}
    row_index =  0
    for r in order_ws.rows:
        if r[0].value == None: continue
        elif r[0].value == '번호': continue
        cate = change_category(r[10].value)
        file_order['category'+str(row_index)] = cate
        file_order['path'+str(row_index)] = '쿠팡'
        file_order['product'+str(row_index)] = r[10].value
        file_order['option'+str(row_index)] = r[12].value
        file_order['count'+str(row_index)] = r[22].value
        file_order['price'+str(row_index)] = r[18].value
        file_order['delivery'+str(row_index)] = r[20].value
        file_order['orderer'+str(row_index)] = r[24].value
        file_order['payee'+str(row_index)] = r[27].value
        file_order['call'+str(row_index)] = r[28].value
        file_order['address'+str(row_index)] = r[30].value
        file_order['postal_code'+str(row_index)] = r[29].value
        file_order['message'+str(row_index)] = r[31].value
        row_index += 1
    return file_order, row_index

# 아직 판매된 적이 없어서 샘플 파일이 없어서 작업 대기
def kim(order_ws):
    print('-------김약사몰 파일 분석중---------')
    file_order = {}
    row_index =  0
    for r in order_ws.rows:
        if r[0].value == None: continue
        elif r[0].value == '주문번호': continue
        cate = change_category(r[8].value)
        file_order['category'+str(row_index)] = cate
        file_order['path'+str(row_index)] = '위메프'
        file_order['product'+str(row_index)] = r[8].value
        file_order['option'+str(row_index)] = r[10].value
        file_order['count'+str(row_index)] = r[11].value
        file_order['price'+str(row_index)] = r[12].value
        file_order['delivery'+str(row_index)] = r[17].value
        file_order['orderer'+str(row_index)] = r[6].value
        file_order['payee'+str(row_index)] = r[13].value
        file_order['call'+str(row_index)] = r[14].value
        file_order['address'+str(row_index)] = r[16].value
        file_order['postal_code'+str(row_index)] = r[15].value
        file_order['message'+str(row_index)] = r[18].value
        row_index += 1
    return file_order, row_index