/* SI EXISTEN DATOS LOS ELIMINOS Y REINICIO LOS AUTONUMERICOS  
USADOS EN LAS CLAVES PRIMARIAS */  

 
TRUNCATE TABLE paciente, cita, centro, enfermero, muestra, tecnico, resultado RESTART IDENTITY;   
 
/* INSERTAMOS PACIENTES */  
 
/* Importante el orden de inserción en las distintas tablas */ 

insert into paciente (dni,nombre,apellidos,telefono,fecha_nacimiento) values ('11111111A','JOSE', 'PEREZ GARCIA','611223344','1960/12/31');   
 
insert into paciente (dni,nombre,apellidos,telefono,fecha_nacimiento) values ('22222222B','MARIA', 'GONZALEZ JIMENEZ','834121212','1975/03/10');   
 
insert into paciente (dni,nombre,apellidos,telefono,fecha_nacimiento) values ('33333333C','ANTONIO', 'RAMIREZ MARTINEZ','934151515','1979/03/20');   
 
insert into paciente (dni,nombre,apellidos,telefono,fecha_nacimiento) values ('44444444D','EVA', 'HERNANDEZ SANCHEZ','911454545','1968/03/16');   
insert into paciente (dni,nombre,apellidos,telefono,fecha_nacimiento) values ('55555555E','JUAN', 'LOPEZ JIMENEZ','938775522','1961/03/24');   
 
insert into paciente (dni,nombre,apellidos,telefono,fecha_nacimiento) values ('66666666F','BEATRIZ', 'GARCIA GOMEZ','914785234','1972/05/27'); 
 
insert into paciente (dni,nombre,apellidos,telefono,fecha_nacimiento) values ('77777777G','PEDRO', 'BLANCO MARTIN','954847696','1985/02/17');   
 
insert into paciente (dni,nombre,apellidos,telefono,fecha_nacimiento) values ('88888888H','ANA', 'FERNANDEZ RUIZ','936598457','1958/08/19');   
 
insert into paciente (dni,nombre,apellidos,telefono,fecha_nacimiento) values ('99999999I','AGUSTIN', 'ROMERO DOMINGUEZ','924152478','1982/09/03');   
 
insert into paciente (dni,nombre,apellidos,telefono,fecha_nacimiento) values ('00000000J','NOELIA', 'GIMENEZ ORTIZ','957849562','1999/07/14');  

/* INSERTAMOS CENTRO */  
insert into centro (direccion) values ('CL ACACIAS');   
 
/* INSERTAMOS ENFERMEROS*/  
insert into enfermero (dni, nombre,apellidos) values ('98765432', 'AGUSTIN','TORRES BENJUMEA');  
 
insert into enfermero (dni, nombre,apellidos) values ('23456789' , 'ALFREDO','SIMANCAS IGLESIAS');  
 
insert into enfermero (dni, nombre,apellidos) values ('34567891' , 'CARIDAD','ALMENGLO REINA');  

 
/* INSERTAMOS TECNICOS*/  
insert into tecnico (dni,nombre,apellidos) values ('12345678Z','JAIME','BLANCO PALACIOS');   
 
insert into tecnico (dni,nombre,apellidos) values ('23456781A','PAULA','ROSA SEVILLA');   

 
/* INSERTAMOS CITAS*/ 
 insert into cita (fecha_cita, fecha_grabacion,observaciones,dni_paciente,codigo_centro) values ('2021/12/01', '2021/11/24','diabetes','11111111A',1);  
 
insert into cita (fecha_cita, fecha_grabacion,observaciones,dni_paciente,codigo_centro) values ('2021/12/01', '2021/11/24','sano','33333333C',1);   
 
insert into cita (fecha_cita, fecha_grabacion,observaciones,dni_paciente,codigo_centro) values ('2021/12/01', '2021/11/24',' ','77777777G',1);  
 
insert into cita (fecha_cita, fecha_grabacion,observaciones,dni_paciente,codigo_centro) values ('2021/12/01', '2021/11/24','sano','44444444D',1);  
 
