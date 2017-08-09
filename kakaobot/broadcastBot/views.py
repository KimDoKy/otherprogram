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
    print(json_str)
    received_json_data = json.loads(json_str)
    product_name = received_json_data['content']
    today_date = datetime.date.today().strftime("%m월 %d일")

    return JsonResponse({
        'message' : {
            'text' : today_date + '의 ' + product_name + ' 상품입니다.'
        },
        'keyboard' : {
            'type' : 'buttons',
            'buttons' : ['잉어', '사슴', '해마']
        }
    })
