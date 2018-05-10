from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from bs4 import BeautifulSoup
from urllib.request import urlopen, Request
import json, datetime, requests
from urllib.parse import quote
import random

content_list = []

def getImageUrl(request):
    req = str(request)
    img_url = "https://search.naver.com/search.naver?where=image&sm=tab_jum&ie=utf8&query=" + quote(req)
    return img_url

def crawl(request):
    global content_list
    img_url = getImageUrl(request)
    html = urlopen(img_url)
    bsObj = BeautifulSoup(html, 'html.parser')
    img_list = bsObj.find_all('div', {'class':'_item'})
    for i in img_list:
        i.find_all('img')
        content_list.append(i.find('data-source'))

    content_list = img_list.find_all('data-source')
    num = random.randrange(5,10)
    image_url = contents[num].attrs['src']
    width = contents[num].attrs['data-width']
    height = contents[num].attrs['data-height']
    return image_url, width, height


def product(request):
    return JsonResponse({
        'type': 'buttons',
        'buttons' : ['사슴', '잉어', '해마', '복숭아']
        })

@csrf_exempt
def answer(request):
    json_str = ((request.body).decode('utf-8'))
    received_json_data = json.loads(json_str)
    product_name = received_json_data['content']
    day = datetime.date.today()
    delivery = day + datetime.timedelta(days=4)
    delivery_date = delivery.strftime("%m월 %d일")
    image_url = crawl(request)[0]
    width = crawl(request)[1]
    height = crawl(request)[2]

    return JsonResponse({
        'message' : {
            'text' : '문의 주신 상품은 ' + product_name + '입니다. 지금 주문하시면 배송은' + delivery_date + ' 도착 예정입니다.',
            'photo' : {
                "url" : image_url,
                'width' : width,
                'height' : height
            }
        },
        'keyboard' : {
            'type' : 'buttons',
            'buttons' : ['잉어', '사슴', '해마', '복숭아']
        }
    })
