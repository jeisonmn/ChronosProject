# ChronosProject
Proyecto para practica empresarial en ICE-GEDI
El equipo se enfocará en el desarrollo de un sistema que permita facilitar el proceso que va desde la solicitud de trabajos de impresión en gran formato hasta la entrega del trabajo al cliente. El sistema deberá además calcular el tiempo que dura la solicitud en cada departamento.
El departamento  GEDI del Instituto Costarricense de Electricidad necesita un sistema para automatizar el proceso del registro de solicitudes de trabajos de gran formato y calcular el tiempo de esta en cada departamento.
Actualmente el registro para este tipo de trabajos en la sección de gran formato se lleva en un documento de Excel.
Cada departamento tiene un tiempo estimado que debe cumplir para procesar la solicitud, muchas veces la solicitud dura mucho en un departamento o incluso hay que devolvérsela al cliente, por esta razón las entregas de los trabajos se atrasan y se pierde credibilidad con los clientes. 
Debido a esto se ve la necesidad de crear un sistema que les permita tener el control de las solicitudes, de los tiempos y además del cuál puedan sacar reportes los cuales indiquen en que aspectos deben mejorar para no atrasarse en la entrega de los trabajos.

Pre-requisitos: 
1) Sistema Operativo Windows
2) Base de datos SQL Server
3) Servidor web IIS
4) Lenguaje de programación ASP.Net
5) Navegador de Internet(Chrome,Firefox,IE)

Instalación:
1)Clonar el repositorio de github.
2)Descomprimir la carpeta en algún lugar en la computadora.
3)Montar el Backup de la base de datos en SQL Server.
4)Abrir el código con Visual Studio.

Deployment:
Agregando el IIS
1.	Nos vamos al Panel de control.
2.	Elegimos Programas.
3.	Activar o desactivar caracteristicas de Windows.
4.	Habilitamos Internet Information Services y le damos aceptar.
Configurando el IIS
Nos vamos ahora al panel de administración > sistema de seguridad > herramientas administrativas > y hacemos clic en Administrador de internet information services. Otra forma más rápida presionamos win + r, tecleamos inetmgr y luego enter.
Verificamos si está configurado correctamente entrando a nuestro browser y escribiendo localhost.
Ahora tenemos que configurar el IIS para que levante los aplicativos ASP.NET
•	Entramos a la consola de Windows (win +r, escribir CMD)
•	Copiamos esto cd C:\Windows\Microsoft.NET\Framework\v4.0.30319\
•	Copiamos aspnet_regiis.exe -ir
 
En el administrador del IIS (win + r, inetmgr) nos vamos a Grupo de aplicaciones.
•	Desplegamos grupos de aplicaciones
•	Por defecto los aplicativos apuntan a DefaultAppPool, le damos doble click y cambiamos la versión del framework a la 4.0 o la más reciente.
Publicando nuestro proyecto en el IIS
En nuestro proyecto, hacemos click derecho en la capa web y nos vamos a Publish.
En publish method elegimos File System.
Luego elegimos la ruta donde va a estar el proyecto,
•	Creamos una carpeta donde queremos guardar nuestro proyecto, y le damos open. Luego le damos clic en publish
•	Si todo salió bien veremos el mensaje “publish succeeded” en la parte inferior de nuestro visual studio.
Convirtiendo nuestra publicación en una aplicación
Regresamos al IIS y desplegamos las carpetas. Las que tengan icono de carpeta es que todavía no han sido convertidas en aplicación, le damos clic derecho y les decimos convertir aplicación.
Finalmente, si todo ha salido correctamente debemos entrar a nuestro browser favorito y el nombre que hayan puesto en la carpeta a nuestro proyecto debería ser la ruta a nuestra apliacación.

Integrantes: Lohana Montoya, Iván Mora, Jeison Mena.
