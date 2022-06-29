#Movie_Ratings: Es una tabla de Películas que fueron evaluadas por usuarios, dándoles un puntaje del 1 al 5.
#1)¿Cuántas películas fueron calificadas por Thomas?
#2)¿Cuántas películas fueron calificadas por Matt?
from distutils.log import info
import mysql.connector
from mysql.connector import Error

def cuantas_peliculas(cursor):
    registro = cursor.fetchone()    #para obtener una respuesta usamos el cursor y fetchone, que recibe una sola respuesta de la consultas.
    print("-> Estas conectado a la bd: ", registro)
    cursor.execute("SELECT * FROM movie_ratings.usuario_califica_peliculas WHERE nombre_usuario='Thomas';")#Se hace la consulta a Mysql, con el comando para buscar todas las calificaciones que hizo Thomas
    resultados =cursor.fetchall()   #Se obtiene los resultados en una Tupla[num_de_califiaciones][nombre,pelicula,califiacion].
    num_peliculas = len(resultados) #Se guarda en una variable el tamaño de la tupla obtenida
    return num_peliculas#y se retorna.
        


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
        print("-> Estas conectado a la bd: ", registro)
        print("-> Thomas califico: ",cuantas_peliculas(cursor)," Peliculas.")   #Se llama a la funcion que calculara el numero de peliculas de thomas.
    #Si algo falla en todo este bloque
except Error as ex: #obtenemos el error en una varible
    print("-> Error durante la conexion: ", ex) #e informamos cual es el error
finally:        #Para finalizar la ejecucion cerramos la conexion con la bd.
    if conexion.is_connected():
        conexion.close()#y se cierra la conexion con la BD
        print("-> La conexion a la Bd ha finalizado.")