<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works

En este trabajo se realiza un motor a pasos con la implementación de una maquina de estados tipo moore. El cambio de un estado a otro se hace a diferentes velocidades, 1s, 0.5s, 0.25s y 0.125s, utilizando la base de tiempo realizada en el trabajo anterior. Se realizan 3 tipos de pasos para este motor los cuales son el paso completo, el medio paso y el paso doble y cada uno de estos puede ser realizado en el sentido horario o antihorario.

El motor a pasos puede implementarse como una maquina de estados en la cual tendremos 3 entradas y 4 salidas. Las entradas son :

  -Selector de velocidad: Viene de una base de tiempo previamente realizada. En el código puede verse como un wire llamado vel. Si esta en un valor alto se            cambia al siguiente estado mientras que en un valor bajo se mantiene en el mismo estado. Con esta entrada podemos variar la velocidad con la que cambian los        estados.
  
  -Sentido: Esta entrada indica si el motor a pasos tendrá el sentido antihorario u horario, en el código esta representada por la entrada sentido.

  -Paso: Con esta entrada definimos si el paso sera completo, medio o doble. En el código se define como paso.

Las 4 bobinas de salidas se definen como I1, I2, I3 y I4.
En la figura podemos ver el diagrama de la maquina de estados que representa al motor a pasos. La entrada H corresponde a la salida de la base de tiempo vel, la salida D al sentido y P al tipo de paso.
![Captura de pantalla 2024-03-29 023219](https://github.com/AlanTavira/motor_pasos/assets/165334805/508a41f1-62bb-4e4e-992f-eff174756aaa)


## How to test
Se utiliza un reloj de 50MHz para la máquina de estados y la base de tiempo. Dependiendo del selector de velocidad el cambio de un estado a otro se dará en 1s (cuando se cuenten todos los ciclos), 0.5s (conteo de la mitad de los ciclos), 0.25s (conteo de 1/4 del total de los ciclos) o 0.125s (1/8 de los ciclos). Si la entrada "paso" esta activa entonces el cambio será de medio paso y cuando este en bajo el paso será completo, si la entrada paso está en bajo y nos encontramos en un estado correspondiente a medio paso (4, 5, 6 o 7) entonces el paso será doble. Si la entrada "sentido" está en bajo entonces el cambio se dará en sentido horario y cuando la entrada este en un valor alto el sentido será antihorario. Por último, la salida de la base de tiempo nos indica si cambiar a otro estado (valor en alto) o permanecer en el mismo estado (valor en bajo).

## External hardware

FPGA Cyclone II EP2C35F672C6ES
