# About
Repositorio para el Curso de 'Fundamentos y Diseño de Bases de Datos'.
Cusco - Peru, Unsaac 2024-I.

Ejercicios resueltos en scripts de SQL.

# Colaboracion
Se usara git y github para compartir codigo, ver el siguiente [tutorial de git](https://youtube.com)

La rama 'main' solo contendra las mejores soluciones a un ejercicio y esta
protegida de pushes. Solo las tres personas que asigno el profe estan
permitidas de hacer un _merge_ a esta rama. Hacer un _pull request_ a estos
usuarios de github:
 - Ian-Piero
 - Nayelilh
 - daniel-alegria-sallo

La rama 'alumnos' contendra el codigo de todos los alumnos que deseen y todo el
contenido de la rama 'main'. Esta rama no esta protegida y cualquier
colaborador puede modificarlo. Cada vez que se haga un cambio o _merge_ a
'main', 'alumnos' se syncronizara para tener las mejores respuestas. Se propone
el siguiente workflow en esta rama.

## Compartir codigo
Se crea un directorio (si no existe) con el mismo nombre de la pregunta,
"./ejercicios1/pregunta1/" por ejemplo. Y dentro de ese se crea un script sql
que contenga en su nombre el codigo del estudiante
(e.g. "./ejercicios1/pregunta1/215270.sql")

Serie de commandos de git:

    git checkout alumnos
    mkdir -p ejercicios1/pregunta1/    # crear directorio si no existe
    cd ejercicios1/pregunta1/
    nvim 215270.sql                    # editar 215270.sql
    git add 215270.sql
    git commit -m "agrega script del alumno 215270"
    git push origin alumnos

## Solicitar que el codigo sea puesto como el mejor
Como el cambio necesita estar en la rama 'main' creamos una nueva rama y
simplemente se copia el archivo propuesto a el archivo que es actualmente el
mejor. Todo esto es para solicitar un pull request a uno de los 3 encargados
que pueden modificar 'main'.

NOTA: Incluir en el nombre de la rama su codigo para evitar confictos de
nombres. La rama pusheada en el repositorio de github sera eliminada despues de
ser _mergeada_ o rechazado.

Serie de commandos de git:

    git checkout -b mejor-215270 alumnos
    cd ejercicios1
    cp pregunta1/215270.sql pregunta1.sql
    git add pregunta1.sql
    git commit -m "actualiza archivo, mi codigo es mejor"
    git push -u origin mejor-215270
    # crear un pull request para unirse con 'main' en Github

## Proponer mejora/cambio a otro alumno
Si se quiere mejorar el codigo de otro estudiando, lo mas apropiado seria crear
una nueva rama y solicitar un pull request a el estudiante que creo
originalmente es script. Y finalmente _mergear_ a la rama 'alumnos'

Serie de commandos de git:

    git checkout -b propuesta-215270 alumnos
    cd ejercicios1/pregunta1/
    nvim 215270.sql # editar 215270.sql
    git add 215270.sql
    git commit -m "mejora el codigo | arregla error de tipeo/syntaxis | etc"
    git push -u origin propuesta-215270
    # crear un pull request para unirse con 'alumnos' en Github

