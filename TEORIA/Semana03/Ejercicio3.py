#Movie_Ratings: Es una tabla de Películas que fueron evaluadas por usuarios, dándoles un puntaje del 1 al 5.
#3)¿Qué película fue la más calificada por los usuarios?, ¿cuántos usuarios la calificaron?
#   Disgregue por número de usuarios que la calificaron con un determinado puntaje.

from asyncio.windows_events import NULL
from distutils.log import info
import mysql.connector
from mysql.connector import Error

def pelicula_mayor(cursor): #funcion que nos devolvera la pelicula mas califiacada.
    registro = cursor.fetchone()    #para obtener una respuesta usamos el cursor y fetchone, que recibe una sola respuesta de la consultas.
    cursor.execute("SELECT * FROM usuario_califica_peliculas;")#Se hace la consulta a Mysql, con el comando para buscar todas las calificaciones.
    resultados =cursor.fetchall()   #Se obtiene los resultados en una Tupla[num_de_califiaciones][nombre,pelicula,califiacion].
    cursor.execute("SELECT * FROM peliculas;")#Se hace la consulta a Mysql, con el comando para buscar todos loas nombres de las peliculas.
    name_peliculas =cursor.fetchall()   #Se obtiene los resultados en una Tupla[num_peliculas].
    mayor = 0   #variable para el numero con mayor
    cont = 0    #variable contador de califiaciones
    peli_mayor = NULL   #variable para almacenar el numero de tupla de peli con mayor califiacaiones
    for pelicula in name_peliculas:    #bucle para comparar cada peli pelicula=[(una_peli,),()...]
        for linea in resultados:    #bucle para comparar cada noombre de peli calificada
            if linea[1] == pelicula[0]    :   #Si el mobre de la peli con el de la peli califiacada son iguales #pelicula[0]=una_peli
                cont = cont+1   #se va contando mas 1
        if cont > mayor:    #al finalizar el bucle de calificaciones, si el contador es mayor que el contador de la comparacion anterior
            mayor = cont    #el contador actual se guarda en la variable mayor,
            peli_mayor = pelicula[0] #se guarda el numero de la tupla de la peli que gano mas calificaciones que la anterior
        cont = 0    #y volvemos al contador a 0.
    print("-> La pelicula mas calificada por los usuarios es: ",peli_mayor)#Se imprime la pelicula con mas califiaciones.
    
    return mayor#y se retorna el nombre de la pelicula con mayor calificaiones.
        


try:    #Si todo sale bien
    conexion = mysql.connector.connect(         #En una variable obtedremos la conexion, entonces
        host='localhost',       #le enviamos los datos del server.
        port=3306,
        user='root',
        password='1234',
        db='movie_ratings'
    )

    if conexion.is_connected():     #Condicional para verificar si nos conectamos a la bd.
        print("-> Conexion exitosa a la BD.")
        cursor = conexion.cursor()  #Objeto que actua como conexion para hacer lecturas, inserciones, actualizaciones y eliminaciones.
        cursor.execute("SELECT database();") #una vez establecida la conexion a la bd y el cursor, con execute nops permitira hacer una sentencia en la bd
        registro = cursor.fetchone()    #para obtener una respuesta usamos el cursor y fetchone, que recibe una sola respuesta de la consultas.
        print("-> Estas conectado a la BD: ", registro[0])
        print("-> El numero de usuarios que calificaron esta pelicula es: ",pelicula_mayor(cursor), " usuarios")   #Se imprimira el valor que devuelva la funcion pelicula_mayor().
    
    #Si algo falla en todo este bloque
except Error as ex: #obtenemos el error en una varible
    print("-> Error durante la conexion: ", ex) #e informamos cual es el error
finally:        #Para finalizar la ejecucion cerramos la conexion con la bd.
    if conexion.is_connected():
        conexion.close()#y se cierra la conexion con la BD
        print("-> La conexion a la Bd ha finalizado.")