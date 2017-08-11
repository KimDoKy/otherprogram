from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
import json, datetime

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

    return JsonResponse({
        'message' : {
            'text' : '문의 주신 상품은 ' + product_name + '입니다. 지금 주문하시면 배송은' + delivery_date + ' 도착 예정입니다.',
            'photo' : {
                "url" : "http://mieninc.godohosting.com/chun/peach/p4.jpg",
                'width' : '100%',
                'height' : '100%'
            }
        },
        'keyboard' : {
            'type' : 'buttons',
            'buttons' : ['잉어', '사슴', '해마']
        }
    })
