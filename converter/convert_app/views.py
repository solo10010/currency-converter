from django.shortcuts import render
from django.http import HttpResponse
import requests, json
# func

request = "https://api.exchangerate-api.com/v6/latest"


# Create your views here.
def index(request):
    response = requests.get(url="https://api.exchangerate-api.com/v6/latest").json()
    
    if request.method == 'GET':
        return render(request, 'convert_app/index.html', response)

    if request.method == 'POST':
        form_summa = request.POST.get('summa')
        val_for = request.POST.get('from')
        val_to = request.POST.get('to')

        valutes = response['rates']

        convertation = float(form_summa) * valutes[val_to] # конвертируем на валюту

        result = dict(data = convertation, vaultfor = val_for, valtto = val_to) # из результата делаем словарь

        response.update(result) # обьединеть словари

        return render(request, 'convert_app/index.html', response)