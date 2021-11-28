<?php  
// << añadir conexión local >>  

// Datos de la cadena de conexión    

$maquina = "localhost";      

$puerto = "5432";      

$bbdd = "postgres"; // cambiar por tu bbdd      

$usuario = "postgres"; // cambiar por tu usuario  

$contrasenya = "######"; // cambiar por tu contraseña  

// << añadir conexión local >>  
// Establecer la conexión a bbdd PostgreSQL  
$conexion = pg_connect("host=$maquina port=$puerto dbname=$bbdd user=$usuario password=$contrasenya");  

// Estado de la conexión  
if($conexion) {  
	echo "Conexión realizada con éxito.";  
} else {  
 	  echo "Error: No se ha podido realizar la conexión.";  
}  

// Cerrar la conexión  
pg_close($conexion);  
 

?> 