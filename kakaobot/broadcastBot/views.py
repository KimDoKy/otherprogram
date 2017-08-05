from django.shortcuts import render

from django.http import JsonResponse

def product(request):
    return JsonResponse({
        'type': 'buttons',
        'butons' : ['사슴', '잉어', '해마']
        })
