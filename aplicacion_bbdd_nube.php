<?php
	// << a�adir conexi�n nube >>
    // ElephantSQL
    // URL: postgres://<nombre_usuario>:<contrase�a_usuario>@<nombre_maquina>/<nombre_bbdd>
    // Datos de la cadena de conexi�n
    $maquina = "tai.db.elephantsql.com"; // cambiar por la m�quina que indica ElephantSQL
    $puerto = "5432";
    $bbdd = "buqjeypq"; // cambiar por tu bbdd
    $usuario = "buqjeypq"; // cambiar por tu usuario
    $contrasenya = "ZyRPZlzTrurmGNYkGuauAVfKbLZmAgum"; // cambiar por tu contrase�a
	// << a�adir conexi�n nube >>

    // Establecer la conexi�n a bbdd PostgreSQL
    $conexion = pg_connect("host=$maquina port=$puerto dbname=$bbdd user=$usuario password=$contrasenya");

    // Estado de la conexi�n
    if (!$conexion) {
        echo utf8_encode("Error: No se ha podido realizar la conexi�n.");
        exit;
	}

// ------------ CONSULTAS -------------------------------------------------------------------
	//<<<a�adir consultaJOIN1>>>
	// Consulta JOIN 1
	function consulta_join1($conexion) {
	  // Realizar una consulta SQL
	  $consulta = "select dni, nombre, apellidos, fecha_cita from paciente inner join cita on cita.dni_paciente = paciente.dni wherefecha_nacimiento <'1970-01-01'; ";
	  // Cambiar por vuestra SELECT
	  $resultado = pg_query($conexion, $consulta);
	  // Comprobar resultado de la consulta
	  if (!$resultado) {
		echo utf8_encode("No se ha podido realizar la consulta join   1, error: ").pg_last_error();
		exit;
	  }   
	  // Comprobar que devuelve la consulta
	  if (pg_num_rows($resultado) == 0) { // La consulta no tiene ninguna fila
		 echo utf8_encode("No se encontr� ninguna fila 	que coincida con la consulta join 1.");
	  } else {
		 //<<<a�adir mostrar consultaJOIN1>>>
		 echo "<p>===================<br/>";  
		 echo "CONSULTA JOIN 1<br/>";
		 echo "===================<p/>";
		 echo "<p>";
		 // Mostrar los datos de la consulta
		 while ($fila = pg_fetch_row($resultado)) {
		   // A�adir todos los campos que se quieran mostrar  $fila[0] para  primer campo, $fila[1] para segundo campo, $fila[2] para tercer campo, ...
		   echo "Campo 1: $fila[0] Campo 2: $fila[1]  Campo 3: $fila[2]";
		   echo "<br />\n";
		 }
		 echo "===================<p/>";
		 //<<<a�adir mostrar consultaJOIN1>>>
	  }
	  // Liberar los resultados   
	  pg_free_result($resultado);
	}
	// Realizar consultajoin1
	consulta_join1($conexion);
	//<<<a�adir consultaJOIN1>>>
  
	//<<<a�adir consultaJOIN2>>>
	// Consulta JOIN 2
	function consulta_join2($conexion) {
		// Realizar una consulta SQL
		$consulta = "select dni_paciente,confirmado from muestra inner join resultado on resultado.codigo_muestra = muestra.codigo where confirmado ='positivo';";
		// Cambiar por vuestra SELECT
		$resultado = pg_query($conexion, $consulta);
		// Comprobar resultado de la consulta
		if (!$resultado) {
			echo utf8_encode("No se ha podido realizar la consulta join 2, error: ").pg_last_error();
			exit;
		}
		// Comprobar que devuelve la consulta
		if (pg_num_rows($resultado) == 0) {
			// La consulta no tiene ninguna fila
			echo utf8_encode("No se encontr� ninguna fila que coincida con la consulta join 2.");
		} else {
			//<<<a�adir mostrar consultaJOIN2>>>
			echo "<p>===================<br/>";
			echo "CONSULTA JOIN 2<br/>"; 
			echo "===================<p/>";
			echo "<p>";
			// Mostrar los datos de la consulta
			while ($fila = pg_fetch_row($resultado)) {
			// A�adir todos los campos que se quieran mostrar  $fila[0] para primer campo, $fila[1] para segundo campo, $fila[2] para tercer campo, ...
				echo "Campo 1: $fila[0] Campo 2: $fila[1]";
				echo "<br />\n";
			}
			echo "===================<p/>";
			//<<<a�adir mostrar consultaJOIN2>>>
		}

		// Liberar los resultados
		pg_free_result($resultado);
	}
    // Realizar consultajoin2
    consulta_join2($conexion);
    //<<<a�adir consultaJOIN2>>>
    //<<<a�adir consultaAGREGADA1>>>
    // Consulta AGREGADA 1

    function consulta_agregada1($conexion) {
		// Realizar una consulta SQL
		$consulta = "select fecha_cita, count(codigo) from cita group by fecha_cita order by fecha_cita;";
		// Cambiar por vuestra SELECT
		$resultado = pg_query($conexion, $consulta);
		// Comprobar resultado de la consulta
		if (!$resultado) {
			echo utf8_encode("No se ha podido realizar la consulta agregada 1, error: ").pg_last_error();
			exit;
		}
  
		// Comprobar que devuelve la consulta
		if (pg_num_rows($resultado) == 0) {
           // La consulta no tiene ninguna fila
           echo utf8_encode("No se encontr� ninguna fila que coincida con la consulta agregada 1.");
        } else {
           //<<<a�adir mostrar AGREGADA1>>>
           echo "<p>===================<br/>";
           echo "CONSULTA AGREGADA 1<br/>";
           echo "===================<p/>";
           echo "<p>";
           // Mostrar los datos de la consulta
           while ($fila = pg_fetch_row($resultado)) {
				// A�adir todos los campos que se quieran mostrar $fila[0] para primer campo, $fila[1] para segundo campo, $fila[2] para tercer campo, ...
                echo "Campo 1: $fila[0] Campo 2: $fila[1]";
                echo "<br />\n";
           }
		   echo "===================<p/>";
		//<<<a�adir mostrar consultaAGREGADA1>>>
        }
        // Liberar los resultados  
        pg_free_result($resultado);
	}
    // Realizar consultaAGREGADA1  
    consulta_agregada1($conexion);   
    ////<<<a�adir consultaAGREGADA1>>>
    
	//<<<a�adir consultaAGREGADA2>>>
    // Consulta AGREGADA 2
    function consulta_agregada2($conexion) {
        // Realizar una consulta SQL
        $consulta = "select count (*), fecha_recogida from muestra group by fecha_recogida having count(*)>2;";
        // Cambiar por vuestra SELECT
        $resultado = pg_query($conexion, $consulta);
        // Comprobar resultado de la consulta
        if (!$resultado) {
            echo utf8_encode("No se ha podido realizar la consulta agregada 2, error: ").pg_last_error();
            exit;
        }
        // Comprobar que devuelve la consulta
        if (pg_num_rows($resultado) == 0) {
			// La consulta no tiene ninguna fila
			echo utf8_encode("No se encontr� ninguna fila que coincida con la consulta agregada 2.");
        } else {
			//<<<a�adir mostrar consultaAGREGADA2>>>
			echo "<p>===================<br/>";
			echo "CONSULTA AGREGADA 2<br/>";
			echo "===================<p/>";
			echo "<p>";
			// Mostrar los datos de la consulta
			while ($fila = pg_fetch_row($resultado)) {
				// A�adir todos los campos que se quieran mostrar $fila[0] para primer campo, $fila[1] para segundo campo, $fila[2] para tercer campo, ...
				echo "Campo 1: $fila[0] Campo 2: $fila[1]";
				echo "<br />\n";
			}
			echo "===================<p/>";
			//<<<a�adir mostrar consultaAGREGADA2>>>
		}
		// Liberar los resultados  
		pg_free_result($resultado); 
	} 
	// Realizar consultaAGREGADA2    
	consulta_agregada2($conexion);   
	////<<<a�adir consultaAGREGADA2>>> 
// Cerrar la conexi�n
pg_close($conexion);

?>