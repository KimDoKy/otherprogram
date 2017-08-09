from django.shortcuts import render

from django.http import JsonResponse

def product(request):
    return JsonResponse({
        'type': 'buttons',
        'buttons' : ['사슴', '잉어', '해마']
        })
