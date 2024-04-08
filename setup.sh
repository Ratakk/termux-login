#!/data/data/com.termux/files/usr/bin/bash

pkg install python
cp login.py $PREFIX/bin/
chmod 700 $PREFIX/bin/login.py
cp login $PREFIX/bin/
chmod 700 $PREFIX/bin/login
mkdir /data/data/com.termux/files/usr/share/login/
clear

import os

# Logo de calavera en ASCII art
skull = """
      ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣀⡤⠤⠴⠶⠶⠒⠶⠶⠦⠤⢤⣀⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣤⢶⠟⠫⠅⠐⠒⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢽⣛⠶⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⣠⡴⠟⢋⡵⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠳⣈⠛⢷⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⣠⡾⠋⢀⡴⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠑⢄⠈⠻⣦⡀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⢀⣾⠋⢀⠔⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠑⢦⡘⢻⣆⠀⠀⠀⠀⠀
⠀⠀⠀⣠⡞⢁⡴⢃⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠒⠙⣷⡀⠀⠀⠀
⠀⠀⣰⠏⢰⠏⠀⠀⠃⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢷⡄⠀⠀
⠀⣸⠏⢠⣿⢠⣄⠀⠘⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠀⠈⢿⡄⠀
⢠⡏⢀⢿⣯⠀⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⠀⠈⣷⠀
⣾⠀⢼⣿⣿⡀⠹⣿⣶⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⠀⠀⠀⢸⡇
⡿⠀⠀⢿⣿⣇⠀⢿⣾⡷⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡇⠀⠀⠀⠀⣇
⣇⠀⠀⠼⣿⣿⠀⠸⣯⣶⣷⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⣿
⣿⠀⠘⢿⣿⣿⣇⠀⢿⣿⠷⠖⠓⠲⠆⠀⠠⠾⢶⣄⠀⠀⠀⠀⠀⠀⣠⡴⠖⠙⠋⠉⠁⠀⠀⠀⠀⠀⠀⠀⣿⡁⠀⠀⠀⢠⡟
⢻⡆⠀⢹⣿⣿⡿⠂⠀⠀⠀⠀⠀⣀⠀⢤⠀⠀⠀⠀⠁⠀⠀⠀⣠⠞⠁⠀⠀⠀⠀⠀⡀⠀⠄⠀⠀⠀⠀⠘⣿⣺⠀⠀⠀⣼⠃
⠘⣷⠀⠘⢿⣿⡄⠀⢀⣠⣤⣴⣾⣿⣿⣿⣷⣦⣤⣀⣀⣷⣤⣼⣧⠀⣀⣤⣤⣶⣾⣿⣷⣶⣦⣤⣄⡀⠀⠀⢻⡗⠀⠀⢀⡿⠀
⠀⠸⣧⠀⠈⢿⠙⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠈⡇⢈⡿⢦⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⢻⠃⠀⢀⣼⠃⠀
⠀⠀⣿⣆⡴⢻⡄⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⡇⢸⡴⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⡘⠢⡀⣼⡇⠀⠀
⠀⠀⢸⡼⡇⣸⡇⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⣻⢃⡶⠀⣦⠳⠀⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⠆⡇⠀⣏⣿⠀⠀⠀
⠀⠀⠘⣿⠁⠙⣷⡈⠻⣿⣿⣿⣿⣿⠿⠿⠛⠻⣀⣴⡇⣾⣿⣠⣿⡄⢳⣄⠈⠙⠻⢿⣿⣿⣿⣿⣿⠿⠃⣠⠇⠀⠸⣿⠂⠀⠀
⠀⠀⣠⠏⠀⠀⠈⠿⡷⠲⠦⠾⠀⠀⠒⠒⠒⠚⢡⣾⢸⣿⣿⣿⣿⣿⢸⡟⠿⢶⣤⠴⠚⠒⠤⡒⠒⠒⠋⣁⡀⠀⠀⢹⣆⠀⠀
⠀⠸⣿⠀⠀⠀⠜⢈⠇⠀⠀⠀⠀⠀⣀⣠⡴⠊⣿⡇⣿⣿⣿⣿⣿⣿⡇⢣⠀⠠⢄⣀⡀⠀⠀⠈⠳⢄⡀⠀⠉⠑⢦⠀⣿⠀⠀
⠀⠀⠙⢿⣄⠀⠰⡃⠀⠀⠀⠀⠀⢺⡁⠀⠀⠀⠘⡇⣿⣿⣿⣿⣿⣿⡟⢘⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⠀⠀⣠⡿⠃⠀⠀
⠀⠀⠀⠀⠻⣷⣤⣿⣶⣶⣶⣶⢦⣄⡹⡄⠀⠀⠀⠳⡘⢿⣿⠗⣿⡿⢣⠏⠀⠀⠀⡠⢊⣤⣶⣶⣶⣾⣷⣤⣤⡴⠋⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠸⣿⣿⣿⣿⣿⡏⠀⢿⡇⠀⠀⣸⠁⡄⠙⡶⣍⠀⣩⠖⠁⠀⠀⠀⠀⢁⣾⡟⠀⢿⣿⣿⣿⣿⡟⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠙⣿⠉⠛⢹⣷⠀⢸⡇⠀⠀⡇⠀⢇⢠⠀⠙⠀⠃⡠⠀⡀⠀⠀⠀⣀⣻⠃⢠⣿⠛⠉⣹⡟⠁⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⢸⡀⠐⡄⢿⣧⣸⠿⣾⣶⣾⢤⣬⣦⣤⣤⣀⣤⣧⣤⣯⠦⣶⣴⣿⢻⢀⣿⠏⡰⠀⢹⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⢸⡇⠀⢷⠘⣿⣿⣶⣿⣼⡇⢸⡇⠈⠁⠀⢏⠀⢸⠀⢸⠀⣧⣯⣼⡞⢹⡟⣰⠃⠀⢸⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⢸⢣⠀⠈⢇⠘⣿⠷⣽⠸⡟⡾⢧⡴⣄⣀⣯⣀⡼⣤⠾⡟⢻⢸⣽⢆⡾⢀⠟⠀⠀⣿⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⣾⡴⠀⠀⠈⠆⠈⠆⠺⢟⠣⢧⣀⣇⣣⠀⣇⢈⣇⣎⣀⣧⢛⡿⠀⠜⢡⠋⠀⠀⠀⢹⡆⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠙⢷⣤⡀⠀⠀⠀⠀⠀⠈⠑⠶⣭⣉⠙⠋⠏⠹⣉⣉⡽⠞⠀⠀⠀⠀⠀⠀⠀⢀⣴⠟⠁⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢷⣄⣀⠀⠀⢀⠀⠀⠀⠀⠀⠉⠻⠿⠛⠉⠁⠀⠀⠀⡀⠀⠀⣷⣠⣤⡟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠳⣦⡀⠙⠢⣄⠀⠀⠀⠀⠀⠀⠀⠀⢀⡴⠚⠁⢀⣴⠟⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⢷⣄⠀⠉⠁⠀⠀⠒⠒⠈⠗⠃⢀⣠⡶⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠻⠶⠶⠶⠶⠶⠶⠶⣶⡶⠟⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡀⠀⠀⡀⠀⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
"""

# Obtener el ancho de la terminal
_, columns = os.popen('stty size', 'r').read().split()

# Calcular la cantidad de espacios a agregar para ajustar el logo al ancho de la terminal
spaces_to_add = int(columns) - max([len(line) for line in skull.split('\n')])

# Añadir espacios al principio de cada línea
skull_adjusted = '\n'.join([' ' * (spaces_to_add // 2) + line for line in skull.split('\n')])

# Imprimir el logo ajustado
print("\033[91m" + skull_adjusted)


#TODO: hide input
read -p "Introduzca una nueva contraseña: " passone;
read -p "Repita la contraseña: " passtwo;

if [ $passone = $passtwo ];
then
	touch /data/data/com.termux/files/usr/share/login/.pass
	python -c "import hashlib; print(hashlib.sha1(b'$passone').hexdigest())" > /data/data/com.termux/files/usr/share/login/.pass
	echo 'Inicio de sesión instalado'

elif [ $passone != $passtwo ];
then
	echo 'La contraseña no coincide'
fi
