<?php 
 
// << añadir conexión nube >> 
// ElephantSQL 
// URL: postgres://<nombre_usuario>:<contraseña_usuario>@<nombre_maquina>/<nombre_bbdd> 
// Datos de la cadena de conexión 
$maquina = "tai.db.elephantsql.com";  

// cambiar por la máquina que indica ElephantSQL 
$puerto = "5432"; 
$bbdd = "buqjeypq"; // cambiar por tu bbdd 
$usuario = "buqjeypq"; // cambiar por tu usuario 
$contrasenya = "ZyRPZlzTrurmGNYkGuauAVfKbLZmAgum";  

// cambiar por tu contraseña 
// << añadir conexión nube >> 
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