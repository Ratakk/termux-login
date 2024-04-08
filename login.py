#!/bin/bash

# Este es un comentario en Bash

# Python code for ASCII art skull
python_code="
import os
import random

# Lista de logos de calavera en ASCII art
logos = [
    '''
⠀⠀⠀⢀⡤⢤⢄⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⣼⡅⠠⢀⡈⢀⣙⣦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⠤⠤⢤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⢸⠀⠀⠀⠈⠙⠿⣝⢇⠀⠀⣀⣠⠤⠤⠤⠤⣤⡤⠚⠁⠀⠀⠀⠀⠀⠉⠢⡀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⢧⡀⠀⠀⠠⣄⠈⢺⣺⡍⠀⠀⠀⠀⣠⠖⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⡄⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠸⡆⢀⠘⣔⠄⠑⠂⠈⠀⡔⠤⠴⠚⡁⠀⠀⢀⠀⠀⠀⣠⠔⢶⡢⡀⠀⠠⡇⠀⠀⠀⠀⠀
⠀⠀⠀⠀⢠⣇⠀⢃⡀⠁⠀⠀⠀⡸⠃⢀⡴⠊⢀⠀⠀⠈⢂⡤⠚⠁⠀⠀⠙⢿⠀⠉⡇⠀⠀⠀⠀⠀
⠀⠀⠀⣠⠾⣹⢤⢼⡆⠀⠀⠀⠀⠀⠀⠈⢀⠞⠁⠀⢠⣴⠏⠀⠀⠀⠀⠀⠀⠸⡇⠀⢇⠀⠀⠀⠀⠀
⠀⠀⣾⢡⣤⡈⠣⡀⠙⠒⠀⠀⠀⠀⣀⠤⠤⣤⠤⣌⠁⢛⡄⠀⠀⠀⠀⠀⠠⡀⢇⠀⠘⣆⠀⢀⡴⡆
⠀⠀⣿⢻⣿⣿⣄⡸⠀⡆⠀⠒⣈⣩⣉⣉⡈⠉⠉⠢⣉⠉⠀⠀⠀⠀⠀⠀⠀⢣⠈⠢⣀⠈⠉⢁⡴⠃
⠀⢀⢿⣿⣿⡿⠛⠁⠀⢻⣿⣿⣿⣿⣿⣿⣿⣷⣦⣄⣸⢿⠀⠀⠀⠀⠀⠀⠀⠸⡄⠀⡇⠉⠉⠁⠀⠀
⣠⣞⠘⢛⡛⢻⣷⣤⡀⠈⡎⣿⣿⣿⣿⣿⣿⣿⣿⣿⠹⠏⠀⠀⠀⠀⠀⠀⠀⠀⠇⢰⡇⠀⠀⠀⠀⠀
⠻⣌⠯⡁⢠⣸⣿⣿⣷⡄⠁⠈⢻⢿⣿⣿⣿⣿⠿⠋⠃⠰⣀⠀⠀⠀⠀⠀⠀⠀⠀⣾⠇⠀⠀⠀⠀⠀
⠀⠀⠉⢻⠨⠟⠹⢿⣿⢣⠀⠀⢨⡧⣌⠉⠁⣀⠴⠊⠑⠀⡸⠛⠀⠀⠀⠀⠀⣸⢲⡟⠀⠀⠀⠀⠀⠀
⠀⠀⣠⠏⠀⠀⠀⠉⠉⠁⠀⠐⠁⠀⠀⢉⣉⠁⠀⠀⢀⠔⢷⣄⠀⠀⠀⠀⢠⣻⡞⠀⠀⠀⠀⠀⠀⠀
⠀⢠⠟⡦⣀⣀⣀⠀⠀⠀⠀⠀⠀⠀⢾⠉⠀⣹⣦⠤⣿⣿⡟⠁⠀⠀⠀⢀⣶⠟⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠈⠙⣦⣁⡎⢈⠏⢱⠚⢲⠔⢲⠲⡖⠖⣦⣿⡟⠀⣿⡿⠁⣠⢔⡤⠷⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⢿⣟⠿⡿⠿⠶⢾⠶⠾⠶⠾⠞⢻⠋⠏⣸⠁⠀⡽⠓⠚⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⢸⡏⠳⠷⠴⠣⠜⠢⠜⠓⠛⠊⠀⢀⡴⠣⠀⠀⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⣏⠒⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠊⠁⢀⣀⣀⠴⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠘⢦⡀⠀⠀⠀⠀⠀⠀⢀⣀⠴⠖⠒⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠉⠑⠒⠒⠐⠒⠛⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
    ''',
    '''
⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣀⠤⠤⠒⠒⠒⠒⠲⠦⣀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⢀⡠⠐⠊⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⢦⡀⠀⠀⠀⠀
⠀⢀⡶⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢳⠀⠀
⠀⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⡄
⢸⠁⡤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻
⡏⢠⠁⠱⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸
⡇⡞⠀⠀⢣⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠠⠤⢀⠀⠀⠀⠀⠀⢀⡠⠀⠘⢆⢻
⡗⡇⠀⠀⠈⢆⠀⠀⠀⠀⠀⠀⢀⣀⡠⠖⠒⠒⠢⣄⠁⠀⢀⢀⣠⠞⠉⠑⠢⣜⠀
⢠⠃⠀⠀⠀⠈⣆⠀⠀⠀⠀⢠⣿⡏⠀⠀⠀⢀⣀⠈⠆⠐⠁⠈⡏⠀⠀⢀⣤⡜⡆
⢸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠒⣿⣿⡆⠀⠀⠀⣛⣿⡇⣤⠀⠀⠀⠑⡀⠀⠘⣘⣃⠃
⠀⢇⠀⠀⡀⠀⠀⠀⠀⠀⠀⠸⣇⠙⢦⣀⠀⠈⣉⡴⠃⠀⢀⡴⡆⠳⡤⠤⠆⡇⠀
⠀⠈⣏⠈⠉⢦⡀⠀⠀⠀⠀⠀⠙⠒⠈⠉⠛⡛⣫⠆⠀⢠⣾⣷⣷⠀⠀⠢⢠⠇⠀
⠀⠀⠘⣧⣄⠀⣩⠢⣄⠀⠀⠀⠠⠤⠴⠚⠉⠺⠃⠀⢀⡟⣿⠙⢿⢀⣄⣤⡞⠀⠀
⠀⠀⠀⠀⠙⢳⣬⠀⢼⣷⡀⢄⣤⣤⣴⣦⠴⠁⠀⠐⡜⣆⠸⣆⣘⢸⡇⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠈⠟⠀⠀⠙⣯⠉⠉⢒⣯⣿⠀⠀⠀⠀⠀⠈⠉⠙⠛⠈⡇⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⢸⡀⢀⣀⣈⣇⣴⣿⢏⣼⣦⡈⠑⠲⠤⣤⣀⣀⡠⠺⠇⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⢧⠀⠀⠉⠉⢻⣵⣿⣿⣿⣿⢷⢠⣤⣀⣈⣀⠈⠜⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠘⢣⡀⢀⡀⠀⠙⢿⣿⣿⢏⠎⣼⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣆⠙⠢⣕⣤⠙⠓⢋⡜⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠑⠶⢦⠭⣽⡶⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
   '''
]