insert into cita (fecha_cita, fecha_grabacion,observaciones,dni_paciente,codigo_centro) values ('2021/12/02', '2021/11/25','sano','22222222B',1);   
 
insert into cita (fecha_cita, fecha_grabacion,observaciones,dni_paciente,codigo_centro) values ('2021/12/02', '2021/11/25','sano','99999999I',1);   
 
insert into cita (fecha_cita, fecha_grabacion,observaciones,dni_paciente,codigo_centro) values ('2021/12/02', '2021/11/25','sano','00000000J',1);   
 
insert into cita (fecha_cita, fecha_grabacion,observaciones,dni_paciente,codigo_centro) values ('2021/12/03', '2021/11/25','sano','66666666F',1);   
 
insert into cita (fecha_cita, fecha_grabacion,observaciones,dni_paciente,codigo_centro) values ('2021/12/03', '2021/11/26','sano','55555555E',1);   
 
insert into cita (fecha_cita, fecha_grabacion,observaciones,dni_paciente,codigo_centro) values ('2021/12/03', '2021/11/26','sano','88888888H',1);   
 
insert into cita (fecha_cita, fecha_grabacion,observaciones,dni_paciente,codigo_centro) values ('2021/12/07', '2021/11/27','sano','33333333C',1);   
 
insert into cita (fecha_cita, fecha_grabacion,observaciones,dni_paciente,codigo_centro) values ('2021/12/07', '2021/11/27','infartado','88888888H',1);   
 
insert into cita (fecha_cita, fecha_grabacion,observaciones,dni_paciente,codigo_centro) values ('2021/12/07', '2021/11/27','sano','33333333C',1);   
 
insert into cita (fecha_cita, fecha_grabacion,observaciones,dni_paciente,codigo_centro) values ('2021/12/07', '2021/11/28','sano','22222222B',1);   
 
insert into cita (fecha_cita, fecha_grabacion,observaciones,dni_paciente,codigo_centro) values ('2021/12/15', '2021/11/28','sano','11111111A',1);  
 
insert into cita (fecha_cita, fecha_grabacion,observaciones,dni_paciente,codigo_centro) values ('2021/12/15', '2021/11/28','sano','33333333C',1);  
 

/* INSERTAMOS MUESTRAS*/  
insert into muestra (fecha_recogida, codigo_enfermero,codigo_tecnico, dni_paciente) values ('2021/12/02' , 1,1,'11111111A');  
 
insert into muestra (fecha_recogida, codigo_enfermero,codigo_tecnico, dni_paciente) values ('2021/12/02' , 3,2,'33333333C');  
 
insert into muestra (fecha_recogida, codigo_enfermero,codigo_tecnico, dni_paciente) values ('2021/12/02' , 2,1,'22222222B');  
 
insert into muestra (fecha_recogida, codigo_enfermero,codigo_tecnico, dni_paciente) values ('2021/12/03' , 1,1,'44444444D');  
 
insert into muestra (fecha_recogida, codigo_enfermero,codigo_tecnico, dni_paciente) values ('2021/12/03' , 2,2,'55555555E');  
 
insert into muestra (fecha_recogida, codigo_enfermero,codigo_tecnico, dni_paciente) values ('2021/12/03' , 3,2,'66666666F');  
 
insert into muestra (fecha_recogida, codigo_enfermero,codigo_tecnico, dni_paciente) values ('2021/12/04' , 3,2,'77777777G');  
 
insert into muestra (fecha_recogida, codigo_enfermero,codigo_tecnico, dni_paciente) values ('2021/12/02' , 3,2,'33333333C');  
 

/* INSERTAMOS RESULTADOS */  
insert into resultado (confirmado, codigo_muestra) values ('negativo' , 1);  
 
insert into resultado (confirmado, codigo_muestra) values ('negativo' , 2);  
 
insert into resultado (confirmado, codigo_muestra) values ('positivo' , 3);  
 
insert into resultado (confirmado, codigo_muestra) values ('indeterminado' , 4);  
 
insert into resultado (confirmado, codigo_muestra) values ('negativo' , 5);  
 
insert into resultado (confirmado, codigo_muestra) values ('positivo' , 6); 