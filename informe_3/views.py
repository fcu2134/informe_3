from django.views.decorators.csrf import csrf_exempt
from django.shortcuts import render
import mysql.connector
from informe_3.modelos.usuario import Usuario
from django.http import HttpResponse
from django import forms
 
mydb = mysql.connector.connect(
        host="localhost",
        user="root",
        password="",
        database="cft"
    )
mycursor = mydb.cursor()



@csrf_exempt
def basededatos(request):
    otroid_usuario = int(request.POST['id_usuario'])
    otronombre_usuario = str(request.POST['nombre_usuario'])

    # Crear una instancia de la clase Usuario
    nuevo_usuario = Usuario(otroid_usuario, otronombre_usuario)
    # Crear un formulario de confirmación
    #confirmacion_form = ConfirmacionForm({'mensaje': 'La información se ha enviado correctamente.'})

    sql = "INSERT usuario (id_usuario, nombre_usuario) VALUES (%s, %s)"
    
    # Utilizar los valores de la instancia, no de la clase
    val = (nuevo_usuario.id_usuario, nuevo_usuario. nombre_usuario)
    
    mycursor.execute(sql, val)
    mydb.commit()
    if otroid_usuario and otronombre_usuario:
            

            return render(request, 'datos_enviados.html', {'id_usuario': otroid_usuario, "nombre_usuario": otronombre_usuario})
    else:
            return HttpResponse("Campos 'id_usuario' o 'nombre_usuario' faltantes en la solicitud.")
    
@csrf_exempt
def user(request):
    return render(request, "usuario.html")

@csrf_exempt
def html(request):
    return render(request, "informe_3.html")
@csrf_exempt
def buscar(request):
    try:
        nombre = request.POST['nombre']
        apellido = request.POST["apellido"]
        run = request.POST['run']
        carrera = request.POST['carrera']
        nt_1 = float(request.POST['nt_1']) if request.POST['nt_1'] else 0.0
        nt_2 = float(request.POST['nt_2']) if request.POST['nt_2'] else 0.0
        nt_3 = float(request.POST['nt_3']) if request.POST['nt_3'] else 0.0
        nt_4 = float(request.POST['nt_4']) if request.POST['nt_4'] else 0.0
        nt_5 = float(request.POST['nt_5']) if request.POST['nt_5'] else 0.0
        nt_6 = float(request.POST['nt_6']) if request.POST['nt_6'] else 0.0

        modulo = request.POST["modulo"]

        porc_nt_1 = 0.15
        porc_nt_2 = 0.15
        porc_nt_3 = 0.2
        porc_nt_4 = 0.2
        porc_nt_5 = 0.15
        porc_nt_6 = 0.15

        promedio = round((nt_1 * porc_nt_1) + (nt_2 * porc_nt_2) + (nt_3 * porc_nt_3) + (nt_4 * porc_nt_4) + (nt_5 * porc_nt_5) + (nt_6 * porc_nt_6), 2)

        promedio = max(1, min(7, promedio))

        return render(request, 'entregado.html', {'nombre': nombre, "run": run, "carrera": carrera, "nt_1": nt_1, "nt_2": nt_2, "nt_3": nt_3, "nt_4": nt_4, "nt_5": nt_5, "nt_6": nt_6, "promedio": promedio, "modulo": modulo, "apellido": apellido})
    
    except ValueError as e:
        # Manejar el error aquí, por ejemplo, mostrar un mensaje de error o redirigir a una página de error.
        return render(request, 'error.html', {'error_message': 'Error al procesar los datos. Asegúrate de ingresar números válidos en los campos de notas.'})
