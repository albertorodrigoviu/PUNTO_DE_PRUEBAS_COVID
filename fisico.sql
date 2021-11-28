/*------------------------------------------------------------ */ 

/* Base de datos para un puno de pruebas COVID */  

/*------------------------------------------------------------ */  


/* Elimino la base de datos si esta existiese*/  

DROP DATABASE IF EXISTS "PUNTO_DE_PRUEBAS_COVID";  

 

/* Creo la base de datos si esta existiese*/ 

CREATE DATABASE "PUNTO_DE_PRUEBAS_COVID"  WITH   
OWNER = postgres  
ENCODING = 'UTF8'  
LC_COLLATE = 'Spanish_Spain.1252' 
LC_CTYPE = 'Spanish_Spain.1252' 
TABLESPACE = pg_default  
CONNECTION LIMIT = -1;  
 

/* Borro las tablas y el dominio si existen */  
/* Es importante el orden de borrado de las tablas debido a las claves externas*/  

DROP TABLE IF EXISTS RESULTADO;  
DROP DOMAIN IF EXISTS estados;  
DROP TABLE IF EXISTS MUESTRA;  
DROP TABLE IF EXISTS CITA;  
DROP TABLE IF EXISTS ENFERMERO;  
DROP TABLE IF EXISTS PACIENTE;  
DROP TABLE IF EXISTS CENTRO;  
DROP TABLE IF EXISTS TECNICO;  
 
/* Creamos las tablas. */ 
/* También es importante el orden de creación de tablas*/ 

 
CREATE TABLE PACIENTE (  
dni character varying(9) NOT NULL,  
nombre character varying(25) NOT NULL,  
apellidos character varying(25) NOT NULL,  
telefono character varying(9),  
fecha_nacimiento date,  
CONSTRAINT cp_paciente PRIMARY KEY (dni)  
);  
 

CREATE TABLE CENTRO(  
codigo serial NOT NULL,  
direccion character varying(100) NOT NULL,  
CONSTRAINT cp_centro PRIMARY KEY (codigo)  
);  
  

CREATE TABLE TECNICO(   
codigo serial NOT NULL,   
dni character varying(9) NOT NULL,   
nombre character varying(25) NOT NULL,   
apellidos character varying(25) NOT NULL,   
CONSTRAINT cp_tecnico PRIMARY KEY (codigo)   
);   
 

CREATE TABLE CITA(  
codigo serial NOT NULL,  
fecha_cita date NOT NULL,  
fecha_grabacion date NOT NULL,  
observaciones character varying(250),  
dni_paciente character varying(9),  
codigo_centro integer,  
CONSTRAINT cp_cita PRIMARY KEY (codigo),  
CONSTRAINT ca_paciente FOREIGN KEY (dni_paciente) REFERENCES PACIENTE(dni) ON DELETE RESTRICT ON UPDATE CASCADE,  
CONSTRAINT ca_centro FOREIGN KEY (codigo_centro) REFERENCES CENTRO(codigo) ON DELETE RESTRICT ON UPDATE RESTRICT   
);   
 

CREATE TABLE ENFERMERO(  
codigo serial NOT NULL,  
dni character varying(9) NOT NULL,  
nombre character varying(25) NOT NULL,  
apellidos character varying(25) NOT NULL,  
codigo_centro integer,  
CONSTRAINT cp_enfermero PRIMARY KEY (codigo),  
CONSTRAINT ca_centro FOREIGN KEY (codigo_centro)  
REFERENCES CENTRO(codigo)  
ON DELETE RESTRICT  
ON UPDATE CASCADE  
);    
 

CREATE TABLE MUESTRA(  
codigo serial NOT NULL,  
fecha_recogida date NOT NULL,  
codigo_enfermero integer,  
codigo_tecnico integer,  
dni_paciente character varying,  
CONSTRAINT cp_muestra PRIMARY KEY (codigo),  
CONSTRAINT ca_enfermero FOREIGN KEY (codigo_enfermero) REFERENCES ENFERMERO(codigo) ON DELETE RESTRICT ON UPDATE CASCADE,  
CONSTRAINT ca_tecnico FOREIGN KEY (codigo_tecnico) REFERENCES TECNICO(codigo) ON DELETE RESTRICT ON UPDATE CASCADE,  
CONSTRAINT ca_paciente FOREIGN KEY (dni_paciente) REFERENCES PACIENTE(dni) ON DELETE RESTRICT ON UPDATE CASCADE  
);  
 

/* Creamos el dominio de datos */  
CREATE DOMAIN estados AS character varying(15)  
CHECK (VALUE IN ('positivo', 'negativo', 'indeterminado'));  

 
CREATE TABLE RESULTADO(  
codigo serial NOT NULL,  
confirmado estados NOT NULL,  
codigo_muestra integer,  
codigo_tecnico integer, 
CONSTRAINT cp_resultado PRIMARY KEY (codigo),  
CONSTRAINT ca_muestra FOREIGN KEY (codigo_muestra) REFERENCES MUESTRA(codigo) ON DELETE RESTRICT ON UPDATE RESTRICT  
CONSTRAINT ca_tecnico FOREIGN KEY (codigo_tecnico) REFERENCES TECNICO(codigo) ON DELETE RESTRICT ON UPDATE RESTRICT 
); 

 