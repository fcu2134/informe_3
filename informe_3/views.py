from django.views.decorators.csrf import csrf_exempt
from django.shortcuts import render
from django.db import models

from modelos import carr_mod, carrera , docente ,est_mod , estado , estudiante ,jefe_carrera,jornada, mod_doc , modulo, sala , semestre , usuario

@csrf_exempt

    mydb=mysql.connector.connect(
    host="localhost",
    user="root",
    password="",
    database="cft"
    )
    mycursor= mydb.cursor()
    estudiante=estudiante(5,"stefy","villa")
    carrera=carrera(50,"","")


    sqlestudiante = "INSERT into gato(estudiante.run,estudiante_nombre_est,estudiante_apellido) VALUES (%s,%s,%s)"
    estudiante_val =(estudiante.run,estudiante.nombre_est,estudiante.apellido)

    mycursor.execute(estudiante,estudiante_val)
    mydb.commit()
    print("1 registro se ah ingresado,id",mycursor.lastrowid)