# Matlab

git add .
git commit -m "second commit, all"
git push -u origin master

The main folder for the Pulse Oximetry project is the "MATLAB_ARDUINO_simulazione_PPG" one. 


He hecho una captura de pantalla a un articulo que hablaba de fotopletismografia y he creado la imagen prova.png
He descargado grabit.m que permite de importar una foto, elegirla origen y la orientacion de los ejes X y Y, y pulsando sobre la imagen permite de tomar puntos y pues de exportar en un fichero los puntossegun la posiccion respecto a X y Y.
He creado con grabit mi array de puntos de la imagen prova.png y lo he exportado en el fichero Data002.mat

Para ejecutar todo:
-Añadir esta carpeta a proprio path de matlab
-Añadir a proprio workspace Data002.mat
-Abrir el Script Matlab_arduino_PPG_Simulator3.m y ejecutarlo

para apagar el ejecucion del bucle matlab:
-presionar ctrl+C
-escribir en el terminal Matlab "fclose(arduinoCom)" para terminar la comunicacion con Arduino u en alternativa escribir "instrreset" que elimina todos los "Instrument Object Array" (no hacer esta alternativa si està abierta otra comunicacion serial en otra porta USB)

En el caso que algo fracase "DON'T PANIC":
-Asegurate de que el bucle de matlab no este mas ejecutado (ctrl+C tenedo el focus en el terminal matlab para pararlo)
-Desenchufa tu arduino
-Espera 3 segundos (haz una respiracion profunda)
-Enchufalo de nuevo
-Incrementa tu puerto USB en el codigo matlab (ej: si antes era /dev/ttyUSB1 u COM1 ahora escribimos /dev/ttyUSB2 u COM2)

Otras informaciones importantes:
Este Script envia una String a Arduino tramite el puerto USB.
Cada caracter del String esta leido por arduino como codigo ASCII entonces una vez en Arduino necesitamos convertir estos valores(Ej: si quiero enviar 0 arduino leerà su correspondiente codigo ASCII decimal o sea 48)
Todavia no he encontrado un modo de solucionar este problema.
