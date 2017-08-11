from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from bs4 import BeautifulSoup
from urllib.request import urlopen
import json, datetime


def getImageUrl(request):
    req = str(request)
    img_url = "https://www.google.co.kr/search?as_st=y&tbm=isch&hl=ko&as_q=" + req + "&safe=images&tbs=isz:lt,islt:vga"
    return img_url

def crawl(request):
    img_url = getImageUrl(request)
    html = urlopen(img_url)
    bsObj = BeautifulSoup(html, 'html.parser')
    image_url = bsObj.find_all('img')[0].attrs['src']
    width = bsObj.find_all('img')[0].attrs['width']
    height = bsObj.find_all('img')[0].attrs['heigth']
    return image_url, width, height


def product(request):
    return JsonResponse({
        'type': 'buttons',
        'buttons' : ['사슴', '잉어', '해마']
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
            'buttons' : ['잉어', '사슴', '해마']
        }
    })
