from django.views.decorators.csrf import csrf_exempt
from django.shortcuts import render
import mysql.connector
from informe_3.modelos.usuario import Usuario
from informe_3.modelos.estado import Estado
from django.http import HttpResponse

 
mydb = mysql.connector.connect(
        host="localhost",
        user="root",
        password="",
        database="cft"
    )
mycursor = mydb.cursor()


@csrf_exempt
def basededatos(request):
    otroid_usuario = int(request.POST.get('id_usuario'))
    otronombre_usuario = str(request.POST.get('nombre_usuario'))
    otroestado = str(request.POST.get('estado_id'))
    otrodescripcion = str(request.POST.get('descripcion'))
    otrofecha_hora = str(request.POST.get('fecha_hora'))

    nuevo_usuario = Usuario(otroid_usuario, otronombre_usuario)
    nuevo_estado = Estado(otroestado, otroid_usuario, otrodescripcion, otrofecha_hora)

    sql_usuario = "INSERT INTO usuario (id_usuario, nombre_usuario) VALUES (%s, %s)"
    val_usuario = (nuevo_usuario.id_usuario, nuevo_usuario.nombre_usuario)
    mycursor.execute(sql_usuario, val_usuario)

    sql_estado = "INSERT INTO estado (estado_id, id_usuario, descripcion, fecha_hora) VALUES (%s, %s, %s, %s)"
    val_estado = (nuevo_estado.estado_id, nuevo_estado.id_usuario, nuevo_estado.descripcion, nuevo_estado.fecha_hora)
    mycursor.execute(sql_estado, val_estado)

    mydb.commit()

    return render(request, 'datos_enviados.html', {'id_usuario': otroid_usuario, 'nombre_usuario': otronombre_usuario, 'estado_id': otroestado, 'descripcion': otrodescripcion, 'fecha_hora': otrofecha_hora})

#me faltaron tablas profe pero no me dio tiempo :C
    
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
