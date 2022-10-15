#!/bin/bash

if test -f ~/miniconda3/condabin/conda &> /dev/null
then
    echo "BCML will now be installed. This might take a bit."
    zenity --info --text "BCML will now be installed. This might take a bit." --title "BCML Installer" --width=300 &> /dev/null
    ~/miniconda3/condabin/conda init
    ~/miniconda3/condabin/conda install -c conda-forge gcc -y
    ~/miniconda3/condabin/conda install pip -y
    ~/miniconda3/bin/python -m pip install bcml
    mkdir ~/.icons
    wget https://github.com/sks316/bcml-steamdeck/raw/main/bcml.png -O ~/.icons/bcml.png
    wget https://github.com/sks316/bcml-steamdeck/raw/main/BCML.desktop -O ~/Desktop/BCML.desktop
    chmod +x ~/Desktop/BCML.desktop
    cp ~/Desktop/BCML.desktop ~/.local/share/applications/BCML.desktop
    echo "BCML is now installed. You can access it with the icon on your desktop, or through your application launcher."
    zenity --info --text "BCML is now installed. You can access it with the icon on your desktop, or through your application launcher." --title "BCML Installer" --width=300 &> /dev/null
else
    echo "Miniconda is missing. Please install Miniconda with Python 3.7, then run this script again."
    zenity --error --text "Miniconda is missing. Please install Miniconda with Python 3.7, then run this script again." --title "BCML Installer" --width=300 &> /dev/null
fi
exit