# Obtener el ancho de la terminal
_, columns = os.popen('stty size', 'r').read().split()

# Calcular la cantidad de espacios a agregar para ajustar el logo al ancho de la terminal
spaces_to_add = int(columns) - max([len(line) for line in random.choice(logos).split('\n')])

# Elegir un logo aleatoriamente
selected_logo = random.choice(logos)

# Añadir espacios al principio de cada línea
selected_logo_adjusted = '\\n'.join([' ' * (spaces_to_add // 2) + line for line in selected_logo.split('\\n')])

# Imprimir el logo ajustado
print('\033[91m' + selected_logo_adjusted)
"

# Ejecutar el código de Python
python -c "$python_code"

# Resto del código...
#!/data/data/com.termux/files/usr/bin/env python
import getpass
import hashlib
import sys
import os

password = getpass.getpass()

filepass = open("/data/data/com.termux/files/usr/share/login/.pass", "r")
filepass = filepass.read().split("\n")[0]

password = password.encode()
password = hashlib.sha1(password).hexdigest()

if password != filepass:
    print("Contraseña no válida")
    os.system("exit")
else:
    prefix = "/data/data/com.termux/files/usr"
    home = "/data/data/com.termux/files/home"
    motd = False
    hush = False

    os.system("clear")

    try:
        open(prefix + "/etc/motd")
        motd = True
    except:
        motd = False

    try:
        open(home + "/.hushlogin")
        hush = True
    except:
        hush = False

    if motd and not hush:
        print(open(prefix + "/etc/motd").read())
    
    os.system(sys.argv[1] + " " + sys.argv[2])
