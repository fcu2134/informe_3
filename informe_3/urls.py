from django.contrib import admin
from django.urls import path
from informe_3.views import buscar, html

urlpatterns = [
    path('admin/', admin.site.urls),
    path("buscar/", buscar),
    path("pagina/", html),
]
